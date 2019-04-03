package com.yhlt.showcase.system.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.system.dao.RoleDao;
import com.yhlt.showcase.system.dao.RoleResourcesDao;
import com.yhlt.showcase.system.entity.ResourcesEntity;
import com.yhlt.showcase.system.entity.RoleEntity;
import com.yhlt.showcase.system.entity.RoleResourcesEntity;
import com.yhlt.showcase.system.entity.RoleUserEntity;
import com.yhlt.showcase.system.entity.UserEntity;

@Component
@Transactional
@BusinessLog(service = "角色信息管理")
@DataPermission
public class RoleService extends BaseService<RoleEntity, RoleDao> {


	@Autowired
	private RoleUserService roleUserService;
	
	@Autowired
	private RoleResourcesDao roleResourcesDao;

	@BusinessLog(operation = "维护角色资源的关系")
	public void saveRoleResources(RoleEntity roleEntity, Long[] resourceIds) {
		for (RoleResourcesEntity rr : roleEntity.getRoleResourcess()) {
			roleResourcesDao.delete(rr);
		}
		for (Long id : resourceIds) {
			RoleResourcesEntity roleResourcesEntity = new RoleResourcesEntity();
			ResourcesEntity resourcesEntity = new ResourcesEntity();
			resourcesEntity.setId(id);
			roleResourcesEntity.setRole(roleEntity);
			roleResourcesEntity.setResources(resourcesEntity);
			roleResourcesDao.save(roleResourcesEntity);
		}
	}

	@BusinessLog(operation = "维护角色人员的关系")
	public void saveRoleUser(RoleEntity roleEntity, Long[] userIds) {
		Map<Long, Object> temp = isExists(roleEntity.getId());
		List<RoleUserEntity> result = new ArrayList<RoleUserEntity>();
		for (Long id : userIds) {
			if (!temp.containsKey(id)) {
				RoleUserEntity roleUser = new RoleUserEntity();
				UserEntity userEntity = new UserEntity();
				userEntity.setId(id);
				roleUser.setUser(userEntity);
				roleUser.setRole(roleEntity);
				result.add(roleUser);
			}
		}
		roleUserService.save(result);
	}

//	@BusinessLog(operation = "判断角色用户记录是否存在")
	private Map<Long, Object> isExists(Long roleId) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_role.id", Long.valueOf(roleId));
		List<RoleUserEntity> entities = roleUserService
				.findByParams(searchParams);
		Map<Long, Object> result = new HashMap<Long, Object>();
		for (RoleUserEntity roleUserEntity : entities) {
			result.put(roleUserEntity.getUser().getId(), null);
		}
		return result;
	}
}
