package com.yhlt.showcase.match.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.match.entity.MatchMainEntity;
import com.yhlt.showcase.match.service.MatchMainService;
import com.yhlt.showcase.match.service.MatchProjectService;

@Controller
@RequestMapping(value = "/match/main")
public class MatchMainController extends BaseController<MatchMainEntity, MatchMainService> {

	@Autowired
	private MatchProjectService matchProjectService;

	/**
	 * 赛事
	 * 
	 * @return
	 */
	@RequestMapping(value = "/toMatchMain")
	public String toMatchMain() {
		return "match/match_index";
	}

	/**
	 * 跳转至比赛详情
	 * 
	 * @return
	 */
	@RequestMapping(value = "/toMatchDetail")
	public String toMatchDetail(Long matchId, HttpServletRequest request) {
		request.setAttribute("matchId", matchId);
		return "match/match_detail";
	}

	/**
	 * 比赛项目详情
	 * 
	 * @param projectId
	 * @return
	 */
	@RequestMapping(value = "/findProjectDetaile")
	@ResponseBody
	public Map<String, Object> findProjectDetaile(Long projectId, Long matchId) {
		Map<String, Object> result = matchProjectService.findOneMap(projectId);
		MatchMainEntity t = service.findOne(matchId);
		result.put("status", t.getMatchStatus());
		return result;
	}

	/**
	 * 赛事报名须知
	 * 
	 * @return
	 */
	@RequestMapping(value = "/toTips")
	public String toTips(Long matchId, HttpServletRequest request) {
		request.setAttribute("matchId", matchId);
		return "match/match_tips";
	}
}
