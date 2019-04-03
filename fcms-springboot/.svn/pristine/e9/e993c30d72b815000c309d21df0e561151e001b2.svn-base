package com.yhlt.showcase.chat.entity;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Formula;

import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * 聊天message entity
 * 
 * @author wyt
 * @date 2018年8月6日15:37:38
 */
@Entity
@Table(name = "V_FCMS_CHAT_MESSAGE")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class VChatMessageEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1646222215881911793L;

	private String uuid;

	private Long userId;
	private Long targetUserId;
	@Formula(value = "(select t.name from tm_fcms_venue_user t where t.id = user_id)")
	private String userName;
	@Formula(value = "(select t.name from tm_fcms_venue_user t where t.id = target_user_id)")
	private String targetUserName;

	private String type;// text,image,sound
	private String content;
	//接收消息的用户头像
	@Formula(value = "(select t.img_url from tm_fcms_venue_user t where t.id = target_user_id)")
	private String userPhoto;

	/**
	 * 0 接收消息，1 发送消息
	 */
	private Long isSend;

	@Transient
	private String sender;

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getTargetUserId() {
		return targetUserId;
	}

	public void setTargetUserId(Long targetUserId) {
		this.targetUserId = targetUserId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getTargetUserName() {
		return targetUserName;
	}

	public void setTargetUserName(String targetUserName) {
		this.targetUserName = targetUserName;
	}

	public Long getIsSend() {
		return isSend;
	}

	public void setIsSend(Long isSend) {
		this.isSend = isSend;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSender() {
		return isSend.equals(1L) ? "self" : "";
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUserPhoto() {
		return userPhoto;
	}

	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}
}
