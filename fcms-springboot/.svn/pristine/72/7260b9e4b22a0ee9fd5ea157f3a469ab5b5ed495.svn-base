package com.yhlt.showcase.venue.service;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.venue.dao.VenueAnalysisMBDAO;
import com.yhlt.showcase.venue.dao.VenueInfoDao;
import com.yhlt.showcase.venue.dto.VenueAnalysisDto;
import com.yhlt.showcase.venue.entity.VenueInfoEntity;

/**
 * @Description: 场馆管理 service
 * @author linannan
 * @date 2018-07-20 11:09
 */
@Component
@Transactional
@BusinessLog(service = "场馆管理")
@DataPermission
public class VenueInfoService extends BaseService<VenueInfoEntity, VenueInfoDao> {
	@Autowired
	private VenueAnalysisMBDAO analysisMBDAO;
	
	// 场馆使用分析
	public List<VenueAnalysisDto> findVenueAnalysisData(Map<String, Object> params) {
		return analysisMBDAO.findVenueAnalysisData(params);
	}

}
