package com.yhlt.showcase.checklist.dao;

import org.springframework.data.jpa.repository.Query;

import com.yhlt.showcase.base.dao.BaseDao;
import com.yhlt.showcase.checklist.entity.ChecklistEntity;

/**
 * 检查单配置
 * 
 * @author admin
 *
 */
public interface ChecklistEntityDao extends BaseDao<ChecklistEntity> {

	@Query("select max(sortNumber) from ChecklistEntity")
	public Integer findUserSortNumberMax();
}
