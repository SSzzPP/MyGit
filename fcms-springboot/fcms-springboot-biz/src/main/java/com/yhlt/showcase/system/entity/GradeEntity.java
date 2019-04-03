package com.yhlt.showcase.system.entity;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import com.yhlt.showcase.base.entity.BaseEntity;
/**
 * @Description: 年级表entity
 * @author szp
 * @date 2019-02-25 14:24
 */
@Entity
@Table(name = "TM_GRADE_SZP")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class GradeEntity extends BaseEntity<Long> {
	private static final long serialVersionUID = 1L;
	/**
	 * 年级名称
	 */
	//@NotBlank(message = "年级名称不能为空")
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
