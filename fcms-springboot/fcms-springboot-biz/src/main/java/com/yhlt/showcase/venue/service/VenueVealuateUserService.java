package com.yhlt.showcase.venue.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.venue.dao.VenueVealuateUserDao;
import com.yhlt.showcase.venue.entity.VenueVealuateUserEntity;

@Component
@Transactional
@BusinessLog(service = "教练评价")
@DataPermission
public class VenueVealuateUserService extends BaseService<VenueVealuateUserEntity, VenueVealuateUserDao>{

}
