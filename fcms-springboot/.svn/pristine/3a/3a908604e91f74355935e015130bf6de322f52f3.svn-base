package com.yhlt.showcase.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.system.entity.LoginLogEntity;
import com.yhlt.showcase.system.service.LoginLogService;

/**
 * 登录日志
 * 
 * @author hubaojie
 * 
 */
@Controller
@RequestMapping(value = "/admin/system/loginLog")
public class LoginLogController extends
		BaseController<LoginLogEntity, LoginLogService> {

	@Override
	public String index(Model model) {
		return "system/systemLog/loginLog_index";
	}
}
