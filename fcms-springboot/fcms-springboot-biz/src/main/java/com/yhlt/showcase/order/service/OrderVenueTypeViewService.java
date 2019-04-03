package com.yhlt.showcase.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

import javax.transaction.Transactional;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.order.entity.OrderVenueTypeViewEntity;
import com.yhlt.showcase.order.dao.OrderLastMBDAO;
import com.yhlt.showcase.order.dao.OrderVenueTypeViewDao;

/**
 * @Description: 上周场馆预约情况 service
 * @author shiguoqin
 * @date 2018-09-06 14:53
 */
@Component
@Transactional
@BusinessLog(service = "上周场馆预约情况")
@DataPermission
public class OrderVenueTypeViewService extends BaseService<OrderVenueTypeViewEntity, OrderVenueTypeViewDao> {
	@Autowired
	private OrderLastMBDAO orderLastMBDAO;
	
	public List<Long> findLastOrder(Long userId){
		return orderLastMBDAO.findLastOrder(userId);
	};
}

