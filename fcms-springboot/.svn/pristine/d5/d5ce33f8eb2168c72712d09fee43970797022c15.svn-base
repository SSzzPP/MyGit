package com.yhlt.showcase.message.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.yhlt.showcase.base.entity.BaseEntity;
import com.yhlt.showcase.base.util.DateUtil;

import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Formula;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;

/**
 * @Description: 社区圈互动 Entity
 * @author swy
 * @date 2018-07-27 14:06
 */
@Entity
@Table(name = "TR_MESSAGE_USER_COMMENT")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class MessageUserCommentEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 消息id
	 */
	private Long messageId;
	/**
	 * 顶层评论（预留）
	 */
	private String commentId;
	
	/**
	 * 用户id
	 */
	private Long userId;
	
	/**
	 * 用户头像
	 */
	@Formula("(select vu.uuid from tm_fcms_venue_user vu where vu.id = user_id)")
	private String userPhoto;
	
	@Formula("(select vu.img_url from tm_fcms_venue_user vu where vu.id = user_id)")
	private String imgUrl;
	/**
	 * 用户昵称
	 */
	@Formula("(select vu.name from tm_fcms_venue_user vu where vu.id = user_id)")
	private String userName;
	
	/**
	 * 评论内容
	 */
	@Size(min = 1, max = 100, message = "最多可输入100个字符")
	private String content;
	/**
	 * 1.阅读 2.点赞 3.评论
	 */
	private Long type;
	/**
	 * 评论时间
	 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date time;
	private String timeWrapper;
	/**
	 * 删除标记（0未删除，1已删除）
	 */
	private Long deleteFlag;
	
	public Long getMessageId() {
		return messageId;
	}
	public void setMessageId(Long messageId) {
		this.messageId = messageId;
	}
	public String getCommentId() {
		return commentId;
	}
	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getUserPhoto() {
		return userPhoto;
	}
	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
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
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getTimeWrapper() {
		Long num = DateUtil.intervalDays(DateUtil.formatDate(time, "yyyy-MM-dd"), new Date());
		if(num > 2){
			timeWrapper = DateUtil.formatDate2Str(time,"yyyy-MM-dd");
		}else if(num > 1){
			timeWrapper = "前天";
		}else if(num > 0){
			timeWrapper = "昨天";
		}else{
			if(num!=-1){
				timeWrapper = DateUtil.formatDate2Str(time,"HH:mm");
			}else{
				timeWrapper = DateUtil.formatDate2Str(time,"yyyy-MM-dd");
			}
		}
		return timeWrapper;
	}
	public void setTimeWrapper(String timeWrapper) {
		this.timeWrapper = timeWrapper;
	}
	public Long getDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(Long deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

}

