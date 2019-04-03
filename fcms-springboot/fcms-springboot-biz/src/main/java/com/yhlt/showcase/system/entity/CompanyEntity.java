package com.yhlt.showcase.system.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * 组织机构-公司<br>
 * 删除公司时需要删除下子公司 <br>
 * 删除公司时需要删除公司下部门<br>
 * 
 * 
 * @author wj
 * @date 2014年12月25日20:20:45
 */
@Entity
@Table(name = "tc_system_company")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class CompanyEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3627868618657398768L;
	/**
	 * 名称
	 */
	@NotNull(message = "公司名不能为空")
	@Size(min = 2, max = 20, message = "名称长度限制2-20位")
	private String name;
	/**
	 * 层级
	 */
	private int layer;
	/**
	 * 图标
	 */
	private String icon;
	/**
	 * 排序编码
	 */
	private Long sortNumber = 0L;
	/**
	 * 删除标记（0：正常 1：已删除）
	 */
	private Long deleteFlag = 0L;
	/**
	 * 父公司
	 */
	// @Transient
	private Long parentId = 0L;
	/**
	 * 公司总经理
	 */
	@ManyToOne
	@JsonIgnore
	@JoinColumn(name="leader_id")
	private UserEntity leader;
	/**
	 * 公司董事长
	 */
	@ManyToOne
	@JsonIgnore
	@JoinColumn(name="manager_id")
	private UserEntity manager;
	
	// /**
	// * 父公司
	// */
	// @ManyToOne
	// @JoinColumn(name = "parent_id")
	// @NotFound(action = NotFoundAction.IGNORE)
	// private CompanyEntity parent;
	@Transient
	private String iconCls = "icon2 r14_c19";
	/**
	 * 子集合
	 */
	// @JsonIgnore
	@OneToMany(mappedBy = "parentId", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	@OrderBy("sortNumber")
	private Set<CompanyEntity> children = new HashSet<CompanyEntity>();

	/**
	 * 子部门
	 */
	@JsonIgnore
	@OneToMany(mappedBy = "companyEntity", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	@OrderBy("sortNumber")
	private Set<DepartmentEntity> departmentEntities = new HashSet<DepartmentEntity>();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Long getSortNumber() {
		return sortNumber;
	}

	public void setSortNumber(Long sortNumber) {
		this.sortNumber = sortNumber;
	}

	public Long getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Long deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public UserEntity getLeader() {
		return leader;
	}

	public void setLeader(UserEntity leader) {
		this.leader = leader;
	}

	public UserEntity getManager() {
		return manager;
	}

	public void setManager(UserEntity manager) {
		this.manager = manager;
	}

	public Set<CompanyEntity> getChildren() {
		return new HashSet<CompanyEntity>(children);
	}

	public void setChildren(Set<CompanyEntity> children) {
		this.children = children;
	}

	// public CompanyEntity getParent() {
	// return parent;
	// }
	//
	// public void setParent(CompanyEntity parent) {
	// this.parent = parent;
	// }

	public Set<DepartmentEntity> getDepartmentEntities() {
		return new HashSet<DepartmentEntity>(departmentEntities);
	}

	public void setDepartmentEntities(Set<DepartmentEntity> departmentEntities) {
		this.departmentEntities = departmentEntities;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public int getLayer() {
		return layer;
	}

	public void setLayer(int layer) {
		this.layer = layer;
	}

}
