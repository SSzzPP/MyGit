package com.yhlt.showcase.activity;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.activity.entity.ActivityMainUserEntity;
import com.yhlt.showcase.activity.service.ActivityMainUserService;
import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.LoginContextHolder;

@Controller
@RequestMapping(value = "/mobile/activity/user")
public class ActivityMainUserController extends BaseController<ActivityMainUserEntity, ActivityMainUserService> {

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

		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_itemId", itemId);
		searchParams.put("EQ_mainId", mainId);
		searchParams.put("EQ_createById", LoginContextHolder.get().getUserId());
		ActivityMainUserEntity entity = service.findOneByParams(searchParams);

		if (entity == null) {
			result.put("msg", "请先报名");
			return result;
		}

		service.delete(entity);
		result.put("success", true);
		result.put("msg", "撤销成功");
		return result;
	}

}
