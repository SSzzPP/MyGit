package com.yhlt.showcase.checklist.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.checklist.entity.ChecklistBillGpsEntity;
import com.yhlt.showcase.checklist.service.ChecklistBillGpsService;

/**
 * 安保专项检查单巡查路线gps
 * 
 * @author GCK
 * 
 */
@Controller
@RequestMapping(value = "/admin/checklistbillgps")
public class ChecklistBillGpsController extends BaseController<ChecklistBillGpsEntity, ChecklistBillGpsService> {

	
	@Override
	public String index(Model model) {
		return null;
	}
	

	/**
	 * list带排序不带分页
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/noPageList")
	@ResponseBody
	public List<ChecklistBillGpsEntity> noPageList(
			@RequestParam(value = "sort", defaultValue = "id") String sort,
			@RequestParam(value = "order", defaultValue = "asc") String order,
			HttpServletRequest request, Model model)
			throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_", true);
		Order o = new Order("desc".equals(order)?Direction.DESC:Direction.ASC, sort);
		return service.findByParams(searchParams,new Sort(o));
	}
}
