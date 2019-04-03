package com.yhlt.showcase.subscribe.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.subscribe.dao.SportChannelMBDAO;
import com.yhlt.showcase.subscribe.dto.SportChannelDto;
import com.yhlt.showcase.subscribe.entity.NewsSubscribeEntity;
import com.yhlt.showcase.subscribe.service.NewsSubscribeService;

/**
 * @Description :消息订阅 Controller
 * @author zhuwenkai
 * @date 2018-09-03 11:00
 */
@Controller
@RequestMapping(value= "/mobile/news/subscribe")
public class NewsSubscribeController extends BaseController<NewsSubscribeEntity, NewsSubscribeService>{
	
	@Autowired
	private SportChannelMBDAO sportChannelMBDAO;
	
	@RequestMapping(value = "/newsSubscribeList")
	@ResponseBody
	public Map<String, Object> newsSubscribeList(
			@RequestParam(value = "page", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "rows", defaultValue = "10") Integer pageRows,
			@RequestParam(value = "sort", defaultValue = "id") String sort,
			@RequestParam(value = "order", defaultValue = "asc") String order,
			HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_", true);
		// 排序字段 多个用List
		Long loginUserId = LoginContextHolder.get().getUserId();
		searchParams.put("EQ_userId", loginUserId);
		Order o = new Order("desc".equals(order)?Direction.DESC:Direction.ASC, sort);
		Map<String, Object> result = service.findByParamsMap(searchParams,
				new PageRequest(pageNum - 1, pageRows,new Sort(o)));
		return result;
	}
	/**
	 * 修改消息推送状态
	 * @param enabled
	 * @param id
	 * @return
	 */
	@RequestMapping("/updateEnabled")
	@ResponseBody
	public Map<String, Object> updateEnabled(Integer enabled, long id) {
		boolean upadteSuccess = service.updateEnabled(enabled, id) > 0;
		Map<String, Object> result = new HashMap<>();
		result.put("success", upadteSuccess);
		return result;
	}
	/**
	 * 当前登录用户 健身频道 动态选项卡
	 * @return
	 */
	@RequestMapping("/dynamicTabDetail")
	@ResponseBody
	public Map<String, Object> dynamicTabDetail(){
		Long userId = LoginContextHolder.get().getUserId();
		SportChannelDto sportChannelDto = sportChannelMBDAO.findOneByUserId(userId);
		Map<String, Object> result = new HashMap<>();
		if(sportChannelDto!=null)
			result.put("success", true);
		else 
			result.put("success", false);
		result.put("obj", sportChannelDto);
		return result;
	}
	
}
