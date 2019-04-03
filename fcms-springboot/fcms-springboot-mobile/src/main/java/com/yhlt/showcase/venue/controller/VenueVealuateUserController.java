package com.yhlt.showcase.venue.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.order.entity.OrderEntity;
import com.yhlt.showcase.order.service.OrderService;
import com.yhlt.showcase.venue.entity.VenueVealuateUserEntity;
import com.yhlt.showcase.venue.service.VenueVealuateUserService;

@Controller
@RequestMapping(value = "/mobile/vealuate/user")
public class VenueVealuateUserController extends BaseController<VenueVealuateUserEntity, VenueVealuateUserService>{
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "/saveVealuate")
	@ResponseBody
	public Map<String, Object> saveVealuate(String vealuate, String orderUuid,Long starLevel,Long teachTime, HttpServletRequest request, Model model)
			throws Exception {
		VenueVealuateUserEntity vealuateUserEntity = new VenueVealuateUserEntity();
		OrderEntity orderEntity = orderService.findOneByUuid(orderUuid);
		orderEntity.setVealuateStatus(1);
		orderService.save(orderEntity);
		vealuateUserEntity.setUserId(orderEntity.getCoachId());
		vealuateUserEntity.setCourseId(orderEntity.getCourseId());
		vealuateUserEntity.setContent(vealuate);
		vealuateUserEntity.setStarLevel(starLevel);
		vealuateUserEntity.setTeachTime(teachTime);
		vealuateUserEntity.setCreateById(LoginContextHolder.get().getUserId());
		service.save(vealuateUserEntity);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		return result;
	}
}