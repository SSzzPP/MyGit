package com.yhlt.showcase.survey.entity;

import java.util.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Formula;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * 调查问卷
 * 
 * @author stone
 * 
 */
@Entity
@Table(name = "tm_fcms_survey_paper")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class SurveyPaperEntity extends BaseEntity<Long>{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5578627513079621833L;
	@Column(insertable = true, updatable = false)
	private String uuid = UUID.randomUUID().toString();
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
	private int status = 0;
	@Transient
	private String statusWrapper;
	@Formula(value = "(select t.name from tc_system_user t  where t.id=create_by_id)")
	private String createUserName;
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
	private int total=0;
	
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
	public String getStatusWrapper() {
		if (this.status == 0)
			return "草稿";
		else
			return "已发布";
	}

	public void setStatusWrapper(String statusWrapper) {
		this.statusWrapper = statusWrapper;
	}
	public String getCreateUserName() {
		return createUserName;
	}
	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
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
	
}
