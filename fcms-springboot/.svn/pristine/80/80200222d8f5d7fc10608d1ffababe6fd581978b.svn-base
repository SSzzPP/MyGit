package com.yhlt.showcase.activity;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.activity.entity.ActivityMainEntity;
import com.yhlt.showcase.activity.entity.ActivityMainUserEntity;
import com.yhlt.showcase.activity.service.ActivityMainService;
import com.yhlt.showcase.activity.service.ActivityMainUserService;
import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.util.DateUtil;

@Controller
@RequestMapping(value = "/mobile/activity/user")
public class ActivityMainUserController extends BaseController<ActivityMainUserEntity, ActivityMainUserService> {

	@Autowired
	private ActivityMainService activityMainService;
	/**
	 * 报名活动
	 * 
	 * @param itemId
	 * @param mainId
	 * @return
	 */
	@RequestMapping(value = "/addMainUser")
	@ResponseBody
	public Map<String, Object> addMainUser(Long itemId, Long mainId) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", false);
		
		ActivityMainEntity activityMainEntity = activityMainService.findOne(mainId);
		if (DateUtil.compareDateTime(activityMainEntity.getStopTime(), new Date()) == -1) {
			result.put("msg", "已过报名时间");
			return result;
		}

		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_itemId", itemId);
		searchParams.put("EQ_mainId", mainId);
		searchParams.put("EQ_createById", LoginContextHolder.get().getUserId());
		ActivityMainUserEntity entity = service.findOneByParams(searchParams);

		if (entity != null) {
			result.put("msg", "已报名");
			return result;
		}
		ActivityMainUserEntity t = new ActivityMainUserEntity();
		t.setItemId(itemId);
		t.setMainId(mainId);
		t.setCreateById(LoginContextHolder.get().getUserId());
		service.save(t);

		result.put("success", true);
		result.put("msg", "报名成功");
		return result;
	}

	/**
	 * 撤销报名
	 */
	@RequestMapping(value = "/deleteMainUser")
	@ResponseBody
	public Map<String, Object> deleteMainUser(Long itemId, Long mainId) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", false);
		
		ActivityMainEntity activityMainEntity = activityMainService.findOne(mainId);
		if (DateUtil.compareDateTime(activityMainEntity.getStopTime(), new Date()) == -1) {
			result.put("msg", "已过报名时间");
			return result;
		}

		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_itemId", itemId);
		searchParams.put("EQ_mainId", mainId);
		searchParams.put("EQ_createById", LoginContextHolder.get().getUserId());
		ActivityMainUserEntity entity = service.findOneByParams(searchParams);

		if (entity == null) {
			result.put("msg", "您未报名");
			return result;
		}

		service.delete(entity);
		result.put("success", true);
		result.put("msg", "撤销成功");
		return result;
	}

}
