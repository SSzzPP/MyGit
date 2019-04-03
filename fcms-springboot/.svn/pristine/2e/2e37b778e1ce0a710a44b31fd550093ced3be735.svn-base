package com.yhlt.showcase.blockchain.command;

import com.alibaba.fastjson.JSONObject;
import com.yhlt.showcase.blockchain.utils.ConvertUtil;

/**
 * 和fee相关的命令
 * @author stone
 * @date 2018年3月4日 下午8:39:56
 */
public class FeeCommand extends BaseCommand{

	public FeeCommand(String ip, String port, String login, String password){
		try {
			initialize(ip, port, login, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * settxfee
	 * @param amount
	 * @return
	 * @throws Exception
	 */
	public boolean setTxFee(double amount) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SETTXFEE, amount);
		return ConvertUtil.getResult(resultObj, Boolean.class);
	}
}
