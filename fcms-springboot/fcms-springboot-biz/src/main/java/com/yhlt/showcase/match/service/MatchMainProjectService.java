package com.yhlt.showcase.match.service;

import org.springframework.stereotype.Component;
import javax.transaction.Transactional;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.match.entity.MatchMainProjectEntity;
import com.yhlt.showcase.match.dao.MatchMainProjectDao;

/**
 * @Description: 赛事和项目关系 service
 * @author sgq
 * @date 2018-10-10 11:52
 */
@Component
@Transactional
@BusinessLog(service = "赛事和项目关系")
@DataPermission
public class MatchMainProjectService extends BaseService<MatchMainProjectEntity, MatchMainProjectDao> {
}

