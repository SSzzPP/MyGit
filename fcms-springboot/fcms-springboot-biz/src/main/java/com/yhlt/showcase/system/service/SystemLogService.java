package com.yhlt.showcase.system.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.system.dao.SystemLogDao;
import com.yhlt.showcase.system.entity.SystemLog;

/**
 * 系统日志Service类
 * 
 * @author wj
 * @date 2014-11-18 18:17:00
 * 
 */
@Component
@Transactional
@DataPermission
public class SystemLogService extends BaseService<SystemLog, SystemLogDao> {

	public SystemLog log(SystemLog t) {
		return dao.save(t);
	}

}
