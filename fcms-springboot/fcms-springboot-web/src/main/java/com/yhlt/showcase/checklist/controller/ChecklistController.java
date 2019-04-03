package com.yhlt.showcase.checklist.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.AccessRequired;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.base.utils.CopyPropertiesUtil;
import com.yhlt.showcase.checklist.entity.ChecklistEntity;
import com.yhlt.showcase.checklist.service.ChecklistService;
import com.yhlt.showcase.checklist.utils.RiskConstants;
import com.yhlt.showcase.system.service.UserService;

/**
 * 安保专项检查单类型
 * 
 * @author GCK
 * 
 */
@Controller
@RequestMapping(value = "/admin/checklist")
public class ChecklistController extends BaseController<ChecklistEntity, ChecklistService> {

	@Autowired
	private UserService userService;

	@Override
	public String index(Model model) {
		return "checklist/checklist_index";
	}
	
	@RequestMapping(value="/index2")
	public String index2(Model model) {
		return "checklist/checklist_config_index";
	}
	
	@RequestMapping(value = "/add")
	public String add(HttpServletRequest request, Model model, Long entityId) {
		ChecklistEntity entity = null;
		if (entityId != null) {
			entity = service.findOne(entityId);
		}
		request.setAttribute("entity", JSON.toJSON(entity));
		return "checklist/checklist_add";
	}
	
	@RequestMapping(value = "/addConfig")
	public String addConfig(HttpServletRequest request, Model model, Long entityId,Long parentId) {
		ChecklistEntity entity = null ;
		if (entityId != null) {
			entity = service.findOne(entityId);
		}
		request.setAttribute("parentId", parentId);
		request.setAttribute("entity", JSON.toJSON(entity));
		return "checklist/checklist_config_add";
	}


	@Override
	public Map<String, Object> save(ChecklistEntity t, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (t.getId() != null) {
			ChecklistEntity temp = service.findOne(t.getId());
			CopyPropertiesUtil.copyPropertiesIgnoreNull(t, temp);
			temp.setGmtModified(new Date());
			temp.setLastModifiedById(LoginContextHolder.get().getUserId());
			t = temp;
		} else {
			t.setGmtCreate(new Date());
			t.setCreateById(LoginContextHolder.get().getUserId());
			t.setSortNumber(service.findUserSortNumberMax() + 1);
			t.setUuid(UUID.randomUUID().toString());
		}
		// 验证实体类
		Set<ConstraintViolation<ChecklistEntity>> constraintViolations = validator.getValidator().validate(t);
		// 如果大于0，说明有验证未通过信息
		if (constraintViolations.size() > 0) {
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("success", false);
			result.put("msg", constraintViolations.iterator().next().getMessage());
			return result;
		}

		Map<String, Object> result = service.saveMap(t);
		return result;
	}

	/**
	 * 查询combotree，用于树形选择
	 * 
	 */
	@RequestMapping(value = "/combotree")
	@ResponseBody
	public List<ChecklistEntity> combotree(HttpServletRequest request, Model model) {
		List<ChecklistEntity> list = new ArrayList<ChecklistEntity>();
		ChecklistEntity resource = new ChecklistEntity();
		resource.setId(0L);
		resource.setName("无父节点");
		list.add(resource);
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_", true);
		list.addAll(service.findByParams(searchParams));
		return list;
	}

	/**
	 * 用户排序
	 * 
	 * @param sortType
	 *            0-升，1-降
	 * @param userId
	 * @param request
	 * @param model
	 * @return
	 */
	@AccessRequired("管理员")
	@RequestMapping(value = "/checklistSort")
	@ResponseBody
	public Map<String, Object> checklistSort(@RequestParam int sortType, @RequestParam long securityAssuranceId,
			HttpServletRequest request, Model model) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			ChecklistEntity securityAssurance = service.findOne(securityAssuranceId);
			int currentSortNumber = securityAssurance.getSortNumber();

			Page<ChecklistEntity> securityAssuranceEntityList = null;
			// 升
			if (sortType == 0) {
				Map<String, Object> searchParams = new HashMap<String, Object>();
				searchParams.put("LT_sortNumber", currentSortNumber);
				securityAssuranceEntityList = service.findByParams(searchParams,
						new PageRequest(0, 1, new Sort(new Order(Direction.DESC, "sortNumber"))));
			} else {
				// 降
				Map<String, Object> searchParams = new HashMap<String, Object>();
				searchParams.put("GT_sortNumber", currentSortNumber);
				securityAssuranceEntityList = service.findByParams(searchParams,
						new PageRequest(0, 1, new Sort(new Order(Direction.ASC, "sortNumber"))));
			}
			if (securityAssuranceEntityList != null && securityAssuranceEntityList.getSize() > 0) {
				ChecklistEntity securityAssuranceEntityTemp = securityAssuranceEntityList.getContent().get(0);
				securityAssurance.setSortNumber(securityAssuranceEntityTemp.getSortNumber());
				securityAssuranceEntityTemp.setSortNumber(currentSortNumber);
				service.save(securityAssurance);
				service.save(securityAssuranceEntityTemp);
			}
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}

	/**
	 * 
	 * @param id
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteJudge")
	@ResponseBody
	public Map<String, Object> deletetype1(@RequestParam("ids") long id, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> securityAssuranceCount = new HashMap<String, Object>();
		securityAssuranceCount.put("EQ_parentId", id);
		long count = service.count(securityAssuranceCount);
		if (count == 0) {
			service.delete(id);
			result.put("success", true);
		} else {
			result.put("success", false);
			result.put("msg", "请先删除子节点");
		}
		return result;
	}

	@RequestMapping(value = "/tree")
	@ResponseBody
	public List<ChecklistEntity> tree(HttpServletRequest request) {
		List<ChecklistEntity> list = new ArrayList<ChecklistEntity>();
		ChecklistEntity securityAssuranceEntity = new ChecklistEntity();
		securityAssuranceEntity.setId(0L);
		securityAssuranceEntity.setName("全部");
		list.add(securityAssuranceEntity);
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		securityAssuranceEntity.setChildren(new HashSet<ChecklistEntity>(
				service.findByParams(searchParams, new Sort(Sort.Direction.ASC, "sortNumber"))));
		return list;

	}

	/**
	 * 只显示fix = 0
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/tree2")
	@ResponseBody
	public List<ChecklistEntity> tree2(HttpServletRequest request) {
		List<ChecklistEntity> list = new ArrayList<ChecklistEntity>();
		ChecklistEntity securityAssuranceEntity = new ChecklistEntity();
		securityAssuranceEntity.setId(0L);
		securityAssuranceEntity.setName("全部");
		list.add(securityAssuranceEntity);
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		searchParams.put("EQ_fix", RiskConstants.Checklist_FIX);
		securityAssuranceEntity.setChildren(new HashSet<ChecklistEntity>(
				service.findByParams(searchParams, new Sort(Sort.Direction.ASC, "sortNumber"))));
		return list;
	}

	/**
	 * 展示检查依据树treeGist
	 * 
	 * @param request
	 * @param parentId
	 * @return
	 */
	@RequestMapping(value = "/treeType")
	@ResponseBody
	public List<ChecklistEntity> treeGist(HttpServletRequest request, Integer parentId, Integer type) {
		List<ChecklistEntity> list = new ArrayList<ChecklistEntity>();
		Map<String, Object> searchParams = new HashMap<String, Object>();

		if (parentId != null && type != null) {
			searchParams.put("EQ_parentId", parentId);
			searchParams.put("EQ_type", type);
			searchParams.put("EQ_fix", RiskConstants.Checklist_FIX);
			list = service.findByParams(searchParams);
		}
		return list;
	}

	@RequestMapping(value = "/treeAll")
	@ResponseBody
	public List<ChecklistEntity> treeAll(HttpServletRequest request, Integer parentId) {
		List<ChecklistEntity> list = new ArrayList<ChecklistEntity>();
		Map<String, Object> searchParams = new HashMap<String, Object>();

		if (parentId != null) {
			if (parentId.equals(0)) {
				ChecklistEntity securityAssuranceEntity = new ChecklistEntity();
				securityAssuranceEntity.setId(0L);
				securityAssuranceEntity.setName("全部");
				// securityAssuranceEntity.setState("closed");
				securityAssuranceEntity.setType(0);
				securityAssuranceEntity.setTypeStatus("无");
				list.add(securityAssuranceEntity);
				searchParams.put("EQ_parentId", parentId);
				searchParams.put("EQ_fix", RiskConstants.Checklist_FIX);
				securityAssuranceEntity.setChildren(new HashSet<ChecklistEntity>(
						service.findByParams(searchParams, new Sort(Sort.Direction.ASC, "sortNumber"))));
			} else {
				searchParams.put("EQ_parentId", parentId);
				list = service.findByParams(searchParams);
			}
		}
		return list;
	}



	@RequestMapping(value = "/edit")
	@ResponseBody
	public Map<String, Object> edit(Long id, Model model, HttpServletRequest request, HttpServletResponse response,
			String remark) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("msg", "保存失败！");
		result.put("success", false);

		if (id != null) {
			ChecklistEntity parentEntity = service.findOne(id);

			ChecklistEntity securityAssuranceEntity = new ChecklistEntity();
			// CopyPropertiesUtil.copyPropertiesIgnoreNull(
			// securityAssuranceEntity, parentEntity);
			CopyPropertiesUtil.copyPropertiesIgnoreNull(parentEntity, securityAssuranceEntity);
			// BeanUtils.copyProperties(securityAssuranceEntity, parentEntity);
			securityAssuranceEntity.setName(remark);
			securityAssuranceEntity.setGmtModified(new Date());
			securityAssuranceEntity.setLastModifiedById(LoginContextHolder.get().getUserId());

			result = service.saveMap(securityAssuranceEntity);
		}
		return result;
	}

	@Override
	public Map<String, Object> delete(long id, Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		Map<String, Object> result = new HashMap<String, Object>();

		result.put("success", false);

		searchParams.put("EQ_parentId", id);
		List<ChecklistEntity> assuranceEntities = service.findByParams(searchParams);
		if (assuranceEntities != null && assuranceEntities.size() > 0) {
			return result;
		} else {
			service.delete(id);
			result.put("success", true);
		}

		return result;
	}


}
