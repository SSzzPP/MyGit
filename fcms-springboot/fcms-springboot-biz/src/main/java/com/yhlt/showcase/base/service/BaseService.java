package com.yhlt.showcase.base.service;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.validation.ValidatorFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;

import com.yhlt.showcase.base.dao.BaseDao;
import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.modules.DynamicSpecifications;
import com.yhlt.showcase.base.modules.SearchFilter;

public abstract class BaseService<T, DAO extends BaseDao<T>> {
	/**
	 * hibernate验证器
	 */
	@Autowired
	protected ValidatorFactory validator;

	@Autowired
	protected DAO dao;

	@SuppressWarnings("rawtypes")
	private Class clazz = null;

	@SuppressWarnings("rawtypes")
	public BaseService() {
		// 获取泛型class
		Type genType = getClass().getGenericSuperclass();
		Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
		clazz = (Class) params[0];
	}

	/**
	 * 保存对象
	 * 
	 * @param t
	 * @return
	 */
	@BusinessLog(operation = "保存")
	public T save(T t) {
		return dao.save(t);
	}

	/**
	 * 保存对象并且返回Map
	 * 
	 * @param t
	 * @return Map<String, Object> easyUI-jsonMap
	 */
	@BusinessLog(operation = "保存")
	public Map<String, Object> saveMap(T t) {
		t = dao.save(t);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		result.put("obj", t);
		return result;
	}

	/**
	 * 批量保存并且返回Map
	 * 
	 * @param list
	 * @return Map<String, Object> easyUI-jsonMap
	 */
	@BusinessLog(operation = "保存")
	public Map<String, Object> save(List<T> list) {
		list = (List<T>) dao.saveAll(list);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		result.put("obj", list);
		return result;
	}

	/**
	 * 根据ID删除
	 * 
	 * @param id
	 */
	@BusinessLog(operation = "删除")
	public void delete(long id) {
		dao.deleteById(id);
	}

	/**
	 * 根据实体进行删除
	 * 
	 * @param t
	 */
	@BusinessLog(operation = "删除")
	public void delete(T t) {
		dao.delete(t);
	}

	/**
	 * 根据实体进行删除
	 * 
	 * @param List
	 *            <T>
	 */
	@BusinessLog(operation = "删除")
	public void delete(List<T> t) {
		dao.deleteAll(t);
	}

	/**
	 * 根据ID查找
	 * 
	 * @param id
	 * @return T
	 */
	public T findOne(long id) {
		Optional<T> optional = dao.findById(id);
		T t = optional.isPresent() ? optional.get() : null;
		return t;
	}

	/**
	 * 根据ID查找
	 * 
	 * @param id
	 * @return T
	 */
	public Map<String, Object> findOneMap(long id) {
		Optional<T> optional = dao.findById(id);
		T t = optional.isPresent() ? optional.get() : null;
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		result.put("obj", t);
		return result;
	}

	/**
	 * 查找全部,禁止使用
	 * 
	 * @return List<T>
	 */
	@Deprecated
	public List<T> findAll() {
		return (List<T>) dao.findAll();
	}

	/**
	 * 数据规则引擎方法，禁止使用
	 * 
	 * @return
	 */
	@Deprecated
	public List<T> findAllForDataPermission(Map<String, Object> searchParams) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		@SuppressWarnings("unchecked")
		Specification<T> spec = DynamicSpecifications.bySearchFilter(filters.values(), clazz);
		return dao.findAll(spec, new PageRequest(0, 50)).getContent();
	}

	/**
	 * 按页面传来的查询条件查询用户. 没有分页参数
	 * 
	 * @param searchParams
	 * @return wj
	 */
	@SuppressWarnings("unchecked")
	@DataPermission
	public T findOneByParams(Map<String, Object> searchParams) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		Specification<T> spec = DynamicSpecifications.bySearchFilter(filters.values(), clazz);
		Optional<T> optional = dao.findOne(spec);
		T t = optional.isPresent() ? optional.get() : null;
		return t;
	}

	/**
	 * 按页面传来的查询条件查询用户. 没有分页参数
	 * 
	 * @param searchParams
	 * @param sort
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@DataPermission
	public List<T> findByParams(Map<String, Object> searchParams, Sort sort) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		Specification<T> spec = DynamicSpecifications.bySearchFilter(filters.values(), clazz);
		List<T> list = dao.findAll(spec, sort);
		return list;
	}

	/**
	 * 按页面传来的查询条件查询用户. 没有分页参数
	 * 
	 * @param searchParams
	 * @return wj
	 */
	@SuppressWarnings("unchecked")
	@DataPermission
	public List<T> findByParams(Map<String, Object> searchParams) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		Specification<T> spec = DynamicSpecifications.bySearchFilter(filters.values(), clazz);
		List<T> list = dao.findAll(spec);
		return list;
	}

	/**
	 * 按页面传来的查询条件查询用户. 有分页参数
	 * 
	 * @param searchParams
	 * @param pageRequest
	 * @return wj
	 */
	@SuppressWarnings("unchecked")
	@DataPermission
	public Page<T> findByParams(Map<String, Object> searchParams, PageRequest pageRequest) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		Specification<T> spec = DynamicSpecifications.bySearchFilter(filters.values(), clazz);
		Page<T> list = dao.findAll(spec, pageRequest);
		return list;
	}

	/**
	 * 按页面传来的查询条件查询用户. 有分页参数
	 * 
	 * @param searchParams
	 * @param pageRequest
	 * @return wj
	 */
	@SuppressWarnings("unchecked")
	@DataPermission
	public Map<String, Object> findByParamsMap(Map<String, Object> searchParams, PageRequest pageRequest) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		Specification<T> spec = DynamicSpecifications.bySearchFilter(filters.values(), clazz);
		Page<T> list = dao.findAll(spec, pageRequest);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("total", list.getTotalElements());
		result.put("rows", list.getContent());
		return result;
	}

	/**
	 * 按页面传来的查询条件查询用户. 有分页参数
	 * 
	 * @param searchParams
	 * @param pageRequest
	 * @return wj
	 */
	@SuppressWarnings("unchecked")
	@DataPermission
	public Map<String, Object> findByParamsMapFront(Map<String, Object> searchParams, PageRequest pageRequest) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		Specification<T> spec = DynamicSpecifications.bySearchFilter(filters.values(), clazz);
		Page<T> list = dao.findAll(spec, pageRequest);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("recordsTotal", list.getTotalElements());
		result.put("recordsFiltered", list.getTotalElements());
		result.put("data", list.getContent());

		// result.put("iTotalRecords", list.getTotalElements());
		// result.put("iTotalDisplayRecords", list.getTotalElements());
		// result.put("aaData", list.getContent());
		return result;
	}

	/**
	 * 根据条件做count统计
	 * 
	 * @param searchParams
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@DataPermission
	public long count(Map<String, Object> searchParams) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		Specification<T> spec = DynamicSpecifications.bySearchFilter(filters.values(), clazz);
		return dao.count(spec);
	}

	/**
	 * 根据uuid查找
	 * 
	 * @param uuid
	 * @return
	 */
	@DataPermission
	public T findOneByUuid(String uuid) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_uuid", uuid);
		return findOneByParams(searchParams);
	}

}
