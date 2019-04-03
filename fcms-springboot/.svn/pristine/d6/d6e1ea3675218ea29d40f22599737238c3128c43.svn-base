/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.yhlt.showcase.system.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.yhlt.showcase.base.entity.IdEntity;

@Entity
@Table(name = "tr_system_role_resource")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class RoleResourcesEntity extends IdEntity<Long> {
	
	private static final long serialVersionUID = 1L;
	/**
	 * 资源
	 */
	@ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
	@JoinColumn(name = "resource_id")
	private ResourcesEntity resources;
	
	/**
	 * 角色
	 */
	@ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
	@JoinColumn(name = "role_id")
	private RoleEntity role;

	public ResourcesEntity getResources() {
		return resources;
	}

	public void setResources(ResourcesEntity resources) {
		this.resources = resources;
	}

	public RoleEntity getRole() {
		return role;
	}

	public void setRole(RoleEntity role) {
		this.role = role;
	}

}