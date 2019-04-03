package com.yhlt.showcase.venue.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.properties.BlockChainProperties;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.util.DateUtil;
import com.yhlt.showcase.base.utils.BlockChainUtil;
import com.yhlt.showcase.order.entity.OrderEntity;
import com.yhlt.showcase.order.service.OrderService;
import com.yhlt.showcase.venue.entity.VenueVealuateEntity;
import com.yhlt.showcase.venue.service.VenueUserService;
import com.yhlt.showcase.venue.service.VenueVealuateService;

@Controller
@RequestMapping(value = "/mobile/venue/vealuate")
public class VenueVealuateController extends BaseController<VenueVealuateEntity, VenueVealuateService> {
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private VenueUserService venueUserService;
	@Autowired
	private BlockChainProperties blockChainProperties;

	@RequestMapping(value = "/saveVealuate")
	@ResponseBody
	public Map<String, Object> saveVealuate(String vealuate, String orderUuid,Long starLevel,Long environmentStar,Long serviceStar, HttpServletRequest request, Model model)
			throws Exception {
		VenueVealuateEntity vealuateEntity = new VenueVealuateEntity();
		OrderEntity orderEntity = orderService.findOneByUuid(orderUuid);
		orderEntity.setVealuateStatus(1);
		orderService.save(orderEntity);
		vealuateEntity.setContent(vealuate);
		vealuateEntity.setVenueId(orderEntity.getVenueId());
		vealuateEntity.setStarLevel(starLevel);
		vealuateEntity.setCreateById(LoginContextHolder.get().getUserId());
		vealuateEntity.setEnvironmentStar(environmentStar);
		vealuateEntity.setServiceStar(serviceStar);
		service.save(vealuateEntity);
		//区块链存场馆评价
		if(blockChainProperties.getEnabled()) {
			String key = orderEntity.getVenueId().toString()+"."+vealuateEntity.getId().toString();
			JSONObject dataobj = new JSONObject();
			dataobj.put("name", venueUserService.findOne(LoginContextHolder.get().getUserId()).getName());
			dataobj.put("time", DateUtil.formatDate2Str(new Date(), "yyyy-MM-dd HH:mm:ss"));
			dataobj.put("content", vealuate);
			BlockChainUtil.sendItem("VENUE_VEAL", key, dataobj);
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		return result;
	}
}
