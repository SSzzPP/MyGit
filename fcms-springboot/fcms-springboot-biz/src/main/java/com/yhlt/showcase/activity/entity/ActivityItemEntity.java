package com.yhlt.showcase.activity.entity;

import com.yhlt.showcase.base.entity.BaseEntity;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;

/**
 * @Description: 结伴运动 Entity
 * @author shiguoqin
 * @date 2018-08-14 15:21
 */
@Entity
@Table(name = "TM_FCMS_ACTIVITY_ITEM")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class ActivityItemEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	* 
	*/ 
	private String name;

	/**
	* 类型
	*/ 
	private Long type;

	/**
	* 备注
	*/ 
	private String remarks;

	/**
	* 封页图
	*/ 
	private String headImg;
	
	/**
	 * 关注人数
	 */
	@Formula("(select ifnull(sum(1),0) from TR_FCMS_ACTIVITY_ITEM_USER iu where iu.item_id=id)")
	private String peopleNum;
	
	/**
	 * 活动数量
	 */
	@Formula("(select ifnull(sum(1),0) from TM_FCMS_ACTIVITY_MAIN am where am.item_id=id)")
	private String mainNum;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getType() {
		return type;
	}

	public void setType(Long type) {
		this.type = type;
	}
	
	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getHeadImg() {
		return headImg;
	}

	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}

	public String getPeopleNum() {
		return peopleNum;
	}

	public void setPeopleNum(String peopleNum) {
		this.peopleNum = peopleNum;
	}

	public String getMainNum() {
		return mainNum;
	}

	public void setMainNum(String mainNum) {
		this.mainNum = mainNum;
	}
	

}

