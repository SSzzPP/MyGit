package com.yhlt.showcase.checklist.entity;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * @Description: 检查单gps Entity
 * @author swy
 * @date 2018-08-24 17:20
 */
@Entity
@Table(name = "TM_FCMS_CHECKLIST_BILL_GPS")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class ChecklistBillGpsEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	* 检查单id
	*/ 
	private Long billId;

	/**
	 * 经度
	 */
	private String lng;

	/**
	 * 纬度
	 */
	private String lat;

	/**
	* 排序
	*/ 
	private Long sortNumber;

	public Long getBillId() {
		return billId;
	}

	public void setBillId(Long billId) {
		this.billId = billId;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public Long getSortNumber() {
		return sortNumber;
	}

	public void setSortNumber(Long sortNumber) {
		this.sortNumber = sortNumber;
	}

	

}

