package com.yhlt.showcase.checklist.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.yhlt.showcase.base.dao.BaseDao;
import com.yhlt.showcase.checklist.entity.ChecklistBillEntity;

/**
 * 检查单主表
 * 
 * @author admin
 *
 */
public interface ChecklistBillDao extends BaseDao<ChecklistBillEntity> {

	@Query("select max(noSeed) from ChecklistBillEntity t where t.billNo like %:billNo%")
	public Integer findMaxSeed(@Param("billNo") String billNo);
}
