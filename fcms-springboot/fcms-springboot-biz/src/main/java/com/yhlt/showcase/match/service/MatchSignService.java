package com.yhlt.showcase.match.service;

import org.springframework.stereotype.Component;
import javax.transaction.Transactional;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.match.entity.MatchSignEntity;
import com.yhlt.showcase.match.dao.MatchSignDao;

/**
 * @Description: 报名 service
 * @author sgq
 * @date 2018-10-16 14:26
 */
@Component
@Transactional
@BusinessLog(service = "报名")
@DataPermission
public class MatchSignService extends BaseService<MatchSignEntity, MatchSignDao> {
}

