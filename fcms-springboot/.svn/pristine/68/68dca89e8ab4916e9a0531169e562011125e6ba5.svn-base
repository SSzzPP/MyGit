package com.yhlt.showcase.base.security;

import java.io.Serializable;
import java.util.Date;
import java.util.Properties;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 当前登录用户上下文信息
 * 
 * @author xunxun
 * @date 2015-1-7 上午10:59:58
 */
public class LoginContext implements Serializable {
	private static final long serialVersionUID = -8215311021159364931L;
	/**
	 * 用户id
	 */
	private Long userId;
	/**
	 * 用户名
	 */
	private String userName;
	/**
	 * 访问IP地址
	 */
	private String ip;
	/**
	 * 其他属性信息
	 */
	private Properties properties = new Properties();
	/**
	 * 客户端访问语言
	 */
	private String language;
	/**
	 * 密碼
	 */
	private String password;
	/**
	 * 可逆密碼
	 */
	private String reversiblePassword;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
	private Date createTime;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
	private Date lastAccessedTime;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Properties getProperties() {
		return properties;
	}

	public void setProperties(Properties properties) {
		this.properties = properties;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getReversiblePassword() {
		return reversiblePassword;
	}

	public void setReversiblePassword(String reversiblePassword) {
		this.reversiblePassword = reversiblePassword;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getLastAccessedTime() {
		return lastAccessedTime;
	}

	public void setLastAccessedTime(Date lastAccessedTime) {
		this.lastAccessedTime = lastAccessedTime;
	}

}
