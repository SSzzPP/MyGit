package com.yhlt.showcase.map.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.map.entity.MapDrawStyleEntity;
import com.yhlt.showcase.map.service.MapDrawStyleService;

/**
 * 地图绘制样式
 * 
 * @author swy
 * */
@Controller
@RequestMapping(value = "/admin/map/style")
public class MapDrawStyleController extends BaseController<MapDrawStyleEntity, MapDrawStyleService>{
	
	
	@Override
	public String index(Model model) {
		return null;
	}
}
