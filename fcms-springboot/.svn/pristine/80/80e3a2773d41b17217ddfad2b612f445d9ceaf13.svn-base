package com.yhlt.showcase.blockchain.command;

import com.alibaba.fastjson.JSONObject;
import com.yhlt.showcase.blockchain.model.Block;
import com.yhlt.showcase.blockchain.utils.ConvertUtil;

/**
 * 和区块相关的命令
 * @author stone
 * @date 2018年3月6日 下午2:43:40
 */
public class BlockCommand extends BaseCommand{

	public BlockCommand(String ip, String port, String login, String password){
		try {
			initialize(ip, port, login, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * Returns best block hash
	 * @return The block hash hex
	 * @throws Exception
	 */
	public String showBestBlockHash() throws Exception{
		JSONObject resultObj=exec(CommandEnum.SHOWBESTBLOCKHASH);
		return ConvertUtil.getResult(resultObj, String.class);
	}
	/**
	 * 显示区块信息
	 * @param blockHash  Block hash 或者高度
	 * @return
	 * @throws Exception
	 */
	public Block showBlock(String blockHash) throws Exception{
		JSONObject resultObj= exec(CommandEnum.SHOWBLOCK,blockHash,1);
		return ConvertUtil.getResult(resultObj, Block.class);
	}
	/**
	 * Return block count of the chain.
	 * @return
	 * @throws Exception
	 */
	public long showBlockCount() throws Exception{
		JSONObject resultObj=exec(CommandEnum.SHOWBLOCKCOUNT);
		return ConvertUtil.getResult(resultObj, Long.class);
	}
	/**
	 * Return specified block index hash
	 * @param index The block index
	 * @return
	 * @throws Exception
	 */
	public String showBlockHash(long index) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SHOWBLOCKHASH,index);
		return ConvertUtil.getResult(resultObj, String.class);
	}
}
