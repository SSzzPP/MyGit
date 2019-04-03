package com.yhlt.showcase.message.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.message.dao.MessageMainDao;
import com.yhlt.showcase.message.entity.MessageMainEntity;

/**
 * @Description: 社区圈 service
 * @author swy
 * @date 2018-07-27 11:05
 */
@Component
@Transactional
@BusinessLog(service = "社区圈")
@DataPermission
public class MessageMainService extends BaseService<MessageMainEntity, MessageMainDao> {

}

