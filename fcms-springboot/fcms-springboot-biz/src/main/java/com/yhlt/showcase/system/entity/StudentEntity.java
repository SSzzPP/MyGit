package com.yhlt.showcase.system.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Formula;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.yhlt.showcase.base.entity.BaseEntity;
/**
 * @Description: 学生管理 entity
 * @author szp
 * @date 2019-02-25 14:24
 */
@Entity
@Table(name = "TM_STUDENT_SZP")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class StudentEntity extends BaseEntity<Long> {
	private static final long serialVersionUID = 1L;
	/**
	 * 姓名
	 */
	//@NotBlank(message = "姓名不能为空")
	private String name;
	/**
	 * 性别
	 */
	//@NotBlank(message = "性别不能为空")
	private String sex;
	/**
	 * 年龄
	 */
	//@NotBlank(message = "年龄不能为空")
	private Integer age;
	/**
	 * 手机号
	 */
	@Size(min= 11, max = 11, message = "手机号不正确")
	private String tel;
	/**
	 * 出生日期
	 */
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+08:00")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;
	/**
	 * 地址
	 */
	//@NotBlank(message = "地址不能为空")
	private String address;
	/**
	 * 学生类型
	 * 对应数据库表tc_system_dict的主键
	 */
	private long studentType;
	/** 
	 * 职位
	 * 用于数据筛选后在页面显示
	 */
	@Formula("(select d.name from tc_system_dict d where d.id = student_type)")
	private String position;
	/**
	 * 所属年级ID
	 * 对应数据库表tm_grade_szp的主键
	 */
	private long gradeId;
	/** 
	 * 年级
	 * 用于数据筛选后在页面显示
	 */
	@Formula("(select g.name from tm_grade_szp g where g.id = grade_id)")
	private String gradeStudent;
	/**
	 * 所属班级ID
	 * 对应数据库表tm_class_szp的主键
	 */
	private long classId;
	/** 
	 * 班级
	 * 用于数据筛选后在页面显示
	 */
	@Formula("(select c.name from tm_class_szp c where c.id = class_id)")
	private String classStudent;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public long getStudentType() {
		return studentType;
	}

	public void setStudentType(long studentType) {
		this.studentType = studentType;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public long getGradeId() {
		return gradeId;
	}

	public void setGradeId(long gradeId) {
		this.gradeId = gradeId;
	}

	public String getGradeStudent() {
		return gradeStudent;
	}

	public void setGradeStudent(String gradeStudent) {
		this.gradeStudent = gradeStudent;
	}

	public long getClassId() {
		return classId;
	}

	public void setClassId(long classId) {
		this.classId = classId;
	}

	public String getClassStudent() {
		return classStudent;
	}

	public void setClassStudent(String classStudent) {
		this.classStudent = classStudent;
	}
}
