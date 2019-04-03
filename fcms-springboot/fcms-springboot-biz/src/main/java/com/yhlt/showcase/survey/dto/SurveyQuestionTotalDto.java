package com.yhlt.showcase.survey.dto;

import java.io.Serializable;
import java.util.List;

import com.yhlt.showcase.survey.entity.SurveyQuestionEntity;
import com.yhlt.showcase.survey.entity.SurveyRecordEntity;

public class SurveyQuestionTotalDto implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8232384774303008800L;
	private SurveyQuestionEntity surveyQuestionEntity;
	private List<SurveyRecordEntity> surveyRecordEntities;
	private Integer optionsNums;
	public SurveyQuestionEntity getSurveyQuestionEntity() {
		return surveyQuestionEntity;
	}
	public void setSurveyQuestionEntity(SurveyQuestionEntity surveyQuestionEntity) {
		this.surveyQuestionEntity = surveyQuestionEntity;
	}
	public List<SurveyRecordEntity> getSurveyRecordEntities() {
		return surveyRecordEntities;
	}
	public void setSurveyRecordEntities(
			List<SurveyRecordEntity> surveyRecordEntities) {
		this.surveyRecordEntities = surveyRecordEntities;
	}
	public Integer getOptionsNums() {
		return optionsNums;
	}
	public void setOptionsNums(Integer optionsNums) {
		this.optionsNums = optionsNums;
	}
	

}
