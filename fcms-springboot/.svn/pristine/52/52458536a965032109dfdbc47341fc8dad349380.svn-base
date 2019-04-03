package com.yhlt.showcase.venue.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.venue.dto.VenueUserTypeViewDto;
import com.yhlt.showcase.venue.entity.VenueUserTypeViewEntity;
import com.yhlt.showcase.venue.service.VenueUserTypeViewService;
@Controller
@RequestMapping(value = "/admin/user/type/view")
public class VenueUserTypeViewController extends BaseController<VenueUserTypeViewEntity, VenueUserTypeViewService>{

	@Override
	public String index(Model model) {
		return null;
	}
	
	/**
	 * 
	 * @param strTypes
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/searchType")
	@ResponseBody
	public Map<String, Object> searchType (String strTypes, Model model, HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", false);
		
		List<Long> list = new ArrayList<>();
		List<VenueUserTypeViewDto> userList = null;
		if (StringUtils.isNotBlank(strTypes)) {
			String[] typeId = strTypes.split(",");
			for (String id : typeId) {
				Long typeid = Long.valueOf(id);
				if(typeId.length > 1 && typeid == 1) {
					continue;
				}
				list.add(typeid);
			}
		 userList = service.findTypeUser(list);
		}
		
		result.put("success", true);
		result.put("rows", userList);
		return result;
	}

}
