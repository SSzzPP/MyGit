package com.yhlt.showcase.venue.service;

import org.springframework.stereotype.Component;
import javax.transaction.Transactional;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.venue.entity.VenueCerificateEntity;
import com.yhlt.showcase.venue.dao.VenueCerificateDao;

/**
 * @Description: 场馆证书 service
 * @author swy
 * @date 2018-07-24 14:37
 */
@Component
@Transactional
@BusinessLog(service = "场馆证书")
@DataPermission
public class VenueCerificateService extends BaseService<VenueCerificateEntity, VenueCerificateDao> {
}

