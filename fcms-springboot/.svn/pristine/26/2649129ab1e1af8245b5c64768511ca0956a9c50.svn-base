package com.yhlt.showcase.match.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.match.entity.MatchMainProjectEntity;
import com.yhlt.showcase.match.service.MatchMainProjectService;

@Controller
@RequestMapping(value = "/match/main/project")
public class MatchMainProjectController extends BaseController<MatchMainProjectEntity, MatchMainProjectService> {

	/**
	 * 跳转到比赛项目详情页 所带参数teamId和matchUserId 是由添加人员时才会跳转
	 * 
	 * @param projectId
	 * @param matchId
	 * @param teamId
	 * @param matchUserId
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/toProjectDetail")
	public String toProjectDetail(Long projectId, Long matchId, Long teamId, Long matchUserId,
			HttpServletRequest request) {
		request.setAttribute("projectId", projectId);
		request.setAttribute("matchId", matchId);
		if (teamId != null) {
			request.setAttribute("teamId", teamId);
		}
		if (matchUserId != null) {
			request.setAttribute("matchUserId", matchUserId);
		}
		return "match/project_index";
	}
}
