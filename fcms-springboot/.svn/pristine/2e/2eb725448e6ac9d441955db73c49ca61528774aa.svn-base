package com.yhlt.showcase.system.service;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.system.dao.BigDataAgeMBDAO;
import com.yhlt.showcase.system.dto.BigDataAgeDto;

@Component
@Transactional
@BusinessLog(service = "数据统计-年龄")
@DataPermission
public class BigDataAgeService {

	@Autowired
	private BigDataAgeMBDAO bigDataAgeMBDAO;

	/**
	 * 健身人群年龄段分布统计
	 * 
	 * @author swy
	 */
	public List<BigDataAgeDto> findList() {
		return bigDataAgeMBDAO.findList();
	}

}
