package com.yhlt.showcase.survey.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.yhlt.showcase.base.entity.BaseEntity;

@Entity
@Table(name = "v_system_survey_user_total")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class SurveyUserTotalEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
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
	private int status = 0;
	@Formula(value = "(select t.name from tc_system_user t  where t.id=create_by_id)")
	private String createUserName;
	/**
	 * 总人数
	 */
	private Integer total;
	/**
	 * 实际参与人数
	 */
	private Integer actual;
	/**
	 * 问题个数
	 */
	private Integer questionSize;
	/**
	 * 是否是考卷
	 */
	private Integer isExam;

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Integer getActual() {
		return actual;
	}

	public void setActual(Integer actual) {
		this.actual = actual;
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

	public String getCreateUserName() {
		return createUserName;
	}

	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	}

	public Integer getQuestionSize() {
		return questionSize;
	}

	public void setQuestionSize(Integer questionSize) {
		this.questionSize = questionSize;
	}

	public Integer getIsExam() {
		return isExam;
	}

	public void setIsExam(Integer isExam) {
		this.isExam = isExam;
	}
}
