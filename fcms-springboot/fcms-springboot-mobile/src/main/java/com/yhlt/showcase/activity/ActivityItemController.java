package com.yhlt.showcase.activity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.activity.entity.ActivityItemEntity;
import com.yhlt.showcase.activity.service.ActivityItemService;
import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.base.utils.ImageUtils;

@Controller
@RequestMapping(value = "/mobile/activity/item")
public class ActivityItemController extends BaseController<ActivityItemEntity, ActivityItemService>{

	/**
	 * 显示封页图
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/itemHeadImg")
	public void userHeadImg(Long itemId, HttpServletRequest request, HttpServletResponse response) {
		ActivityItemEntity entity = service.findOne(itemId);

		try {
			if (entity.getHeadImg() != null) {
				ImageUtils.imgToStream(entity.getHeadImg(), response);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	/**
	 * 结伴运动
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/searchActivity")
	@ResponseBody
	public List<ActivityItemEntity> searchActivity(HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_id_1", 3499L);
		searchParams.put("EQ_id_2", 4399L);
		searchParams.put("EQ_id_3", 4400L);
		return service.findByParams(searchParams);
	}
	
	/**
	 * 赛事信息
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/searchEvent")
	@ResponseBody
	public List<ActivityItemEntity> searchEvent(HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_id_1", 4410L);
		searchParams.put("EQ_id_2", 4411L);
		searchParams.put("EQ_id_3", 4412L);
		return service.findByParams(searchParams);
	}
}
