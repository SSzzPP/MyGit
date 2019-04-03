package com.yhlt.showcase.venue.service;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

import javax.transaction.Transactional;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.base.utils.BlockChainUtil;
import com.yhlt.showcase.system.entity.UserEntity;
import com.yhlt.showcase.venue.entity.VenueUserEntity;
import com.yhlt.showcase.venue.dao.VenueUserDao;

/**
 * @Description: 场馆人员管理service
 * @author swy
 * @date 2018-07-24 14:24
 */
@Component
@Transactional
@BusinessLog(service = "场馆人员管理")
@DataPermission
public class VenueUserService extends BaseService<VenueUserEntity, VenueUserDao> {
	
	/**
	 * 根据手机号 查询用户
	 * @throws Exception 
	 */
	public String getAddress(Long id){
		try {
			VenueUserEntity venueUserEntity = findOne(id);
			String address = venueUserEntity.getBlockChainAddress();
			if(StringUtils.isBlank(address)) {
				address = BlockChainUtil.createAddress();
				updateBlockChainAddress(address,id);
			}
			return address;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 修改钱包地址
	 * @param telephone
	 * @param open_id
	 * @return
	 */
	public int updateBlockChainAddress (String address , Long id){
		return dao.updateBlockChainAddress(address, id);
	}
	
	/**
	 * 修改积分总数
	 * @param telephone
	 * @param open_id
	 * @return
	 */
	public int upadateUserTotal (Long total , Long id){
		return dao.updateBlockChainTotal(total, id);
	}
	
	/**
	 * 修改免打扰状态
	 * @param undisturb
	 * @param id
	 * @return
	 */
	public int updateUndisturb (Integer undisturb , Long id) {
		return dao.updateUndisturb(undisturb, id);
	}
}

