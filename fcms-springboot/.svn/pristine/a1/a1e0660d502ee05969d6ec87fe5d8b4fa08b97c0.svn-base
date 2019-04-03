package com.yhlt.showcase.sensitive.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.sensitive.entity.SensitiveWordsViewEntity;
import com.yhlt.showcase.sensitive.service.SensitiveWordsViewService;
/**
* 敏感词视图
* 
* @author swy
* */
@Controller
@RequestMapping(value = "/admin/sensitive/view")
public class SensitiveWordsViewController extends BaseController<SensitiveWordsViewEntity, SensitiveWordsViewService>{

	
	@Override
	public String index(Model model) {
		return null;
	}
	
	/**
	 * 跳转到详情页面
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/toDetail")
	public String toAddPage(String content, HttpServletRequest request, Model model) {
		request.setAttribute("content", content);
		return "sensitive/sensitive_words_detail";
	}
	
}
