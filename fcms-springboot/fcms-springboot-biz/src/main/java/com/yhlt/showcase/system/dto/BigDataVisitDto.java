package com.yhlt.showcase.system.dto;

import java.io.Serializable;

/**
 * 数据统计-访问量DTO
 * 
 * @author swy
 * 
 */
public class BigDataVisitDto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3195662154407787050L;
	
	/**
	 * 日期拼接字符串（年月日）
	 */
	private Long id;
	/**
	 * 日期（年-月-日）
	 */
	private String nowdate;
	/**
	 * 日
	 */
	private Long nowday;
	/**
	 * web访问量
	 */
	private Long webNum;
	/**
	 * 手机访问量
	 */
	private Long mobileNum;
	/**
	 * 总访问量
	 */
	private Long avgNum;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNowdate() {
		return nowdate;
	}
	public void setNowdate(String nowdate) {
		this.nowdate = nowdate;
	}
	public Long getNowday() {
		return nowday;
	}
	public void setNowday(Long nowday) {
		this.nowday = nowday;
	}
	public Long getWebNum() {
		return webNum;
	}
	public void setWebNum(Long webNum) {
		this.webNum = webNum;
	}
	public Long getMobileNum() {
		return mobileNum;
	}
	public void setMobileNum(Long mobileNum) {
		this.mobileNum = mobileNum;
	}
	public Long getAvgNum() {
		return avgNum;
	}
	public void setAvgNum(Long avgNum) {
		this.avgNum = avgNum;
	}

}
