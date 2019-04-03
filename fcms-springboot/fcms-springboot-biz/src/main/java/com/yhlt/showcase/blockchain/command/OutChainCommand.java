package com.yhlt.showcase.blockchain.command;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.yhlt.showcase.blockchain.utils.ConvertUtil;

/**
 * 脱链相关命令
 * @author stone
 * @date 2018年3月12日 下午2:48:24
 */
public class OutChainCommand extends BaseCommand{

	public OutChainCommand(String ip, String port, String login, String password){
		try {
			initialize(ip, port, login, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 创建缓存码
	 * @return
	 * @throws Exception
	 */
	public String setupCache() throws Exception{
		JSONObject resultObj=exec(CommandEnum.SETUPCACHE);
		return ConvertUtil.getResult(resultObj, String.class);
	}
	/**
	 * 写入缓存
	 * @param cache
	 * @param hex
	 * @return 文件大小
	 * @throws Exception
	 */
	public long addCache(String cache,String hex) throws Exception{
		JSONObject resultObj=exec(CommandEnum.ADDCACHE, cache,hex);
		return ConvertUtil.getResult(resultObj, Long.class);
	}
	/**
	 * 以脱链的形式写入数据模块
	 * @param dataModName
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public String sendItem(String dataModName,String key,String cache) throws Exception{
		JSONObject cacheObject=new JSONObject();
		cacheObject.put("cache", cache);
		JSONObject resultObj=exec(CommandEnum.SENDITEM, dataModName,key,cacheObject,"outchain");
		return ConvertUtil.getResult(resultObj, String.class);
	}
	/**
	 * 以脱链的形式写入数据模块
	 * @param dataModName
	 * @param keys
	 * @param cache
	 * @return
	 * @throws Exception
	 */
	public String sendItem(String dataModName,List<String> keys,String cache) throws Exception{
		JSONObject cacheObject=new JSONObject();
		cacheObject.put("cache", cache);
		JSONObject resultObj=exec(CommandEnum.SENDITEM, dataModName,keys,cacheObject,"outchain");
		return ConvertUtil.getResult(resultObj, String.class);
	}
}
