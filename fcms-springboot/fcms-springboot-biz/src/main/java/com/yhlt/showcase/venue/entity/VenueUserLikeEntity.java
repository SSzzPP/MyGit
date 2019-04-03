package com.yhlt.showcase.venue.entity;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

import com.yhlt.showcase.base.entity.BaseEntity;
@Entity
@Table(name = "TR_FCMS_USER_LIKE")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class VenueUserLikeEntity extends BaseEntity<Long>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long venueUserId;
	
	private Long likeId;

	@Formula("(select d.name from TC_SYSTEM_DICT d where like_id=d.id)")
	private String likeName;
	
	public Long getVenueUserId() {
		return venueUserId;
	}

	public void setVenueUserId(Long venueUserId) {
		this.venueUserId = venueUserId;
	}

	public Long getLikeId() {
		return likeId;
	}

	public void setLikeId(Long likeId) {
		this.likeId = likeId;
	}
	public String getLikeName() {
		return likeName;
	}
	public void setLikeName(String likeName) {
		this.likeName = likeName;
	}
	

}
