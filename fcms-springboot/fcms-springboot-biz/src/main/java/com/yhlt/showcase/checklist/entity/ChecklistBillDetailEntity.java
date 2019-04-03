package com.yhlt.showcase.checklist.entity;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Formula;

import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * 安保专项检查单明细
 * 
 * @author wj
 * 
 */
@Entity
@Table(name = "TM_FCMS_CHECKLIST_BILL_DETAIL")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class ChecklistBillDetailEntity extends BaseEntity<Long> {
	/**
	 * status remark process_id gmt_create create_by_id gmt_modified
	 * last_modified_by_id
	 */
	/**
	 * 
	 */
	private static final long serialVersionUID = 2014346741173663583L;

	/**
	 * uuid
	 */
	@Column(insertable = true, updatable = false)
	private String uuid = UUID.randomUUID().toString();
	/**
	 * 检查单
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "bill_id")
	@Fetch(FetchMode.JOIN)
	private ChecklistBillEntity checklistBillEntity;

	/**
	 * 检查大分类
	 */
	private Long checklistTypeOneId;
	private String checklistTypeOneName;
	/**
	 * 检查标准
	 */
	private Long checklistStandardId;
	private String checklistStandardName;

	/**
	 * 0固定项，1部门自定义项目
	 */
	private Integer fix = 0;
	/**
	 * 修改状态
	 */
	private Integer orgStatus;

	/**
	 * 原始备注
	 */
	private String orgRemark;
	/**
	 * 原始状态
	 */
	private Integer modifyStatus;

	/**
	 * 修改备注
	 */
	private String modifyRemark;

	/**
	 * 0符合,1不符合,2未检查,3不适用
	 */
	private Integer status = 0;

	/**
	 * 检查详情
	 */
	private String remark;

	/**
	 * 流程id
	 */
	private String processId;

	/**
	 * 不符合条数，和检查标准有关，和部门 与责任人无关 / t.department_id=department_id and
	 */
	// @Formula(value =
	// "(SELECT count(1) from tm_sms_security_assurance_bill_detail t WHERE t.status
	// = 1 and t.department_id=department_id and
	// t.security_assurance_standard_id=security_assurance_standard_id)")

	@Formula(value = "(SELECT count(1) from TM_FCMS_CHECKLIST_BILL_FILE t WHERE  t.bill_id = bill_id and t.checklist_standard_id=checklist_standard_id)")
	private Integer picCount;

	public ChecklistBillDetailEntity() {
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}


	public Integer getStatus() {
		// if (modifyStatus != null)
		// return modifyStatus;
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getRemark() {
		if (StringUtils.isNotBlank(modifyRemark))
			return modifyRemark;
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getProcessId() {
		return processId;
	}

	public void setProcessId(String processId) {
		this.processId = processId;
	}

	public Integer getModifyStatus() {
		return modifyStatus;
	}

	public void setModifyStatus(Integer modifyStatus) {
		this.modifyStatus = modifyStatus;
	}

	public String getModifyRemark() {
		return modifyRemark;
	}

	public void setModifyRemark(String modifyRemark) {
		this.modifyRemark = modifyRemark;
	}

	public Integer getOrgStatus() {
		return orgStatus;
	}

	public void setOrgStatus(Integer orgStatus) {
		this.orgStatus = orgStatus;
	}

	public String getOrgRemark() {
		return orgRemark;
	}

	public void setOrgRemark(String orgRemark) {
		this.orgRemark = orgRemark;
	}

	public Integer getFix() {
		return fix;
	}

	public void setFix(Integer fix) {
		this.fix = fix;
	}

	public Integer getPicCount() {
		return picCount;
	}

	public void setPicCount(Integer picCount) {
		this.picCount = picCount;
	}

	public ChecklistBillEntity getChecklistBillEntity() {
		return checklistBillEntity;
	}

	public void setChecklistBillEntity(ChecklistBillEntity checklistBillEntity) {
		this.checklistBillEntity = checklistBillEntity;
	}

	public Long getChecklistTypeOneId() {
		return checklistTypeOneId;
	}

	public void setChecklistTypeOneId(Long checklistTypeOneId) {
		this.checklistTypeOneId = checklistTypeOneId;
	}

	public String getChecklistTypeOneName() {
		return checklistTypeOneName;
	}

	public void setChecklistTypeOneName(String checklistTypeOneName) {
		this.checklistTypeOneName = checklistTypeOneName;
	}


	public Long getChecklistStandardId() {
		return checklistStandardId;
	}

	public void setChecklistStandardId(Long checklistStandardId) {
		this.checklistStandardId = checklistStandardId;
	}

	public String getChecklistStandardName() {
		return checklistStandardName;
	}

	public void setChecklistStandardName(String checklistStandardName) {
		this.checklistStandardName = checklistStandardName;
	}

}
