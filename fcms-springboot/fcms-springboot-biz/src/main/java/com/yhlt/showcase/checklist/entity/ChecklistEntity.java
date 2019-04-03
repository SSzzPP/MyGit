package com.yhlt.showcase.checklist.entity;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Where;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.yhlt.showcase.base.entity.BaseEntity;
import com.yhlt.showcase.checklist.utils.RiskConstants;

/**
 * 安全检查项配置表
 * 
 * @author admin
 *
 */
@Entity
@Table(name = "TM_FCMS_CHECKLIST")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class ChecklistEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3775291508986324351L;

	/**
	 * uuid` varchar(255) NOT NULL,
	 */
	@Column(insertable = true, updatable = false)
	public String uuid = UUID.randomUUID().toString();

	/**
	 * ZH综合安全检查单、YX运行安全检查单、KF空防安全检查单、XF消防安全检查单。
	 * 
	 * <!-- 编号:KF，XF，YX，ZH -->
	 */
	private String billNo;

	/**
	 * nane
	 */
	public String name;

	/**
	 * 检查标准
	 */
	public String remark;

	/**
	 * 父节点
	 */
	public Long parentId;

	/**
	 * '0分类,1检查项,2检查依据,3检查依据明细'
	 */
	public Integer type;
	@Transient
	public String typeStatus = "";

	/**
	 * 排序
	 */
	public Integer sortNumber;

	@Transient
	private String iconCls = "icon2 r4_c4";

	/**
	 * 子集合
	 */
	@OneToMany(mappedBy = "parentId", fetch = FetchType.LAZY, cascade = { CascadeType.REMOVE, CascadeType.MERGE })
	@OrderBy("sortNumber")
	@Where(clause = "type=0")
	private Set<ChecklistEntity> children = new HashSet<ChecklistEntity>();

	/**
	 * 子集合
	 */
	@JsonIgnore
	@OneToMany(mappedBy = "parentId", fetch = FetchType.LAZY, cascade = { CascadeType.REMOVE, CascadeType.MERGE })
	@OrderBy("sortNumber")
	private Set<ChecklistEntity> children2 = new HashSet<ChecklistEntity>();

	/**
	 * 部门
	 */
	public Long departmentId;

	/**
	 * 0固定项，1部门自定义项目
	 */
	public Integer fix = 0;

	// @Transient
	// public String state;

	// @JsonIgnore
	// @OneToMany(mappedBy = "SecurityAssuranceEntity", fetch = FetchType.LAZY,
	// cascade = CascadeType.REMOVE)
	// private List<SecurityAssuranceEntity> securityAssuranceEntities;

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

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

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getSortNumber() {
		return sortNumber;
	}

	public void setSortNumber(Integer sortNumber) {
		this.sortNumber = sortNumber;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public Set<ChecklistEntity> getChildren() {
		return children;
	}

	public void setChildren(Set<ChecklistEntity> children) {
		this.children = children;
	}

	public Set<ChecklistEntity> getChildren2() {
		return children2;
	}

	public void setChildren2(Set<ChecklistEntity> children2) {
		this.children2 = children2;
	}

	public String getBillNo() {
		return billNo;
	}

	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}

	public Long getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Long departmentId) {
		this.departmentId = departmentId;
	}

	public Integer getFix() {
		return fix;
	}

	public void setFix(Integer fix) {
		this.fix = fix;
	}

	// public String getState() {
	// if (this.children2 == null || this.children2.size() == 0) {
	// state = "open";
	// } else {
	// state = "closed";
	// }
	// return state;
	// }
	//
	// public void setState(String state) {
	// this.state = state;
	// }

	public String getTypeStatus() {
		if (this.type != null) {
			if (this.type.equals(RiskConstants.Checklist_TYPE_CATEGORY)) {
				typeStatus = "检查分类";
			}
			if (this.type.equals(RiskConstants.Checklist_TYPE_STANDARD)) {
				typeStatus = "检查标准";
			}
		}
		return typeStatus;
	}

	public void setTypeStatus(String typeStatus) {
		this.typeStatus = typeStatus;
	}

}
