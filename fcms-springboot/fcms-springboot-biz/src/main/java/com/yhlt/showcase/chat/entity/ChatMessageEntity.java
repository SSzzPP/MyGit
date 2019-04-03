package com.yhlt.showcase.chat.entity;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Formula;

import com.yhlt.showcase.base.entity.BaseEntity;
import com.yhlt.showcase.base.security.LoginContextHolder;

/**
 * 聊天message entity
 * 
 * @author lnn
 * 
 */
@Entity
@Table(name = "TM_FCMS_CHAT_MESSAGE")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class ChatMessageEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1646222215881911793L;

	private String uuid;

	private Long sendUserId;
	private Long recvUserId;
	@Formula(value = "(select t.name from tm_fcms_venue_user t where t.id = send_user_id)")
	private String sendUserName;
	@Formula(value = "(select t.name from tm_fcms_venue_user t where t.id = recv_user_id)")
	private String recvUserName;
	@Formula(value = "(select t.img_url from tm_fcms_venue_user t where t.id = send_user_id)")
	private String sendUserPhoto;
	@Formula(value = "(select t.img_url from tm_fcms_venue_user t where t.id = recv_user_id)")
	private String recvUserPhoto;

	private String type;// text,image,sound
	private String content;

	@Transient
	private String sender;

	public ChatMessageEntity() {
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public Long getSendUserId() {
		return sendUserId;
	}

	public void setSendUserId(Long sendUserId) {
		this.sendUserId = sendUserId;
	}

	public Long getRecvUserId() {
		return recvUserId;
	}

	public void setRecvUserId(Long recvUserId) {
		this.recvUserId = recvUserId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSendUserName() {
		return sendUserName;
	}

	public void setSendUserName(String sendUserName) {
		this.sendUserName = sendUserName;
	}

	public String getRecvUserName() {
		return recvUserName;
	}

	public void setRecvUserName(String recvUserName) {
		this.recvUserName = recvUserName;
	}

	public String getSender() {
		return sender;
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

	public String getSendUserPhoto() {
		return sendUserPhoto;
	}

	public void setSendUserPhoto(String sendUserPhoto) {
		this.sendUserPhoto = sendUserPhoto;
	}

	public String getRecvUserPhoto() {
		return recvUserPhoto;
	}

	public void setRecvUserPhoto(String recvUserPhoto) {
		this.recvUserPhoto = recvUserPhoto;
	}
	

}
