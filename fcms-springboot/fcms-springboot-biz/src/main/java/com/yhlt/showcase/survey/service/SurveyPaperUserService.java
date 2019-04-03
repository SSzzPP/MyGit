package com.yhlt.showcase.survey.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.survey.dao.SurveyPaperUserDao;
import com.yhlt.showcase.survey.entity.SurveyPaperUserEntity;

/**
 * 问卷问题
 * 
 * @author stone
 * 
 */
@Component
@Transactional
@BusinessLog(service = "问卷用户")
@DataPermission
public class SurveyPaperUserService extends
BaseService<SurveyPaperUserEntity, SurveyPaperUserDao>{
	/**
	 * 
	 * @param paperId
	 * @return
	 */
	public List<SurveyPaperUserEntity> findAllByPaperId(Long paperId){
		Map<String, Object> searchParams=new HashMap<String, Object>();
		searchParams.put("EQ_surveyPaperEntity.id", paperId);
		return this.findByParams(searchParams);
	}
}
