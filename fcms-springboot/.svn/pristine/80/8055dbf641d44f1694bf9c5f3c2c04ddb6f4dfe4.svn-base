package com.yhlt.showcase.activity.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Formula;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.yhlt.showcase.base.entity.BaseEntity;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.util.DateUtil;

/**
 * @Description: 结伴运动关注 Entity
 * @author shiguoqin
 * @date 2018-08-14 15:36
 */
@Entity
@Table(name = "TM_FCMS_ACTIVITY_MAIN")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class ActivityMainEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	* 
	*/
	private Long itemId;
	@Formula("(select i.name from tm_fcms_activity_item i where i.id=item_id)")
	private String itemName;
	
	/**
	 * 活动标题
	 */
	@Size(min = 1, max = 20, message = "长度限制1-20个字")
	private String title;

	/**
	 * 费用类型0：AA，1：我请客，2：求请客
	 */
	private Long costType;

	/**
	 * 成员0：男女不限，1：限帅哥，2：限美女
	 */
	private Long member;

	/**
	 * 活动时间
	 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+08:00")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date activityTime;

	/**
	 * 集合地点
	 */
	@Size(max = 20, message = "最多可输入20个字符")
	private String location;

	/**
	 * 报名截止时间
	 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+08:00")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date stopTime;

	/**
	 * 最多参加人数
	 */
	private Long peopleNum;

	/**
	 * 邀请说明
	 */
	@Size(min = 1, max = 100, message = "长度限制1-100个字")
	private String instructions;

	/**
	 * 发布者联系方式
	 */
	@Size(min = 11, max = 11, message = "手机号不正确")
	private String tel;

	/**
	 * 字符串时间
	 */
	@Transient
	private String timeWrapper;
	/**
	 * 用户昵称
	 */
	@Formula("(select v.name from tm_fcms_venue_user v where v.id=create_by_id)")
	private String userName;
	/**
	 * 用户uuid
	 */
	@Formula("(select v.uuid from tm_fcms_venue_user v where v.id=create_by_id)")
	private String uuid;

	/**
	 * 判断是否是用户发布的
	 */
	@Transient
	private Boolean isMain;

	/**
	 * 用户报名状态
	 */
	@Transient
	private String sign;
	/**
	 * 报名人数
	 */
	@Formula("(select ifnull(sum(1),0) from tr_fcms_activity_main_user mu where mu.item_id=item_id and mu.main_id=id)")
	private Long signNum;
	
	/**
	 * 用户头像
	 */
	@Formula("(select v.img_url from tm_fcms_venue_user v where v.id=create_by_id)")
	private  String userPhoto;

	public Long getItemId() {
		return itemId;
	}

	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCostType() {
		if (this.costType == 0) {
			return "AA";
		} else if (this.costType == 1) {
			return "我请客";
		} else {
			return "求请客";
		}
	}

	public void setCostType(Long costType) {
		this.costType = costType;
	}

	public String getMember() {
		if (this.member == 0) {
			return "男女不限";
		} else if (this.member == 1) {
			return "限帅哥";
		} else {
			return "限美女";
		}
	}

	public void setMember(Long member) {
		this.member = member;
	}

	public Date getActivityTime() {
		return activityTime;
	}

	public void setActivityTime(Date activityTime) {
		this.activityTime = activityTime;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Date getStopTime() {
		return stopTime;
	}

	public void setStopTime(Date stopTime) {
		this.stopTime = stopTime;
	}

	public Long getPeopleNum() {
		return peopleNum;
	}

	public void setPeopleNum(Long peopleNum) {
		this.peopleNum = peopleNum;
	}

	public String getInstructions() {
		return instructions;
	}

	public void setInstructions(String instructions) {
		this.instructions = instructions;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
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

	public Boolean getSignNum() {
		if (peopleNum > this.signNum) {
			return true;
		} else {
			return false;
		}
	}

	public void setSignNum(Long signNum) {
		this.signNum = signNum;
	}

	public Boolean getIsMain() {
		if (LoginContextHolder.get() == null) {
			return false;
		}
		if (createById.equals(LoginContextHolder.get().getUserId())) {
			isMain = true;
		} else {
			isMain = false;
		}
		return isMain;
	}

	public void setIsMain(Boolean isMain) {
		this.isMain = isMain;
	}
	
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	
	public String getUserPhoto() {
		return userPhoto;
	}
	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}
	
}

