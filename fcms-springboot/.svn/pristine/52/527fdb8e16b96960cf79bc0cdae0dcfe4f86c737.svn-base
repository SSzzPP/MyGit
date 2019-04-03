package com.yhlt.showcase.system.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Where;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * 系统资源
 * 
 * @author xunxun
 * @date 2014-11-15 下午1:56:25
 */
@Entity
@Table(name = "tc_system_resources")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class ResourcesEntity extends BaseEntity<Long> {

	private static final long serialVersionUID = 5698062778737079502L;

	/**
	 * 名称
	 */
	@NotNull(message = "名称不能为空")
	@Size(min = 2, max = 10, message = "名称长度限制2-10位")
	private String name;
	/**
	 * 编码
	 */
	@NotNull(message = "编码不能为空")
	@Size(min = 0, max = 30, message = "名称长度限制30位")
	private String code;
	/**
	 * 描述
	 */
	private String description;
	/**
	 * 图标
	 */
	private String icon;
	/**
	 * URL
	 */
	private String url;
	/**
	 * 排序编码
	 */
	@NotNull(message = "顺序号不能为空")
	private Long sortNumber = 0L;
	/**
	 * 类型（0：菜单 1：功能）
	 */
	private Long type = 0L;
	/**
	 * 删除标记（0：正常 1：已删除）
	 */
	private Long deleteFlag = 0L;
	/**
	 * 父菜单
	 */
	// @Transient
	private Long parentId = 0L;

	/*
	 * @ManyToOne
	 * 
	 * @JoinColumn(name = "parent_id")
	 * 
	 * @NotFound(action = NotFoundAction.IGNORE) private ResourcesEntity parent;
	 */

	@Transient
	private String iconCls = "icon2 r4_c4";

	public Long getParentId() {
		return parentId;
	}

	/**
	 * 子菜单集合
	 */
	@JsonIgnore
	@OneToMany(mappedBy = "parentId", fetch = FetchType.LAZY, cascade = {
			CascadeType.REMOVE, CascadeType.MERGE })
	@Where(clause = "delete_flag=0")
	@OrderBy("sortNumber")
	private Set<ResourcesEntity> children = new HashSet<ResourcesEntity>();

	/**
	 * 资源角色集合
	 */
	@JsonIgnore
	@OneToMany(mappedBy = "resources", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	private Set<RoleResourcesEntity> roleResourcess;
	@Transient
	private String state = "closed";

	// 0后台菜单，1前台菜单
	private Integer flag = 0;

	public String getState() {
		return state;
	}

	public Integer getFlag() {
		return flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Set<RoleResourcesEntity> getRoleResourcess() {
		return roleResourcess;
	}

	public void setRoleResourcess(Set<RoleResourcesEntity> roleResourcess) {
		this.roleResourcess = roleResourcess;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Long getSortNumber() {
		return sortNumber;
	}

	public void setSortNumber(Long sortNumber) {
		this.sortNumber = sortNumber;
	}

	public Long getType() {
		return type;
	}

	public void setType(Long type) {
		this.type = type;
	}

	public Long getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Long deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	/*
	 * public Long getParentId() { if (parent != null) { parentId =
	 * parent.getId(); } return parentId; }
	 */

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public Set<ResourcesEntity> getChildren() {
		return children;
	}

	public void setChildren(Set<ResourcesEntity> children) {
		this.children = children;
	}

	/*
	 * public ResourcesEntity getParent() { return parent; }
	 * 
	 * public void setParent(ResourcesEntity parent) { this.parent = parent; }
	 */
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

}
