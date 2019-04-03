package com.yhlt.showcase.system.dao;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.yhlt.showcase.base.dao.BaseDao;
import com.yhlt.showcase.system.entity.UserEntity;

public interface UserDao extends BaseDao<UserEntity> {

	/**
	 * 修改手机号码
	 * @param telephone
	 * @param open_id
	 * @return
	 */
	@Modifying
	@Query(value = "update UserEntity u set u.telephone = ?1 where id= ?2 ")
	public int updateUserTelephone(String telephone , Long id);
}
