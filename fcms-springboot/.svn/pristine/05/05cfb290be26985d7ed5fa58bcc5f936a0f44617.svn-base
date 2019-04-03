package com.yhlt.showcase.main.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.security.SessionSecurityConstants;
import com.yhlt.showcase.system.dto.SystemMenuDto;
import com.yhlt.showcase.system.entity.UserEntity;
import com.yhlt.showcase.system.service.UserRoleResourceService;
import com.yhlt.showcase.system.service.UserService;

/**
 * 主页
 * 
 * @author xunxun
 * @date 2014-11-17 下午3:34:34
 */
@Controller
@RequestMapping(value = "/admin/main")
public class MainController {

	@Autowired
	private UserRoleResourceService userRoleResourceService;
	@Autowired
	private UserService userService;

	/**
	 * 查询左侧菜单
	 * 
	 * @param model
	 * @return
	 * @author xunxun
	 * @date 2014-11-19 下午3:01:44
	 */
	@RequestMapping()
	public String index(HttpServletRequest request, Model model) {
		// 当前服务器时间
		request.setAttribute(SessionSecurityConstants.KEY_SYSTEM_DATETIME, DateFormatUtils.format(new Date(), "yyyy-MM-dd HH:mm:ss"));
		UserEntity entity = userService.findOne(LoginContextHolder.get().getUserId());
		if (entity != null) {
			request.setAttribute("nickName", entity.getName());
			return "system/main/index";
		} else {
			return "redirect:/login/user";
		}
	}

	@RequestMapping("/homePage")
	public String homePage() {
		//return "system/main/homePage";
		return "map/userMap";
	}

	@RequestMapping("/portal")
	public String portal() {
		return "portal";
	}

	/**
	 * 查询左侧菜单
	 * 
	 * @param model
	 * @return
	 * @author xunxun
	 * @date 2014-11-19 下午3:01:44
	 */
	@RequestMapping("/menu/one")
	@ResponseBody
	public List<SystemMenuDto> menuOne(Model model) {
		Long userId = LoginContextHolder.get().getUserId();
		// Long userId = 1L;
		List<SystemMenuDto> lists = userRoleResourceService.findSystemMenuByUserId(userId, null);
		return lists;
	}

	/**
	 * 查询左侧菜单
	 * 
	 * @param model
	 * @return
	 * @author xunxun
	 * @date 2014-11-19 下午3:01:44
	 */
	@ResponseBody
	@RequestMapping("/menu/two")
	@SuppressWarnings("rawtypes")
	public Map<Long, Set> menuTwo(Model model) {
		Map<Long, Set> result = new HashMap<Long, Set>();
		// 查询一级菜单
		List<SystemMenuDto> firstMenus = menuOne(model);
		for (SystemMenuDto systemMenuDto : firstMenus) {
			result.put(systemMenuDto.getId(), systemMenuDto.getChildren());
		}
		return result;
	}

	/**
	 * ajax请求无权限跳转到此方法，返回json
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/noAccess")
	@ResponseBody
	public Map<String, Object> noAccess(Model model) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", false);
		result.put("msg", "无权限访问");
		return result;
	}
}
