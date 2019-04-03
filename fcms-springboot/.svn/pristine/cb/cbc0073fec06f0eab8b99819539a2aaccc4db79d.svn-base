package com.yhlt.showcase.front.controller.map;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spatial4j.core.context.SpatialContext;
import com.spatial4j.core.distance.DistanceUtils;
import com.spatial4j.core.shape.Rectangle;
import com.yhlt.showcase.Image.entity.ImageEntity;
import com.yhlt.showcase.Image.service.ImageService;
import com.yhlt.showcase.base.properties.EnvProperties;
import com.yhlt.showcase.base.security.AccessRequired;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.venue.entity.VenueEquipmentTypeEntity;
import com.yhlt.showcase.venue.entity.VenueInfoTypeViewEntity;
import com.yhlt.showcase.venue.service.VenueEquipmentTypeService;
import com.yhlt.showcase.venue.service.VenueInfoTypeViewService;

/**
 * 地图绘制样式
 * 
 * @author swy
 * */
@Controller
@RequestMapping(value = "/front/map")
public class FrontMapController {
	
	@Autowired
	private VenueInfoTypeViewService venueInfoTypeViewService;
	@Autowired
	private VenueEquipmentTypeService venueEquipmentTypeService;
	@Autowired
	private ImageService imageService;
	@Autowired
	private EnvProperties envProperties;
	//场馆搜索
	
	@RequestMapping(value = "/venue/search")
	@ResponseBody
	public List<VenueInfoTypeViewEntity> venueSearch(HttpServletRequest request, Model model) throws Exception {
		// 当前所在经纬度
		double lng = Double.parseDouble(request.getParameter("lng"));
		double lat = Double.parseDouble(request.getParameter("lat"));
		double radius = Integer.parseInt(request.getParameter("radius"));

		SpatialContext geo = SpatialContext.GEO;
		Rectangle rectangle = geo.getDistCalc().calcBoxByDistFromPt(
		        geo.makePoint(lng, lat), radius/1000* DistanceUtils.KM_TO_DEG, geo, null);
		
		//System.out.println(rectangle.getMinX() + "-" + rectangle.getMaxX());// 经度范围
		//System.out.println(rectangle.getMinY() + "-" + rectangle.getMaxY());// 纬度范围
		

		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_", true);
		searchParams.put("GTE_lng", rectangle.getMinX());
		searchParams.put("LTE_lng", rectangle.getMaxX());
		searchParams.put("GTE_lat", rectangle.getMinY());
		searchParams.put("LTE_lat", rectangle.getMaxY());
		searchParams.put("EQ_certificationStatus", 401L);
		return venueInfoTypeViewService.findByParams(searchParams);
	}
	
	//设施搜索
	
	@RequestMapping(value = "/equipment/search")
	@ResponseBody
	public List<VenueEquipmentTypeEntity> equipmentSearch(HttpServletRequest request, Model model) throws Exception {
		// 当前所在经纬度
		double lng = Double.parseDouble(request.getParameter("lng"));
		double lat = Double.parseDouble(request.getParameter("lat"));
		double radius = Integer.parseInt(request.getParameter("radius"));
		
		SpatialContext geo = SpatialContext.GEO;
		Rectangle rectangle = geo.getDistCalc().calcBoxByDistFromPt(
				geo.makePoint(lng, lat), radius/1000* DistanceUtils.KM_TO_DEG, geo, null);
		
		//System.out.println(rectangle.getMinX() + "-" + rectangle.getMaxX());// 经度范围
		//System.out.println(rectangle.getMinY() + "-" + rectangle.getMaxY());// 纬度范围
		
		
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_", true);
		searchParams.put("GTE_lng", rectangle.getMinX());
		searchParams.put("LTE_lng", rectangle.getMaxX());
		searchParams.put("GTE_lat", rectangle.getMinY());
		searchParams.put("LTE_lat", rectangle.getMaxY());
		searchParams.put("EQ_publicFlag", 0L);
		return venueEquipmentTypeService.findByParams(searchParams);
	}
	
	//图片显示
	@RequestMapping(value = "/showImage")
	public void showImage(String uuid, HttpServletRequest request, HttpServletResponse response) {
		ImageEntity imageEntity = imageService.findOneByUuid(uuid);
		if (imageEntity != null && imageEntity.getSysFilePath() != null) {
			imageService.coverImgCallBack(imageEntity.getSysFilePath(), response);
		} else {
			imageService.coverImgCallBack(envProperties.getNoFile(), response);
		}
	}
}
