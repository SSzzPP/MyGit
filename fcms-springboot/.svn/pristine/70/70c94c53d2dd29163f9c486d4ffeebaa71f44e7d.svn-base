package com.yhlt.showcase.system.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.base.utils.Constants;
import com.yhlt.showcase.system.dao.ResourcesDao;
import com.yhlt.showcase.system.dto.SystemMenuDto;
import com.yhlt.showcase.system.dto.UserRoleResourceDto;
import com.yhlt.showcase.system.entity.ResourcesEntity;
import com.yhlt.showcase.system.entity.UserRoleResourceEntity;

/**
 * 系统资源
 * @author xunxun
 * @date 2014-11-15 下午2:46:12
 */
@Component
@Transactional
@BusinessLog(service = "资源信息管理")
@DataPermission
public class ResourcesService extends BaseService<ResourcesEntity, ResourcesDao>{

	/**
	 * 根据session中的菜单查找数据
	 * 
	 * @param id
	 * @return T
	 */
	public List<SystemMenuDto> findSystemMenuByList(
			List<UserRoleResourceEntity> resourcesEntities, Long parentId) {
		List<UserRoleResourceEntity> list = resourcesEntities;
		// sortnumber排序
		Collections.sort(list, new Comparator<UserRoleResourceEntity>() {

			@Override
			public int compare(UserRoleResourceEntity o1,
					UserRoleResourceEntity o2) {
				return o1.getSortNumber().compareTo(o2.getSortNumber());
			}
		});
		List<SystemMenuDto> root = new ArrayList<SystemMenuDto>();
		for (UserRoleResourceEntity resourceEntity : list) {
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
	private SystemMenuDto getChildRenList(UserRoleResourceEntity resourceEntity,
			List<UserRoleResourceEntity> list) {
		SystemMenuDto systemMenuDto = new SystemMenuDto(resourceEntity.getId(),
				resourceEntity.getName(), resourceEntity.getDescription(),
				resourceEntity.getIcon(), resourceEntity.getUrl());
		for (UserRoleResourceEntity userRoleResourceEntity : list) {
			if (resourceEntity.getId().equals(
					userRoleResourceEntity.getParentId())) {
				systemMenuDto.getChildren().add(
						getChildRenList(userRoleResourceEntity, list));
			}
		}
		return systemMenuDto;
	}

	public List<SystemMenuDto> findSystemMenuByDtoList(
			List<UserRoleResourceDto> resourcesEntities, Long parentId) {
		List<UserRoleResourceDto> list = resourcesEntities;
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
			if (parentId == null && resourceEntity.getParentId().equals(0L)) {// 加载一级菜单
				root.add(getChildRenList2(resourceEntity, list));
			} else if (resourceEntity.getParentId().equals(parentId)) {// 加载二级菜单
				root.add(getChildRenList2(resourceEntity, list));
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
	private SystemMenuDto getChildRenList2(UserRoleResourceDto resourceEntity,
			List<UserRoleResourceDto> list) {
		SystemMenuDto systemMenuDto = new SystemMenuDto(resourceEntity.getId(),
				resourceEntity.getName(), resourceEntity.getDescription(),
				resourceEntity.getIcon(), resourceEntity.getUrl());
		for (UserRoleResourceDto userRoleResourceEntity : list) {
			if (resourceEntity.getId().equals(
					userRoleResourceEntity.getParentId())) {
				systemMenuDto.getChildren().add(
						getChildRenList2(userRoleResourceEntity, list));
			}
		}
		return resourceEntity.getType()==Constants.RESOURCE_TYPE_MENU?systemMenuDto:null;
	}
}
