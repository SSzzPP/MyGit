package com.yhlt.showcase.venue.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;

import org.springframework.beans.BeanUtils;
import org.springframework.data.domain.PageRequest;
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
import com.yhlt.showcase.venue.entity.VenueCourseEntity;
import com.yhlt.showcase.venue.service.VenueCourseService;
/**
* 课程
* 
* @author swy
* */
@Controller
@RequestMapping(value = "/admin/venue/course")
public class VenueCourseController extends BaseController<VenueCourseEntity, VenueCourseService>{

	
	@Override
	public String index(Model model) {
		return "venue/course/venue_course_index";
	}
	
	/**
	 * 跳转到新增页面
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/add")
	public String toAddPage(Long id, HttpServletRequest request, Model model) {
		VenueCourseEntity entity = new VenueCourseEntity();
		if (id != null) {
			entity = service.findOne(id);
		}
		request.setAttribute("entity", entity);
		return "venue/course/venue_course_add";
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
	@RequestMapping(value = "/saveInfo")
	@ResponseBody
	public Map<String, Object> saveInfo(@ModelAttribute("T") VenueCourseEntity t,Model model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (t.getId() != null) {
			VenueCourseEntity temp = service.findOne(t.getId());
			BeanUtils.copyProperties(t, temp);
			temp.setGmtModified(new Date());
			temp.setLastModifiedById(LoginContextHolder.get().getUserId());
			t = temp;
		} else {
			t.setGmtCreate(new Date());
			t.setCreateById(LoginContextHolder.get().getUserId());
		}
		// 验证实体类
		Set<ConstraintViolation<VenueCourseEntity>> constraintViolations = validator.getValidator().validate(t);
		// 如果大于0，说明有验证未通过信息
		if (constraintViolations.size() > 0) {
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("success", false);
			result.put("msg", constraintViolations.iterator().next().getMessage());
			return result;
		}

		Map<String, Object> result = new HashMap<String, Object>();
		VenueCourseEntity venueCourseEntity = service.save(t);
		
		result.put("success", true);
		result.put("obj", venueCourseEntity);
		return result;
	}
	/**
	 * 删除
	 * 
	 * @param t
	 * @param model
	 * @param request
	 * @param responses
	 * @return
	 * @throws Exception
	 */
	@AccessRequired("管理员")
	@RequestMapping(value = "/deleteInfo")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam("ids") Long id, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		if (id != null) {
			result = super.delete(id, model, request, response);
		} else {
			result.put("success", false);
			result.put("msg", "删除失败！");
		}
		return result;
	}
	@RequestMapping("/layuiTable")
	@ResponseBody
	public Map<String, Object> layuiTable(
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
		result.put("code", 200);
		result.put("msg", "暂无数据");
		return result;
	} 
}
