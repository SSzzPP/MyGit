package com.yhlt.showcase.activity.service;

import org.springframework.stereotype.Component;
import javax.transaction.Transactional;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.activity.entity.ActivityCommentEntity;
import com.yhlt.showcase.activity.dao.ActivityCommentDao;

/**
 * @Description: 结伴运动点赞 service
 * @author shiguoqin
 * @date 2018-08-14 15:45
 */
@Component
@Transactional
@BusinessLog(service = "结伴运动关注")
@DataPermission
public class ActivityCommentService extends BaseService<ActivityCommentEntity, ActivityCommentDao> {
}

