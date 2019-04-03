package com.yhlt.showcase.match.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.match.entity.MatchTeamUserEntity;
import com.yhlt.showcase.match.service.MatchProjectService;
import com.yhlt.showcase.match.service.MatchTeamUserService;

@Controller
@RequestMapping("/match/team/user")
public class MatchTeamUserController extends BaseController<MatchTeamUserEntity, MatchTeamUserService> {
	@Autowired
	private MatchProjectService matchProjectService;

	@RequestMapping("/getMatchContactsList")
	@ResponseBody
	public Map<String, Object> getMatchContactsList(Long teamId, Long projectId) {
		// 项目需求人数
		Long peopleNum = matchProjectService.findOne(projectId).getPeopleNum();
		Map<String, Object> result = new HashMap<String, Object>();
		Long loginUserId = LoginContextHolder.get().getUserId();
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_createById", loginUserId);
		// 查询和当前登录用户相关的联系人
		List<MatchTeamUserEntity> list = service.findByParams(searchParams);
		if (list != null && !list.isEmpty()) {
			// 去重复处理
			Set<String> idNames = new HashSet<String>();
			Set<String> teamUserIdNames = new HashSet<String>();
			for (MatchTeamUserEntity matchTeamUserEntity : list) {
				String idName = matchTeamUserEntity.getMatchUserId() + "-" + matchTeamUserEntity.getMatchUserName();
				if (matchTeamUserEntity.getTeamId() == teamId) {
					// 当前队伍中的人集合
					teamUserIdNames.add(idName);

				}
				idNames.add(idName);
			}
			if (teamUserIdNames != null && !teamUserIdNames.isEmpty()) {
				idNames.removeAll(teamUserIdNames);// 已在team中的不显示
			}
			result.put("success", true);
			result.put("idNames", idNames);
			result.put("existTeamUsers", teamUserIdNames.size());
			result.put("peopleNum", peopleNum);
		} else {
			result.put("success", false);
		}
		return result;
	}

	@RequestMapping("/saveMatchTeamUsers")
	@ResponseBody
	public Map<String, Object> saveMatchTeamUsers(Long teamId, String matchUserIds, HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<MatchTeamUserEntity> list = new ArrayList<>();
		String[] ids = matchUserIds.split(",");
		Long loginUserId = LoginContextHolder.get().getUserId();
		for (String id : ids) {
			if (StringUtils.isNotBlank(id)) {
				MatchTeamUserEntity matchTeamUserEntity = new MatchTeamUserEntity();
				matchTeamUserEntity.setCreateById(loginUserId);
				matchTeamUserEntity.setMatchUserId(Long.valueOf(id));
				matchTeamUserEntity.setTeamId(teamId);
				list.add(matchTeamUserEntity);
			}
		}
		service.save(list);
		result.put("success", true);
		return result;
	}
}
