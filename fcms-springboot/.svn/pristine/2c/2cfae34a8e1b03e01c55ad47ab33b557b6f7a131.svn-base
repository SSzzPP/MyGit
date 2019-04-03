package com.yhlt.showcase.complaint.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * @Description: 消费投诉 Entity
 * @author swy
 * @date 2018-08-09 09:28
 */
@Entity
@Table(name = "TM_FCMS_COMPLAINT_MAIN")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class ComplaintMainEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 内容
	 */
	private String content;

	/**
	 * 投诉类型（0：场馆；1：教练）
	 */
	private Long type;

	/**
	 * 场馆id
	 */
	private Long venueId;

	/**
	 * 教练id
	 */
	private Long userId;
	
	//根据用户UUid取头像
	@Formula("(select vu.uuid from tm_fcms_venue_user vu where vu.id = create_by_id)")
	private String uuid;
	
	@Formula("(select vu.name from tm_fcms_venue_user vu where vu.id = create_by_id)")
	private String userName;

	/**
	 * 0正常1删除
	 */
	private Long deleteFlag;
	
	//投诉图片集合
	@OneToMany(mappedBy="complaintId",fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
	private Set<ComplaintImageEntity> complaintImgs=new HashSet<ComplaintImageEntity>();
	
	@Formula("(select v.name from tm_fcms_venue_info v where v.id = venue_id)")
	private String venueName;
	
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

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Long deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public String getVenueName() {
		return venueName;
	}

	public void setVenueName(String venueName) {
		this.venueName = venueName;
	}

	public Set<ComplaintImageEntity> getComplaintImgs() {
		return new HashSet<ComplaintImageEntity>(complaintImgs);
	}

	public void setComplaintImgs(Set<ComplaintImageEntity> complaintImgs) {
		this.complaintImgs = complaintImgs;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
}
