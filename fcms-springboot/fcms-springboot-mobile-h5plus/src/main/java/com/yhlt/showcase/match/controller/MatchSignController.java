package com.yhlt.showcase.match.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.match.entity.MatchSignEntity;
import com.yhlt.showcase.match.entity.MatchTeamUserEntity;
import com.yhlt.showcase.match.entity.MatchUserEntity;
import com.yhlt.showcase.match.service.MatchSignService;
import com.yhlt.showcase.match.service.MatchTeamUserService;
import com.yhlt.showcase.match.service.MatchUserService;

@Controller
@RequestMapping(value = "/match/sign")
public class MatchSignController extends BaseController<MatchSignEntity, MatchSignService> {

	@Autowired
	private MatchUserService matchUserService;
	@Autowired
	private MatchTeamUserService matchTeamUserService;

	/**
	 * 跳转到添加人员
	 * 
	 * @param matchId
	 * @param project
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/toOneSign")
	public String toOneSign(Long matchId, Long projectId, Long teamId, Integer type, HttpServletRequest request) {
		if (teamId != null) {
			request.setAttribute("teamId", teamId);
		}
		if (matchId != null) {
			request.setAttribute("matchId", matchId);
		}
		if (projectId != null) {
			request.setAttribute("projectId", projectId);
		}
		if (type != null) {
			request.setAttribute("type", type);
		}
		return "match/match_sign";
	}

	/**
	 * 
	 * 跳转到常用联系人页面
	 * 
	 * @return
	 */
	@RequestMapping("/toMatchContacts")
	public String toMatchContacts(Long teamId, Long projectId, Long matchId, HttpServletRequest request) {
		request.setAttribute("teamId", teamId);
		request.setAttribute("projectId", projectId);
		request.setAttribute("matchId", matchId);
		return "match/match_contacts";
	}

	/**
	 * 保存参赛人员(有队伍创建并保存到队伍)
	 * 
	 * @param name
	 * @param sex
	 * @param mobile
	 * @param matchId
	 * @param projectId
	 * @return
	 */
	@RequestMapping(value = "/saveMatchUser")
	@ResponseBody
	public Map<String, Object> saveMatchUser(String name, Long sex, String mobile, Long teamId, Long matchId,
			Long projectId, Integer type) {
		Map<String, Object> result = new HashMap<>();
		result.put("success", false);
		MatchUserEntity t = new MatchUserEntity();
		t.setName(name);
		t.setSex(sex);
		t.setMobile(mobile);
		t.setCreateById(LoginContextHolder.get().getUserId());
		Set<ConstraintViolation<MatchUserEntity>> constraintViolations = validator.getValidator().validate(t);
		// 如果大于0，说明有验证未通过信息
		if (constraintViolations.size() > 0) {
			result.put("success", false);
			result.put("msg", constraintViolations.iterator().next().getMessage());
			return result;
		}
		t = matchUserService.save(t);
		if (teamId != null) {
			MatchTeamUserEntity entity = new MatchTeamUserEntity();
			entity.setCreateById(LoginContextHolder.get().getUserId());
			entity.setMatchUserId(t.getId());
			matchTeamUserService.save(entity);
		}
		if (type != 1) {
			MatchSignEntity matchSignEntity = new MatchSignEntity();
			matchSignEntity.setCreateById(LoginContextHolder.get().getUserId());
			matchSignEntity.setMatchId(matchId);
			matchSignEntity.setProjectId(projectId);
			matchSignEntity.setType(0L);
			matchSignEntity.setStatus(0L);
			matchSignEntity.setMatchUserId(t.getId());
			service.save(matchSignEntity);
		}

		result.put("success", true);
		result.put("obj", t);
		return result;
	}

	/**
	 * 报名
	 * 
	 * @param matchId
	 * @param projectId
	 * @param type
	 *            teamId 团队赛是团队 id 单人赛是个人报名信息id
	 * 
	 * @return
	 */
	@RequestMapping(value = "/saveSign")
	@ResponseBody
	public Map<String, Object> saveSign(Long matchId, Long projectId, Long type, Long teamId) {
		Map<String, Object> result = new HashMap<>();
		result.put("success", false);
		Map<String, Object> search = new HashMap<>();
		search.put("EQ_matchId", matchId);
		search.put("EQ_projectId", projectId);
		search.put("EQ_createById", LoginContextHolder.get().getUserId());
		MatchSignEntity matchSignEntity = service.findOneByParams(search);
		if (matchSignEntity.getStatus() == 1) {
			result.put("msg", "已报名，请勿重复报名");
			return result;
		}
		matchSignEntity.setStatus(1L);
		result = service.saveMap(matchSignEntity);
		/*
		 * if (teamId == null) { result.put("success", false); result.put("msg",
		 * "请先添加人员"); return result; } MatchSignEntity entity = new MatchSignEntity();
		 * entity.setMatchId(matchId); entity.setProjectId(projectId); if (type == 0) {
		 * entity.setMatchUserId(teamId); entity.setType(0L); } if (type == 1) {
		 * entity.setTeamId(teamId); entity.setType(1L); }
		 * 
		 * Set<ConstraintViolation<MatchSignEntity>> constraintViolations =
		 * validator.getValidator().validate(entity); // 如果大于0，说明有验证未通过信息 if
		 * (constraintViolations.size() > 0) { result.put("success", false);
		 * result.put("msg", constraintViolations.iterator().next().getMessage());
		 * return result; } entity.setCreateById(LoginContextHolder.get().getUserId());
		 * result = service.saveMap(entity);
		 */
		return result;
	}

}
