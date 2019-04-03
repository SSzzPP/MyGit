package com.yhlt.showcase.venue.service;

import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.venue.dao.VenueEquipmentTypeDao;
import com.yhlt.showcase.venue.entity.VenueEquipmentTypeEntity;

@Component
@Transactional
@BusinessLog(service = "设施管理")
@DataPermission
public class VenueEquipmentTypeService extends BaseService<VenueEquipmentTypeEntity, VenueEquipmentTypeDao> {
	/**
	 * 根据设施id修改设施经纬度
	 * 
	 * @param id,lng,lat
	 * @param
	 * @return
	 */
	public int updateEquipment(Long id, String lng, String lat) {
		return dao.updateEquipment(id, lng, lat,new Date());
	}
}
