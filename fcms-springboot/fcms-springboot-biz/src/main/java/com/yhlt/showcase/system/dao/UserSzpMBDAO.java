package com.yhlt.showcase.system.dao;

import java.util.List;
import java.util.Map;

import com.yhlt.showcase.base.repository.MyBatisRepository;
import com.yhlt.showcase.system.dto.UserSzpDto;

/**
 * 用户mybatis dao
 * @author szp
 *
 */
@MyBatisRepository
public interface UserSzpMBDAO {
	/**
	 * 查询用户
	 * @param param
	 * @return
	 */
	public List<UserSzpDto> findUser(Map<String, Object> param);
	/**
	 * 查询总记录
	 * @param param
	 * @return
	 */
	public Long count(Map<String, Object> param);
}
