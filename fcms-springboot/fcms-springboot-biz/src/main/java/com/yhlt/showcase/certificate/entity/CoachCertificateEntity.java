package com.yhlt.showcase.certificate.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * 教练认证Entity
 * 
 * @author zwk
 *
 */
@Entity
@Table(name = "TM_FCMS_COACH_CERTIFICATE")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class CoachCertificateEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1646222215881911793L;

	/**
	 * 认证状态 0 等待审核 1认证成功2认证失败
	 */
	private Integer status;
	/**
	 * 执教场馆Id 可以为空
	 */
	private Long venueId;
	@Formula("(select v.name from tm_fcms_venue_info v where v.id = venue_id)")
	private String venueName;

	/**
	 * 从教时间
	 */
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+08:00")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date teachStart;
	/**
	 * 成就与荣誉
	 */
	private String achievement;
	/**
	 * 真实姓名
	 */
	private String realName;
	/**
	 * 手机号码
	 */
	private String mobile;
	/**
	 * 用户认证的类型0场馆管理认证1教练认证
	 */
	private Integer certificateType;

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Long getVenueId() {
		return venueId;
	}

	public void setVenueId(Long venueId) {
		this.venueId = venueId;
	}

	public Date getTeachStart() {
		return teachStart;
	}

	public void setTeachStart(Date teachStart) {
		this.teachStart = teachStart;
	}

	public String getAchievement() {
		return achievement;
	}

	public void setAchievement(String achievement) {
		this.achievement = achievement;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getVenueName() {
		return venueName;
	}

	public void setVenueName(String venueName) {
		this.venueName = venueName;
	}

	public Integer getCertificateType() {
		return certificateType;
	}

	public void setCertificateType(Integer certificateType) {
		this.certificateType = certificateType;
	}

}
