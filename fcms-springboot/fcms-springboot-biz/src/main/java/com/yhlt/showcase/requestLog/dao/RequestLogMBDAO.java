package com.yhlt.showcase.requestLog.dao;

import java.util.Map;

import com.yhlt.showcase.base.repository.MyBatisRepository;

@MyBatisRepository
public interface RequestLogMBDAO {
	public void saveRequestLogException(Map<String, Object> result);
}
