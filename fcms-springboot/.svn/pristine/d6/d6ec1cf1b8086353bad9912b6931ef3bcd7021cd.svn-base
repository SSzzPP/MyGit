package com.yhlt.showcase.match.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.utils.SensitiveWordsUtil;
import com.yhlt.showcase.match.entity.MatchSignEntity;
import com.yhlt.showcase.match.entity.MatchTeamEntity;
import com.yhlt.showcase.match.entity.MatchTeamUserEntity;
import com.yhlt.showcase.match.entity.MatchUserEntity;
import com.yhlt.showcase.match.service.MatchSignService;
import com.yhlt.showcase.match.service.MatchTeamService;
import com.yhlt.showcase.match.service.MatchTeamUserService;
import com.yhlt.showcase.match.service.MatchUserService;

@Controller
@RequestMapping("/match/main/team")
public class MatchTeamController extends BaseController<MatchTeamEntity, MatchTeamService> {
	
	@Autowired
	private MatchTeamUserService matchTeamUserService;
	@Autowired
	private MatchUserService matchUserService;
	@Autowired
	private MatchSignService matchSignService;
	@Autowired
	private MatchTeamService matchTeamService;


	@RequestMapping("/saveMatchTeam")
	@ResponseBody
	public Map<String, Object> saveMatchTeam(String teamName, String leaderName, String mobile,Long matchId, Long projectId) {
		Map<String, Object> result = new HashMap<>();
		result.put("success", false);

		/*if (SensitiveWordsUtil.sensitiveFlag(teamName)) {
			result.put("msg", "您填写的团队名称不符合规范！");
			return result;
		}
		if (SensitiveWordsUtil.sensitiveFlag(leaderName)) {
			result.put("msg", "您填写的领队姓名不符合规范！");
			return result;
		}*/
		MatchTeamEntity matchTeamEntity = new MatchTeamEntity();
		matchTeamEntity.setTeamName(teamName);
		matchTeamEntity.setLeaderName(leaderName);
		matchTeamEntity.setMobile(mobile);
		matchTeamEntity = service.save(matchTeamEntity);
		
		MatchSignEntity matchSignEntity = new MatchSignEntity();
		matchSignEntity.setCreateById(LoginContextHolder.get().getUserId());
		matchSignEntity.setMatchId(matchId);
		matchSignEntity.setProjectId(projectId);
		matchSignEntity.setType(1L);
		matchSignEntity.setStatus(0L);
		matchSignEntity.setTeamId(matchTeamEntity.getId());
		matchSignService.save(matchSignEntity);
		
		result.put("teamId", matchTeamEntity.getId());
		MatchTeamEntity entity = service.save(matchTeamEntity);
		result.put("teamId", entity.getId());

		result.put("success", true);
		result.put("msg", "提交成功");
		return result;
	}
	
	/**
	 *
	 * @param matchUserId
	 * @return
	 */
	@RequestMapping(value = "/findMatchUser")
	@ResponseBody
	public Map<String, Object> findMatchUser (Long matchId,Long projectId) {
		Map<String, Object> result = new HashMap<>();
		result.put("success", false);
		Map<String, Object> search = new HashMap<>();
		search.put("EQ_matchId", matchId);
		search.put("EQ_projectId", projectId);
		search.put("EQ_createById", LoginContextHolder.get().getUserId());
		MatchSignEntity matchSignEntity = matchSignService.findOneByParams(search);
		if (matchSignEntity == null) {
			return result;
		}
		//个人赛
		if (matchSignEntity.getMatchUserId() != null) {
			MatchUserEntity t = matchUserService.findOne(matchSignEntity.getMatchUserId());
			result.put("success", true);
			result.put("obj", t);
		}
		//团队赛
		if (matchSignEntity.getTeamId() !=null) {
			search.clear();
			search.put("EQ_teamId",matchSignEntity.getTeamId());
			List<MatchTeamUserEntity> list = matchTeamUserService.findByParams(search);
			int num = 0;
			List<MatchUserEntity> userList = new ArrayList<MatchUserEntity>();
			for (MatchTeamUserEntity t : list) {
				num++;
				MatchUserEntity entity = matchUserService.findOne(t.getMatchUserId());
				userList.add(entity);
			}
			MatchTeamEntity matchTeam = matchTeamService.findOne(matchSignEntity.getTeamId());
			result.put("team", matchTeam);
			result.put("success", true);
			result.put("total", num);
			result.put("teamId", matchSignEntity.getTeamId());
			result.put("rows", userList);
		}
		return result;
	}
}