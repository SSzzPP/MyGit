package com.yhlt.showcase.message.entity;

import com.yhlt.showcase.base.entity.BaseEntity;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;

/**
 * @Description: 社区圈照片 Entity
 * @author swy
 * @date 2018-07-27 13:47
 */
@Entity
@Table(name = "TM_FCMS_MESSAGE_IMAGE")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class MessageImageEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 主表消息id
	 */
	private Long messageId;
	/**
	 * 人员id
	 */
	private Long userId;
	/**
	 * 图片微信返回地址
	 */
	private String mediaId;
	/**
	 * 图片下载地址
	 */
	private String imgUrl;
	/**
	 * uuid
	 */
	private String uuid;
	
	public Long getMessageId() {
		return messageId;
	}
	public void setMessageId(Long messageId) {
		this.messageId = messageId;
	}
	public String getMediaId() {
		return mediaId;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public void setMediaId(String mediaId) {
		this.mediaId = mediaId;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

}

