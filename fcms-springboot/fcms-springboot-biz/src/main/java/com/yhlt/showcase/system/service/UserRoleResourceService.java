package com.yhlt.showcase.system.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.base.utils.Constants;
import com.yhlt.showcase.system.dao.UserRoleResourceDao;
import com.yhlt.showcase.system.dao.UserRoleResourcesMBDAO;
import com.yhlt.showcase.system.dto.SystemMenuDto;
import com.yhlt.showcase.system.dto.UserRoleResourceDto;
import com.yhlt.showcase.system.entity.UserRoleResourceEntity;

@Component
@Transactional
@BusinessLog(service = "用户资源信息查询")
@DataPermission
public class UserRoleResourceService extends
		BaseService<UserRoleResourceEntity, UserRoleResourceDao> {

	@Autowired
	private UserRoleResourcesMBDAO userRoleResourcesMBDAO;

	/**
	 * Mybatis 查询用户权限角色
	 * 
	 * @param param
	 * @return
	 */
	public List<UserRoleResourceDto> findUserRoleResourceByMap(
			Map<String, Object> param) {
		return userRoleResourcesMBDAO.findUserRoleResource(param);
	}

	/**
	 * 根据ID查找
	 * 
	 * @param id
	 * @return T
	 */
	public List<SystemMenuDto> findSystemMenuByUserId(long userId, Long parentId) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
//		searchParams.put("EQ_deleteFlag", Constants.DELETE_FLAG_FALSE);
		searchParams.put("resourceFlag", 0);
		searchParams.put("userId", userId);
		searchParams.put("type", Constants.RESOURCE_TYPE_MENU);
		// if (parentId != null)
		// searchParams.put("EQ_parentId", parentId);
		List<UserRoleResourceDto> list = userRoleResourcesMBDAO.findUserRoleResource(searchParams);
		// sortnumber排序
		Collections.sort(list, new Comparator<UserRoleResourceDto>() {

			@Override
			public int compare(UserRoleResourceDto o1,
					UserRoleResourceDto o2) {
				return o1.getSortNumber().compareTo(o2.getSortNumber());
			}
		});
		List<SystemMenuDto> root = new ArrayList<SystemMenuDto>();
		for (UserRoleResourceDto resourceEntity : list) {
			if (parentId == null && resourceEntity.getParentId().equals(0L)) {
				root.add(getChildRenList(resourceEntity, list));
			} else if (resourceEntity.getParentId().equals(parentId)) {
				root.add(getChildRenList(resourceEntity, list));
			}
		}
		return root;
	}

	/**
	 * 递归菜单
	 * 
	 * @param resourceEntity
	 * @param list
	 * @return
	 */
	private SystemMenuDto getChildRenList(
			UserRoleResourceDto resourceEntity,
			List<UserRoleResourceDto> list) {
		SystemMenuDto systemMenuDto = new SystemMenuDto(resourceEntity.getId(),
				resourceEntity.getName(), resourceEntity.getDescription(),
				resourceEntity.getIcon(), resourceEntity.getUrl());
		for (UserRoleResourceDto userRoleResourceEntity : list) {
			if (resourceEntity.getId().equals(
					userRoleResourceEntity.getParentId())) {
				systemMenuDto.getChildren().add(
						getChildRenList(userRoleResourceEntity, list));
			}
		}
		return systemMenuDto;
	}

}
