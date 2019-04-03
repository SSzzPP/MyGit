package com.yhlt.showcase.chat.dto;

import java.util.Date;

import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.yhlt.showcase.base.util.DateUtil;

/**
 * 聊天列表DTO
 * 
 * @author admin
 * 
 */
public class ChatMessageListDto {
	private Long sendUserId;
	private Long recvUserId;
	private String headImage;
	private String recvUserName;
	private String content;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date gmtCreate;

	@Transient
	private String sendTimeWrapper;

	public ChatMessageListDto() {
	}

	public ChatMessageListDto(Long sendUserId, Long recvUserId, String headImage, String recvUserName, String content, Date gmtCreate) {
		super();
		this.sendUserId = sendUserId;
		this.recvUserId = recvUserId;
		this.headImage = headImage;
		this.recvUserName = recvUserName;
		this.content = content;
		this.gmtCreate = gmtCreate;
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

	public String getHeadImage() {
		return headImage;
	}

	public void setHeadImage(String headImage) {
		this.headImage = headImage;
	}

	public String getRecvUserName() {
		return recvUserName;
	}

	public void setRecvUserName(String recvUserName) {
		this.recvUserName = recvUserName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getGmtCreate() {
		return gmtCreate;
	}

	public void setGmtCreate(Date gmtCreate) {
		this.gmtCreate = gmtCreate;
	}

	public String getSendTimeWrapper() {
		Long num = DateUtil.intervalDays(DateUtil.formatDate(gmtCreate, "yyyy-MM-dd"), new Date());
		if (num > 2) {
			sendTimeWrapper = DateUtil.formatDate2Str(gmtCreate, "yyyy-MM-dd");
		} else if (num > 1) {
			sendTimeWrapper = "前天";
		} else if (num > 0) {
			sendTimeWrapper = "昨天";
		} else {
			if (num != -1) {
				sendTimeWrapper = DateUtil.formatDate2Str(gmtCreate, "HH:mm");
			} else {
				sendTimeWrapper = DateUtil.formatDate2Str(gmtCreate, "yyyy-MM-dd");
			}
		}
		return sendTimeWrapper;
	}

	public void setSendTimeWrapper(String sendTimeWrapper) {
		this.sendTimeWrapper = sendTimeWrapper;
	}

}
