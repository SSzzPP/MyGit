package com.yhlt.showcase.match.service;

import org.springframework.stereotype.Component;
import javax.transaction.Transactional;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.match.entity.MatchMainEntity;
import com.yhlt.showcase.match.dao.MatchMainDao;

/**
 * @Description: 赛事 service
 * @author sgq
 * @date 2018-10-10 11:43
 */
@Component
@Transactional
@BusinessLog(service = "上周场馆预约情况")
@DataPermission
public class MatchMainService extends BaseService<MatchMainEntity, MatchMainDao> {
}

