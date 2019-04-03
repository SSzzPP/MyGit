/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.yhlt.showcase.base.modules;

import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;

import com.google.common.collect.Maps;

public class SearchFilter {

	public enum Operator {
		EQ, LIKE, GT, LT, GTE, LTE, NEQ, IN, NOTIN, ISNULL, ISNOTNULL
	}

	public String fieldName;
	public Object value;
	public Operator operator;
	public String conditionGroup;

	public SearchFilter(String fieldName, Operator operator, Object value) {
		this.fieldName = fieldName;
		this.value = value;
		this.operator = operator;
	}

	/**
	 * 
	 * @param fieldName
	 *            字段名称
	 * @param value
	 *            字段值
	 * @param operator
	 *            EQ|LIKE|GT|LT|GTE|LTE|NEQ|IN
	 * @param conditionGroup
	 *            条件分组KEY 用来做混合条件查询(A and B) or (A and C)
	 */
	public SearchFilter(String fieldName, Operator operator, Object value,
			String conditionGroup) {
		this.fieldName = fieldName;
		this.value = value;
		this.operator = operator;
		this.conditionGroup = conditionGroup;
	}

	/**
	 * searchParams中key的格式为OPERATOR_FIELDNAME
	 */
	@SuppressWarnings("deprecation")
	public static Map<String, SearchFilter> parse(
			Map<String, Object> searchParams) {
		Map<String, SearchFilter> filters = Maps.newHashMap();

		for (Entry<String, Object> entry : searchParams.entrySet()) {
			// 过滤掉空值
			String key = entry.getKey();
			Object value = entry.getValue();
			if (StringUtils.isBlank(ObjectUtils.toString(value))) {
				continue;
			}

			// 拆分operator与filedAttribute
			String[] names = StringUtils.split(key, "_");
			if (names.length != 2  && names.length != 3) {
				throw new IllegalArgumentException(key
						+ " is not a valid search filter name");
			}
			Operator operator = Operator.valueOf(names[0]);
			String filedName = names[1];
			String conditionGroup = null;
			if (names.length == 3)
				conditionGroup = names[2];
			// 创建searchFilter
			SearchFilter filter = new SearchFilter(filedName, operator, value,
					conditionGroup);
			filters.put(key, filter);
		}

		return filters;
	}
}
