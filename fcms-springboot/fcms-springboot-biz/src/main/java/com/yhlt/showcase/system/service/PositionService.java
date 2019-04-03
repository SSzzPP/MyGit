package com.yhlt.showcase.system.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.system.dao.PositionDao;
import com.yhlt.showcase.system.entity.PositionEntity;

/**
 * 职位管理
 * @author hubaojie
 *
 */
@Component
@Transactional
@BusinessLog(service = "职位管理")
@DataPermission
public class PositionService extends BaseService<PositionEntity, PositionDao>{
	
	public synchronized Long getMaxSortNumber() {
		return dao.getMaxSortNumber();
	}
}
