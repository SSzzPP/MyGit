package com.yhlt.showcase.system.entity;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * 用户-角色-资源视图
 * 
 * @author wj
 * 
 */
@Entity
@Table(name = "v_system_role_resource")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class UserRoleResourceEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8537193144161329580L;
	/**
	 * 名称
	 */
	private String name;
	/**
	 * 描述
	 */
	private String description;
	/**
	 * 编码
	 */
	private String code;
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
	private Long parentId = 0L;
	/**
	 * 用户ID
	 */
	private Long userId;
	/**
	 * 前后台菜单权限
	 */
	private int flag;

	public UserRoleResourceEntity() {
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

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

}
