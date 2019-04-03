package com.yhlt.showcase.match.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * @Description: 赛事 Entity
 * @author sgq
 * @date 2018-10-10 11:43
 */
@Entity
@Table(name = "tm_fcms_match_main")
public class MatchMainEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	* 赛事标题
	*/ 
	private String title;

	/**
	* 0：未发布；1：发布
	*/ 
	private int status;

	/**
	* 报名截止时间
	*/ 
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+08:00")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date endTime;

	/**
	* 咨询电话
	*/ 
	private String tel;

	/**
	* 赛事开始时间
	*/ 
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+08:00")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date startTime;

	/**
	 * 赛事结束时间
	 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+08:00")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date matchEnd;
	/**
	* 比赛地点
	*/ 
	private String location;

	/**
	* 详细说明
	*/ 
	private String instructions;

	/**
	 *赛事状态 
	 */
	@Formula("( select (case when NOW()<t.END_TIME then '报名中' when NOW()>t.END_TIME and NOW()<t.START_TIME then '报名结束' when NOW()>t.START_TIME and NOW()<t.MATCH_END then '比赛中' when NOW()>t.MATCH_END then '已结束' end) from tm_fcms_match_main t where ID=t.id)")
	private String matchStatus;
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getInstructions() {
		return instructions;
	}

	public void setInstructions(String instructions) {
		this.instructions = instructions;
	}
	
	public Date getMatchEnd() {
		return matchEnd;
	}
	
	public void setMatchEnd(Date matchEnd) {
		this.matchEnd = matchEnd;
	}
	
	public String getMatchStatus() {
		return matchStatus;
	}
	
	public void setMatchStatus(String matchStatus) {
		this.matchStatus = matchStatus;
	}
}

