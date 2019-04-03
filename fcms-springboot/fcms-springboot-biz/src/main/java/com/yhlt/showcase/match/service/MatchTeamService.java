package com.yhlt.showcase.match.service;

import org.springframework.stereotype.Component;
import javax.transaction.Transactional;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.match.entity.MatchTeamEntity;
import com.yhlt.showcase.match.dao.MatchTeamDao;

/**
 * @Description: 报名队伍 service
 * @author sgq
 * @date 2018-10-16 11:38
 */
@Component
@Transactional
@BusinessLog(service = "报名队伍")
@DataPermission
public class MatchTeamService extends BaseService<MatchTeamEntity, MatchTeamDao> {
}

