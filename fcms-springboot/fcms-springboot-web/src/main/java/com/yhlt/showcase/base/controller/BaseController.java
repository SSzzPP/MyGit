package com.yhlt.showcase.base.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.ValidatorFactory;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.entity.BaseEntity;
import com.yhlt.showcase.base.security.AccessRequired;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.base.util.Servlets;

/**
 * 基础Controller
 * 
 * @author admin
 * 
 * @param <T>
 * @param <Service>
 */
public abstract class BaseController<T extends BaseEntity<Long>, Service extends BaseService<T, ?>> {

	@Autowired
	protected Service service;
	/**
	 * hibernate验证器
	 */
	@Autowired
	protected ValidatorFactory validator;

	/**
	 * 默认主页方法
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping()
	public abstract String index(Model model);

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
	public Map<String, Object> save(@ModelAttribute("T") T t, Model model,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		if (t.getId() != null) {
			T temp = service.findOne(t.getId());
			BeanUtils.copyProperties(t, temp);
			temp.setGmtModified(new Date());
			temp.setLastModifiedById(LoginContextHolder.get().getUserId());
			t = temp;
		} else {
			t.setGmtCreate(new Date());
			t.setCreateById(LoginContextHolder.get().getUserId());
		}
		// 验证实体类
		Set<ConstraintViolation<T>> constraintViolations = validator
				.getValidator().validate(t);
		// 如果大于0，说明有验证未通过信息
		if (constraintViolations.size() > 0) {
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("success", false);
			result.put("msg", constraintViolations.iterator().next()
					.getMessage());
			return result;
		}

		Map<String, Object> result = service.saveMap(t);
		return result;
	}

	/**
	 * 分页查询，包含search_查询条件<br>
	 * 返回Map{row:{},total:{}}
	 * 
	 * @param pageNum
	 * @param pageRows
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(
			@RequestParam(value = "page", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "rows", defaultValue = "10") Integer pageRows,
			@RequestParam(value = "sort", defaultValue = "id") String sort,
			@RequestParam(value = "order", defaultValue = "asc") String order,
			HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_", true);
		// 排序字段 多个用List
		Order o = new Order("desc".equals(order)?Direction.DESC:Direction.ASC, sort);
		Map<String, Object> result = service.findByParamsMap(searchParams,
				new PageRequest(pageNum - 1, pageRows,new Sort(o)));
		return result;
	}

	/**
	 * 根据search_查找全部
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/search")
	@ResponseBody
	public List<T> search(HttpServletRequest request, Model model)
			throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_", true);
		return service.findByParams(searchParams);
	}
	/**
	 * 查询明细
	 * 
	 * @param id
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/detail")
	@ResponseBody
	public Map<String, Object> detail(@RequestParam("id") long id, Model model,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String, Object> result = service.findOneMap(id);
		return result;
	}

	/**
	 * 删除一条记录
	 * 
	 * @param id
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@AccessRequired("管理员")
	@RequestMapping(value = "/delete")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam("ids") long id,
			Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		service.delete(id);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		return result;
	}

	/**
	 * 批量删除
	 * 
	 * @param ids
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 * @author xunxun
	 * @date 2015-1-16 上午10:54:32
	 */
	@AccessRequired("管理员")
	@RequestMapping(value = "/batchDelete")
	@ResponseBody
	public Map<String, Object> batchDelete(@RequestParam("ids") Long[] ids,
			Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		for (Long id : ids) {
			service.delete(id);
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		return result;
	}

	/**
	 * 数据权限筛选内容
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/dataPermissionAll")
	@ResponseBody
	public List<T> dataPermissionAll(Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_", true);
		return service.findAllForDataPermission(searchParams);
	}

}
