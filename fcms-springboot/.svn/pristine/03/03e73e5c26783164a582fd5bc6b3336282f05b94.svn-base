package com.yhlt.showcase.match.entity;

import com.yhlt.showcase.base.entity.BaseEntity;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.persistence.Entity;

/**
 * @Description: 比赛项目 Entity
 * @author sgq
 * @date 2018-10-10 11:50
 */
@Entity
@Table(name = "tm_fcms_match_project")
public class MatchProjectEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	* 项目名
	*/ 
	private String name;

	/**
	* 比赛事宜
	*/ 
	@Size(min = 0, max = 100, message = "最多可输入250个字符")
	private String remark;

	/**
	* 比赛规则
	*/ 
	@Size(min = 0, max = 100, message = "最多可输入25s0个字符")
	private String rule;
	
	/**
	 * 0：单人赛1：团队赛
	 */
	private Long type;
	
	private Long peopleNum;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getRule() {
		return rule;
	}

	public void setRule(String rule) {
		this.rule = rule;
	}

	public Long getType() {
		return type;
	}

	public void setType(Long type) {
		this.type = type;
	}

	public Long getPeopleNum() {
		return peopleNum;
	}

	public void setPeopleNum(Long peopleNum) {
		this.peopleNum = peopleNum;
	}

}

