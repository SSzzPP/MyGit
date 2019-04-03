package com.yhlt.showcase.activity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.activity.entity.ActivityItemEntity;
import com.yhlt.showcase.activity.entity.ActivityItemUserEntity;
import com.yhlt.showcase.activity.service.ActivityItemService;
import com.yhlt.showcase.activity.service.ActivityItemUserService;
import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.LoginContextHolder;

import com.yhlt.showcase.subscribe.entity.NewsSubscribeEntity;
import com.yhlt.showcase.subscribe.service.NewsSubscribeService;

import com.yhlt.showcase.base.utils.CookieUtils;


@Controller
@RequestMapping(value = "/mobile/item/user")
public class ActivityItemUserController extends BaseController<ActivityItemUserEntity, ActivityItemUserService> {

	@Autowired
	private ActivityItemService activityItemService;
	@Autowired
	private NewsSubscribeService newsSubscribeService;
	/**
	 * 查询多少用户关注和是否关注
	 * 
	 * @param itemId
	 * @return
	 */
	@RequestMapping(value = "/peopleNumAndFollow")
	@ResponseBody
	public Map<String, Object> peopleNumAndFollow(Long itemId, HttpServletRequest request) {

		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_itemId", itemId);
		Long peopleNum = service.count(searchParams);

		Long follow = 0L;
		if (!"no_login".equals(CookieUtils.getCookie(request, "sessionId"))) {
			searchParams.put("EQ_createById", LoginContextHolder.get().getUserId());
			ActivityItemUserEntity entity = service.findOneByParams(searchParams);
			if (entity != null) {
				follow = 1L;
			}
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("peopleNum", peopleNum);
		result.put("follow", follow);

		return result;
	}

	/**
	 * 取消关注
	 * 
	 * @param itemId
	 * @return
	 */
	@RequestMapping(value = "/deleteItemUser")
	@ResponseBody
	public Map<String, Object> deleteItemUser(Long itemId) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", false);

		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_itemId", itemId);
		searchParams.put("EQ_createById", LoginContextHolder.get().getUserId());
		ActivityItemUserEntity entity = service.findOneByParams(searchParams);
		service.delete(entity);
		Map<String, Object> searchNewsSubParams = new HashMap<String, Object>();
		searchNewsSubParams.put("EQ_userId", LoginContextHolder.get().getUserId());
		searchNewsSubParams.put("EQ_itemId", itemId);
		NewsSubscribeEntity newsSubscribeEntity = newsSubscribeService.findOneByParams(searchNewsSubParams);
		newsSubscribeService.delete(newsSubscribeEntity);
		return result;
	}

	/**
	 * 加关注
	 * 
	 * @param itemId
	 * @return
	 */
	@RequestMapping(value = "/saveItemUser")
	@ResponseBody
	public Map<String, Object> saveItemUser(Long itemId) {
		Map<String, Object> result = new HashMap<String, Object>();
		Long userId = LoginContextHolder.get().getUserId();
		result.put("success", false);
		Integer type=null;
		if (itemId==3499||itemId==4399||itemId==4400) 
			type=2;	
		if (itemId==4410||itemId==4411||itemId==4412) 
			type=3;
		ActivityItemUserEntity entity = new ActivityItemUserEntity();
		entity.setItemId(itemId);
		entity.setCreateById(LoginContextHolder.get().getUserId());
		service.save(entity);
		NewsSubscribeEntity newsSubscribeEntity = new NewsSubscribeEntity(userId,itemId,0,type);
		newsSubscribeService.save(newsSubscribeEntity);
		return result;
	}

	/**
	 * 关注结伴运动圈子
	 * 
	 * @return
	 */
	@RequestMapping(value = "/userLikeSport")
	@ResponseBody
	public List<ActivityItemEntity> userLikeSport() {

		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_createById", LoginContextHolder.get().getUserId());
		searchParams.put("EQ_itemId_1", 3499);
		searchParams.put("EQ_itemId_2", 4399);
		searchParams.put("EQ_itemId_3", 4400);
		List<ActivityItemUserEntity> itemList = service.findByParams(searchParams);

		List<ActivityItemEntity> list = new ArrayList<>();
		for (ActivityItemUserEntity t : itemList) {
			ActivityItemEntity entity = activityItemService.findOne(t.getItemId());
			list.add(entity);
		}

		return list;
	}
	
	/**
	 * 关注赛事圈子
	 * 
	 * @return
	 */
	@RequestMapping(value = "/userLikeEvent")
	@ResponseBody
	public List<ActivityItemEntity> userLikeEvent() {

		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_createById", LoginContextHolder.get().getUserId());
		searchParams.put("EQ_itemId_1", 4410);
		searchParams.put("EQ_itemId_2", 4411);
		searchParams.put("EQ_itemId_3", 4412);
		List<ActivityItemUserEntity> itemList = service.findByParams(searchParams);

		List<ActivityItemEntity> list = new ArrayList<>();
		for (ActivityItemUserEntity t : itemList) {
			ActivityItemEntity entity = activityItemService.findOne(t.getItemId());
			list.add(entity);
		}

		return list;
	}
	
}
