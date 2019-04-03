package com.yhlt.showcase.base.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 基类Entity
 * 
 * @param <PK>
 * @author xunxun
 * @date 2014-11-15 下午1:56:14
 */
@MappedSuperclass
public class BaseEntity<PK extends Serializable> extends IdEntity<PK> implements
		Serializable {
	private static final long serialVersionUID = -7756611276785642606L;
	/**
	 * 创建时间
	 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
	@Column(insertable = true, updatable = false)
	protected Date gmtCreate = new Date();
	/**
	 * 修改时间
	 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
	@Column(insertable = true, updatable = true)
	protected Date gmtModified = new Date();
	/**
	 * 创建人ID
	 */
	@Column(insertable = true, updatable = false)
	protected Long createById;
	/**
	 * 最后更新人ID
	 */
	@Column(insertable = true, updatable = true)
	protected Long lastModifiedById;

	public Date getGmtCreate() {
		return gmtCreate;
	}

	public void setGmtCreate(Date gmtCreate) {
		this.gmtCreate = gmtCreate;
	}

	public Date getGmtModified() {
		return gmtModified;
	}

	public void setGmtModified(Date gmtModified) {
		this.gmtModified = gmtModified;
	}

	public Long getCreateById() {
		return createById;
	}

	public void setCreateById(Long createById) {
		this.createById = createById;
	}

	public Long getLastModifiedById() {
		return lastModifiedById;
	}

	public void setLastModifiedById(Long lastModifiedById) {
		this.lastModifiedById = lastModifiedById;
	}
	
//	@Override
//	public String toString() {
//		return ToStringBuilder.reflectionToString(this);
//	}
}
