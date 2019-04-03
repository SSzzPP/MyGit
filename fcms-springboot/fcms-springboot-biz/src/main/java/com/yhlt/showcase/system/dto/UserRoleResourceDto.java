package com.yhlt.showcase.system.dto;

import java.io.Serializable;

/**
 * 用户-角色-资源视图DTO
 * 
 * @author wj
 * 
 */
public class UserRoleResourceDto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3195662154407787050L;
	
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
	
	/**
	 * 前台三级菜单高亮:0：常规；1：高亮
	 */
	private int menuActive = 0;
	

	public UserRoleResourceDto() {
	}

	
	public int getMenuActive() {
		return menuActive;
	}


	public void setMenuActive(int menuActive) {
		this.menuActive = menuActive;
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
	
	@Override
	public boolean equals(Object obj) {
		 if(this == obj) //先检查是否其自反性，后比较other是否为空。这样效率高                                     
			 return true;
		 if(obj == null)         
			 return false;
		 if( !(obj instanceof UserRoleResourceDto))
			 return false;
		 
		 UserRoleResourceDto dto = (UserRoleResourceDto)obj;
		 if(this.id.longValue() != dto.getId().longValue())
			   return false;
		 
		 return true;
	}

}
