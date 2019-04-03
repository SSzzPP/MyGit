package com.yhlt.showcase.activity.entity;

import com.yhlt.showcase.base.entity.BaseEntity;
import javax.persistence.Table;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;

/**
 * @Description: 结伴运动点赞 Entity
 * @author shiguoqin
 * @date 2018-08-14 15:45
 */
@Entity
@Table(name = "TR_FCMS_ACTIVITY_COMMENT")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class ActivityCommentEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	* 
	*/ 
	private Long mainId;

	/**
	* 
	*/ 
	private Long itemId;

	/**
	* 
	*/ 
	private Long userId;

	/**
	* 评论时间
	*/ 
	private Date time;

	/**
	* 1.阅读 2.点赞 3.评论
	*/ 
	private Long type;

	/**
	* 删除标记（0未删除，1已删除）
	*/ 
	private Long deleteFlag;

	public Long getMainId() {
		return mainId;
	}

	public void setMainId(Long mainId) {
		this.mainId = mainId;
	}

	public Long getItemId() {
		return itemId;
	}

	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Long getType() {
		return type;
	}

	public void setType(Long type) {
		this.type = type;
	}

	public Long getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Long deleteFlag) {
		this.deleteFlag = deleteFlag;
	}


}

