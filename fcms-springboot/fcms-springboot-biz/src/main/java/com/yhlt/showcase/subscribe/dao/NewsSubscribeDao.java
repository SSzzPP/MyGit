package com.yhlt.showcase.subscribe.dao;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.yhlt.showcase.base.dao.BaseDao;
import com.yhlt.showcase.subscribe.entity.NewsSubscribeEntity;
/**
 * @Description :消息订阅 Dao
 * @author zhuwenkai
 * @date 2018-09-03 11:00
 */
public interface NewsSubscribeDao extends BaseDao<NewsSubscribeEntity>{
	
	/**
	 * 修改消息推送状态
	 * @param enabled
	 * @param id
	 * @return
	 */
	@Modifying
	@Query(value = "update NewsSubscribeEntity n set n.enabled = ?1 where n.id= ?2 ")
	public int updateEnabled(Integer enabled , Long id);
}
