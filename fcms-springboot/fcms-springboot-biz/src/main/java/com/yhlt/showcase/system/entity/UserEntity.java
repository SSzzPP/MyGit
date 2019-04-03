package com.yhlt.showcase.system.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.yhlt.showcase.base.entity.BaseEntity;

@Entity
@Table(name = "tc_system_user")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class UserEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// @NotNull(message = "用户名不能为空")
	@Size(min = 2, max = 20, message = "用户名长度限制2-20位")
	private String loginName;
	// 不显示在Restful接口的属性.
	// @NotNull(message = "密码不能为空")
	@Size(min = 3, max = 32, message = "密码长度限制3-32位")
	@JsonIgnore
	private String password;
	// @NotNull(message = "真实姓名不能为空")
	@Size(min = 2, max = 10, message = "真实姓名长度限制2-10位")
	private String name;
	// @NotNull(message = "性别不能为空")
	private Integer sex;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+08:00")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;
	private String telephone;
	private String mobile;
	private String email;
	private String companyAddress;
	private String homeAddress;
	private Integer statusId;
	private String pinyinName;
	private String workcode;
	private Integer secLevel;
	/**
	 * 公司
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "company_id")
	@Fetch(FetchMode.JOIN)
	private CompanyEntity companyEntity;

	/**
	 * 部门
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "department_id")
	@Fetch(FetchMode.JOIN)
	private DepartmentEntity departmentEntity;

	/**
	 * 职位
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "pos_id")
	@Fetch(FetchMode.JOIN)
	private PositionEntity positionEntity;

	/**
	 * 人员角色
	 */
	@JsonIgnore
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	private Set<RoleUserEntity> roleUsers;

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCompanyAddress() {
		return companyAddress;
	}

	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}

	public String getHomeAddress() {
		return homeAddress;
	}

	public void setHomeAddress(String homeAddress) {
		this.homeAddress = homeAddress;
	}

	public Integer getStatusId() {
		return statusId;
	}

	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}

	public String getPinyinName() {
		return pinyinName;
	}

	public void setPinyinName(String pinyinName) {
		this.pinyinName = pinyinName;
	}

	public String getWorkcode() {
		return workcode;
	}

	public void setWorkcode(String workcode) {
		this.workcode = workcode;
	}

	public Integer getSecLevel() {
		return secLevel;
	}

	public void setSecLevel(Integer secLevel) {
		this.secLevel = secLevel;
	}

	public CompanyEntity getCompanyEntity() {
		return companyEntity;
	}

	public void setCompanyEntity(CompanyEntity companyEntity) {
		this.companyEntity = companyEntity;
	}

	public DepartmentEntity getDepartmentEntity() {
		return departmentEntity;
	}

	public void setDepartmentEntity(DepartmentEntity departmentEntity) {
		this.departmentEntity = departmentEntity;
	}

	public PositionEntity getPositionEntity() {
		return positionEntity;
	}

	public void setPositionEntity(PositionEntity positionEntity) {
		this.positionEntity = positionEntity;
	}

	public Set<RoleUserEntity> getRoleUsers() {
		return roleUsers;
	}

	public void setRoleUsers(Set<RoleUserEntity> roleUsers) {
		this.roleUsers = roleUsers;
	}

}