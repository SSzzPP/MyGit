package com.yhlt.showcase.venue.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yhlt.showcase.Image.entity.ImageEntity;
import com.yhlt.showcase.Image.service.ImageService;
import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.properties.EnvProperties;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.base.utils.ImageUtils;
import com.yhlt.showcase.venue.entity.VenueInfoTypeViewEntity;
import com.yhlt.showcase.venue.service.VenueInfoTypeViewService;

@Controller
@RequestMapping(value = "/mobile/venue/view")
public class VenueInfoTypeViewController extends BaseController<VenueInfoTypeViewEntity, VenueInfoTypeViewService> {
	@Autowired
	private EnvProperties envProperties;
	@Autowired
	private ImageService imageService;
	
	/**
	 * 跳转到场馆预约
	 * @return
	 */
	@RequestMapping(value = "/toVenueInfo")
	public String toVenueInfo () {
		return "/venue/venue_search";
	}
	
	/**
	 * 场馆详情
	 * @param venueId
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/toVenueDetail")
	public String toVenueDetail(Long venueId,HttpServletRequest request) {
		request.setAttribute("venueId", venueId);
		return "/venue/venue_detail";
	}
	
	/**
	 * 教练信息
	 * @param userId
	 * @param coachUuid
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/toCoach")
	public String toCoach(Long userId, String coachUuid,HttpServletRequest request) {
		request.setAttribute("userId", userId);
		request.setAttribute("coachUuid", coachUuid);
		return "/venue/coach";
	}
	
	/**
	 * 场馆更多信息
	 * @param venueId
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/toMoreInfo")
	public String toMoreInfo(Long venueId,HttpServletRequest request) {
		request.setAttribute("venueId", venueId);
		return "/venue/venue_moreInfo";
	}
	
	/**
	 * 预约场馆
	 * @param venueId
	 * @param equipmentId
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/toOrderInfo")
	public String toOrderInfo(Long venueId, Long equipmentId,Integer type,String orderUuid,HttpServletRequest request) {	
		request.setAttribute("venueId", venueId);
		request.setAttribute("equipmentId", equipmentId);
		request.setAttribute("type", type);
		request.setAttribute("orderUuid", orderUuid);
		return "venue/order_info";
	}

	/**
	 * 查询场馆列表
	 */
	@Override
	public Map<String, Object> list(@RequestParam(value = "page", defaultValue = "1") Integer pageNum, @RequestParam(value = "rows", defaultValue = "10") Integer pageRows, @RequestParam(value = "sort", defaultValue = "id") String sort, @RequestParam(value = "order", defaultValue = "asc") String order, HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_", true);
		searchParams.put("EQ_certificationStatus", 401L);

		Map<String, Object> result = service.findByParamsMap(searchParams, new PageRequest(pageNum - 1, pageRows, Direction.ASC, "id"));
		return result;
	}

	/**
	 * 显示首页图
	 * 
	 * @param uuid
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/showImg")
	public void showImg(String uuid, HttpServletRequest request, HttpServletResponse response) {
		ImageEntity imageEntity = imageService.findOneByUuid(uuid);
		try {
			if (imageEntity != null && imageEntity.getSysFilePath() != null) {
				ImageUtils.imgToStream(imageEntity.getSysFilePath(), response);
			} else {
				ImageUtils.imgToStream(envProperties.getNoFile(), response);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}

}
