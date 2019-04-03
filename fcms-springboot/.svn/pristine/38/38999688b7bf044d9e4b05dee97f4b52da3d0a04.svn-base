package com.yhlt.showcase.venue.dao;

import java.util.Date;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.yhlt.showcase.base.dao.BaseDao;
import com.yhlt.showcase.venue.entity.VenueEquipmentTypeEntity;

public interface VenueEquipmentTypeDao extends BaseDao<VenueEquipmentTypeEntity> {
	/**
	 * 根据设施id修改设施经纬度
	 * 
	 * @param id,lng,lat
	 * @param 
	 * @return
	 */
	@Modifying
	@Query(value = "update VenueEquipmentTypeEntity v set v.lng = ?2,lat=?3,gmt_modified=?4 where v.id= ?1 ")
	public int updateEquipment(Long id,String lng,String lat,Date gmtModified);
}
