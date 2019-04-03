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
import com.yhlt.showcase.venue.entity.VenueUserEntity;

/**
 * 
 * @author stone
 * 
 */
@Entity
@Table(name = "tm_fcms_survey_record")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class SurveyRecordEntity extends BaseEntity<Long>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8229153927016029233L;
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
	@JoinColumn(name = "user_id")
	@Fetch(FetchMode.JOIN)
	private VenueUserEntity userEntity;
	/*
	 * 试卷
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "question_id")
	@Fetch(FetchMode.JOIN)
	private SurveyQuestionEntity surveyQuestionEntity;
	//用户答案
	private String userAnswer;
	public SurveyPaperEntity getSurveyPaperEntity() {
		return surveyPaperEntity;
	}
	public void setSurveyPaperEntity(SurveyPaperEntity surveyPaperEntity) {
		this.surveyPaperEntity = surveyPaperEntity;
	}
	public VenueUserEntity getUserEntity() {
		return userEntity;
	}
	public void setUserEntity(VenueUserEntity userEntity) {
		this.userEntity = userEntity;
	}
	public SurveyQuestionEntity getSurveyQuestionEntity() {
		return surveyQuestionEntity;
	}
	public void setSurveyQuestionEntity(SurveyQuestionEntity surveyQuestionEntity) {
		this.surveyQuestionEntity = surveyQuestionEntity;
	}
	public String getUserAnswer() {
		return userAnswer;
	}
	public void setUserAnswer(String userAnswer) {
		this.userAnswer = userAnswer;
	}
	
	

}
