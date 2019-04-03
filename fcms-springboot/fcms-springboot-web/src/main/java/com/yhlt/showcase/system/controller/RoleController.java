package com.yhlt.showcase.system.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.AccessRequired;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.system.entity.RoleEntity;
import com.yhlt.showcase.system.entity.RoleResourcesEntity;
import com.yhlt.showcase.system.entity.RoleTreeEntity;
import com.yhlt.showcase.system.service.RoleService;
import com.yhlt.showcase.system.service.RoleTreeService;
import com.yhlt.showcase.system.service.RoleUserService;

/**
 * 角色管理
 * 
 * @author admin
 * 
 */
@Controller
@RequestMapping(value = "/admin/system/role")
@AccessRequired("角色管理")
public class RoleController extends BaseController<RoleEntity, RoleService> {

	@Autowired
	private RoleTreeService treeService;

	@Autowired
	private RoleUserService roleUserService;

	// @Autowired
	// private ResourcesService resourcesService;

	@Override
	public String index(Model model) {
		return "system/role/role_index";
	}

	/**
	 * 新增角色
	 * 
	 * @author hxk
	 */
	@RequestMapping(value = "/roleAdd")
	public String roleAdd(Model model, HttpServletRequest request, HttpServletResponse response, Long roleId)
			throws Exception {
		RoleEntity roleEntity = new RoleEntity();
		if (roleId != null) {
			roleEntity = service.findOne(roleId);
		}
		request.setAttribute("roleEntity", roleEntity);
		return "system/role/role_add";
	}

	@Override
	public Map<String, Object> save(RoleEntity r, Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		boolean isNotExists = true;
		Map<String, Object> result = new HashMap<String, Object>();
		// 检查角色注册情况
		if (r.getId() == null) {
			if (!check(r.getId(), r.getName())) {
				result.put("success", isNotExists);
				result.put("msg", isNotExists ? "" : "角色已被注册");
				return result;
			}
		}
		if (r.getId() != null) {
			RoleEntity temp = service.findOne(r.getId());
			BeanUtils.copyProperties(r, temp);
			temp.setGmtModified(new Date());
			temp.setLastModifiedById(LoginContextHolder.get().getUserId());
			r = temp;
		} else {
			r.setGmtCreate(new Date());
			r.setCreateById(LoginContextHolder.get().getUserId());
		}
		result = service.saveMap(r);
		result.put("success", true);
		result.put("msg", "保存成功！");
		return result;
	}

	/**
	 * 检查名称重复情况
	 * 
	 * @param loginName
	 * @return
	 */
	private boolean check(Long id, String name) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		if (id != null) {
			searchParams.put("NEQ_id", Long.valueOf(id));
		}
		searchParams.put("EQ_name", name);
		List<RoleEntity> userEntities = service.findByParams(searchParams);
		// flag=true 没有注册，false已被注册
		boolean flag = userEntities == null || userEntities.size() == 0;
		return flag;
	}

	/**
	 * 跳转
	 * 
	 * @return
	 */
	@RequestMapping(value = "/userSelection")
	public String userSelection() {
		return "common/userSelection";
	}

	/**
	 * 查询角色名注册
	 * 
	 * @return
	 * @date 2015年1月7日16:26:02
	 */
	@RequestMapping(value = "/check", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> check(@RequestParam("roleName") String roleName, @RequestParam("roleId") Long roleId,
			HttpServletRequest request, Model model) {
		Map<String, Object> result = new HashMap<String, Object>();
		// flag=true 没有注册，false已被注册
		boolean flag = false;
		flag = check(roleId, roleName);
		result.put("success", flag);
		result.put("msg", flag ? "" : "角色已被注册");
		return result;
	}

	/**
	 * 角色树
	 */
	@RequestMapping(value = "/roleTreegrid")
	@ResponseBody
	public List<RoleTreeEntity> roleTreegrid(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_", true);
		String strParentId = request.getParameter("id");
		if (StringUtils.isNotBlank(strParentId)) {
			Long parentId = Long.valueOf(strParentId);
			searchParams.put("EQ_parentId", parentId);
		}
		return treeService.findByParams(searchParams);
	}

	/**
	 * 人员维护
	 */
	@AccessRequired("管理员")
	@RequestMapping(value = "/editUser", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> editUser(@RequestParam("ids") Long[] ids, @RequestParam("roleId") String roleId,
			Model model, HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> result = new HashMap<String, Object>();
		if (!StringUtils.isBlank(roleId)) {
			RoleEntity roleEntity = super.service.findOne(Long.valueOf(roleId));
			if (roleEntity != null) {
				service.saveRoleUser(roleEntity, ids);
			}
			result.put("success", true);
		} else {
			result.put("success", false);
		}
		return result;
	}

	/**
	 * 人员维护_根据id获得选中人员
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/selectedUser", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectedUser(@RequestParam(value = "page", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "rows", defaultValue = "10") Integer pageRows, HttpServletRequest request,
			Model model) {
		Map<String, Object> result = null;
		String roleId = request.getParameter("id");
		if (!StringUtils.isBlank(roleId) && Long.valueOf(roleId) != -1) {// -1公司节点，不返回数据
			Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_", true);
			searchParams.put("EQ_role.id", Long.valueOf(roleId));
			result = roleUserService.findByParamsMap(searchParams, new PageRequest(pageNum - 1, pageRows));
		}
		return result;
	}

	/**
	 * 人员维护_人员删除
	 * 
	 * @param id
	 * @param model
	 * @param request
	 * @param response
	 */
	@AccessRequired("管理员")
	@RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteUser(@RequestParam("ids") Long[] ids, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		for (Long id : ids) {
			roleUserService.delete(id);
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		return result;
	}

	/**
	 * 资源维护_根据角色id查询资源
	 * 
	 * @param roleId
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/resourceTreegrid", method = RequestMethod.POST)
	@ResponseBody
	public Set<Long> resourceTreegrid(@RequestParam("roleId") String roleId, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		Set<Long> ids = null;
		if (!StringUtils.isBlank(roleId)) {
			RoleEntity roleEntity = service.findOne(Long.valueOf(roleId));
			if (roleEntity != null) {
				ids = new HashSet<Long>();
				for (RoleResourcesEntity rr : roleEntity.getRoleResourcess()) {
					ids.add(rr.getResources().getId());
				}
			}
		}
		return ids;
	}

	/**
	 * 资源维护_保存选中资源
	 * 
	 * @param roleId
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	/* @AccessRequired("管理员") */
	@RequestMapping(value = "/editResources", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> editResources(@RequestParam("resourceIds") Long[] resourceIds,
			@RequestParam("roleId") String roleId, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		Map<String, Object> result = new HashMap<String, Object>();
		if (!StringUtils.isBlank(roleId)) {
			RoleEntity roleEntity = service.findOne(Long.valueOf(roleId));
			if (roleEntity != null) {
				service.saveRoleResources(roleEntity, resourceIds);
			}
			result.put("success", true);
		} else {
			result.put("success", false);
		}
		return result;
	}

}
