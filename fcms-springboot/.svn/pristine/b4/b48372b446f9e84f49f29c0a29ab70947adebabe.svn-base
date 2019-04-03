/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.yhlt.showcase.base.util;

import java.util.Enumeration;
import java.util.Map;
import java.util.TreeMap;
import javax.servlet.ServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;

/**
 * Http与Servlet工具类.
 * 
 * @author calvin
 */
public class Servlets {

	/**
	 * 取得带相同前缀的Request Parameters, copy from spring WebUtils.
	 * 
	 * 返回的结果的Parameter名已去除前缀.
	 */
	public static Map<String, Object> getParametersStartingWith(
			ServletRequest request, String prefix) {
		return getParametersStartingWith(request, prefix, false);
	}

	/**
	 * * 取得带相同前缀的Request Parameters, copy from spring WebUtils.
	 * 
	 * 返回的结果的Parameter名已去除前缀.
	 * 
	 * @param request
	 * @param prefix
	 * @param convertLong
	 *            需要转换long型,values[0]==0的数据不会处理
	 * @return
	 */
	public static Map<String, Object> getParametersStartingWith(
			ServletRequest request, String prefix, boolean convertLong) {
		Validate.notNull(request, "Request must not be null");
		Enumeration<?> paramNames = request.getParameterNames();
		Map<String, Object> params = new TreeMap<String, Object>();
		if (prefix == null) {
			prefix = "";
		}
		while ((paramNames != null) && paramNames.hasMoreElements()) {
			String paramName = (String) paramNames.nextElement();
			if ("".equals(prefix) || paramName.startsWith(prefix)) {
				String unprefixed = paramName.substring(prefix.length());
				String[] values = request.getParameterValues(paramName);
				if ((values == null) || (values.length == 0)) {
					// Do nothing, no values found at all.
				} else if (values.length > 1) {
					params.put(unprefixed, values);
				} else {
					if (StringUtils.isNotBlank(values[0])) {
						// 需要数值转换
						// if (convertLong) {
						// try {
						// long longValue = Long.parseLong(values[0]);
						// params.put(unprefixed, longValue);
						// } catch (Exception e) {
						// params.put(unprefixed, values[0]);
						// }
						// } else {
						params.put(unprefixed, values[0]);
						// }
					}
				}
			}
		}
		return params;
	}

}
