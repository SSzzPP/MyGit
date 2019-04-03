package com.yhlt.showcase.requestLog.service;

import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.requestLog.dao.RequestLogDao;
import com.yhlt.showcase.requestLog.dao.RequestLogMBDAO;
import com.yhlt.showcase.requestLog.entity.RequestLogEntity;

/**
 * @Description: WEB访问日志 service
 * @author wangyoutao
 * @date 2018-05-07 17:20
 */
@Component
@Transactional
@BusinessLog(service = "WEB访问日志")
@DataPermission
public class RequestLogService extends BaseService<RequestLogEntity, RequestLogDao> {
	@Autowired
	private RequestLogMBDAO requestLogMBDAO;
	
	public RequestLogEntity noLogSave(RequestLogEntity requestLogEntity) {
		return super.save(requestLogEntity);
	}
	/**
	 * 保存到oracle
	 * @param entity
	 * @return
	 */
	public void saveRequestLogException(Map<String, Object> result) {
		 requestLogMBDAO.saveRequestLogException(result);
	}
}

