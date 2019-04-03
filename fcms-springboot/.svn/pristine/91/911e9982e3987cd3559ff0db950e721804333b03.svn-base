package com.yhlt.showcase.blockchain.command;

import com.alibaba.fastjson.JSONObject;
import com.yhlt.showcase.blockchain.utils.ValidateUtil;

/**
 * 和公钥私钥相关的命令
 * @author stone
 * @date 2018年3月4日 下午3:55:08
 */
public class KeyCommand extends BaseCommand{

	public KeyCommand(String ip, String port, String login, String password){
		try {
			initialize(ip, port, login, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 导入私钥
	 * @param privateKey
	 * @throws Exception
	 */
	public void importPrivateKey(String privateKey) throws Exception{
		exec(CommandEnum.IMPORTPRIVKEY, privateKey);
	}
	public String showPrivateKey(String address) throws Exception{
		JSONObject resultObj=exec(CommandEnum.DUMPPRIVKEY, address);
		if(!ValidateUtil.validateJSONObject(resultObj)){
			return "";
		}
		return resultObj.getString("result");
	}
}
