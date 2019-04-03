package com.yhlt.showcase.map.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.map.entity.MapDrawAreaEntity;
import com.yhlt.showcase.map.service.MapDrawAreaService;

/**
 * 地图区域
 * 
 * @author swy
 * */
@Controller
@RequestMapping(value = "/mobile/map/area")
public class MapDrawAreaController extends BaseController<MapDrawAreaEntity, MapDrawAreaService>{
	
	/**
	 * 查找当前登录人负责的全部区域
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/searchAreas")
	@ResponseBody
	public List<MapDrawAreaEntity> searchAreas(HttpServletRequest request, Model model)
			throws Exception {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_userId", LoginContextHolder.get().getUserId());
		return service.findByParams(searchParams);
	}
	
	
}
