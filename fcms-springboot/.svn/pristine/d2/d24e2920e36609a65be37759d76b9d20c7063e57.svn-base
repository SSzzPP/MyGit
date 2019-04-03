package com.yhlt.showcase.message.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.yhlt.showcase.base.entity.BaseEntity;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.util.DateUtil;

import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Formula;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;

/**
 * @Description: 社区圈 Entity
 * @author swy
 * @date 2018-07-27 11:05
 */
@Entity
@Table(name = "TM_FCMS_MESSAGE_MAIN")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class MessageMainEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 人员id
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
	 * 所属运动圈类型
	 */
	private Long type;
	
	/**
	 * 内容
	 */
	@Size(min = 0, max = 100, message = "最多可输入100个字符")
	private String content;
	/**
	 * 评论数  点赞数
	 */
	@Formula("(select count(a.message_id) from tr_message_user_comment a where a.message_id=id and a.type = 3 and a.delete_flag = 0)")
	private Long commentNumber;
	@Formula("(select count(a.message_id) from tr_message_user_comment a where a.message_id=id and a.type = 2 and a.delete_flag = 0)")
	private Long zanNumber;
	/**
	 * 用户发表时间
	 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date time;
	private String timeWrapper;
	
	/**
	 * 判断是否是用户发布的
	 */
	@Transient
	private Boolean isMain;
	
	/**
	 * 用户自己发布的消息是否删除：0.删除   1.未删除
	 */
	private Long deleteFlag;

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

	public Long getType() {
		return type;
	}

	public void setType(Long type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Long getCommentNumber() {
		return commentNumber;
	}

	public void setCommentNumber(Long commentNumber) {
		this.commentNumber = commentNumber;
	}

	public Long getZanNumber() {
		return zanNumber;
	}

	public void setZanNumber(Long zanNumber) {
		this.zanNumber = zanNumber;
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

	public Boolean getIsMain() {
		if (LoginContextHolder.get() == null) {
			isMain = false;
		} else if (userId.equals(LoginContextHolder.get().getUserId())) {
			isMain = true;
		} else {
			isMain = false;
		}
		return isMain;
	}

	public void setIsMain(Boolean isMain) {
		this.isMain = isMain;
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

