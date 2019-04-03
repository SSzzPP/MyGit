package com.yhlt.showcase.checklist.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.checklist.entity.ChecklistEntity;
import com.yhlt.showcase.checklist.service.ChecklistService;

/**
 * 检查单配置
 * 
 * @author admin
 * 
 */
@Controller
@RequestMapping(value = "/mobile/checklist")
public class ChecklistController extends BaseController<ChecklistEntity, ChecklistService> {

	/**
	 * 跳转到创建检查单
	 * @return
	 */
	@RequestMapping(value = "/toCreate")
	public String toCreate () {
		return "/checklist/check_list_create";
	}
	
	/**
	 * 跳转到填写检查单
	 * @return
	 */
	@RequestMapping(value = "/toWrite")
	public String toWrite (String billUuid,HttpServletRequest request) {
		request.setAttribute("billUuid", billUuid);
		return "/checklist/check_list_write";
	}
	
	/**
	 * 跳转到检查单列表
	 * @return
	 */
	@RequestMapping(value = "/toList")
	public String toList () {
		return "/checklist/check_list";
	}
	
	/**
	 * 跳转到查看检查单
	 * @return
	 */
	@RequestMapping(value = "/toRead")
	public String toRead (String billUuid,HttpServletRequest request) {
		request.setAttribute("billUuid", billUuid);
		return "/checklist/check_list_read";
	}
	
}
