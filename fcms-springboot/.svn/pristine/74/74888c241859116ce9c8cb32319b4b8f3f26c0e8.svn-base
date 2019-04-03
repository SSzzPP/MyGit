package com.yhlt.showcase.system.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.system.entity.SystemLog;
import com.yhlt.showcase.system.service.SystemLogService;

/**
 * 系统日志
 * 
 * @author admin
 * 
 */
@Controller
@RequestMapping(value = "/admin/system/systemLog")
public class SystemLogController extends
		BaseController<SystemLog, SystemLogService> {

	@Override
	public String index(Model model) {
		return "system/systemLog/systemLog_index";
	}

	
	@Override
	public Map<String, Object> list(
			@RequestParam(value = "page", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "rows", defaultValue = "10") Integer pageRows,
			@RequestParam(value = "sort", defaultValue = "gmtCreate") String sort,
			@RequestParam(value = "order", defaultValue = "desc") String order,
			HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_");

		// 排序字段 多个用List
		Order o = new Order("desc".equals(order) ? Direction.DESC
				: Direction.ASC, sort);

		String gmtCreate_begin = request.getParameter("gmtCreate_begin");
		String gmtCreate_end = request.getParameter("gmtCreate_end");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		if (!StringUtils.isBlank(gmtCreate_begin)) {
			Date param_begin = sdf.parse(gmtCreate_begin);
			searchParams.put("GT_gmtCreate", param_begin);
		}
		if (!StringUtils.isBlank(gmtCreate_end)) {
			Date param_end = sdf.parse(gmtCreate_end);
			searchParams.put("LT_gmtCreate", param_end);
		}
		Map<String, Object> result = service.findByParamsMap(searchParams,
				new PageRequest(pageNum - 1, pageRows, new Sort(o)));
		return result;
	}

}
