package com.yhlt.showcase.blockchain.command;

import com.alibaba.fastjson.JSONObject;
import com.yhlt.showcase.blockchain.utils.ConvertUtil;

/**
 *
 * @author stone
 * @date 2018年3月4日 下午4:02:58
 */
public class SellCommand extends BaseCommand {
	public SellCommand(String ip, String port, String login, String password) {
		try {
			initialize(ip, port, login, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 发行数字资产
	 * @param address    地址
	 * @param assetName  资产名称
	 * @param open       是否追加
	 * @param qty        资产数量
	 * @param unit       最小单位
	 * @return
	 * @throws Exception
	 */
	public String sell(String address,String assetName,boolean open,double qty,double unit) throws Exception{
		JSONObject assetConfigs=new JSONObject();
		assetConfigs.put("name", assetName);
		assetConfigs.put("open", open);
		JSONObject resultObj=exec(CommandEnum.SELL,address,assetConfigs,qty,unit);
		return ConvertUtil.getResult(resultObj, String.class);
	}
	/**
	 * 追加资产
	 * @param address  地址
	 * @param assetId  sell txid, asset reference, asset name
	 * @param qty      数量
	 * @return
	 * @throws Exception
	 */
	public String sellAsset(String address,String assetId,double qty) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SELLASSET,address,assetId,qty);
		return ConvertUtil.getResult(resultObj, String.class);
	}
}
