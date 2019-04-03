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
@Table(name = "tm_fcms_survey_paper_user")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class SurveyPaperUserEntity extends BaseEntity<Long>{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8931771408721803746L;
	/*
	 * 试卷
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "paper_id")
	@Fetch(FetchMode.JOIN)
	private SurveyPaperEntity surveyPaperEntity;
	/*
	 * 用户
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	@Fetch(FetchMode.JOIN)
	private VenueUserEntity userEntity;
	//0未做完 1做完
	private int status=0;
	//分数
	private int score;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}

}
