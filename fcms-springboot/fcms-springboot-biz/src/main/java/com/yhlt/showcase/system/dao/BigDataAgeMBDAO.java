package com.yhlt.showcase.system.dao;

import java.util.List;
import java.util.Map;

import com.yhlt.showcase.base.repository.MyBatisRepository;
import com.yhlt.showcase.system.dto.BigDataAgeDto;
/**
 * 数据统计-年龄mybatis dao
 * 
 * @author swy
 */
@MyBatisRepository
public interface BigDataAgeMBDAO {

	public List<BigDataAgeDto> findList();
}
