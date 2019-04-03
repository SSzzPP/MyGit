package com.yhlt.showcase.match.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.match.entity.MatchMainEntity;
import com.yhlt.showcase.match.service.MatchMainService;

@Controller
@RequestMapping(value = "/admin/match/main")
public class MatchMainController extends BaseController<MatchMainEntity, MatchMainService> {

	@Override
	public String index(Model model) {
		return "match/match/match_index";
	}

	/**
	 * 新增和修改
	 * 
	 * @param request
	 * @param matchId
	 * @return
	 */
	@RequestMapping(value = "/toMatchAdd")
	public String toMatchAdd(HttpServletRequest request, Long matchId) {
		if (matchId != null) {
			MatchMainEntity matchEntity = service.findOne(matchId);
			request.setAttribute("matchEntity", matchEntity);
		}
		return "match/match/match_add";
	}

	/**
	 * 发布赛事
	 * 
	 * @param matchId
	 * @return
	 */
	@RequestMapping(value = "sendMatch")
	@ResponseBody
	public Map<String, Object> sendMatch(Long matchId) {
		MatchMainEntity entity = service.findOne(matchId);
		entity.setStatus(1);
		return service.saveMap(entity);
	}

}
