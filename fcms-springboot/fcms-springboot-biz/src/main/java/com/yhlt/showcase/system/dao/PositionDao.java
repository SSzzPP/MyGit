package com.yhlt.showcase.system.dao;

import org.springframework.data.jpa.repository.Query;

import com.yhlt.showcase.base.dao.BaseDao;
import com.yhlt.showcase.system.entity.PositionEntity;
/**
 * 职位管理
 * @author hubaojie
 *
 */
public interface PositionDao extends BaseDao<PositionEntity>{
	
	@Query("select max(p.sortNumber) from PositionEntity p")
	Long getMaxSortNumber();
}
