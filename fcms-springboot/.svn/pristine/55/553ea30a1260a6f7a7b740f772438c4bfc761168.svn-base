package com.yhlt.showcase.system.service;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.system.dao.BigDataVisitMBDAO;
import com.yhlt.showcase.system.dto.BigDataVisitDto;

@Component
@Transactional
@BusinessLog(service = "数据统计-访问量")
@DataPermission
public class BigDataVisitService {

	@Autowired
	private BigDataVisitMBDAO bigDataVisitMBDAO;

	/**
	 * 访问量
	 * 
	 * @author swy
	 */
	public List<BigDataVisitDto> findListbyParam(Map<String, Object> param) {
		return bigDataVisitMBDAO.findListbyParam(param);
	}

}
