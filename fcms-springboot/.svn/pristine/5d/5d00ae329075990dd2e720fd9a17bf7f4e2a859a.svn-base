package com.yhlt.showcase.system.entity;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * 登录日志表-记录用户访问信息
 * 
 * @author hubaojie
 * 
 */
@Entity
@Table(name = "tc_system_login_log")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class LoginLogEntity extends BaseEntity<Long> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
//	@ManyToOne(fetch = FetchType.EAGER)
//	@JoinColumn(name = "createById", insertable = false, updatable = false)
//	private UserEntity userInfo;
	// ip地址
	private String ipAddress;
	// 操作系统名称
	private String osName;
	// 版本号
	private String osVersion;
	// 客户端操作系统位数
	private String osArch;
	// 客户端uuid
	private String osUuid;
	// 客户端电脑名称
	private String remoteHost;
	// 客户端浏览器的版本号、类型 
	private String userAgent;
	
	@Formula(value = "(select t.name  from  tc_system_user t where  t.id=create_by_id)")
	private String createName;

	public LoginLogEntity() {
	}

	
	public String getCreateName() {
		return createName;
	}

	public void setCreateName(String createName) {
		this.createName = createName;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getOsName() {
		return osName;
	}

	public void setOsName(String osName) {
		this.osName = osName;
	}

	public String getOsVersion() {
		return osVersion;
	}

	public void setOsVersion(String osVersion) {
		this.osVersion = osVersion;
	}

	public String getOsArch() {
		return osArch;
	}

	public void setOsArch(String osArch) {
		this.osArch = osArch;
	}

	public String getRemoteHost() {
		return remoteHost;
	}

	public void setRemoteHost(String remoteHost) {
		this.remoteHost = remoteHost;
	}

	public String getUserAgent() {
		return userAgent;
	}

	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}


	public String getOsUuid() {
		return osUuid;
	}


	public void setOsUuid(String osUuid) {
		this.osUuid = osUuid;
	}

//	public UserEntity getUserInfo() {
//		return userInfo;
//	}
//
//	public void setUserInfo(UserEntity userInfo) {
//		this.userInfo = userInfo;
//	}

	
	
}
