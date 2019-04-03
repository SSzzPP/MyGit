package com.yhlt.showcase.survey.entity;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Formula;

import com.yhlt.showcase.base.entity.BaseEntity;
/**
 * 问卷问题
 * @author stone
 *
 */
@Entity
@Table(name = "tm_fcms_survey_question")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class SurveyQuestionEntity extends BaseEntity<Long>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4379216343869791939L;
	/**
	 *  
	 */
	@Column(insertable = true, updatable = false)
	private String uuid = UUID.randomUUID().toString();
	/**
	 * 0单选,1多选
	 */
	private Integer questionType;
	/**
	 * 题目
	 */
//	@Excel(name = "题干",orderNum="1" )
	@Size(min = 1, max = 1000, message = "名称长度限制1-1000位")
	private String title;
//	@Excel(name = "题型",orderNum="2" )
	@Transient
	private String questionTypeStr;

	/**
	 * 选项内容
	 */
//	@Excel(name = "选项",orderNum="2" )
	@Size(min = 1, max = 1000, message = "答案长度限制1-1000位")
	private String options;
	
	/**
	 * 选项个数
	 */
//	@Excel(name = "选项个数",orderNum="3" )
	private int optionsNums;
	/**
	 *	查询关键字
	 */
//	@Excel(name = "关键字",orderNum="4" )
	private String keyWords;
	
	/**
	 *	解析
	 */
//	@Excel(name = "解析",orderNum="5" )
	private String analysis;
	@Formula(value = "(select t.name from tc_system_user t  where t.id=create_by_id)")
	private String createUserName;
	/**
	 * 答案
	 */
	private String answer;
	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public Integer getQuestionType() {
		return questionType;
	}

	public void setQuestionType(Integer questionType) {
		this.questionType = questionType;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getOptions() {
		return options;
	}

	public void setOptions(String options) {
		this.options = options;
	}

	public int getOptionsNums() {
		return optionsNums;
	}

	public void setOptionsNums(int optionsNums) {
		this.optionsNums = optionsNums;
	}

	public String getKeyWords() {
		return keyWords;
	}

	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}

	public String getAnalysis() {
		return analysis;
	}

	public void setAnalysis(String analysis) {
		this.analysis = analysis;
	}
	public String getQuestionTypeStr() {
		if(this.questionType == null)
			return this.questionTypeStr;
		else if(this.questionType == 0)
			return "单选";
		else if(this.questionType == 1)
			return "多选";
		else
			return "-";
	}

	public void setQuestionTypeStr(String questionTypeStr) {
		this.questionTypeStr = questionTypeStr;
	}

	public String getCreateUserName() {
		return createUserName;
	}

	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
}
