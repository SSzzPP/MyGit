package com.yhlt.showcase.sensitive.entity;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * 敏感词视图（有分类）
 * 注：不全是带有敏感词的，查的是全部
 * 
 * @author swy
 *
 */
@Entity
@Table(name = "v_fcms_sensitive_words_type")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class SensitiveWordsViewEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 内容
	 */
	private String content;
	/**
	 * 健身场馆id
	 */
	private Long venueId;
	@Formula("(select v.name from tm_fcms_venue_info v where v.id = venue_id)")
	private String venueName;
	/**
	 * 类型（0：场馆评价；1：场馆投诉）
	 */
	private Long type;
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Long getType() {
		return type;
	}
	public void setType(Long type) {
		this.type = type;
	}
	public Long getVenueId() {
		return venueId;
	}
	public void setVenueId(Long venueId) {
		this.venueId = venueId;
	}
	public String getVenueName() {
		return venueName;
	}
	public void setVenueName(String venueName) {
		this.venueName = venueName;
	}

}
