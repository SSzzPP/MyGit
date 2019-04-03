package com.yhlt.showcase.selection.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @author yty
 * 
 */
@Controller
@RequestMapping(value = "/selection")
public class SelectionController {
	/**
	 * 多选人员新增
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "users")
	public String users(Model model) {
		return "selection/selection_users";
	}

	/**
	 * 单选人员
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "user")
	public String user(Model model) {
		return "selection/selection_user";
	}

	/**
	 * 单选公司
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "company")
	public String company(Model model) {
		return "selection/selection_company";
	}

	/**
	 * 多选公司
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "companies")
	public String companies(Model model) {
		return "selection/selection_companies";
	}

	/**
	 * 单选部门
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "department")
	public String department(Model model) {
		return "selection/selection_department";
	}

	/**
	 * 多选部门
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "departments")
	public String departments(Model model) {
		return "selection/selection_departments";
	}

	/**
	 * 单选供应商
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "supplier")
	public String supplier(Model model) {
		return "selection/selection_supplier";
	}

	/**
	 * 多选供应商
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "suppliers")
	public String suppliers(Model model) {
		return "selection/selection_suppliers";
	}

	/**
	 * 选择联合体
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "union")
	public String union(Model model) {
		return "selection/selection_union";
	}

	/**
	 * 分配经办人
	 */
	@RequestMapping(value = "manager")
	public String manager(Model model) {
		return "selection/selection_manager";
	}

	/**
	 * 分配代理机构
	 */
	@RequestMapping(value = "proxy")
	public String proxy(HttpServletRequest request) {
		return "selection/selection_proxy";
	}
}
