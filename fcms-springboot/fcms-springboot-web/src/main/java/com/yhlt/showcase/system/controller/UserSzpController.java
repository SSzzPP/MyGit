package com.yhlt.showcase.system.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.security.AccessRequired;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.system.dto.UserSzpDto;
import com.yhlt.showcase.system.service.UserSzpService;

/**
 * 用户
 * 
 * @author szp
 */
@Controller
@RequestMapping(value = "/admin/system/user/szp")
@AccessRequired("用户管理")
public class UserSzpController{
	@Autowired
	private UserSzpService userSzpService;
	
	@RequestMapping(value = "")
	public String index(Model model) {
		return "system/user/szp/user_index_szp";
	}
	
	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String,Object> list(
			@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "rows", defaultValue = "10") Integer rows,
			@RequestParam(value = "sort", defaultValue = "id") String sort,
			@RequestParam(value = "order", defaultValue = "asc") String order,
			HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_", true);
		searchParams.put("sortName",sort);
		searchParams.put("sortOrder",order);
		Integer sum = rows*page-rows;
		searchParams.put("sum",sum);
		searchParams.put("rows",rows);
		List<UserSzpDto> list=userSzpService.findUserByMap(searchParams);
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("total", userSzpService.count(searchParams));
		result.put("rows", list);
		return result;
	}
}
