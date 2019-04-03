package com.yhlt.showcase.system.dto;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * 系统菜单DTO
 * 
 * @author wj
 * 
 */
public class SystemMenuDto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4451977115580434654L;
	/**
	 * ID
	 */
	private Long id;
	/**
	 * 名称
	 */
	private String name;
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
	 * 父菜单
	 */
	private Set<SystemMenuDto> children = new LinkedHashSet<SystemMenuDto>();
	/**
	 * 待办任务数
	 */
	private Long taskCount;

	public SystemMenuDto() {
	}

	public SystemMenuDto(Long id, String name, String description, String icon,
			String url) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.icon = icon;
		this.url = url;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public Set<SystemMenuDto> getChildren() {
		return children;
	}

	public void setChildren(Set<SystemMenuDto> children) {
		this.children = children;
	}

	public Long getTaskCount() {
		return taskCount;
	}

	public void setTaskCount(Long taskCount) {
		this.taskCount = taskCount;
	}

}
