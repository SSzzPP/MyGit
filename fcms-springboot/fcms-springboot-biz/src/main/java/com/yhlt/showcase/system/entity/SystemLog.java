package com.yhlt.showcase.system.entity;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * 业务日志表
 * 
 * @author wj
 * 
 */
@Entity
@Table(name = "tc_system_log")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class SystemLog extends BaseEntity<Long> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

//	@ManyToOne(fetch = FetchType.EAGER)
//	@JoinColumn(name = "createById", insertable = false, updatable = false)
//	private UserEntity userInfo;
	// 业务表主键ID
	private String entityId;
	// 后台业务类
	private String service;
	// 操作前内容
	private String content;
	// 后台业务方法
	private String operation;
	// 返回结果
	private String result;
	// 类名称
	private String className;
	
	@Formula(value = "(select t.name  from  tc_system_user t where  t.id=create_by_id)")
	private String createName;

	public SystemLog() {
	}

	
	public String getCreateName() {
		return createName;
	}

	public void setCreateName(String createName) {
		this.createName = createName;
	}

	public String getEntityId() {
		return entityId;
	}

	public void setEntityId(String entityId) {
		this.entityId = entityId;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

}
