package com.yhlt.showcase.venue.entity;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

import com.yhlt.showcase.base.entity.BaseEntity;

@Entity
@Table(name = "TR_VENUE_USER_RECORD")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class VenueUserRecordEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 场馆用户ID
	 */
	private Long venueUserId;
	/**
	 * 履历内容
	 */
	private String content;

	@Formula("(select d.name from TM_FCMS_VENUE_USER d where venue_user_id=d.id)")
	private String venueUserName;

	public Long getVenueUserId() {
		return venueUserId;
	}

	public void setVenueUserId(Long venueUserId) {
		this.venueUserId = venueUserId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getVenueUserName() {
		return venueUserName;
	}

	public void setVenueUserName(String venueUserName) {
		this.venueUserName = venueUserName;
	}

}
