package com.yhlt.showcase.complaint.service;

import org.springframework.stereotype.Component;
import javax.transaction.Transactional;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.complaint.entity.ComplaintMainEntity;
import com.yhlt.showcase.complaint.dao.ComplaintMainDao;

/**
 * @Description: 消费投诉 service
 * @author swy
 * @date 2018-08-09 09:28
 */
@Component
@Transactional
@BusinessLog(service = "消费投诉")
@DataPermission
public class ComplaintMainService extends BaseService<ComplaintMainEntity, ComplaintMainDao> {
}

