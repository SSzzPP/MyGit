package com.yhlt.showcase.system.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.system.dao.RoleUserDao;
import com.yhlt.showcase.system.entity.RoleUserEntity;

@Component
@Transactional
@BusinessLog(service = "角色用户管理")
@DataPermission
public class RoleUserService extends BaseService<RoleUserEntity,RoleUserDao> {
	/**
	 * 保存对象并且返回Map
	 * 
	 * @param t
	 * @return Map<String, Object> easyUI-jsonMap
	 */
	public RoleUserEntity noLogsave(RoleUserEntity t) {
		t = dao.save(t);
		return t;
	}
}
