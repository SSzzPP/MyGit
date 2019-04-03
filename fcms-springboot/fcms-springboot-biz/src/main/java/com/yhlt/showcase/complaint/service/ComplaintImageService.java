package com.yhlt.showcase.complaint.service;

import org.springframework.stereotype.Component;
import javax.transaction.Transactional;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.complaint.entity.ComplaintImageEntity;
import com.yhlt.showcase.complaint.dao.ComplaintImageDao;

/**
 * @Description: 消费投诉图片 service
 * @author swy
 * @date 2018-08-09 09:34
 */
@Component
@Transactional
@BusinessLog(service = "消费投诉图片")
@DataPermission
public class ComplaintImageService extends BaseService<ComplaintImageEntity, ComplaintImageDao> {
}

