package com.yhlt.showcase.activity.dao;

import com.yhlt.showcase.base.dao.BaseDao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.yhlt.showcase.activity.entity.ActivityMainEntity;

/**
 * @Description: 结伴运动关注 dao
 * @author shiguoqin
 * @date 2018-08-14 15:36
 */
public interface ActivityMainDao extends BaseDao<ActivityMainEntity> {
	@Query(value = "select mainId from ActivityMainUserEntity WHERE createById = ?1")
	public List<Long> getAllFollow(Long venueUserId);
}

