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
	/*消息订阅*/
	@RequestMapping("/toNewsSubscribe")
	public String toNewsSubscribe(Long translate, HttpServletRequest request) {
		request.setAttribute("translate", translate);
		return "newsSubscribe/newsSubscribe";
	}
	/*消息订阅*/
	@RequestMapping("/toDynamicURL")
	public String toDynamicURL(Long translate, HttpServletRequest request) {
		request.setAttribute("translate", translate);
		return "dynamicChannel/dynamic_channel_index";
	}
	/*体育赛事*/
	@RequestMapping("/toSportMatch")
	public String toSportMatch(Long translate, HttpServletRequest request) {
		request.setAttribute("translate", translate);
		return "dynamicChannel/sport_match";
	}
	/*法律法规*/
	@RequestMapping("/toLaws")
	public String toLaws(Long translate, HttpServletRequest request) {
		request.setAttribute("translate", translate);
		return "dynamicChannel/laws";
	}
	/*健身圈消息*/
	@RequestMapping("/toCircleNews")
	public String toCircleNews(Long translate, HttpServletRequest request) {
		request.setAttribute("translate", translate);
		return "dynamicChannel/circle_news";
	}
	/*赛事信息*/
	@RequestMapping("/toMatchNews")
	public String toMatchNews(Long translate, HttpServletRequest request) {
		request.setAttribute("translate", translate);
		return "dynamicChannel/match_news";
	}
	/*在线学习*/
	@RequestMapping("/toOnlineStudy")
	public String toOnlineStudy(Long translate, HttpServletRequest request) {
		request.setAttribute("translate", translate);
		return "dynamicChannel/online_study";
	}
	/*推荐场馆*/
	@RequestMapping("/toRecommendVenue")
	public String toRecommendVenue(Long translate, HttpServletRequest request) {
		request.setAttribute("translate", translate);
		return "dynamicChannel/recommend_venue";
	}
	/*著名教练*/
	@RequestMapping("/toFamousCoach")
	public String toFamousCoach(Long translate, HttpServletRequest request) {
		request.setAttribute("translate", translate);
		return "dynamicChannel/famous_coach";
	}
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
	public Map<String, Object> updateEnabled(Integer enabled, Long id) {
		Boolean upadteSuccess = service.updateEnabled(enabled, id) > 0;
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
		SportChannelDto sportChannelDto = null;
		sportChannelDto=sportChannelMBDAO.findOneByUserId(userId);
		Map<String, Object> result = new HashMap<>();
		if(sportChannelDto!=null)
			result.put("success", true);
		else 
			result.put("success", false);
		result.put("obj", sportChannelDto);
		return result;
	}
	
}
