package com.yhlt.showcase.system.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.AccessRequired;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.base.utils.Constants;
import com.yhlt.showcase.system.entity.CompanyEntity;
import com.yhlt.showcase.system.entity.DepartmentEntity;
import com.yhlt.showcase.system.service.CompanyService;
import com.yhlt.showcase.system.service.DepartmentService;
import com.yhlt.showcase.system.service.UserService;

/**
 * 组织机构-部门
 * 
 * @author wj
 * @date 2014年12月25日20:23:27
 */
@Controller
@RequestMapping(value = "/admin/system/department")
@AccessRequired("部门管理")
public class DepartmentController extends BaseController<DepartmentEntity, DepartmentService> {

	@Autowired
	private CompanyService companyService;

	@Autowired
	private UserService userService;

	@Override
	public String index(Model model) {
		return "system/department/department_index";
	}

	/**
	 * 跳转增加页面
	 */
	@RequestMapping(value = "/toAddPage")
	public String toAddPage(Long companyId, Long departmentId, HttpServletRequest request, Model model) {
		CompanyEntity companyEntity = new CompanyEntity();
		DepartmentEntity departmentEntity = new DepartmentEntity();
		if (companyId != null) {
			companyEntity = companyService.findOne(companyId);
		}
		if (departmentId != null) {
			departmentEntity = service.findOne(departmentId);
		}
		request.setAttribute("departmentEntity", departmentEntity);
		request.setAttribute("entity", companyEntity);
		return "/system/department/department_add";
	}

	/**
	 * 查询combotree，用于树形选择
	 * 
	 * @return
	 * @author xunxun
	 * @date 2014-11-19 下午3:02:15
	 */
	@RequestMapping(value = "/combotree")
	@ResponseBody
	public List<DepartmentEntity> combotree(HttpServletRequest request, Model model) {
		List<DepartmentEntity> list = new ArrayList<DepartmentEntity>();
		DepartmentEntity resource = new DepartmentEntity();
		resource.setId(0L);
		resource.setName("无父节点");
		list.add(resource);
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_", true);
		list.addAll(service.findByParams(searchParams,
				new Sort(new Order("desc".equals("asc") ? Direction.DESC : Direction.ASC, "sortNumber"))));
		return list;
	}

	/**
	 * 查询treegrid，用于部门展示
	 * 
	 * @return
	 * @author wj
	 * @date 2015年3月25日10:34:46
	 */
	@RequestMapping(value = "/treegrid")
	@ResponseBody
	public List<DepartmentEntity> treegrid(@RequestParam(value = "companyId", required = false) Long companyId,
			@RequestParam(value = "sort", defaultValue = "sortNumber", required = false) String sort,
			@RequestParam(value = "order", defaultValue = "asc", required = false) String order,
			HttpServletRequest request, Model model) {
		Long theId = null;
		if (companyId != null)
			theId = companyId;
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_", true);
		Order o = new Order("desc".equals(order) ? Direction.DESC : Direction.ASC, sort);
		// 递归循环子集记录
		List<DepartmentEntity> result = new ArrayList<DepartmentEntity>();
		if (theId == null || theId == Constants.ZERO)
			result = service.findByParams(searchParams, new Sort(o));
		else {
			Map<String, Object> searchParams2 = new HashMap<String, Object>();
			searchParams2.put("EQ_id", theId);
			CompanyEntity newsTypeEntity = companyService.findOneByParams(searchParams2);
			Set<Long> ids = new HashSet<Long>();
			fillChildIds(newsTypeEntity, ids);
			searchParams.put("IN_companyEntity.id", ids);
			result = service.findByParams(searchParams, new Sort(o));
		}
		return result;
	}

	@AccessRequired("管理员")
	@RequestMapping(value = "/delete")
	@ResponseBody
	public Map<String, Object> delete(long id, Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		DepartmentEntity departmentEntity = service.findOne(id);
		Map<String, Object> searchParams = new HashMap<String, Object>();
		Map<String, Object> result = new HashMap<String, Object>();
		// 是否有子部门
		searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_parentId", departmentEntity.getId());
		long departChildrenCount = service.count(searchParams);
		if (departChildrenCount > 0) {
			result.put("success", false);
			result.put("msg", "删除失败，该部门含有子部门！");
			return result;
		}

		// 是否有员工
		searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_departmentEntity.id", departmentEntity.getId());
		long userCount = userService.count(searchParams);
		if (userCount > 0) {
			result.put("success", false);
			result.put("msg", "删除失败，该部门含有员工！");
			return result;
		}

		return super.delete(id, model, request, response);
	}

	private void fillChildIds(CompanyEntity entity, Set<Long> ids) {
		ids.add(entity.getId());
		if (entity.getChildren().size() > 0) {
			for (CompanyEntity children : entity.getChildren()) {
				ids.add(children.getId());
				fillChildIds(children, ids);
			}
		}
	}

	/**
	 * 查询treegrid，根据权限展示部门，
	 * 
	 * @return
	 * @author wj
	 * @date 2015年3月25日10:34:46
	 */
	// @RequestMapping(value = "/treegridByAudit")
	// @ResponseBody
	// public List<DepartmentEntity> treegridByAudit(
	// @RequestParam(value = "companyId", required = false) Long companyId,
	// @RequestParam(value = "sort", defaultValue = "sortNumber", required = false)
	// String sort,
	// @RequestParam(value = "order", defaultValue = "asc", required = false) String
	// order,
	// HttpServletRequest request, Model model) {
	// Long theId = null;
	// if (companyId != null && !"".equals(companyId))
	// theId = Long.valueOf(companyId.toString());
	// Map<String, Object> searchParams = Servlets.getParametersStartingWith(
	// request, "search_", true);
	// Order o = new Order("desc".equals(order) ? Direction.DESC
	// : Direction.ASC, sort);
	// // 递归循环子集记录
	// List<DepartmentEntity> result = new ArrayList<DepartmentEntity>();
	// if (theId == null || theId == Constants.ZERO)
	// result = service.findByParams(searchParams, new Sort(o));
	// else {
	// Map<String, Object> searchParams2 = new HashMap<String, Object>();
	// searchParams2.put("EQ_id", theId);
	// CompanyEntity newsTypeEntity = companyService
	// .findOneByParams(searchParams2);
	// Set<Long> ids = new HashSet<Long>();
	// fillChildIds(newsTypeEntity, ids);
	// searchParams.put("IN_companyEntity.id", ids);
	//
	// // 查询所有部门
	// result = service.findByParams(searchParams, new Sort(o));
	// // 查询该用户的 【课件部门权限】
	// searchParams.clear();
	// searchParams.put("EQ_userEntity.id",LoginContextHolder.get().getUserId());
	// List<DepartmentAuditUserEntity> auditList =
	// departmentAuditUserService.findByParams(searchParams, new Sort(o));
	//
	// // 数据权限：可见部门id
	// List<Long> auditDeptIds = new ArrayList<Long>();
	// for (DepartmentAuditUserEntity auditEntity : auditList) {
	// auditDeptIds.add(auditEntity.getDepartmentEntity().getId());
	// }
	//
	// // 筛选数据‘
	// for (DepartmentEntity deptEntity : result) {
	//
	// }
	// }
	// return result;
	// }

	/**
	 * 导航条层级
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/layers")
	@ResponseBody
	public Map<String, Object> layers(HttpServletRequest request, Model model) {
		String strId = request.getParameter("id");
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("ids", new ArrayList<Long>());
		result.put("names", new ArrayList<String>());
		if (StringUtils.isNotBlank(strId)) {
			try {
				service.getLayers(Long.valueOf(strId), result);
				List<Integer> steps = new ArrayList<Integer>();
				List<Long> ids = (List<Long>) result.get("ids");
				for (int index = 0; index < ids.size(); index++) {
					steps.add(index + 2);// 第二层 第三层
				}
				result.put("steps", steps);
				return result;
			} catch (Exception e) {
			}
		}
		return new HashMap<String, Object>();
	}

	/**
	 * 导航条层级
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/searchList")
	@ResponseBody
	public List<Object> searchList(HttpServletRequest request, Model model) {
		String companyId = request.getParameter("companyId");
		CompanyEntity company = companyService.findOne(Long.parseLong(companyId));
		List<Object> list = new ArrayList<Object>();
		list.add(company);
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_companyEntity.id", Long.parseLong(companyId));
		list.addAll(service.findByParams(searchParams));
		return list;
	}

	/**
	 * 保存更新方法<br>
	 * 带验证
	 * 
	 * @param t
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@AccessRequired("管理员")
	@RequestMapping(value = "/save")
	@ResponseBody
	public Map<String, Object> save(@ModelAttribute("T") DepartmentEntity t, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (t.getId() != null) {
			DepartmentEntity temp = service.findOne(t.getId());
			BeanUtils.copyProperties(t, temp);
			temp.setGmtModified(new Date());
			temp.setLastModifiedById(LoginContextHolder.get().getUserId());
			t = temp;
		} else {
			t.setGmtCreate(new Date());
			t.setCreateById(LoginContextHolder.get().getUserId());
		}
		// 验证实体类
		Set<ConstraintViolation<DepartmentEntity>> constraintViolations = validator.getValidator().validate(t);
		// 如果大于0，说明有验证未通过信息
		if (constraintViolations.size() > 0) {
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("success", false);
			result.put("msg", constraintViolations.iterator().next().getMessage());
			return result;
		}

		Map<String, Object> result = new HashMap<String, Object>();
		DepartmentEntity departmentEntity = service.save(t);
		result.put("success", true);
		result.put("obj", departmentEntity);
		return result;
	}
}
