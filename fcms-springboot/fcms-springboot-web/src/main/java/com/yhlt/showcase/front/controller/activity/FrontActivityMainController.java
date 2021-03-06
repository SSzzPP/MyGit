package com.yhlt.showcase.front.controller.activity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.yhlt.showcase.activity.entity.ActivityMainEntity;
import com.yhlt.showcase.activity.entity.ActivityMainUserEntity;
import com.yhlt.showcase.activity.service.ActivityMainService;
import com.yhlt.showcase.activity.service.ActivityMainUserService;
import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.base.utils.CookieUtils;
import com.yhlt.showcase.base.utils.DateUtil;
import com.yhlt.showcase.base.utils.SensitiveWordsUtil;

@Controller
@RequestMapping(value = "/front/activity/main")
public class FrontActivityMainController extends BaseController<ActivityMainEntity, ActivityMainService> {

	@Autowired
	private ActivityMainUserService activityMainUserService;
	
	@RequestMapping(value = "/toActivityCircleDetail")
	public String toActivityCircleDetail (Long itemId, String itemName, HttpServletRequest request) {
		request.setAttribute("itemId", itemId);
		request.setAttribute("itemName", itemName);
		return "system/main/activity_circle_detail";
	}

	/**
	 * 跳转到圈子详情
	 * @param itemId
	 * @param itemName
	 * @param type
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/toDetail")
	public String toDetail (Long itemId, String itemName, Long type, HttpServletRequest request) {
		request.setAttribute("itemId", itemId);
		request.setAttribute("itemName", itemName);
		request.setAttribute("type", type);
		return "sportCircle/sport_circle_detail";
	}
	
	/**
	 * 跳转到发布
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/toRelease")
	public String toRelease (Long itemId, String itemName, Long type, HttpServletRequest request) {
		request.setAttribute("itemId", itemId);
		request.setAttribute("itemName", itemName);
		request.setAttribute("type", type);
		return "sportCircle/sport_release";
	}
	
	/**
	 * 跳转至邀请详情
	 * @param mainId
	 * @param follow
	 * @param type
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/toUserSportCircle")
	public String toUserSportCircle (Long mainId, Long follow, Long type,HttpServletRequest request) {
		request.setAttribute("mainId", mainId);
		request.setAttribute("follow", follow);
		request.setAttribute("type", type);
		return "sportCircle/user_sport_circle";
	}
	
	/**
	 * 我的报名/我的发布
	 * @param itemId
	 * @param bg
	 * @param follow
	 * @param type
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/toUserRelease")
	public String toUserRelease (Long itemId, Long bg, Long follow, Long type, HttpServletRequest request) {
		request.setAttribute("itemId", itemId);
		request.setAttribute("bg", bg);
		request.setAttribute("follow", follow);
		request.setAttribute("type", type);
		return "sportCircle/user_sport_release";
	}
	
	/**
	 * 已报名列表
	 * @param mainId
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/toUserSign")
	public String toUserSign (Long mainId, HttpServletRequest request) {
		request.setAttribute("mainId", mainId);
		return "sportCircle/user_sign";
	}
	
	/**
	 * 用户详情
	 * @param uuid
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/toUserDetail")
	public String toUserDetail (String uuid, HttpServletRequest request) {
		request.setAttribute("uuid", uuid);
		return "sportCircle/user_detail";
	}
	
	/**
	 * 发布邀请
	 * 
	 * @param itemId
	 * @param title
	 * @param acvitityTime
	 * @param stopTime
	 * @param location
	 * @param member
	 * @param peopleNum
	 * @param costType
	 * @param instructions
	 * @param tel
	 * @return
	 */
	@RequestMapping(value = "/saveActivityMain")
	@ResponseBody
	public Map<String, Object> saveActivityMain(Long itemId, String title, String acvitityTime, String stopTime,
			String location, Long member, Long peopleNum, Long costType, String instructions, String tel) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", false);

		if(SensitiveWordsUtil.sensitiveFlag(title)) {
			result.put("success", false);
			result.put("msg", "您发布的标题不符合规范！");
			return result;
		}
		if(SensitiveWordsUtil.sensitiveFlag(instructions)) {
			result.put("success", false);
			result.put("msg", "您发布的说明不符合规范！");
			return result;
		}
		
		ActivityMainEntity entity = new ActivityMainEntity();
		entity.setItemId(itemId);
		entity.setCreateById(LoginContextHolder.get().getUserId());
		entity.setTitle(title);
		entity.setActivityTime(DateUtil.parse(acvitityTime, "yyyy-MM-dd HH:mm"));
		entity.setStopTime(DateUtil.parse(stopTime, "yyyy-MM-dd HH:mm"));
		entity.setLocation(location);
		entity.setMember(member);
		entity.setPeopleNum(peopleNum);
		entity.setTel(tel);
		entity.setCostType(costType);
		entity.setInstructions(instructions);

		Set<ConstraintViolation<ActivityMainEntity>> constraintViolations = validator.getValidator().validate(entity);
		// 如果大于0，说明有验证未通过信息
		if (constraintViolations.size() > 0) {
			result.put("success", false);
			result.put("msg", constraintViolations.iterator().next().getMessage());
			return result;
		}

		entity = service.save(entity);
		ActivityMainUserEntity activityMainUserEntity = new ActivityMainUserEntity();
		activityMainUserEntity.setItemId(itemId);
		activityMainUserEntity.setMainId(entity.getId());
		activityMainUserEntity.setCreateById(LoginContextHolder.get().getUserId());
		activityMainUserService.save(activityMainUserEntity);

		result.put("success", true);
		return result;
	}

	/**
	 * 撤销邀请
	 * 
	 * @param mainId
	 * @param itemId
	 * @return
	 */
	@RequestMapping(value = "/deleteActivityMain")
	@ResponseBody
	public Map<String, Object> deleteActivityMain(Long mainId, Long itemId) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", false);

		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_itemId", itemId);
		searchParams.put("EQ_mainId", mainId);
		Long num = activityMainUserService.count(searchParams);
		if (num > 1) {
			result.put("msg", "已有用户报名");
			return result;
		}

		service.delete(mainId);
		//删除报名
		searchParams.clear();
		searchParams.put("EQ_mainId", mainId);
		searchParams.put("EQ_createById", LoginContextHolder.get().getUserId());
		ActivityMainUserEntity t = activityMainUserService.findOneByParams(searchParams);
		activityMainUserService.delete(t);
		result.put("success", true);
		result.put("msg", "撤销成功");
		return result;
	}

	/**
	 * 我的发布
	 * 
	 * @param itemId
	 * @return
	 */
	@RequestMapping(value = "/releaseList")
	@ResponseBody
	public Map<String, Object> releaseList(Long itemId) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", false);

		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_createById", LoginContextHolder.get().getUserId());
		searchParams.put("EQ_itemId", itemId);

		List<ActivityMainEntity> list = service.findByParams(searchParams);

		result.put("success", true);
		result.put("obj", list);
		return result;
	}

	/**
	 * 我的报名
	 * 
	 * @param itemId
	 * @return
	 */
	@RequestMapping(value = "/userSign")
	@ResponseBody
	public Map<String, Object> userSign(Long itemId) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", false);

		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_createById", LoginContextHolder.get().getUserId());
		searchParams.put("EQ_itemId", itemId);
		List<ActivityMainUserEntity> mainUserList = activityMainUserService.findByParams(searchParams);
		List<ActivityMainEntity> list = new ArrayList<ActivityMainEntity>();
		for (ActivityMainUserEntity t : mainUserList) {
			ActivityMainEntity entity = service.findOne(t.getMainId());
			list.add(entity);
		}

		result.put("success", true);
		result.put("obj", list);
		return result;
	}

	@Override
	public Map<String, Object> list(@RequestParam(value = "page", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "rows", defaultValue = "10") Integer pageRows,
			@RequestParam(value = "sort", defaultValue = "id") String sort,
			@RequestParam(value = "order", defaultValue = "asc") String order, HttpServletRequest request, Model model)
			throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_", true);

		Map<String, Object> result = service.findByParamsMap(searchParams,
				new PageRequest(pageNum - 1, pageRows, Direction.DESC, "id"));
		List<Long> allFollow = service.getAllFollow(LoginContextHolder.get().getUserId());
		//String strAllFollow = JSONArray.toJSONString(allFollow);
		result.put("follow", allFollow);
		return result;
	}
	
	@Override
	public Map<String, Object> detail(long id, Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String, Object> result = service.findOneMap(id);
		List<Long> allFollow = service.getAllFollow(LoginContextHolder.get().getUserId());
		String strAllFollow = JSONArray.toJSONString(allFollow);
		result.put("follow", strAllFollow);
		return result;
	}
	@RequestMapping("/toAdd")
	public String toAdd(HttpServletRequest request,Long itemId,String itemName) {
		request.setAttribute("itemId", itemId);
		request.setAttribute("itemName", itemName);
		return "front/sportCircle/sport_circle_add";
	}
	@RequestMapping("toSignUsersList")
	public String toSignUsersList(HttpServletRequest request,Long mainId) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_mainId", mainId);
		request.setAttribute("singUsers", activityMainUserService.findByParams(searchParams));
		return "front/sportCircle/sport_circle_sign";
	}
	@Override
	public String index(Model model) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
