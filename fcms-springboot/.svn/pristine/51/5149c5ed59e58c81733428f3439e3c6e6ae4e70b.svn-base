package com.yhlt.showcase.system.dto;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Transient;

import com.yhlt.showcase.system.entity.ResourcesEntity;

/**
 * 系统资源
 * 
 * @author yty
 * @date 2016年5月13日09:42:11
 */
public class ResourcesDto {

	private Long id;

	/**
	 * 名称
	 */
	private String name;
	/**
	 * 编码
	 */
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
	private Long sortNumber;
	/**
	 * 类型（0：菜单 1：功能）
	 */
	private Long type;
	/**
	 * 删除标记（0：正常 1：已删除）
	 */
	private Long deleteFlag;
	/**
	 * 父菜单
	 */
	private Long parentId;

	private int flag;

	/**
	 * 子菜单集合
	 */
	private List<ResourcesDto> children = new ArrayList<ResourcesDto>();

	@Transient
	private String iconCls = "icon2 r4_c4";

	public ResourcesDto() {

	}

	public ResourcesDto(ResourcesEntity entity) {
		this.id = entity.getId();
		this.name = entity.getName();
		this.code = entity.getCode();
		this.description = entity.getDescription();
		this.icon = entity.getIcon();
		this.url = entity.getUrl();
		this.sortNumber = entity.getSortNumber();
		this.type = entity.getType();
		this.deleteFlag = entity.getDeleteFlag();
		this.parentId = entity.getParentId();
		this.flag = entity.getFlag();
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

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public List<ResourcesDto> getChildren() {
		return children;
	}

	public void setChildren(List<ResourcesDto> children) {
		this.children = children;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

}
