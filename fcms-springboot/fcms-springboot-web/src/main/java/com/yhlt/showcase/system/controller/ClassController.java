package com.yhlt.showcase.system.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.AccessRequired;
import com.yhlt.showcase.system.entity.ClassEntity;
import com.yhlt.showcase.system.service.ClassService;
/**
 * @Description: 班级controller
 * @author szp
 * @date 2019-02-25 14:24
 */
@Controller
@RequestMapping(value = "/admin/system/class")
public class ClassController extends BaseController<ClassEntity, ClassService> {

	@Override
	public String index(Model model) {
		return "system/class_index";
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
		ClassEntity entity = new ClassEntity();
		if (id != null) {
			entity = service.findOne(id);
			request.setAttribute("entity", entity);
		}
		return "system/class_add";
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

}
