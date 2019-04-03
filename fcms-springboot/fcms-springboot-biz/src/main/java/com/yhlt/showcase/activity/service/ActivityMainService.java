package com.yhlt.showcase.activity.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.activity.dao.ActivityMainDao;
import com.yhlt.showcase.activity.entity.ActivityMainEntity;
import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;

/**
 * @Description: 结伴运动关注 service
 * @author shiguoqin
 * @date 2018-08-14 15:36
 */
@Component
@Transactional
@BusinessLog(service = "结伴运动关注")
@DataPermission
public class ActivityMainService extends BaseService<ActivityMainEntity, ActivityMainDao> {
	
	public List<Long> getAllFollow (Long venueUserId) {
		return dao.getAllFollow(venueUserId);
	}
	
}