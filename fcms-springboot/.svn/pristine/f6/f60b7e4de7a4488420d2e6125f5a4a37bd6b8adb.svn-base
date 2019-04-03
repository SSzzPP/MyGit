package com.yhlt.showcase.subscribe.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.subscribe.dao.NewsSubscribeDao;
import com.yhlt.showcase.subscribe.entity.NewsSubscribeEntity;
/**
 * @Description :消息订阅 Service
 * @author zhuwenkai
 * @date 2018-09-03 11:00
 */
@Component
@Transactional
@BusinessLog(service = "消息订阅")
@DataPermission
public class NewsSubscribeService extends BaseService<NewsSubscribeEntity, NewsSubscribeDao>{
	/**
	 * 修改消息推送状态
	 * @param enabled
	 * @param id
	 * @return
	 */
	public int updateEnabled (Integer enabled,Long id) {
		return dao.updateEnabled(enabled, id);
	}
}
