package com.yhlt.showcase.blockchain.command;

import com.alibaba.fastjson.JSONObject;
import com.yhlt.showcase.blockchain.utils.ValidateUtil;

/**
 * 钱包相关命令
 * @author stone
 * @date 2018年3月2日 下午5:00:03
 */
public class WalletCommand extends BaseCommand{

	public WalletCommand(String ip, String port, String login, String password){
		try {
			initialize(ip, port, login, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 钱包备份
	 * @param absolutPath 导出位置（绝对路径）
	 * @throws Exception
	 * @command backupwallet
	 */
	public void backupWallet(String absolutPath) throws Exception{
		JSONObject resultObj=exec(CommandEnum.BACKUPWALLET, absolutPath);
		ValidateUtil.validateJSONObject(resultObj);
	}
}
