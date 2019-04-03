package com.yhlt.showcase.match.service;

import org.springframework.stereotype.Component;
import javax.transaction.Transactional;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.match.entity.MatchProjectEntity;
import com.yhlt.showcase.match.dao.MatchProjectDao;

/**
 * @Description: 比赛项目 service
 * @author sgq
 * @date 2018-10-10 11:50
 */
@Component
@Transactional
@BusinessLog(service = "比赛项目")
@DataPermission
public class MatchProjectService extends BaseService<MatchProjectEntity, MatchProjectDao> {
}

