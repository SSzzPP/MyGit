package com.yhlt.showcase.front.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * 公告-包信息
 * 
 * @author swy
 * @date 2018年11月23日
 */
@Entity
@Table(name = "tc_front_total")
public class FrontTotalEntity extends BaseEntity<Long> {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4939252603503544222L;
	private Date requestTime;
	private String requestIp;
	private String requestName;
	private Long ipv;
	
	public Long getIpv() {
		return ipv;
	}
	public void setIpv(Long ipv) {
		this.ipv = ipv;
	}
	public Date getRequestTime() {
		return requestTime;
	}
	public void setRequestTime(Date requestTime) {
		this.requestTime = requestTime;
	}
	public String getRequestIp() {
		return requestIp;
	}
	public void setRequestIp(String requestIp) {
		this.requestIp = requestIp;
	}
	public String getRequestName() {
		return requestName;
	}
	public void setRequestName(String requestName) {
		this.requestName = requestName;
	}
	
	

}