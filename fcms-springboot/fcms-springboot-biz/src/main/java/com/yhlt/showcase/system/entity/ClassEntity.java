package com.yhlt.showcase.system.entity;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import org.hibernate.annotations.Formula;

import com.yhlt.showcase.base.entity.BaseEntity;
/**
 * @Description: 班级表entity
 * @author szp
 * @date 2019-02-25 14:24
 */
@Entity
@Table(name = "TM_CLASS_SZP")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class ClassEntity extends BaseEntity<Long> {
	private static final long serialVersionUID = 1L;
	/**
	 * 班级级名称
	 */
	//@NotBlank(message = "班级名称不能为空")
	private String name;
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
	private String gradeName;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getGradeId() {
		return gradeId;
	}

	public void setGradeId(long gradeId) {
		this.gradeId = gradeId;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
}
