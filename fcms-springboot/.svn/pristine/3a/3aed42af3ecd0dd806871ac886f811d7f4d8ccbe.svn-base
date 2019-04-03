package com.yhlt.showcase.survey.controller;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
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
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.survey.dao.SurveyRecordTotalMBDAO;
import com.yhlt.showcase.survey.dao.SurveyScoreTotalMBDAO;
import com.yhlt.showcase.survey.dto.SurveyQuestionTotalDto;
import com.yhlt.showcase.survey.dto.SurveyRecordTotalDto;
import com.yhlt.showcase.survey.dto.SurveyScoreDto;
import com.yhlt.showcase.survey.dto.SurveyTotalDto;
import com.yhlt.showcase.survey.entity.SurveyPaperEntity;
import com.yhlt.showcase.survey.entity.SurveyPaperUserEntity;
import com.yhlt.showcase.survey.entity.SurveyQuestionEntity;
import com.yhlt.showcase.survey.entity.SurveyRecordEntity;
import com.yhlt.showcase.survey.service.SurveyPaperQuestionService;
import com.yhlt.showcase.survey.service.SurveyPaperService;
import com.yhlt.showcase.survey.service.SurveyPaperUserService;
import com.yhlt.showcase.survey.service.SurveyRecordService;
import com.yhlt.showcase.system.service.UserService;
import com.yhlt.showcase.venue.entity.VenueUserEntity;

/**
 * 在线考试题库
 * 
 * @author stone
 * 
 */
@Controller
@RequestMapping(value = "/admin/survey/record")
public class SurveyRecordController extends
		BaseController<SurveyRecordEntity, SurveyRecordService> {
	@Autowired
	private UserService userService;
	@Autowired
	private SurveyPaperService surveyPaperService;
	@Autowired
	private SurveyPaperQuestionService surveyPaperQuestionService;
	@Autowired
	private SurveyPaperUserService surveyPaperUserService;
	@Autowired
	private SurveyRecordTotalMBDAO surveyRecordTotalMBDAO;
	@Autowired
	private SurveyScoreTotalMBDAO surveyScoreTotalMBDAO;

	@Override
	public String index(Model model) {
		return "survey/record/survey_record_index";
	}

	@RequestMapping(value = "/toRecord")
	public String toRecord(Model model, HttpServletRequest request) {
		String userId = request.getParameter("userId");
		String paperId = request.getParameter("paperId");
		if (StringUtils.isNotBlank(userId)) {
			model.addAttribute("userEntity",
					userService.findOne(Long.parseLong(userId)));
		}
		if (StringUtils.isNotBlank(paperId)) {
			model.addAttribute("paperEntity",
					surveyPaperService.findOne(Long.parseLong(paperId)));
		}
		return "survey/record/survey_record_index";
	}

	@RequestMapping(value = "/toTotal")
	public String toTotal(Model model, HttpServletRequest request) {
		String paperId = request.getParameter("paperId");
		if (StringUtils.isNotBlank(paperId)) {
			SurveyPaperEntity surveyPaperEntity = surveyPaperService
					.findOne(Long.parseLong(paperId));
			model.addAttribute("paperEntity", surveyPaperEntity);
		}
		model.addAttribute("total", request.getParameter("total"));
		model.addAttribute("actual", request.getParameter("actual"));
		return "survey/record/survey_paper_question_total_index";
	}
	/**
	 * 问卷得分统计
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/toScoreTotal")
	public String toScoreTotal(Model model, HttpServletRequest request) {
		String paperId = request.getParameter("paperId");
		if (StringUtils.isNotBlank(paperId)) {
			SurveyPaperEntity surveyPaperEntity = surveyPaperService
					.findOne(Long.parseLong(paperId));
			model.addAttribute("paperEntity", surveyPaperEntity);
			//查询出问卷总分（题目个数）
			Map<String, Object> searchParams=new HashMap<String, Object>();
			searchParams.put("EQ_surveyPaperEntity.id", paperId);
			Long sumScore=surveyPaperQuestionService.count(searchParams);
			model.addAttribute("sumScore", sumScore);
		}
		model.addAttribute("total", request.getParameter("total"));
		model.addAttribute("actual", request.getParameter("actual"));
		return "survey/record/survey_score_index";
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
	@RequestMapping(value = "/scoreTotalList")
	@ResponseBody
	public Map<String, Object> scoreTotalList(
			@RequestParam(value = "page", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "rows", defaultValue = "10") Integer pageRows,
			@RequestParam(value = "sort", defaultValue = "id") String sort,
			@RequestParam(value = "order", defaultValue = "asc") String order,
			HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_", true);
		searchParams.put("startRow", (pageNum - 1) * pageRows);
		searchParams.put("endRow", pageRows);
		// 排序字段 多个用List
		Order o = new Order("desc".equals(order) ? Direction.DESC
				: Direction.ASC, sort);
		List<SurveyScoreDto> list=surveyScoreTotalMBDAO.findByParams(searchParams);
		if(list==null){
			list=new ArrayList<SurveyScoreDto>();
		}
		Map<String, Object> result=new HashMap<String, Object>(2);
		result.put("total", list.size());
		result.put("rows", list);
		//查询出问卷的应得分数
		return result;
	}
	/**
	 * 导出问卷的得分列表
	 * @param request
	 * @param response
	 * @param paperId
	 * @throws Exception
	 */
//	@RequestMapping(value = "/exportToExcel")
//	@ResponseBody
//	public void exportToExcel(HttpServletRequest request,
//			HttpServletResponse response,Long paperId) throws Exception {
//		Map<String, Object> searchParams=new HashMap<String, Object>();
//		searchParams.put("paperId", paperId);
//		String paperName=request.getParameter("paperName");
//		List<SurveyScoreDto> list=surveyScoreTotalMBDAO.findByParams(searchParams);
//		Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams(
//				"得分统计", "得分统计"), SurveyScoreDto.class, list);
//		OutputStream out = null;
//		try {
//			out = response.getOutputStream();
//			String fileName = paperName+"-得分统计.xls";// 文件名
//			response.setContentType("application/x-msdownload");
//			response.setHeader("Content-Disposition", "attachment; filename="
//					+ URLEncoder.encode(fileName, "UTF-8"));
//			workbook.write(out);
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				out.close();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//	}

		
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
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_", true);
		// 排序字段 多个用List
		Order o = new Order("desc".equals(order) ? Direction.DESC
				: Direction.ASC, sort);
		Map<String, Object> result = service.findByParamsMap(searchParams,
				new PageRequest(pageNum - 1, pageRows, new Sort(o)));
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
	@RequestMapping(value = "/listForTotal")
	@ResponseBody
	public Map<String, Object> listForTotal(
			@RequestParam(value = "page", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "rows", defaultValue = "10") Integer pageRows,
			@RequestParam(value = "sort", defaultValue = "id") String sort,
			@RequestParam(value = "order", defaultValue = "asc") String order,
			HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_", true);
		String paperId = request.getParameter("paperId");
		searchParams.put("EQ_surveyPaperEntity.id", paperId);
		searchParams.put("EQ_status", 1);
		// 排序字段 多个用List
		Order o = new Order("desc".equals(order) ? Direction.DESC
				: Direction.ASC, sort);
		List<SurveyPaperUserEntity> surveyPaperUserEntities = surveyPaperUserService
				.findByParams(searchParams);
		List<SurveyTotalDto> surveyTotalDtos = new ArrayList<SurveyTotalDto>();
		searchParams.clear();
		searchParams.put("EQ_surveyPaperEntity.id", paperId);
		for (SurveyPaperUserEntity surveyPaperUserEntity : surveyPaperUserEntities) {
			VenueUserEntity userEntity = surveyPaperUserEntity.getUserEntity();
			searchParams.put("EQ_userEntity.id", userEntity.getId());
			List<SurveyRecordEntity> records = service
					.findByParams(searchParams);
			if (records == null || records.size() == 0) {
				continue;
			}
			SurveyTotalDto surveyTotalDto = new SurveyTotalDto();
			surveyTotalDto.setUserEntity(userEntity);
			surveyTotalDto.setSurveyRecordEntities(records);
			surveyTotalDtos.add(surveyTotalDto);
		}

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("data", surveyTotalDtos);
		result.put("questionSize", surveyPaperQuestionService
				.getQuestionQuantity(Long.parseLong(paperId)));
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
	@RequestMapping(value = "/listForQuestionTotal")
	@ResponseBody
	public Map<String, Object> listForQuestionTotal(
			@RequestParam(value = "page", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "rows", defaultValue = "10") Integer pageRows,
			@RequestParam(value = "sort", defaultValue = "id") String sort,
			@RequestParam(value = "order", defaultValue = "asc") String order,
			HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_", true);
		String paperId = request.getParameter("paperId");
		searchParams.put("paperId", paperId);
		List<SurveyRecordTotalDto> dtos = surveyRecordTotalMBDAO
				.findByParams(searchParams);
		List<SurveyQuestionTotalDto> surveyQuestionTotalDtos = new ArrayList<SurveyQuestionTotalDto>();
		for (SurveyRecordTotalDto surveyRecordTotalDto : dtos) {
			SurveyQuestionTotalDto surveyQuestionTotalDto = new SurveyQuestionTotalDto();
			List<SurveyRecordEntity> records = new ArrayList<SurveyRecordEntity>();
			for (int i = 0; i < surveyRecordTotalDto.getA(); i++) {
				SurveyRecordEntity recordEntity = new SurveyRecordEntity();
				recordEntity.setUserAnswer("A");
				records.add(recordEntity);
			}
			for (int i = 0; i < surveyRecordTotalDto.getB(); i++) {
				SurveyRecordEntity recordEntity = new SurveyRecordEntity();
				recordEntity.setUserAnswer("B");
				records.add(recordEntity);
			}
			for (int i = 0; i < surveyRecordTotalDto.getC(); i++) {
				SurveyRecordEntity recordEntity = new SurveyRecordEntity();
				recordEntity.setUserAnswer("C");
				records.add(recordEntity);
			}
			for (int i = 0; i < surveyRecordTotalDto.getD(); i++) {
				SurveyRecordEntity recordEntity = new SurveyRecordEntity();
				recordEntity.setUserAnswer("D");
				records.add(recordEntity);
			}
			for (int i = 0; i < surveyRecordTotalDto.getE(); i++) {
				SurveyRecordEntity recordEntity = new SurveyRecordEntity();
				recordEntity.setUserAnswer("E");
				records.add(recordEntity);
			}
			for (int i = 0; i < surveyRecordTotalDto.getF(); i++) {
				SurveyRecordEntity recordEntity = new SurveyRecordEntity();
				recordEntity.setUserAnswer("F");
				records.add(recordEntity);
			}
			for (int i = 0; i < surveyRecordTotalDto.getG(); i++) {
				SurveyRecordEntity recordEntity = new SurveyRecordEntity();
				recordEntity.setUserAnswer("G");
				records.add(recordEntity);
			}
			for (int i = 0; i < surveyRecordTotalDto.getH(); i++) {
				SurveyRecordEntity recordEntity = new SurveyRecordEntity();
				recordEntity.setUserAnswer("H");
				records.add(recordEntity);
			}
			for (int i = 0; i < surveyRecordTotalDto.getI(); i++) {
				SurveyRecordEntity recordEntity = new SurveyRecordEntity();
				recordEntity.setUserAnswer("I");
				records.add(recordEntity);
			}
			for (int i = 0; i < surveyRecordTotalDto.getJ(); i++) {
				SurveyRecordEntity recordEntity = new SurveyRecordEntity();
				recordEntity.setUserAnswer("J");
				records.add(recordEntity);
			}
			for (int i = 0; i < surveyRecordTotalDto.getK(); i++) {
				SurveyRecordEntity recordEntity = new SurveyRecordEntity();
				recordEntity.setUserAnswer("K");
				records.add(recordEntity);
			}
			for (int i = 0; i < surveyRecordTotalDto.getL(); i++) {
				SurveyRecordEntity recordEntity = new SurveyRecordEntity();
				recordEntity.setUserAnswer("L");
				records.add(recordEntity);
			}
			for (int i = 0; i < surveyRecordTotalDto.getM(); i++) {
				SurveyRecordEntity recordEntity = new SurveyRecordEntity();
				recordEntity.setUserAnswer("M");
				records.add(recordEntity);
			}
			for (int i = 0; i < surveyRecordTotalDto.getN(); i++) {
				SurveyRecordEntity recordEntity = new SurveyRecordEntity();
				recordEntity.setUserAnswer("N");
				records.add(recordEntity);
			}
			SurveyQuestionEntity surveyQuestionEntity = new SurveyQuestionEntity();
			surveyQuestionEntity.setId(surveyRecordTotalDto.getQuestion_id());
			surveyQuestionTotalDto
					.setSurveyQuestionEntity(surveyQuestionEntity);
			surveyQuestionTotalDto.setSurveyRecordEntities(records);
			surveyQuestionTotalDto.setOptionsNums(surveyRecordTotalDto
					.getOptionsNums());
			surveyQuestionTotalDtos.add(surveyQuestionTotalDto);
		}
		// 排序字段 多个用List
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("data", surveyQuestionTotalDtos);
		return result;
	}
	
	/**
	 * 获取某个问题的选项的比例
	 */
	@RequestMapping(value = "/getRatio")
	@ResponseBody
	public String getRatio(HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_", true);
		BigDecimal count = new BigDecimal(service.count(searchParams));
		searchParams.remove("LIKE_userAnswer");
		BigDecimal total = new BigDecimal(service.count(searchParams));
		return count.divide(total, 2, RoundingMode.HALF_UP).multiply(new BigDecimal(100)).toString();
	}
}
