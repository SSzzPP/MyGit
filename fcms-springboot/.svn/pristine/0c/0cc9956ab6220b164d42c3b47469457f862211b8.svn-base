package com.yhlt.showcase.match.entity;

import com.yhlt.showcase.base.entity.BaseEntity;
import javax.persistence.Table;
import javax.persistence.Entity;

/**
 * @Description: 报名 Entity
 * @author sgq
 * @date 2018-10-16 14:26
 */
@Entity
@Table(name = "tr_match_sign")
public class MatchSignEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	* 赛事id
	*/ 
	private Long matchId;

	/**
	* 比赛项目id
	*/ 
	private Long projectId;

	/**
	* 报名团队id
	*/ 
	private Long teamId;

	/**
	* 报名用户id（报名团队和报名用户只可以有一个）
	*/ 
	private Long matchUserId;
	
	/**
	 * 0：单人赛1：团队赛
	 */
	private Long type;
	
	/**
	 * 0：创建或已经添加1：已报名
	 */
	private Long status;

	public Long getMatchId() {
		return matchId;
	}

	public void setMatchId(Long matchId) {
		this.matchId = matchId;
	}

	public Long getProjectId() {
		return projectId;
	}

	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}

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

	public Long getType() {
		return type;
	}

	public void setType(Long type) {
		this.type = type;
	}

	public void setStatus(Long status) {
		this.status = status;
	}
	public Long getStatus() {
		return status;
	}

}

