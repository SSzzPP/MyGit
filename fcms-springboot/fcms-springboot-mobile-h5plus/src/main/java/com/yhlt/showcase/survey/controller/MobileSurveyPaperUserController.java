package com.yhlt.showcase.survey.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;
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
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.survey.entity.SurveyPaperEntity;
import com.yhlt.showcase.survey.entity.SurveyPaperUserEntity;
import com.yhlt.showcase.survey.service.SurveyPaperService;
import com.yhlt.showcase.survey.service.SurveyPaperUserService;
import com.yhlt.showcase.venue.entity.VenueUserEntity;
import com.yhlt.showcase.venue.service.VenueUserService;

/**
 * 试卷管理
 * 
 * @author stone
 * 
 */
@Controller
@RequestMapping(value = "/mobile/survey/paperUser")
public class MobileSurveyPaperUserController extends BaseController<SurveyPaperUserEntity, SurveyPaperUserService>{
	@Autowired
	private SurveyPaperService surveyPaperService;
	@Autowired
	private VenueUserService userService;
//	@Override
//	public String index(Model model) {
//		return null;
//	}
	
	/**
	 * 问卷调查 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/toSurveyList")
	public String toSurveyList(Model model) {
		return "/survey/survey_list";
	}
	
	/**
	 * 答卷
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/toSurveyQuestion")
	public String toSurveyQuestion (Long paperId, Long userId, String endDate, String paperTitle, Long status, String now, Model model, HttpServletRequest request) {
		request.setAttribute("paperId", paperId);
		request.setAttribute("userId", userId);
		request.setAttribute("endDate", endDate);
		request.setAttribute("paperTitle", paperTitle);
		request.setAttribute("status", status);
		request.setAttribute("now", now);
		return "/survey/surveyQuestion";
	}
	
	@RequestMapping(value = "/userList")
	@ResponseBody
	public Map<String,Object> userList(
			@RequestParam(value = "page", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "rows", defaultValue = "10") Integer pageRows,
			@RequestParam(value = "sort", defaultValue = "finish") String sort,
			@RequestParam(value = "order", defaultValue = "desc") String order,
			HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_", true);
		Map<String,Object> result=new HashMap<String, Object>();
		// 排序字段 多个用List
		Order o = new Order("desc".equals(order)?Direction.DESC:Direction.ASC, sort);
		List<SurveyPaperUserEntity> paperUserEntities=service.findByParams(searchParams);
		List<VenueUserEntity> userEntities=new ArrayList<VenueUserEntity>();
		if(paperUserEntities!=null&&paperUserEntities.size()>0){
			for (SurveyPaperUserEntity surveyPaperUserEntity : paperUserEntities) {
				userEntities.add(surveyPaperUserEntity.getUserEntity());
			}
		}
		result.put("total", userEntities.size());
		result.put("rows", userEntities);
		return result;
	}
	@RequestMapping(value = "/saveThis")
	@ResponseBody
	public Map<String, Object> saveThis(HttpServletRequest req,
			Long paperId,Long[] userIds
			)
			throws Exception {
		Long loginId=LoginContextHolder.get().getUserId();
		SurveyPaperEntity surveyPaperEntity=surveyPaperService.findOne(paperId);
		List<SurveyPaperUserEntity> list=new ArrayList<SurveyPaperUserEntity>();
		for (Long userId : userIds) {
			Map<String, Object> searchParams=new HashMap<String, Object>();
			searchParams.put("EQ_surveyPaperEntity.id", paperId);
			searchParams.put("EQ_userEntity.id",userId);
			List<SurveyPaperUserEntity> searchs=service.findByParams(searchParams);
			//如果重复 continue
			if(searchs!=null&&searchs.size()>0){
				continue;
			}
			SurveyPaperUserEntity surveyPaperUserEntity=new SurveyPaperUserEntity();
			surveyPaperUserEntity.setSurveyPaperEntity(surveyPaperEntity);
			surveyPaperUserEntity.setUserEntity(userService.findOne(userId));
			surveyPaperUserEntity.setCreateById(loginId);
			surveyPaperUserEntity.setGmtCreate(new Date());
			list.add(surveyPaperUserEntity);
		}
		Map<String, Object> result = service.save(list);
		return result;
	}
	@RequestMapping(value = "/deleteThis")
	@ResponseBody
	public Map<String, Object> deleteThis(HttpServletRequest req,
			Long paperId,Long[] userIds
			)
			throws Exception {
		Map<String, Object> searchParams=new HashMap<String, Object>();
		searchParams.put("EQ_surveyPaperEntity.id", paperId);
		for (Long userId : userIds) {
			searchParams.put("EQ_userEntity.id",userId);
			List<SurveyPaperUserEntity> dels=service.findByParams(searchParams);
			service.delete(dels);
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		return result;
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
			@RequestParam(value = "order", defaultValue = "asc") String order,
			HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_", true);
		Long userId=LoginContextHolder.get().getUserId();
		String status=request.getParameter("status");
		if(StringUtils.isNotBlank(status)){
			if("0".equals(status)){
				searchParams.put("GTE_surveyPaperEntity.endDate", DateUtils.addDays(new Date(), -1));
			}
		}
		searchParams.put("EQ_userEntity.id", userId);
		searchParams.put("EQ_surveyPaperEntity.status", 1);
		// 排序字段 多个用List
		Order o = new Order("desc".equals(order)?Direction.DESC:Direction.ASC, sort);
		Map<String, Object> result = service.findByParamsMap(searchParams, new PageRequest(pageNum - 1, pageRows,new Sort(o)));
		result.put("now", DateFormatUtils.format(new Date(), "yyyy-MM-dd"));
		return result;
	}


}
