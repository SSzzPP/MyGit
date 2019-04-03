/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.yhlt.showcase.system.entity;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.yhlt.showcase.base.entity.IdEntity;

@Entity
@Table(name = "v_system_role_tree")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class RoleTreeEntity extends IdEntity<Long> {

	private static final long serialVersionUID = 1L;

	/**
	 * 名称
	 */
	private String name;
	/**
	 * 父菜单
	 */
	private Long parentId;
	/**
	 * 子集合
	 */
	// @JsonIgnore
	// @OneToMany(fetch = FetchType.LAZY)
	// @JoinColumn(name = "parentId")
	// @OrderBy("sortNumber")
	// private Set<RoleTreeEntity> children = new HashSet<RoleTreeEntity>();
	/**
	 * 标记（0：公司，1：角色）
	 */
	private Integer flag;

	@Transient
	private String state = "closed";

	@Transient
	private String iconCls = "icon2 r22_c5";

	public String getState() {
		if (flag == 1) {
			return "open";
		}
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Integer getFlag() {
		return flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIconCls() {
		return flag == 0 ? "icon2 r14_c19" : iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	// public Set<RoleTreeEntity> getChildren() {
	// return children;
	// }

	// public void setChildren(Set<RoleTreeEntity> children) {
	// this.children = children;
	// }

}