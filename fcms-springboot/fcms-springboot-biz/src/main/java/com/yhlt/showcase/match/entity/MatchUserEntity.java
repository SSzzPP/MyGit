package com.yhlt.showcase.match.entity;

import com.yhlt.showcase.base.entity.BaseEntity;
import javax.persistence.Table;
import javax.persistence.Entity;

/**
 * @Description: 报名人员 Entity
 * @author sgq
 * @date 2018-10-16 11:41
 */
@Entity
@Table(name = "tm_fcms_match_user")
public class MatchUserEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	* 姓名
	*/ 
	private String name;

	/**
	* 性别
	*/ 
	private Long sex;

	/**
	* 证件（暂时不用）
	*/ 
	private String certificates;

	/**
	* 联系方式
	*/ 
	private String mobile;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getSex() {
		return sex;
	}

	public void setSex(Long sex) {
		this.sex = sex;
	}

	public String getCertificates() {
		return certificates;
	}

	public void setCertificates(String certificates) {
		this.certificates = certificates;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

}

