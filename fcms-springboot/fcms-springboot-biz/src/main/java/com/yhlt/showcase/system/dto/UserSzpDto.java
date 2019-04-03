package com.yhlt.showcase.system.dto;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 用户
 * 
 * @author szp
 * 
 */
public class UserSzpDto implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3195662154407787050L;
	
	private Long id;
	/**
	 * 用户名
	 */
	private String userName;
	/**
	 * 公司名称
	 */
	private String companyName;
	/**
	 * 部门名称
	 */
	private String departmentName;
	/**
	 * 年龄
	 */
	private Integer age;
	/**
	 * 出生日期
	 */
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+08:00")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date userBirthday;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public Date getUserBirthday() {
		return userBirthday;
	}
	public void setUserBirthday(Date userBirthday) {
		this.userBirthday = userBirthday;
	}
	
}
