package com.yhlt.showcase.system.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.AccessRequired;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.system.entity.PositionEntity;
import com.yhlt.showcase.system.service.PositionService;
import com.yhlt.showcase.system.service.UserService;

/**
 * 职位管理
 * 
 * @author hubaojie
 * 
 */
@Controller
@RequestMapping(value = "/admin/system/position")
@AccessRequired("职位管理")
public class PositionController extends
		BaseController<PositionEntity, PositionService> {

	@Autowired
	private UserService userService;

	@Override
	public String index(Model model) {
		return "system/position/pos_index";
	}

	/**
	 * 根据字典名称及类型判断数据字典项是否重复
	 * 
	 * @param dictName
	 * @param typeName
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/check")
	@ResponseBody
	public Map<String, Object> check(@RequestParam("name") String name,
			HttpServletRequest request, Model model) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_name", name);
		List<PositionEntity> posEntities = service.findByParams(searchParams);

		Map<String, Object> result = new HashMap<String, Object>();
		boolean flag = posEntities == null || posEntities.size() == 0;
		result.put("success", flag);
		result.put("msg", flag ? "" : "该标识已被使用");
		return result;
	}

	/*
	 * 重写save
	 */
	@Override
	@AccessRequired("管理员")
	public Map<String, Object> save(PositionEntity t, Model model,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		if (t.getSortNumber() == null) {
			Long max = service.getMaxSortNumber();
			t.setSortNumber(max + 1);
		}
		return super.save(t, model, request, response);
	}

	/**
	 * 查询职位树
	 * 
	 * @return
	 * @author hubaojie
	 */
	@RequestMapping(value = "/combotree")
	@ResponseBody
	public List<PositionEntity> tree(HttpServletRequest request, Model model) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_", true);
		Order o = new Order(Direction.ASC, "sortNumber");
		return service.findByParams(searchParams, new Sort(o));
	}

	/**
	 * 职位删除
	 * 
	 * @return
	 * @author hubaojie
	 */
	@AccessRequired("管理员")
	@RequestMapping(value = "/delete")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam("ids") long id,
			Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_positionEntity.id", id);
		long count = userService.count(searchParams);
		if (count == 0)
			return super.delete(id, model, request, response);
		return null;
	}
}
