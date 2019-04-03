package com.yhlt.showcase.order.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.order.entity.OrderEntity;
import com.yhlt.showcase.order.service.OrderService;
import com.yhlt.showcase.order.service.OrderVenueTypeViewService;
import com.yhlt.showcase.venue.entity.VenueUserEntity;
import com.yhlt.showcase.venue.service.VenueUserService;

/**
 * 预约
 * 
 * @author lnn
 * 
 */
@Controller
@RequestMapping(value = "/mobile/order")
public class OrderController extends BaseController<OrderEntity, OrderService> {

	@Autowired
	private VenueUserService venueUserService;
	@Autowired
	private OrderVenueTypeViewService orderVenueTypeViewService;

	@RequestMapping(value = "/saveOrderInfo")
	@ResponseBody
	public Map<String, Object> saveOrderInfo(String name, String orderTime, String orderEndTime, String mobile,String venueId, String equipmentId,String coachId,String courseId, String count, String orderUuid, HttpServletRequest request, Model model) throws Exception {
		OrderEntity orderEntity = new OrderEntity();
		if (!"undefined".equals(orderUuid)) {
			orderEntity = service.findOneByUuid(orderUuid);
			orderEntity.setEditStatus(0);
		}
		orderEntity.setCreateById(LoginContextHolder.get().getUserId());
		orderEntity.setName(name);
		orderEntity.setMobile(mobile);
		orderEntity.setCount(Integer.valueOf(count));
		if(venueId!=null&&equipmentId!=null) {
			orderEntity.setVenueId(Long.valueOf(venueId));
			orderEntity.setEquipmentId(Long.valueOf(equipmentId));
			orderEntity.setType(1);
		}
		if(coachId!=null&&courseId!=null) {
			orderEntity.setCoachId(Long.valueOf(coachId));
			orderEntity.setCourseId(Long.valueOf(courseId));
			orderEntity.setType(2);
		}
		orderEntity.setStatus(0);
		orderEntity.setVealuateStatus(0);
		if ("undefined".equals(orderUuid)) {
			orderEntity.setUuid(UUID.randomUUID().toString());
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date = sdf.parse(orderTime);
		orderEntity.setOrderTime(date);
		orderEntity.setOrderEndTime(sdf.parse(orderEndTime));
		service.save(orderEntity);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		return result;
	}

	@RequestMapping(value = "/myOrderList")
	@ResponseBody
	public Map<String, Object> getMyOrderList(@RequestParam(value = "page", defaultValue = "1") Integer pageNum, @RequestParam(value = "rows", defaultValue = "2") Integer pageRows, @RequestParam(value = "sort", defaultValue = "id") String sort, @RequestParam(value = "order", defaultValue = "desc") String order, HttpServletRequest request, Model model) {
		Long loginUserId = LoginContextHolder.get().getUserId();
		VenueUserEntity venueUserEntity = venueUserService.findOne(loginUserId);
		Map<String, Object> searchParams = new HashMap<String, Object>();
		if (venueUserEntity != null) {
			if (venueUserEntity.getType() == 0) {
				searchParams.put("EQ_venueId", venueUserEntity.getVenueId());
			} else if (venueUserEntity.getType() == 2) {
				searchParams.put("EQ_createById", loginUserId);
			}else if(venueUserEntity.getType() == 1){
				searchParams.put("EQ_coachId", loginUserId);
			}
		}
		Map<String, Object> result = service.findByParamsMap(searchParams, new PageRequest(pageNum - 1, pageRows, Direction.DESC, "gmtCreate"));
		result.put("userType", venueUserEntity.getType());
		return result;
	}

	@RequestMapping(value = "/getOrderDetail")
	@ResponseBody
	public Map<String, Object> getOrderDetail(HttpServletRequest request, Model model, String uuid) {
		Map<String, Object> result = new HashMap<String, Object>();
		OrderEntity orderEntity = service.findOneByUuid(uuid);
		if (orderEntity != null) {
			result.put("order", orderEntity);
		}
		result.put("success", true);
		return result;

	}

	@RequestMapping(value = "/confirm")
	@ResponseBody
	public Map<String, Object> confirm(HttpServletRequest request, Model model, String uuid) {
		Map<String, Object> result = new HashMap<String, Object>();
		OrderEntity orderEntity = service.findOneByUuid(uuid);
		orderEntity.setStatus(1);
		// 如果接单时改签状态为0（正在改签），则直接将改签状态修改为1（改签完成）
		if (orderEntity.getEditStatus() != null && orderEntity.getEditStatus() == 0) {
			orderEntity.setEditStatus(1);
		}
		service.save(orderEntity);
		result.put("success", true);
		return result;

	}

	// 退订
	@RequestMapping(value = "/cancle")
	@ResponseBody
	public Map<String, Object> cancle(HttpServletRequest request, Model model, String uuid, Integer status) {
		Map<String, Object> result = new HashMap<String, Object>();
		OrderEntity orderEntity = service.findOneByUuid(uuid);
		orderEntity.setCancleStatus(status);
		service.save(orderEntity);
		result.put("success", true);
		return result;

	}

	// 根据uuid获取订单
	@RequestMapping(value = "/getOrder")
	@ResponseBody
	public Map<String, Object> getOrder(HttpServletRequest request, Model model, String orderUuid) {
		Map<String, Object> result = new HashMap<String, Object>();
		OrderEntity orderEntity = service.findOneByUuid(orderUuid);
		result.put("order", orderEntity);
		result.put("success", true);
		return result;

	}

	// 退订
	@RequestMapping(value = "/changeEditStatus")
	@ResponseBody
	public Map<String, Object> changeEditStatus(HttpServletRequest request, Model model, String uuid, Integer status) {
		Map<String, Object> result = new HashMap<String, Object>();
		OrderEntity orderEntity = service.findOneByUuid(uuid);
		orderEntity.setEditStatus(status);
		service.save(orderEntity);
		result.put("success", true);
		return result;
	}
	
	/**
	 * 上周健身频次
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/searchOrderNum")
	@ResponseBody
	public Long searchOrderNum(Long type) {
		Map<String, Object> searchParams = new HashMap<>();
		searchParams.put("EQ_createById", LoginContextHolder.get().getUserId());
		searchParams.put("EQ_status", 1L);
		searchParams.put("EQ_typeId", type);
		return orderVenueTypeViewService.count(searchParams);
	}
}
