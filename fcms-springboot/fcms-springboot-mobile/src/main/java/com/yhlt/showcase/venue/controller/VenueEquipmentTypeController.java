package com.yhlt.showcase.venue.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.Image.entity.ImageEntity;
import com.yhlt.showcase.Image.service.ImageService;
import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.properties.EnvProperties;
import com.yhlt.showcase.base.utils.ImageUtils;
import com.yhlt.showcase.venue.entity.VenueEquipmentTypeEntity;
import com.yhlt.showcase.venue.service.VenueEquipmentTypeService;

@Controller
@RequestMapping(value = "/mobile/venue/equipment")
public class VenueEquipmentTypeController extends BaseController<VenueEquipmentTypeEntity, VenueEquipmentTypeService> {
	
	@Autowired
	private ImageService imageService;
	@Autowired
	private EnvProperties envProperties;
	/**
	 * 场馆设施
	 * 
	 * @param venueId
	 * @return
	 */
	@RequestMapping(value = "/venueEquipment")
	@ResponseBody
	public List<VenueEquipmentTypeEntity> venueEquipment(Long venueId) {
		Map<String, Object> searchParams = new HashMap<String, Object>();

		searchParams.put("EQ_venueId", venueId);
		searchParams.put("EQ_publicFlag", 1L);

		List<VenueEquipmentTypeEntity> list = service.findByParams(searchParams);
		return list;
	}

	@RequestMapping(value = "/getName")
	@ResponseBody
	public Map<String, Object> getName(Long equipmentId) {
		Map<String, Object> result = new HashMap<String, Object>();
		if (equipmentId != null) {
			VenueEquipmentTypeEntity equipmentTypeEntity = service.findOne(equipmentId);
			result.put("success", true);
			result.put("venueName", equipmentTypeEntity.getVenueName());
			result.put("equipmentName", equipmentTypeEntity.getName());
		} else {
			result.put("success", false);
			result.put("msg", "功能异常，请联系客服！");
		}
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
