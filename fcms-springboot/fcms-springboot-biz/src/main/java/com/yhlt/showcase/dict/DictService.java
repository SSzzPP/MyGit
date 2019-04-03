package com.yhlt.showcase.dict;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;

/**
 * 数据字典
 * 
 * @author lls
 * 
 */
@Component
@Transactional
@BusinessLog(service = "字典信息管理")
@DataPermission
@CacheConfig(cacheNames = "dicts")
public class DictService extends BaseService<DictEntity, DictDao> {

	@Cacheable(key = "#type+'_'+#value")
	public DictEntity findDict(String type, String value) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_type", type);
		searchParams.put("EQ_value", value);
		return super.findOneByParams(searchParams);
	}

	@Cacheable(key = "#type+'_'+#name")
	public DictEntity findDictByTypeAndName(String type, String name) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_type", type);
		searchParams.put("EQ_name", name);
		return super.findOneByParams(searchParams);
	}

	@Cacheable(key = "#type")
	public List<DictEntity> findByType(String type, Sort sort) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_type", type);
		return super.findByParams(searchParams, sort);
	}

	/**
	 * 不缓存的
	 * 
	 * @param type
	 * @param sort
	 * @return
	 */
	public List<DictEntity> findByTypeNoCache(String type, Sort sort) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_type", type);
		return super.findByParams(searchParams, sort);
	}

	// 不带缓存(根据type和name)
	public DictEntity findDictNoCache(String type, String name) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_type", type);
		searchParams.put("EQ_name", name);
		return super.findOneByParams(searchParams);
	}

}
