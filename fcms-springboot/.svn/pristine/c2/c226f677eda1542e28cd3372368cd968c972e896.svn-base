package com.yhlt.showcase.blockchain.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.yhlt.showcase.blockchain.model.dto.asset.BaseBalanceAsset;

/**
 * 转换工具类
 * @author stone
 * @date 2018年3月4日 下午5:04:02
 */
public class ConvertUtil {
	/**
	 * 获得resultObj中的result
	 * @param <T>
	 * @param resultObj
	 * @return
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static <T> T getResult(JSONObject resultObj,Class<T> arg) throws Exception{
		if(!ValidateUtil.validateJSONObject(resultObj)){
			return null;
		}
		if("String".equals(arg.getSimpleName())){
			return (T)resultObj.getString("result");
		}
		return JSON.parseObject(resultObj.get("result").toString(), arg);
	}
	/**
	 * 获得resultObj中的result (集合类型)
	 * @param resultObj
	 * @param arg
	 * @return
	 * @throws Exception
	 */
	public static <T> List<T> getArrayResult(JSONObject resultObj,Class<T> arg) throws Exception{
		if(!ValidateUtil.validateJSONObject(resultObj)){
			return new ArrayList<T>();
		}
		return JSON.parseArray(resultObj.get("result").toString(), arg);
	}
	/**
	 * assets转成map类型、jsonobject类型
	 * @param assets
	 * @return
	 * @throws Exception
	 */
	public static Map<String, Double> baseBalanceAsset2Map(List<BaseBalanceAsset> assets) throws Exception{
		Map<String, Double> assetsMap=new HashMap<String, Double>();
		for (BaseBalanceAsset baseBalanceAsset : assets) {
			baseBalanceAsset.validate();
			assetsMap.put(baseBalanceAsset.getName(), baseBalanceAsset.getQty());
		}
		return assetsMap;
	}
}
