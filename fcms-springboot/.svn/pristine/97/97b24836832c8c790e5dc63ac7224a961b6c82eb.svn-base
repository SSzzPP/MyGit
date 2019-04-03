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
import com.yhlt.showcase.base.utils.SensitiveWordsUtil;
import com.yhlt.showcase.order.entity.OrderEntity;
import com.yhlt.showcase.order.service.OrderService;
import com.yhlt.showcase.venue.entity.VenueVealuateUserEntity;
import com.yhlt.showcase.venue.service.VenueUserService;
import com.yhlt.showcase.venue.service.VenueVealuateUserService;

@Controller
@RequestMapping(value = "/mobile/vealuate/user")
public class VenueVealuateUserController extends BaseController<VenueVealuateUserEntity, VenueVealuateUserService>{
	@Autowired
	private OrderService orderService;
	@Autowired
	private BlockChainProperties blockChainProperties;
	@Autowired
	private VenueUserService venueUserService;
	
	//教练评价页面
	@RequestMapping("/toCoachVealuate")
	public String toCoachVealuate(String orderUuid,HttpServletRequest request) {
		request.setAttribute("orderUuid", orderUuid);
		return "order/vealuate_coach_info";
	}
	@RequestMapping("/toAllCoachVealuate")
	public String toAllCoachVealuate(Long coachId,HttpServletRequest request) {
		request.setAttribute("coachId", coachId);
		request.setAttribute("vealuateType", 2);
		return "venue/all_vealuate";
	}
	@RequestMapping(value = "/saveVealuate")
	@ResponseBody
	public Map<String, Object> saveVealuate(String vealuate, String orderUuid,Long starLevel,Long teachTime, HttpServletRequest request, Model model)
			throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		//检查敏感词
		if(SensitiveWordsUtil.sensitiveFlag(vealuate)) {
			result.put("success", false);
			result.put("msg", "您发布的内容不符合规范！");
			return result;
		}
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
		//区块链链存教练评价
		if(blockChainProperties.getEnabled()) {
			String key = orderEntity.getCoachId().toString()+"."+vealuateUserEntity.getId().toString();
			JSONObject dataobj = new JSONObject();
			dataobj.put("name", venueUserService.findOne(LoginContextHolder.get().getUserId()).getName());
			dataobj.put("time", DateUtil.formatDate2Str(new Date(), "yyyy-MM-dd HH:mm:ss"));
			dataobj.put("content", vealuate);
			BlockChainUtil.sendItem("COACH_VEAL", key, dataobj);
		}
		result.put("success", true);
		return result;
	}
}