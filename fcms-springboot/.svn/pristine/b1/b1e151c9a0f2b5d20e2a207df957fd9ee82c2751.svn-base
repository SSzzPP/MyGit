package com.yhlt.showcase.system.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.system.dao.LoginLogDao;
import com.yhlt.showcase.system.entity.LoginLogEntity;

/**
 * 附件
 * 
 * @author xunxun
 * @date 2015-1-20 下午1:57:11
 */
@Component
@Transactional
@BusinessLog(service = "用户登录日志管理")
@DataPermission
public class LoginLogService extends BaseService<LoginLogEntity, LoginLogDao> {
	/**
	 * 保存对象并且返回Map
	 * 
	 * @param t
	 * @return Map<String, Object> easyUI-jsonMap
	 */
	public LoginLogEntity noLogsave(LoginLogEntity t) {
		t = dao.save(t);
		return t;
	}

}
