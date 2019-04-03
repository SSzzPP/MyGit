package com.yhlt.showcase.survey.dto;

import java.util.Date;

import javax.persistence.Column;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class SurveyPaperStatusDto{
	/**
	 * 
	 */
	private int id;
	@Column(insertable = true, updatable = false)
	private String uuid;
	// 考试标题
	private String title;
	// 备注信息
	private String remark;
	// 开始时间
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date startDate;
	// 结束时间
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+08:00")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	// 状态0未发布，1已发布
	private int status;
	/**
	 * 是否是考试问卷
	 */
	private Integer isExam;
	/**
	 * 问卷阈值 
	 */
	private String threshold;
	/**
	 * 总分
	 */
	private int total;
	
	/**
	 * 有数据且为1时是完成
	 */
	private int finishStatus;
	
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Integer getIsExam() {
		return isExam;
	}
	public void setIsExam(Integer isExam) {
		this.isExam = isExam;
	}
	public String getThreshold() {
		return threshold;
	}
	public void setThreshold(String threshold) {
		this.threshold = threshold;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getFinishStatus() {
		return finishStatus;
	}
	public void setFinishStatus(int finishStatus) {
		this.finishStatus = finishStatus;
	}
	
}
