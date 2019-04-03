package com.yhlt.showcase.venue.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.venue.dao.VenueUserLikeDao;
import com.yhlt.showcase.venue.entity.VenueUserLikeEntity;
@Component
@Transactional
@BusinessLog(service = "用户喜好运动")
@DataPermission
public class VenueUserLikeService extends BaseService<VenueUserLikeEntity, VenueUserLikeDao>{

}
