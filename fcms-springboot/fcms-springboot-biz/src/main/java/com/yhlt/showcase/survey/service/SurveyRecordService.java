package com.yhlt.showcase.survey.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.survey.dao.SurveyRecordDao;
import com.yhlt.showcase.survey.entity.SurveyRecordEntity;

/**
 * 问卷记录
 * 
 * @author stone
 * 
 */
@Component
@Transactional
@BusinessLog(service = "问卷管理")
@DataPermission
public class SurveyRecordService extends BaseService<SurveyRecordEntity, SurveyRecordDao>{
	/**
	 * 
	 * @param paperId
	 * @return
	 */
	public List<SurveyRecordEntity> findAllByPaperId(Long paperId){
		Map<String, Object> searchParams=new HashMap<String, Object>();
		searchParams.put("EQ_surveyPaperEntity.id", paperId);
		return this.findByParams(searchParams);
	}
	/**
	 * 
	 * @param questionId
	 * @return
	 */
	public List<SurveyRecordEntity> findAllByQuestionId(Long questionId){
		Map<String, Object> searchParams=new HashMap<String, Object>();
		searchParams.put("EQ_surveyQuestionEntity.id", questionId);
		return this.findByParams(searchParams);
	}
}
