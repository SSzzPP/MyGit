package com.yhlt.showcase.system.entity;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * 职位管理
 * 
 * @author lls
 * 
 */
@Entity
@Table(name = "tc_system_position")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class PositionEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7186651772219188691L;

	/**
	 * 职位名称
	 */
	@NotNull(message = "名称不能为空")
	@Size(min = 1, max = 20, message = "名称长度限制1-20位")
	private String name;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 排序编码
	 */
	private Long sortNumber = 0L;

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

	public Long getSortNumber() {
		return sortNumber;
	}

	public void setSortNumber(Long sortNumber) {
		this.sortNumber = sortNumber;
	}

}
