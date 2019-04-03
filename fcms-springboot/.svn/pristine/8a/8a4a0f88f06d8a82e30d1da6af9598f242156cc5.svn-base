package com.yhlt.showcase.survey.controller;

import java.util.ArrayList;
import java.util.Date;
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
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.dict.DictService;
import com.yhlt.showcase.survey.entity.SurveyPaperEntity;
import com.yhlt.showcase.survey.entity.SurveyPaperUserEntity;
import com.yhlt.showcase.survey.service.SurveyPaperService;
import com.yhlt.showcase.survey.service.SurveyPaperUserService;
import com.yhlt.showcase.system.service.UserService;
import com.yhlt.showcase.venue.entity.VenueUserEntity;
import com.yhlt.showcase.venue.service.VenueUserService;

/**
 * 试卷管理
 * 
 * @author stone
 * 
 */
@Controller
@RequestMapping(value = "/admin/survey/paperUser")
public class SurveyPaperUserController extends
BaseController<SurveyPaperUserEntity, SurveyPaperUserService>{
	@Autowired
	private SurveyPaperService surveyPaperService;
	@Autowired
	private VenueUserService userService;
	@Autowired
	private DictService dictService;
	@Override
	public String index(Model model) {
		return "survey/paperUser/survey_paper_user_index";
	}
	@RequestMapping(value = "/userList")
	@ResponseBody
	public Map<String,Object> userList(
			@RequestParam(value = "page", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "rows", defaultValue = "10") Integer pageRows,
			@RequestParam(value = "sort", defaultValue = "gmtCreate") String sort,
			@RequestParam(value = "order", defaultValue = "desc") String order,
			HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_", true);
		Map<String,Object> result=new HashMap<String, Object>();
		if(sort.equals("name")){
			sort="userEntity.name";
		}else if(sort.equals("loginName")){
			sort="userEntity.loginName";
		}else if(sort.equals("id")){
			sort="userEntity.id";
		}
		// 排序字段 多个用List
		Order o = new Order("desc".equals(order)?Direction.DESC:Direction.ASC, sort);
		Map<String, Object> resultMap = service.findByParamsMap(searchParams,
				new PageRequest(pageNum - 1, pageRows,new Sort(o)));
		List<VenueUserEntity> userEntities=new ArrayList<VenueUserEntity>();
		List<SurveyPaperUserEntity> paperUserEntities=(List<SurveyPaperUserEntity>) resultMap.get("rows");
		if(paperUserEntities!=null&&paperUserEntities.size()>0){
			for (SurveyPaperUserEntity surveyPaperUserEntity : paperUserEntities) {
				userEntities.add(surveyPaperUserEntity.getUserEntity());
			}
		}
		result.put("total", (Long)resultMap.get("total"));
		result.put("rows", userEntities);
		return result;
	}
	@RequestMapping(value = "/userAllList")
	@ResponseBody
	public List<VenueUserEntity> userAllList(
			@RequestParam(value = "page", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "rows", defaultValue = "10") Integer pageRows,
			@RequestParam(value = "sort", defaultValue = "finish") String sort,
			@RequestParam(value = "order", defaultValue = "desc") String order,
			HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_", true);
		// 排序字段 多个用List
		Order o = new Order("desc".equals(order)?Direction.DESC:Direction.ASC, sort);
		List<SurveyPaperUserEntity> paperUserEntities=service.findByParams(searchParams);
		List<VenueUserEntity> userEntities=new ArrayList<VenueUserEntity>();
		if(paperUserEntities!=null&&paperUserEntities.size()>0){
			for (SurveyPaperUserEntity surveyPaperUserEntity : paperUserEntities) {
				if(!userEntities.contains(surveyPaperUserEntity.getUserEntity())){
					userEntities.add(surveyPaperUserEntity.getUserEntity());
				}
			}
		}
		return userEntities;
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
			VenueUserEntity userEntity=userService.findOne(userId);
			surveyPaperUserEntity.setUserEntity(userEntity);
			surveyPaperUserEntity.setCreateById(loginId);
			surveyPaperUserEntity.setGmtCreate(new Date());
			if(surveyPaperEntity.getStatus()==1){
			}
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
	@RequestMapping(value = "/paperList")
	@ResponseBody
	public Map<String,Object> paperList(
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
		result.put("total", paperUserEntities.size());
		result.put("rows", paperUserEntities);
		return result;
	}
	/**
	 * 未完成问卷的用户
	 * @param pageNum
	 * @param pageRows
	 * @param sort
	 * @param order
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/notFinishUserList")
	@ResponseBody
	public Map<String,Object> notFinishUserList(
			@RequestParam(value = "page", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "rows", defaultValue = "10") Integer pageRows,
			@RequestParam(value = "sort", defaultValue = "id") String sort,
			@RequestParam(value = "order", defaultValue = "desc") String order,
			HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_", true);
		String paperId=request.getParameter("paperId");
		Map<String,Object> result=new HashMap<String, Object>();
		if(StringUtils.isBlank(paperId)){
			result.put("total", 0);
			result.put("rows", new ArrayList<SurveyPaperUserEntity>());
			return result;
		}
		searchParams.put("EQ_surveyPaperEntity.id", paperId);
		searchParams.put("EQ_status", 0);
		// 排序字段 多个用List
		Order o = new Order("desc".equals(order)?Direction.DESC:Direction.ASC, sort);
		Map<String, Object> resultMap=service.findByParamsMap(searchParams, new PageRequest(pageNum - 1, pageRows,new Sort(o)));
		List<SurveyPaperUserEntity> entities=(List<SurveyPaperUserEntity>) resultMap.get("rows");
		List<VenueUserEntity> users=new ArrayList<VenueUserEntity>();
		for (SurveyPaperUserEntity surveyPaperUserEntity : entities) {
			users.add(surveyPaperUserEntity.getUserEntity());
		}
		resultMap.put("rows", users);
		return resultMap;
	}

}
