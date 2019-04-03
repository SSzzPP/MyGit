package com.yhlt.showcase.survey.dao;

import java.util.List;
import java.util.Map;

import com.yhlt.showcase.base.repository.MyBatisRepository;
import com.yhlt.showcase.survey.dto.SurveyPaperStatusDto;
import com.yhlt.showcase.survey.dto.SurveyRecordTotalDto;

@MyBatisRepository
public interface SurveyRecordTotalMBDAO {
	public List<SurveyRecordTotalDto> findByParams(Map<String,Object> searchParams);
	
	//分页查询
	public List<SurveyPaperStatusDto> findPaperPager(Map<String, Object> searchParams);
}
