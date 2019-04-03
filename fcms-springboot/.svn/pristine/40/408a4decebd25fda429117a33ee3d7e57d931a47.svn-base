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
public class MatchMainController extends BaseController<MatchMainEntity, MatchMainService>{

	@Autowired
	private MatchProjectService matchProjectService;
	
	/**
	 * 比赛项目详情
	 * @param projectId
	 * @return
	 */
	@RequestMapping(value = "/findProjectDetaile")
	@ResponseBody
	public Map<String, Object> findProjectDetaile (Long projectId,Long matchId) {
		Map<String, Object> result = matchProjectService.findOneMap(projectId);
		MatchMainEntity t = service.findOne(matchId);
		result.put("status", t.getMatchStatus());
		 return result;
	}
}
