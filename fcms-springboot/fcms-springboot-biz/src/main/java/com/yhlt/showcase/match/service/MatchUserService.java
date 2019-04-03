package com.yhlt.showcase.match.service;

import org.springframework.stereotype.Component;
import javax.transaction.Transactional;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.match.entity.MatchUserEntity;
import com.yhlt.showcase.match.dao.MatchUserDao;

/**
 * @Description: 报名人员 service
 * @author sgq
 * @date 2018-10-16 11:41
 */
@Component
@Transactional
@BusinessLog(service = "报名人员")
@DataPermission
public class MatchUserService extends BaseService<MatchUserEntity, MatchUserDao> {
}

