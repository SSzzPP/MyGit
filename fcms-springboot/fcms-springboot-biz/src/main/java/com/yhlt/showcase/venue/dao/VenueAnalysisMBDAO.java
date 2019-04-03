package com.yhlt.showcase.venue.dao;

import java.util.List;
import java.util.Map;

import com.yhlt.showcase.base.repository.MyBatisRepository;
import com.yhlt.showcase.venue.dto.VenueAnalysisDto;

/**
 * 场馆使用分析
 * 
 * @author linannan
 *
 */
@MyBatisRepository
public interface VenueAnalysisMBDAO {

	public List<VenueAnalysisDto> findVenueAnalysisData(Map<String, Object> param);
}
