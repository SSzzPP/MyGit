package com.yhlt.showcase.venue.entity;

import com.yhlt.showcase.base.entity.BaseEntity;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;

/**
 * @Description: 场馆证书 Entity
 * @author swy
 * @date 2018-07-24 14:37
 */
@Entity
@Table(name = "TM_FCMS_VENUE_CERTIFICATE")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class VenueCerificateEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	* 证书名称
	*/ 
	private String name;

	/**
	* 人员id
	*/ 
	private Long userId;
	@Formula("(select vu.name from tm_fcms_venue_user vu where vu.id = user_id)")
	private String venueUserName;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getVenueUserName() {
		return venueUserName;
	}

	public void setVenueUserName(String venueUserName) {
		this.venueUserName = venueUserName;
	}

}

