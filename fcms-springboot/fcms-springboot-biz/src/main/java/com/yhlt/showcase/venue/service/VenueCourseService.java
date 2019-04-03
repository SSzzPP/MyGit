package com.yhlt.showcase.venue.service;

import org.springframework.stereotype.Component;
import javax.transaction.Transactional;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.venue.entity.VenueCourseEntity;
import com.yhlt.showcase.venue.dao.VenueCourseDao;

/**
 * @Description: 场馆课程 service
 * @author swy
 * @date 2018-07-24 14:32
 */
@Component
@Transactional
@BusinessLog(service = "场馆课程")
@DataPermission
public class VenueCourseService extends BaseService<VenueCourseEntity, VenueCourseDao> {
}

