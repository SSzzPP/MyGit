package com.yhlt.showcase.system.service;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.system.dao.UserSzpMBDAO;
import com.yhlt.showcase.system.dto.UserSzpDto;

@Component
@Transactional
@BusinessLog(service = "用户信息查询")
@DataPermission
public class UserSzpService{
	@Autowired
	private UserSzpMBDAO userSzpMBDAO;
	
	/**
	 * Mybatis 查询用户
	 * 
	 * @param param
	 * @return
	 */
	public List<UserSzpDto> findUserByMap(Map<String, Object> param) {
		return userSzpMBDAO.findUser(param);
	}
	/**
	 * 查询总记录
	 * @param param
	 * @return
	 */
	public Long count(Map<String, Object> param) {
		return userSzpMBDAO.count(param);
	}
}
