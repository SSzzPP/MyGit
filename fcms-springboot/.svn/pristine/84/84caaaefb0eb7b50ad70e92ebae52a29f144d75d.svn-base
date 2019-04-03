package com.yhlt.showcase.survey.entity;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.yhlt.showcase.base.entity.BaseEntity;


/**
 * 问卷 - 试题 信息
 * 
 * @author stone
 * 
 */
@Entity
@Table(name = "tm_fcms_survey_paper_question")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class SurveyPaperQuestionEntity extends BaseEntity<Long>{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8736545127684594726L;
	/*
	 * 试卷
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "paper_id")
	@Fetch(FetchMode.JOIN)
	private SurveyPaperEntity surveyPaperEntity;
	/*
	 * 试卷
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "question_id")
	@Fetch(FetchMode.JOIN)
	private SurveyQuestionEntity surveyQuestionEntity;
	public SurveyPaperEntity getSurveyPaperEntity() {
		return surveyPaperEntity;
	}
	public void setSurveyPaperEntity(SurveyPaperEntity surveyPaperEntity) {
		this.surveyPaperEntity = surveyPaperEntity;
	}
	public SurveyQuestionEntity getSurveyQuestionEntity() {
		return surveyQuestionEntity;
	}
	public void setSurveyQuestionEntity(SurveyQuestionEntity surveyQuestionEntity) {
		this.surveyQuestionEntity = surveyQuestionEntity;
	}
	

	

}
