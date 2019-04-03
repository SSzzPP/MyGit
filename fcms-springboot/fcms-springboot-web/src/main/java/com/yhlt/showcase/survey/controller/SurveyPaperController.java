package com.yhlt.showcase.survey.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.AccessRequired;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.survey.entity.SurveyPaperEntity;
import com.yhlt.showcase.survey.service.SurveyPaperQuestionService;
import com.yhlt.showcase.survey.service.SurveyPaperService;
import com.yhlt.showcase.survey.service.SurveyPaperUserService;
import com.yhlt.showcase.survey.service.SurveyRecordService;

/**
 * 试卷管理
 * 
 * @author stone
 * 
 */
@Controller
@RequestMapping(value = "/admin/survey/paper")
public class SurveyPaperController extends BaseController<SurveyPaperEntity, SurveyPaperService>{
	@Autowired
	private SurveyPaperUserService surveyPaperUserService;
	@Autowired
	private SurveyPaperQuestionService surveyPaperQuestionService;
	@Autowired
	private SurveyRecordService surveyRecordService;
	@Override
	public String index(Model model) {
		return "survey/paper/survey_paper_index";
	}
	/**
	 * 问卷预览
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/toPreviewPaper")
	public String toProtocol(Model model,HttpServletRequest request) {
		String paperId=request.getParameter("paperId");
		SurveyPaperEntity surveyPaperEntity=service.findOne(Long.parseLong(paperId));
		model.addAttribute("paperEntity", surveyPaperEntity);
		return "survey/paper/survey_paper_question_preview_index";
	}
	/**
	 * 分页查询，包含search_查询条件<br>
	 * 返回Map{row:{},total:{}}
	 * 
	 * @param pageNum
	 * @param pageRows
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(
			@RequestParam(value = "page", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "rows", defaultValue = "10") Integer pageRows,
			@RequestParam(value = "sort", defaultValue = "id") String sort,
			@RequestParam(value = "order", defaultValue = "desc") String order,
			HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_", true);
		// 排序字段 多个用List
		Order o = new Order("desc".equals(order)?Direction.DESC:Direction.ASC, sort);
		Map<String, Object> result = service.findByParamsMap(searchParams,
				new PageRequest(pageNum - 1, pageRows,new Sort(o)));
		return result;
	}
	/**
	 * 发布调查问卷
	 * @param req
	 * @param paperId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/publish")
	public Map<String, Object> publish(HttpServletRequest req, Long paperId) {
		SurveyPaperEntity paper = service.findOne(paperId);
		Map<String, Object> result=new HashMap<String, Object>();
		//若截止时间在当前时间前面
		if(paper.getEndDate()==null){
			result.put("success", false);
			result.put("msg", "结束时间不可为空！");
			return result;
		}
		if(paper.getEndDate().before(new Date())){
			result.put("success", false);
			result.put("msg", "结束时间不可早于当前时间，请先修改结束时间再进行发布！");
			return result;
		}
		//判断是否包含问题
		if(!surveyPaperQuestionService.isExists(paper.getId())){
			result.put("success", false);
			result.put("msg", "此问卷未包含问题，不可提交！");
			return result;
		}
		paper.setStatus(1);
		paper.setStartDate(new Date());
		//查询问题个数 记为总分
		Map<String, Object> searchParams=new HashMap<String, Object>();
		searchParams.put("EQ_surveyPaperEntity.id", paper.getId());
		paper.setTotal((int)(surveyPaperQuestionService.count(searchParams)));
		paper=service.save(paper);
		result.put("success", true);
		result.put("obj", paper);
		return result;
	}
	/**
	 * 保存更新方法<br>
	 * 带验证
	 * 
	 * @param t
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@AccessRequired("管理员")
	@RequestMapping(value = "/save")
	@ResponseBody
	public Map<String, Object> save(SurveyPaperEntity t, Model model,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		if (t.getId() != null) {
			SurveyPaperEntity temp = service.findOne(t.getId());
			BeanUtils.copyProperties(t, temp);
			temp.setGmtModified(new Date());
			temp.setLastModifiedById(LoginContextHolder.get().getUserId());
			t = temp;
		} else {
			t.setGmtCreate(new Date());
			t.setCreateById(LoginContextHolder.get().getUserId());
		}
		// 验证实体类
		Set<ConstraintViolation<SurveyPaperEntity>> constraintViolations = validator
				.getValidator().validate(t);
		// 如果大于0，说明有验证未通过信息
		if (constraintViolations.size() > 0) {
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("success", false);
			result.put("msg", constraintViolations.iterator().next()
					.getMessage());
			return result;
		}
		Map<String, Object> result = service.saveMap(t);
		return result;
	}
	@RequestMapping(value = "/delete")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam("ids") long id,
			Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//删除和问卷相关的问卷问题中间表数据
		surveyPaperQuestionService.delete(surveyPaperQuestionService.findAllByPaperId(id));
		//删除问卷用户中间表数据
		surveyPaperUserService.delete(surveyPaperUserService.findAllByPaperId(id));
		//删除答卷记录中间表
		surveyRecordService.delete(surveyRecordService.findAllByPaperId(id));
		
		service.delete(id);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		return result;
	}
}
