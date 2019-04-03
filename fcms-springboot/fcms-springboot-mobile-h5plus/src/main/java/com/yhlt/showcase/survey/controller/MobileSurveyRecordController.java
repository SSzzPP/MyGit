package com.yhlt.showcase.survey.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.survey.dao.SurveyRecordTotalMBDAO;
import com.yhlt.showcase.survey.dao.SurveyScoreTotalMBDAO;
import com.yhlt.showcase.survey.dto.SurveyQuestionTotalDto;
import com.yhlt.showcase.survey.dto.SurveyRecordTotalDto;
import com.yhlt.showcase.survey.dto.SurveyScoreDto;
import com.yhlt.showcase.survey.entity.SurveyPaperEntity;
import com.yhlt.showcase.survey.entity.SurveyPaperQuestionEntity;
import com.yhlt.showcase.survey.entity.SurveyPaperUserEntity;
import com.yhlt.showcase.survey.entity.SurveyQuestionEntity;
import com.yhlt.showcase.survey.entity.SurveyRecordEntity;
import com.yhlt.showcase.survey.service.SurveyPaperQuestionService;
import com.yhlt.showcase.survey.service.SurveyPaperService;
import com.yhlt.showcase.survey.service.SurveyPaperUserService;
import com.yhlt.showcase.survey.service.SurveyRecordService;
import com.yhlt.showcase.venue.entity.VenueUserEntity;
import com.yhlt.showcase.venue.service.VenueUserService;

/**
 * 问卷记录管理
 * 
 * @author stone
 * 
 */
@Controller
@RequestMapping(value = "/mobile/survey/record")
public class MobileSurveyRecordController extends BaseController<SurveyRecordEntity, SurveyRecordService>{
	@Autowired
	private SurveyPaperQuestionService surveyPaperQuestionService;
	@Autowired
	private VenueUserService venueUserService;
	@Autowired
	private SurveyPaperUserService surveyPaperUserService;
	@Autowired
	private SurveyRecordTotalMBDAO surveyRecordTotalMBDAO;
	@Autowired
	private SurveyScoreTotalMBDAO surveyScoreTotalMBDAO;
	@Autowired
	private SurveyPaperService surveyPaperService;
//	@Override
//	public String index(Model model) {
//		return null;
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
	@RequestMapping(value = "/listThis")
	@ResponseBody
	public Map<String, Object> listThis(
			@RequestParam(value = "paperId", defaultValue = "0") Long paperId,
			HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		Map<String, Object> result = new HashMap<String, Object>();
		Long userId = LoginContextHolder.get().getUserId();
		searchParams.put("EQ_surveyPaperEntity.id", paperId);
		searchParams.put("EQ_userEntity.id", userId);
		List<SurveyRecordEntity> list = service.findByParams(searchParams);
		if (list == null || list.size() == 0) {
			list = new ArrayList<SurveyRecordEntity>();
			VenueUserEntity userEntity = venueUserService.findOne(userId);
			searchParams.clear();
			searchParams.put("EQ_surveyPaperEntity.id", paperId);
			// 创建记录
			List<SurveyPaperQuestionEntity> surveyPaperQuestionEntities = surveyPaperQuestionService
					.findByParams(searchParams);
			if (surveyPaperQuestionEntities == null) {
				surveyPaperQuestionEntities = new ArrayList<SurveyPaperQuestionEntity>();
			}
			for (SurveyPaperQuestionEntity surveyPaperQuestionEntity : surveyPaperQuestionEntities) {
				SurveyRecordEntity surveyRecordEntity = new SurveyRecordEntity();
				surveyRecordEntity.setCreateById(userId);
				surveyRecordEntity.setGmtCreate(new Date());
				surveyRecordEntity.setUserEntity(userEntity);
				surveyRecordEntity.setSurveyPaperEntity(surveyPaperQuestionEntity.getSurveyPaperEntity());
				surveyRecordEntity.setSurveyQuestionEntity(surveyPaperQuestionEntity.getSurveyQuestionEntity());
				list.add(surveyRecordEntity);
			}
			Map<String, Object> map = service.save(list);
			List<SurveyRecordEntity> list2 = (List<SurveyRecordEntity>) map.get("obj");
			result.put("total", list2.size());
			result.put("rows", list2);
			return result;
		} else {
			result.put("total", list.size());
			result.put("rows", list);
			return result;
		}
	}
	/**
	 * 提交答案
	 * @param paperId
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/submitAnswer")
	@ResponseBody
	public Map<String, Object> submitAnswer(
			@RequestParam(value = "paperId", defaultValue = "0") Long paperId,
			HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		Map<String,Object> result=new HashMap<String, Object>();
		
		Long userId=LoginContextHolder.get().getUserId();
		VenueUserEntity venueUserEntity = venueUserService.findOne(userId);
		SurveyPaperEntity surveyPaperEntity = surveyPaperService.findOne(paperId);
		SurveyPaperUserEntity surveyPaperUserEntity = new SurveyPaperUserEntity();
		surveyPaperUserEntity.setSurveyPaperEntity(surveyPaperEntity);
		surveyPaperUserEntity.setUserEntity(venueUserEntity);
		surveyPaperUserEntity.setCreateById(userId);
		List<SurveyRecordEntity> list=service.findByParams(searchParams);
		List<SurveyRecordEntity> saveRecordList=new ArrayList<SurveyRecordEntity>();
		for (SurveyRecordEntity surveyRecordEntity : list) {
			surveyRecordEntity.setUserAnswer(request.getParameter(surveyRecordEntity.getSurveyQuestionEntity().getId()+""));
			saveRecordList.add(surveyRecordEntity);
		}
		service.save(saveRecordList);
		surveyPaperUserEntity.setStatus(1);
		//查询分数

		searchParams.put("userId", userId);
		searchParams.put("paperId", paperId);
		List<SurveyScoreDto> surveyScoreDtos=surveyScoreTotalMBDAO.findByUserAndPaper(searchParams);
		if(surveyScoreDtos!=null&&surveyScoreDtos.size()>0){
			SurveyScoreDto surveyScoreDto=surveyScoreDtos.get(0);
			if(StringUtils.isBlank(surveyScoreDto.getScore())){
				surveyPaperUserEntity.setScore(0);
			}else{
				surveyPaperUserEntity.setScore(Integer.valueOf(surveyScoreDto.getScore()));
			}
		}
		surveyPaperUserService.save(surveyPaperUserEntity);
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
}
