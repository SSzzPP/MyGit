package com.yhlt.showcase.match.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.AccessRequired;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.match.entity.MatchMainProjectEntity;
import com.yhlt.showcase.match.entity.MatchProjectEntity;
import com.yhlt.showcase.match.service.MatchMainProjectService;
import com.yhlt.showcase.match.service.MatchProjectService;

@Controller
@RequestMapping(value = "/admin/match/project")
public class MatchProjectController extends BaseController<MatchProjectEntity, MatchProjectService> {

	@Autowired
	private MatchMainProjectService matchMainProjectService;

	@Override
	public String index(Model model) {
		return "match/project/project_index";
	}

	/**
	 * 新增
	 * 
	 * @return
	 */
	@RequestMapping(value = "/toProjectAdd")
	public String toProjectAdd(HttpServletRequest request, Long matchId) {
		if (matchId != null) {
			request.setAttribute("matchId", matchId);
		}
		return "match/project/project_add";
	}

	/**
	 * 修改
	 * 
	 * @param request
	 * @param projectId
	 * @return
	 */
	@RequestMapping(value = "/toProjectEdit")
	public String toProjectEdit(HttpServletRequest request, Long projectId, Long matchId) {
		MatchProjectEntity matchProjectEntity = service.findOne(projectId);
		request.setAttribute("entity", matchProjectEntity);
		return "match/project/project_edit";
	}

	/**
	 * 保存更新方法<br>
	 * 带验证
	 * 
	 * @param t
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@AccessRequired("管理员")
	@RequestMapping(value = "/saveProject")
	@ResponseBody
	public Map<String, Object> saveProject(MatchProjectEntity t, Long matchId, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (t.getId() != null) {
			MatchProjectEntity temp = service.findOne(t.getId());
			BeanUtils.copyProperties(t, temp);
			temp.setGmtModified(new Date());
			temp.setLastModifiedById(LoginContextHolder.get().getUserId());
			t = temp;
		} else {
			t.setGmtCreate(new Date());
			t.setCreateById(LoginContextHolder.get().getUserId());
		}
		// 验证实体类
		Set<ConstraintViolation<MatchProjectEntity>> constraintViolations = validator.getValidator().validate(t);
		// 如果大于0，说明有验证未通过信息
		if (constraintViolations.size() > 0) {
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("success", false);
			result.put("msg", constraintViolations.iterator().next().getMessage());
			return result;
		}
		Map<String, Object> result = service.saveMap(t);
		if (matchId != null) {
			MatchMainProjectEntity matchMainProjectEntity = new MatchMainProjectEntity();
			matchMainProjectEntity.setMainId(matchId);
			matchMainProjectEntity.setMatchProjectEntity(service.findOne(t.getId()));
			matchMainProjectService.save(matchMainProjectEntity);
		}
		return result;
	}

}
