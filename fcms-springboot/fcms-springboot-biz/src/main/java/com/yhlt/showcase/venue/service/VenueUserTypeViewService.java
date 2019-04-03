package com.yhlt.showcase.venue.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.venue.dao.VenueUserTypeViewDao;
import com.yhlt.showcase.venue.dao.VenueUserTypeViewMBDAO;
import com.yhlt.showcase.venue.dto.VenueUserTypeViewDto;
import com.yhlt.showcase.venue.entity.VenueUserTypeViewEntity;

@Component
@Transactional
@BusinessLog(service = "场馆人员视图")
@DataPermission
public class VenueUserTypeViewService extends BaseService<VenueUserTypeViewEntity, VenueUserTypeViewDao>{

	@Autowired
	private VenueUserTypeViewMBDAO venueUserTypeViewMBDAO;
	
	public List<VenueUserTypeViewDto> findTypeUser (List<Long> list) {
		return venueUserTypeViewMBDAO.findTypeUser(list);
	}
}
