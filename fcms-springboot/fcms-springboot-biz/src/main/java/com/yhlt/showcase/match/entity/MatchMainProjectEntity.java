package com.yhlt.showcase.match.entity;

import com.yhlt.showcase.base.entity.BaseEntity;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 * @Description: 赛事和项目关系 Entity
 * @author sgq
 * @date 2018-10-10 11:52
 */
@Entity
@Table(name = "tr_match_main_project")
public class MatchMainProjectEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	* 比赛id
	*/ 
	private Long mainId;

	/**
	* 比赛项目id
	*/ 
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "project_id")
	@Fetch(FetchMode.JOIN)
	private MatchProjectEntity matchProjectEntity;

	public Long getMainId() {
		return mainId;
	}

	public void setMainId(Long mainId) {
		this.mainId = mainId;
	}

	public MatchProjectEntity getMatchProjectEntity() {
		return matchProjectEntity;
	}

	public void setMatchProjectEntity(MatchProjectEntity matchProjectEntity) {
		this.matchProjectEntity = matchProjectEntity;
	}
	
}

