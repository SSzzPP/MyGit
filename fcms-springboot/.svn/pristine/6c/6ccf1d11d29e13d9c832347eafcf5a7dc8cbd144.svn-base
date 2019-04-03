package com.yhlt.showcase.match.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.match.entity.MatchMainProjectEntity;
import com.yhlt.showcase.match.entity.MatchProjectEntity;
import com.yhlt.showcase.match.service.MatchMainProjectService;
import com.yhlt.showcase.match.service.MatchProjectService;

@Controller
@RequestMapping(value = "/match/mainproject")
public class MatchMainProjectController extends BaseController<MatchMainProjectEntity, MatchMainProjectService> {

	@Autowired
	private MatchProjectService matchProjectService;

	@Override
	public String index(Model model) {
		return null;
	}

	@RequestMapping(value = "/toMatchProject")
	public String toMatchProject(HttpServletRequest reqeust, Long matchId) {
		reqeust.setAttribute("matchId", matchId);
		return "match/match/match_project_index";
	}

	/**
	 * 添加项目
	 * @param matchId
	 * @param projectIds
	 * @return
	 */
	@RequestMapping(value = "/saveMainProject")
	@ResponseBody
	public Map<String, Object> saveMainProject(Long matchId, Long projectIds[]) {
		List<MatchMainProjectEntity> list = new ArrayList<MatchMainProjectEntity>();
		for (Long projectId : projectIds) {
			Map<String, Object> searchParams = new HashMap<String, Object>();
			searchParams.put("EQ_mainId", matchId);
			searchParams.put("EQ_matchProjectEntity.id", projectId);
			List<MatchMainProjectEntity> search = service.findByParams(searchParams);
			if (search != null && search.size() > 0) {
				continue;
			}
			MatchMainProjectEntity entity = new MatchMainProjectEntity();
			entity.setMainId(matchId);
			entity.setMatchProjectEntity(matchProjectService.findOne(projectId));
			entity.setCreateById(LoginContextHolder.get().getUserId());
			entity.setGmtCreate(new Date());
			list.add(entity);
		}
		return service.save(list);
	}

	/**
	 * 展示已添加的项目
	 * @param pageNum
	 * @param pageRows
	 * @param sort
	 * @param order
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/projectList")
	@ResponseBody
	public Map<String, Object> projectList(@RequestParam(value = "page", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "rows", defaultValue = "10") Integer pageRows,
			@RequestParam(value = "sort", defaultValue = "finish") String sort,
			@RequestParam(value = "order", defaultValue = "desc") String order, HttpServletRequest request, Model model)
			throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_", true);
		Map<String, Object> result = new HashMap<String, Object>();
		// 排序字段 多个用List
		List<MatchMainProjectEntity> matchMainProjectEntity = service.findByParams(searchParams);
		List<MatchProjectEntity> matchProjectEntities = new ArrayList<MatchProjectEntity>();
		if (matchMainProjectEntity != null && matchMainProjectEntity.size() > 0) {
			for (MatchMainProjectEntity l : matchMainProjectEntity) {
				matchProjectEntities.add(l.getMatchProjectEntity());
			}
		}
		result.put("total", matchProjectEntities.size());
		result.put("rows", matchProjectEntities);
		return result;
	}
}
