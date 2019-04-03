package com.yhlt.showcase.system.service;

import java.util.HashMap;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.system.dao.UserDao;
import com.yhlt.showcase.system.entity.UserEntity;

@Component
@Transactional
@BusinessLog(service = "用户信息管理")
@DataPermission
public class UserService extends BaseService<UserEntity, UserDao> {

	/**
	 * 根据手机号 查询用户
	 */
	public UserEntity findByPhone(String phone) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_telephone", phone);
		return super.findOneByParams(searchParams);
	}

	/**
	 * 保存对象并且返回Map
	 * 
	 * @param t
	 * @return Map<String, Object> easyUI-jsonMap
	 */
	public UserEntity noLogsave(UserEntity t) {
		t = dao.save(t);
		return t;
	}

	/**
	 * 修改手机号码
	 * @param telephone
	 * @param open_id
	 * @return
	 */
	public int upadateUserTelephone (String telephone , Long id){
		return dao.updateUserTelephone(telephone, id);
	}
}
