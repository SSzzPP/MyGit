package com.yhlt.showcase.blockchain.utils;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSONObject;
/**
 * 验证工具类
 * @author stone
 * @date 2018年7月2日 下午5:15:05
 */
public class ValidateUtil {
	private final static Logger logger=Logger.getLogger(ValidateUtil.class);
	/**
	 * 验证obj
	 * @param obj
	 * @return
	 */
	public static boolean validateJSONObject(JSONObject obj) throws Exception{
		if(obj.containsKey("error")&&obj.get("error")!=null){
			logger.error(obj.get("error").toString());
			return false;
		}
		return true;
	}
	/**
	 * 验证TheClass是什么类型的
	 * @param obj
	 * @param TheClass
	 * @return
	 */
	public static boolean verifyInstance(Object obj, Class TheClass) {
		return TheClass.isInstance(obj);
	}
}
