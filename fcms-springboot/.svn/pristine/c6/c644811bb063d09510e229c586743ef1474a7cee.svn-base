package com.yhlt.showcase.checklist.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.checklist.entity.ChecklistBillEntity;
import com.yhlt.showcase.checklist.service.ChecklistBillService;

/**
 * 安保专项检查单类型
 * 
 * @author GCK
 * 
 */
@Controller
@RequestMapping(value = "/admin/checklistbill")
public class ChecklistBillController extends BaseController<ChecklistBillEntity, ChecklistBillService> {

	
	@Override
	public String index(Model model) {
		return "checklist/bill/checklist_bill_index";
	}
	/**
	 * 查看巡查线路
	 */
	@RequestMapping(value = "/toShowPage")
	public String toShowPage(HttpServletRequest request, Model model, String uuid) {
		// 查询bill实体
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_uuid", uuid);
		ChecklistBillEntity billEntity = service.findOneByParams(searchParams);
		request.setAttribute("areaId", billEntity.getAreaId());
		request.setAttribute("id", billEntity.getId());
		return "checklist/bill/checklist_bill_map";
	}
	
}
