package com.yhlt.showcase.blockchain.command;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.yhlt.showcase.blockchain.model.dto.balance.BalanceAsset;
import com.yhlt.showcase.blockchain.model.dto.transaction.WalletTransactionDetail;
import com.yhlt.showcase.blockchain.utils.ConvertUtil;
/**
 *
 * @author stone
 * @date 2018年3月28日 下午8:44:15
 */
public class AssetCommand extends BaseCommand{

	public AssetCommand(String ip, String port, String login, String password){
		try {
			initialize(ip, port, login, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 订阅资产 只有订阅资产才能查询资产的交易情况
	 * @param assetName
	 * @throws Exception
	 */
	public void order(String assetName) throws Exception{
		exec(CommandEnum.ORDER,assetName);
	}
	/**
	 * 查询资产的交易记录（需要先订阅）
	 * @param assetName
	 * @param count         Default=10 The number of deals to display
	 * @param skip
	 * @param localOrdering Default=false If true, deals appear in the order they were processed by the wallet,
                                          if false - in the order they appear in chain
	 * @return
	 * @throws Exception
	 */
	public List<WalletTransactionDetail> showAssetDeals(String assetName,long count,long skip,boolean localOrdering) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SHOWASSETDEALS, assetName,count,skip,localOrdering);
		return ConvertUtil.getArrayResult(resultObj, WalletTransactionDetail.class);
	}
	/**
	 * {@link #showAssetDeals(String, long, long ,boolean) with localOrdering at false}
	 * 查询资产的交易记录（需要先订阅）
	 * @param assetName
	 * @param count
	 * @param skip
	 * @return
	 * @throws Exception
	 */
	public List<WalletTransactionDetail> showAssetDeals(String assetName,long count,long skip) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SHOWASSETDEALS, assetName,count,skip);
		return ConvertUtil.getArrayResult(resultObj, WalletTransactionDetail.class);
	}
	/**
	 * 查询所有资产
	 * @return
	 * @throws Exception
	 */
	public List<BalanceAsset> showAssets() throws Exception{
		JSONObject resultObj=exec(CommandEnum.SHOWASSETS);
		return ConvertUtil.getArrayResult(resultObj, BalanceAsset.class);
	}
}
