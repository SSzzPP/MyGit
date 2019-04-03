package com.yhlt.showcase.blockchain.command;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.yhlt.showcase.blockchain.model.dto.transaction.Transaction;
import com.yhlt.showcase.blockchain.model.dto.transaction.TxOut;
import com.yhlt.showcase.blockchain.model.dto.transaction.WalletTransaction;
import com.yhlt.showcase.blockchain.model.dto.transaction.WalletTransactionDetail;
import com.yhlt.showcase.blockchain.utils.ConvertUtil;


/**
 * 和交易相关的命令
 * @author stone
 * @date 2018年3月4日 下午4:02:14
 */
public class TransactionCommand extends BaseCommand{
	public TransactionCommand(String ip, String port, String login, String password){
		try {
			initialize(ip, port, login, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 查询address下txid的交易信息
	 * @param address
	 * @param txid
	 * @param verbose
	 * 			default=false
	 *          If true, returns detailed array of inputs and output
	 * @return
	 * @throws Exception
	 */
	public WalletTransaction showAddrDeal(String address, String txid, boolean verbose) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SHOWADDRDEAL, address,txid,verbose);
		return ConvertUtil.getResult(resultObj, WalletTransaction.class);
	}
	/**
	 * 查询address下txid的交易信息(verbose=false)
	 * @param address
	 * @param txid
	 * @return
	 * @throws Exception
	 */
	public WalletTransaction showAddrDeal(String address,String txid) throws Exception{
		return showAddrDeal(address, txid,false);
	}
	/**
	 * Show detailed info about in-wallet deal <txid>
	 * @param txid
	 * @param includeWatchonly
	 * 			Default=false Whether to include watchonly addresses in balance calculation and details[]
	 * @return
	 * @throws Exception
	 */
	public Transaction showDeal(String txid, boolean includeWatchonly) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SHOWDEAL, txid,includeWatchonly);
		return ConvertUtil.getResult(resultObj, Transaction.class);
	}
	/**
	 *
	 * @param txid
	 * @return
	 * @throws Exception
	 */
	public Transaction showDeal(String txid) throws Exception{
		return showDeal(txid,false);
	}
	/**
	 * Return an unspent deal output with memorypool data
	 * @param txid
	 * @param vout
	 * @return
	 * @throws Exception
	 */
	public TxOut showTxOut(String txid, int vout) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SHOWTXOUT, txid,vout);
		return ConvertUtil.getResult(resultObj, TxOut.class);
	}
	/**
	 * 显示钱包txid的交易记录
	 * @param txid
	 * @param includeWatchOnly   Default=false If true include watchonly addr
	 * @param verbose            Default=false If true, returns deals details
	 * @return
	 * @throws Exception
	 */
	public WalletTransactionDetail showWalletDeal(String txid, boolean includeWatchOnly, boolean verbose) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SHOWWALLETDEAL, txid,includeWatchOnly,verbose);
		return ConvertUtil.getResult(resultObj, WalletTransactionDetail.class);
	}
	/**
	 *
	 * @param txid
	 * @param includeWatchOnly
	 * @param verbose =false
	 * @return
	 * @throws Exception
	 */
	public WalletTransactionDetail showWalletDeal(String txid,boolean includeWatchOnly) throws Exception{
		return showWalletDeal(txid, includeWatchOnly, false);
	}
	/**
	 *
	 * @param txid
	 * @param includeWatchOnly =false
	 * @param verbose          =false
	 * @return
	 * @throws Exception
	 */
	public WalletTransaction showWalletDealWithoutDetail(String txid) throws Exception{
		return showWalletDeal(txid, false);
	}
	/**
	 * Show info about the <count> most recent deals related to address.
	 * @param address
	 * @param count  Default=10 The number of deals to return
	 * @param skip   Default=0 The number of deals to skip
	 * @param verbose  Default=false If true, return detailed array deals
	 * @return
	 * @throws Exception
	 */
	public List<WalletTransactionDetail> showAddrDeals(String address, long count, long skip, boolean verbose) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SHOWADDRDEALS, address,count,skip,verbose);
		return ConvertUtil.getArrayResult(resultObj, WalletTransactionDetail.class);
	}
	/**
	 * {@link #showAddrDeals(String, long, long ,boolean) with verbose=false}
	 * @param address
	 * @param count Default=10 The number of deals to return
	 * @param skip  Default=0 The number of deals to skip
	 * @param verbose  Default=false If true, return detailed array deals
	 * @return
	 * @throws Exception
	 */
	public List<WalletTransaction> showAddrDeals(String address, long count, long skip) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SHOWADDRDEALS, address,count,skip);
		return ConvertUtil.getArrayResult(resultObj, WalletTransaction.class);
	}
	/**
	 * {@link #showAddrDealsWithoutDetail(String, long, long) with skip at 0}
	 * @param address
	 * @param count
	 * @return
	 * @throws Exception
	 */
	public List<WalletTransaction> showAddrDeal(String address, long count) throws Exception{
		return showAddrDeals(address, count, 0);
	}
	/**
	 * Return up to 'count' most recent deals skipping the first 'from' deals for this wallet
	 * @param count  Default=10 The number of deals to return
	 * @param skip   Default=0 The number of deals to skip
	 * @param includeWatchOnly  Default=false Include watchonly addr
	 * @return
	 * @throws Exception
	 */
	public List<WalletTransactionDetail> showWalletDeals(long count,long skip,boolean includeWatchOnly) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SHOWWALLETDEALS, count,skip,includeWatchOnly);
		return ConvertUtil.getArrayResult(resultObj, WalletTransactionDetail.class);
	}
	/**
	 * {@link #showWalletDeals(long, long, boolean) with includeWatchOnly at false}
	 * @param count
	 * @param skip
	 * @return
	 * @throws Exception
	 */
	public List<WalletTransactionDetail> showWalletDeals(long count,long skip) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SHOWWALLETDEALS, count,skip,false);
		return ConvertUtil.getArrayResult(resultObj, WalletTransactionDetail.class);
	}
	/**
	 * {@link #showWalletDeals(long, long) with skip at 0}
	 * @param count
	 * @return
	 * @throws Exception
	 */
	public List<WalletTransactionDetail> showWalletDeals(long count) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SHOWWALLETDEALS, count,0,false);
		return ConvertUtil.getArrayResult(resultObj, WalletTransactionDetail.class);
	}
	/**
	 * 根据txid查询start到count字节之间的数据
	 * @param txid
	 * @param start
	 * @param count
	 * @return
	 * @throws Exception
	 */
	public String showTxOutData(String txid,long start,long count) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SHOWTXOUTDATA, txid,start,count);
		return ConvertUtil.getResult(resultObj, String.class);
	}
}
