package com.yhlt.showcase.match.entity;

import com.yhlt.showcase.base.entity.BaseEntity;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

import javax.persistence.Entity;

/**
 * @Description: 队伍人员组成 Entity
 * @author sgq
 * @date 2018-10-16 11:43
 */
@Entity
@Table(name = "tr_match_team_user")
public class MatchTeamUserEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	* 队伍id
	*/ 
	private Long teamId;

	/**
	* 成员用户id
	*/ 
	private Long matchUserId;
	/**
	* 成员用户名
	*/ 
	@Formula("(select u.name from tm_fcms_match_user u where u.id = match_user_id)")
	private String matchUserName;
	public Long getTeamId() {
		return teamId;
	}

	public void setTeamId(Long teamId) {
		this.teamId = teamId;
	}

	public Long getMatchUserId() {
		return matchUserId;
	}

	public void setMatchUserId(Long matchUserId) {
		this.matchUserId = matchUserId;
	}

	public String getMatchUserName() {
		return matchUserName;
	}

	public void setMatchUserName(String matchUserName) {
		this.matchUserName = matchUserName;
	}
	
	
}

