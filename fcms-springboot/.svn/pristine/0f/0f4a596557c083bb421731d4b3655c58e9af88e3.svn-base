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
 * @Description: 场馆评价 Entity
 * @author swy
 * @date 2018-07-24 14:41
 */
@Entity
@Table(name = "TM_FCMS_VENUE_VEALUATE")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class VenueVealuateEntity extends BaseEntity<Long> {

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
	// private Long userId;
	// @Formula("(select vu.name from tm_fcms_venue_user vu where vu.id =
	// user_id)")
	// private String venueUserName;

	/**
	 * 课程id
	 */
	// private Long courseId;
	// @Formula("(select vc.name from tm_fcms_venue_course vc where vc.id =
	// course_id)")
	// private String venueCourseName;

	/**
	 * 卫生评分
	 */
	private Long starLevel;
	/**
	 * 服务评分
	 */
	private Long serviceStar;
	/**
	 * 环境评分
	 */
	private Long environmentStar;

	@Transient
	private String timeWrapper;

	private Long venueId;
	// 根据用户UUid取头像
	@Formula("(select vu.uuid from tm_fcms_venue_user vu where vu.id = create_by_id)")
	private String uuid;

	@Formula("(select vu.name from tm_fcms_venue_user vu where vu.id = create_by_id)")
	private String userName;

	@Formula("(select vi.name from tm_fcms_venue_info vi where vi.id = venue_id)")
	private String venueName;
	
	/**
	 * 评论者头像
	 */
	@Formula("(select vu.img_url from tm_fcms_venue_user vu where vu.id = create_by_id)")
	private String userPhoto;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Long getStarLevel() {
		return starLevel;
	}

	public void setStarLevel(Long starLevel) {
		this.starLevel = starLevel;
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

	public Long getVenueId() {
		return venueId;
	}

	public void setVenueId(Long venueId) {
		this.venueId = venueId;
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

	public Long getServiceStar() {
		return serviceStar;
	}

	public void setServiceStar(Long serviceStar) {
		this.serviceStar = serviceStar;
	}

	public Long getEnvironmentStar() {
		return environmentStar;
	}

	public void setEnvironmentStar(Long environmentStar) {
		this.environmentStar = environmentStar;
	}

	public String getVenueName() {
		return venueName;
	}

	public void setVenueName(String venueName) {
		this.venueName = venueName;
	}

	public String getUserPhoto() {
		return userPhoto;
	}

	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}

}
