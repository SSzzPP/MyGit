package com.yhlt.showcase.activity.service;

import org.springframework.stereotype.Component;
import javax.transaction.Transactional;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.activity.entity.ActivityItemUserEntity;
import com.yhlt.showcase.activity.dao.ActivityItemUserDao;

/**
 * @Description: 结伴运动关注 service
 * @author shiguoqin
 * @date 2018-08-14 15:30
 */
@Component
@Transactional
@BusinessLog(service = "结伴运动关注")
@DataPermission
public class ActivityItemUserService extends BaseService<ActivityItemUserEntity, ActivityItemUserDao> {
}

