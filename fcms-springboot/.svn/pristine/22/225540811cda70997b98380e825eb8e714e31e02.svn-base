package com.yhlt.showcase.blockchain.command;

import com.alibaba.fastjson.JSONObject;
import com.yhlt.showcase.blockchain.utils.ValidateUtil;

/**
 * 消息相关命令
 * @author stone
 * @date 2018年3月4日 下午3:46:29
 */
public class MessageCommand extends BaseCommand{

	public MessageCommand(String ip, String port, String login, String password){
		try {
			initialize(ip, port, login, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 消息签名
	 * @param addressOrPrivateKey
	 * @param message The message to setup a signature of.
	 * @return The signature of the message encoded in base 64
	 * @throws Exception
	 *
	 * @command signmessage
	 */
	public String signMessage(String addressOrPrivateKey,String message) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SIGNMESSAGE,addressOrPrivateKey, message);
		if(!ValidateUtil.validateJSONObject(resultObj)){
			return "";
		}
		return resultObj.getString("result");
	}
	/**
	 * 消息验证
	 * @param address
	 * @param signature
	 * @param message
	 * @return
	 * @throws Exception
	 */
	public boolean checkMessage(String address,String signature, String message) throws Exception{
		JSONObject resultObj=exec(CommandEnum.CHECKMESSAGE,address, signature,message);
		if(!ValidateUtil.validateJSONObject(resultObj)){
			return false;
		}
		return resultObj.getBooleanValue("result");
	}
}
