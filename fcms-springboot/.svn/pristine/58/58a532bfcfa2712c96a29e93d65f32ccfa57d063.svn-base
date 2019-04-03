package com.yhlt.showcase.survey.service;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.survey.dao.SurveyPaperDao;
import com.yhlt.showcase.survey.dao.SurveyRecordTotalMBDAO;
import com.yhlt.showcase.survey.dto.SurveyPaperStatusDto;
import com.yhlt.showcase.survey.entity.SurveyPaperEntity;

/**
 * 问卷管理
 * 
 * @author stone
 * 
 */
@Component
@Transactional
@BusinessLog(service = "问卷管理")
@DataPermission
public class SurveyPaperService extends BaseService<SurveyPaperEntity, SurveyPaperDao>{
	@Autowired
	private SurveyRecordTotalMBDAO surveyRecordTotalMBDAO;
	
	public List<SurveyPaperStatusDto>  findPaperPager(Map<String, Object> searchParams){
		return surveyRecordTotalMBDAO.findPaperPager(searchParams);
	}
}
