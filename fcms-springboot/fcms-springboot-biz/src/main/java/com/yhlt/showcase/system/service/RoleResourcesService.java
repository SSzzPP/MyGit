package com.yhlt.showcase.system.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.system.dao.RoleResourcesDao;
import com.yhlt.showcase.system.entity.RoleResourcesEntity;

@Component
@Transactional
@BusinessLog(service = "用户和资源中间表实体管理")
@DataPermission
public class RoleResourcesService extends BaseService<RoleResourcesEntity,RoleResourcesDao> {
	
}
