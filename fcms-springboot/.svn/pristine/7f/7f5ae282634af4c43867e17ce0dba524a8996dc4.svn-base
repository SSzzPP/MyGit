package com.yhlt.showcase.order.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.order.entity.OrderEntity;
import com.yhlt.showcase.order.service.OrderService;

/**
 * 预约信息管理
 * 
 * @author lnn
 * 
 */
@Controller
@RequestMapping(value = "/admin/order/info")
public class OrderController extends BaseController<OrderEntity, OrderService> {

	@Override
	public String index(Model model) {
		return "order/order_index";
	}

	// 退订
	@RequestMapping(value = "/cancle")
	@ResponseBody
	public Map<String, Object> cancle(HttpServletRequest request, Model model, Long id, Integer status) {
		Map<String, Object> result = new HashMap<String, Object>();
		if (id != null) {
			OrderEntity orderEntity = service.findOne(id);
			orderEntity.setCancleStatus(status);
			service.save(orderEntity);
			result.put("success", true);
		} else {
			result.put("success", false);
			result.put("msg", "系统错误，请联系管理员！");
		}
		return result;

	}

	// 跳转改签
	@RequestMapping(value = "/toEdit")
	public String toEdit(HttpServletRequest request, Model model, Long orderId) {
		OrderEntity orderEntity = new OrderEntity();
		if (orderId != null) {
			orderEntity = service.findOne(orderId);
		}
		request.setAttribute("entity", orderEntity);
		return "order/order_edit";

	}

	// 改签保存
	@RequestMapping(value = "/saveOrderEdit")
	@ResponseBody
	public Map<String, Object> saveOrderEdit(HttpServletRequest request, Model model, OrderEntity t) {
		Map<String, Object> result = new HashMap<String, Object>();
		if (t.getId() != null) {
			OrderEntity orderEntity = service.findOne(t.getId());
			orderEntity.setOrderTime(t.getOrderTime());
			orderEntity.setOrderEndTime(t.getOrderEndTime());
			orderEntity.setCount(t.getCount());
			orderEntity.setStatus(1);
			orderEntity.setEditStatus(1);
			orderEntity.setGmtModified(new Date());
			orderEntity.setLastModifiedById(LoginContextHolder.get().getUserId());
			service.save(orderEntity);
			result.put("success", true);
		} else {
			result.put("success", false);
			result.put("msg", "系统错误，请联系管理员！");
		}
		return result;

	}
}
