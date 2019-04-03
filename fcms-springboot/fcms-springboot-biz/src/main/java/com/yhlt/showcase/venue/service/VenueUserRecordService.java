package com.yhlt.showcase.venue.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.venue.dao.VenueUserRecordDao;
import com.yhlt.showcase.venue.entity.VenueUserRecordEntity;

@Component
@Transactional
@BusinessLog(service = "教练履历管理")
@DataPermission
public class VenueUserRecordService extends BaseService<VenueUserRecordEntity, VenueUserRecordDao> {

}
