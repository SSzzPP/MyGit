package com.yhlt.showcase.system.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.base.utils.Constants;
import com.yhlt.showcase.base.utils.CopyPropertiesUtil;
import com.yhlt.showcase.system.dto.ResourcesDto;
import com.yhlt.showcase.system.entity.ResourcesEntity;
import com.yhlt.showcase.system.service.ResourcesService;

/**
 * 系统资源
 * 
 * @author xunxun
 * @date 2014-11-15 下午2:45:18
 */
@Controller
@RequestMapping(value = "/admin/system/resources")
/* @AccessRequired("资源管理") */
public class ResourcesController extends BaseController<ResourcesEntity, ResourcesService> {

	@Override
	public String index(Model model) {
		return "system/resources/resources_index";
	}

	/**
	 * 供应商资源维护
	 */
	@RequestMapping(value = "/supplier")
	public String supplier(Model model) {
		return "system/resources/supplier_resources_index";
	}

	@RequestMapping(value = "/save")
	@ResponseBody
	public Map<String, Object> save(@ModelAttribute("T") ResourcesEntity t, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (t.getId() != null) {
			ResourcesEntity temp = service.findOne(t.getId());
			CopyPropertiesUtil.copyPropertiesIgnoreNull(t, temp);
			temp.setGmtModified(new Date());
			temp.setLastModifiedById(LoginContextHolder.get().getUserId());
			t = temp;
		} else {
			t.setGmtCreate(new Date());
			t.setCreateById(LoginContextHolder.get().getUserId());
		}
		// 验证实体类
		Set<ConstraintViolation<ResourcesEntity>> constraintViolations = validator.getValidator().validate(t);
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
	 * 查询treegrid,用于显示树
	 * 
	 * @return
	 * @author xunxun
	 * @date 2014-11-19 下午3:02:15
	 */
	@RequestMapping(value = "/treegrid")
	@ResponseBody
	public List<ResourcesEntity> treegrid(HttpServletRequest request, Model model) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		searchParams.put("EQ_deleteFlag", Constants.DELETE_FLAG_FALSE);
		String strParentId = request.getParameter("id");
		if (StringUtils.isNotBlank(strParentId)) {
			Long parentId = Long.valueOf(strParentId);
			searchParams.put("EQ_parentId", parentId);
		}
		List<ResourcesEntity> list = service.findByParams(searchParams);
		Collections.sort(list, new Comparator<ResourcesEntity>() {

			@Override
			public int compare(ResourcesEntity o1, ResourcesEntity o2) {
				return o1.getSortNumber().compareTo(o2.getSortNumber());
			}
		});
		return list;
	}

	/**
	 * 普通的资源树
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/ntreegrid")
	@ResponseBody
	public List<ResourcesDto> ntreegrid(HttpServletRequest request, Model model) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		searchParams.put("EQ_deleteFlag", Constants.DELETE_FLAG_FALSE);
		List<ResourcesEntity> resources = service.findByParams(searchParams);
		List<ResourcesDto> result = new ArrayList<ResourcesDto>();
		for (ResourcesEntity resourcesEntity : resources) {
			ResourcesDto dto = new ResourcesDto(resourcesEntity);
			initChilds(dto);
			result.add(dto);
		}
		return result;
	}

	/**
	 * 加载子级资源
	 * 
	 * @param parent
	 */
	private void initChilds(ResourcesDto parent) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		if (parent != null) {
			searchParams.put("EQ_parentId", parent.getId());
			List<ResourcesEntity> childs = service.findByParams(searchParams);
			List<ResourcesDto> dtos = new ArrayList<ResourcesDto>();
			if (childs != null && childs.size() > 0) {
				for (ResourcesEntity resource : childs) {
					ResourcesDto dto = new ResourcesDto(resource);
					initChilds(dto);
					dtos.add(dto);
				}
				parent.setChildren(dtos);
			}
		}
	}

	/**
	 * 查询combotree，用于树形选择
	 * 
	 * @return
	 * @author xunxun
	 * @date 2014-11-19 下午3:02:15
	 */
	@RequestMapping(value = "/combotree")
	@ResponseBody
	public List<ResourcesEntity> combotree(HttpServletRequest request, Model model) {
		List<ResourcesEntity> list = new ArrayList<ResourcesEntity>();
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		searchParams.put("EQ_deleteFlag", Constants.DELETE_FLAG_FALSE);
		String strParentId = request.getParameter("id");
		if (StringUtils.isNotBlank(strParentId)) {
			Long parentId = Long.valueOf(strParentId);
			if (parentId != 0) {
				searchParams.put("EQ_parentId", parentId);
			} else {
				return list;
			}
		} else {
			ResourcesEntity resource = new ResourcesEntity();
			resource.setId(Constants.ZERO);
			resource.setName("无");
			list.add(resource);
		}
		list.addAll(service.findByParams(searchParams));
		return list;
	}

	/**
	 * 删除
	 * 
	 * @param id
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 * @author xunxun
	 * @date 2015-1-15 上午11:52:31
	 */
	@RequestMapping(value = "/delete")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam("ids") long id, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		service.delete(id);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		return result;
	}

	/**
	 * 逻辑删除 递归赋值
	 * 
	 * @param resources
	 * @param date
	 * @author xunxun
	 * @date 2015-1-15 下午2:49:24
	 */
	// private void delete(ResourcesEntity resources, Date date) {
	// resources.setDeleteFlag(Constants.DELETE_FLAG_TRUE);
	// resources.setGmtModified(date);
	// resources.setLastModifiedById(LoginContextHolder.get().getUserId());
	// /*
	// * Set<ResourcesEntity> reSet = resources.getChildren(); if (reSet !=
	// * null && reSet.size() > 0) { for (ResourcesEntity res : reSet) {
	// * delete(res, date); } }
	// */
	// }
	/**
	 * 跳转到修改页面
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/add")
	public String toEditPage(Model model, HttpServletRequest request, HttpServletResponse response, Long id) {
		if (id != null) {
			request.setAttribute("entity", service.findOne(id));
		}
		return "system/resources/resources_add";
	}

}
