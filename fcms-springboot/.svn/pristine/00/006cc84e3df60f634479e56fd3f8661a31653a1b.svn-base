package com.yhlt.showcase.venue.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Formula;

import com.yhlt.showcase.base.entity.BaseEntity;
import com.yhlt.showcase.base.util.DateUtil;

/**
 * 教练评价
 * @author gs
 *
 */
@Entity
@Table(name = "TM_FCMS_VENUE_USER_VEALUATE")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class VenueVealuateUserEntity extends BaseEntity<Long>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	/**
	 * 内容
	 */
	private String content;

	/**
	 * 被评论教练id
	 */
	private Long userId;

	@Formula("(select vu.name from tm_fcms_venue_user vu where vu.id = user_id)")
	private String venueUserName;

	/**
	 * 课程id
	 */
	private Long courseId;
	
	@Formula("(select vc.name from tm_fcms_venue_course vc where vc.id = course_id)")
	private String venueCourseName;

	/**
	 * 星级
	 */
	private Long starLevel;
	
	/**
	 * 指导时长对应星级
	 */
	private Long teachTime;
	
	/**
	 * 字符串时间
	 */
	@Transient
	private String timeWrapper;
	
	/**
	 * 评论者uuid
	 */
	@Formula("(select vu.uuid from tm_fcms_venue_user vu where vu.id = create_by_id)")
	private String uuid;
	
	/**
	 * 评论者昵称
	 */
	@Formula("(select vu.name from tm_fcms_venue_user vu where vu.id = create_by_id)")
	private String userName;
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getVenueUserName() {
		return venueUserName;
	}

	public void setVenueUserName(String venueUserName) {
		this.venueUserName = venueUserName;
	}

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	public String getVenueCourseName() {
		return venueCourseName;
	}

	public void setVenueCourseName(String venueCourseName) {
		this.venueCourseName = venueCourseName;
	}

	public Long getStarLevel() {
		return starLevel;
	}

	public void setStarLevel(Long starLevel) {
		this.starLevel = starLevel;
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

	public String getTimeWrapper() {
		Long num = DateUtil.intervalDays(DateUtil.formatDate(gmtCreate, "yyyy-MM-dd"), new Date());
		if (num > 2) {
			timeWrapper = DateUtil.formatDate2Str(gmtCreate, "yyyy-MM-dd");
		} else if (num > 1) {
			timeWrapper = "前天";
		} else if (num > 0) {
			timeWrapper = "昨天";
		} else {
			if (num != -1) {
				timeWrapper = DateUtil.formatDate2Str(gmtCreate, "HH:mm");
			} else {
				timeWrapper = DateUtil.formatDate2Str(gmtCreate, "yyyy-MM-dd");
			}
		}
		return timeWrapper;
	}

	public void setTimeWrapper(String timeWrapper) {
		this.timeWrapper = timeWrapper;
	}

	public Long getTeachTime() {
		return teachTime;
	}

	public void setTeachTime(Long teachTime) {
		this.teachTime = teachTime;
	}
}
