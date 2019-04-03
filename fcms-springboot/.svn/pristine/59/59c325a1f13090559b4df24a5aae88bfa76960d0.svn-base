package com.yhlt.showcase.survey.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.survey.dao.SurveyPaperQuestionDao;
import com.yhlt.showcase.survey.entity.SurveyPaperQuestionEntity;

/**
 * 问卷问题
 * 
 * @author stone
 * 
 */
@Component
@Transactional
@BusinessLog(service = "问卷问题")
@DataPermission
public class SurveyPaperQuestionService extends BaseService<SurveyPaperQuestionEntity, SurveyPaperQuestionDao>{
	public int getQuestionQuantity(Long paperId){
		Map<String,Object> searchParams=new HashMap<String,Object>();
		searchParams.put("EQ_surveyPaperEntity.id", paperId);
		List<SurveyPaperQuestionEntity> list=this.findByParams(searchParams);
		if(list==null){
			return 0;
		}
		return list.size();
	}
	/**
	 * 根据paperId查中间表的数据
	 * @param paperId
	 * @return
	 */
	public List<SurveyPaperQuestionEntity> findAllByPaperId(Long paperId){
		Map<String, Object> searchParams=new HashMap<String, Object>();
		searchParams.put("EQ_surveyPaperEntity.id", paperId);
		return this.findByParams(searchParams);
	}
	/**
	 * 根据questionId查中间表数据
	 * @param questionId
	 * @return
	 */
	public List<SurveyPaperQuestionEntity> findAllByQuestionId(Long questionId){
		Map<String, Object> searchParams=new HashMap<String, Object>();
		searchParams.put("EQ_surveyQuestionEntity.id", questionId);
		return this.findByParams(searchParams);
	}
	/**
	 * 判断问卷是否包含问题
	 * @param paperId
	 * @return
	 */
	public boolean isExists(Long paperId){
		Map<String, Object> searchParams=new HashMap<String, Object>();
		searchParams.put("EQ_surveyPaperEntity.id", paperId);
		return this.count(searchParams)==0L?false:true;
	}
}
