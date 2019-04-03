package com.yhlt.showcase.activity.entity;

import com.yhlt.showcase.base.entity.BaseEntity;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;

/**
 * @Description: 结伴运动报名Entity
 * @author shiguoqin
 * @date 2018-08-14 15:42
 */
@Entity
@Table(name = "TR_FCMS_ACTIVITY_MAIN_USER")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class ActivityMainUserEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	* 
	*/ 
	private Long itemId;

	/**
	* 
	*/ 
	private Long mainId;
	/**
	 * 用户昵称
	 */
	@Formula("(select v.name from tm_fcms_venue_user v where v.id=create_by_id)")
	private String userName;
	
	/**
	 * 用户头像
	 */
	@Formula("(select v.uuid from tm_fcms_venue_user v where v.id=create_by_id)")
	private String uuid;
	
	@Formula("(select v.img_url from tm_fcms_venue_user v where v.id=create_by_id)")
	private String userPhoto;
	
	@Formula("(select v.mobile from tm_fcms_venue_user v where v.id=create_by_id)")
	private String mobile;
	
	public Long getItemId() {
		return itemId;
	}

	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}

	public Long getMainId() {
		return mainId;
	}

	public void setMainId(Long mainId) {
		this.mainId = mainId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	
	public String getUserPhoto() {
		return userPhoto;
	}
	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
}

