package com.yhlt.showcase.sensitive.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.AccessRequired;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.sensitive.entity.SensitiveWordsEntity;
import com.yhlt.showcase.sensitive.service.SensitiveWordsService;
/**
* 敏感词
* 
* @author swy
* */
@Controller
@RequestMapping(value = "/admin/sensitive/words")
public class SensitiveWordsController extends BaseController<SensitiveWordsEntity, SensitiveWordsService>{

	
	@Override
	public String index(Model model) {
		return "sensitive/sensitive_words_index";
	}
	
	/**
	 * 跳转到新增/修改页面
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/add")
	public String toAddPage(Long id, HttpServletRequest request, Model model) {
		SensitiveWordsEntity entity = new SensitiveWordsEntity();
		if (id != null) {
			entity = service.findOne(id);
		}
		request.setAttribute("entity", entity);
		return "sensitive/sensitive_words_add";
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
	@RequestMapping(value = "/saveVenue")
	@ResponseBody
	public Map<String, Object> save(@ModelAttribute("T") SensitiveWordsEntity t,Model model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (t.getId() != null) {
			SensitiveWordsEntity temp = service.findOne(t.getId());
			BeanUtils.copyProperties(t, temp);
			temp.setGmtModified(new Date());
			temp.setLastModifiedById(LoginContextHolder.get().getUserId());
			t = temp;
		} else {
			t.setGmtCreate(new Date());
			t.setCreateById(LoginContextHolder.get().getUserId());
		}
		// 验证实体类
		Set<ConstraintViolation<SensitiveWordsEntity>> constraintViolations = validator.getValidator().validate(t);
		// 如果大于0，说明有验证未通过信息
		if (constraintViolations.size() > 0) {
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("success", false);
			result.put("msg", constraintViolations.iterator().next().getMessage());
			return result;
		}

		Map<String, Object> result = new HashMap<String, Object>();
		SensitiveWordsEntity sensitiveWordsEntity= service.save(t);
		
		result.put("success", true);
		result.put("obj", sensitiveWordsEntity);
		return result;
	}
	/**
	 * 删除
	 * 
	 * @param t
	 * @param model
	 * @param request
	 * @param response
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
