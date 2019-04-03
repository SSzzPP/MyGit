package com.yhlt.showcase.base.utils;

import java.util.Set;

import com.yhlt.showcase.base.sensitive.SensitivewordFilter;

public class SensitiveWordsUtil {

	/**
	 * 查询指定内容是否有敏感词
	 * @param txt  检测内容
	 */
	public static Boolean sensitiveFlag(String txt) {
		SensitivewordFilter filter = new SensitivewordFilter();
		Set<String> set = filter.getSensitiveWord(txt, 1);
		return set.size()>0;
	}
}
