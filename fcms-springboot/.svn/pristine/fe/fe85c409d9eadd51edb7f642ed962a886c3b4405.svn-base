package com.yhlt.showcase.venue.dao;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.yhlt.showcase.base.dao.BaseDao;
import com.yhlt.showcase.venue.entity.VenueUserEntity;

/**
 * @Description: 场馆人员管理 dao
 * @author swy
 * @date 2018-07-24 14:24
 */
public interface VenueUserDao extends BaseDao<VenueUserEntity> {
	
	/**
	 * 修改钱包地址
	 * @param 
	 * @param 
	 * @return
	 */
	@Modifying
	@Query(value = "update VenueUserEntity u set u.blockChainAddress = ?1 where u.id= ?2 ")
	public int updateBlockChainAddress(String address , Long id);
	/**
	 * 修改积分总额
	 * @param 
	 * @param 
	 * @return
	 */
	@Modifying
	@Query(value = "update VenueUserEntity u set u.blockChainTotal = ?1 where u.id= ?2 ")
	public int updateBlockChainTotal(Long total , Long id);
	/**
	 * 修改免打扰状态
	 * @param undisturb
	 * @param id
	 * @return
	 */
	@Modifying
	@Query(value = "update VenueUserEntity u set u.undisturb = ?1 where u.id= ?2 ")
	public int updateUndisturb(Integer undisturb , Long id);
}

