package com.yhlt.showcase.survey.dao;

import java.util.List;
import java.util.Map;

import com.yhlt.showcase.base.repository.MyBatisRepository;
import com.yhlt.showcase.survey.dto.SurveyScoreDto;

@MyBatisRepository
public interface SurveyScoreTotalMBDAO {
	public List<SurveyScoreDto> findByParams(Map<String,Object> searchParams);
	//根据paperId和userId查分数
	public List<SurveyScoreDto> findByUserAndPaper(Map<String,Object> searchParams);
}
