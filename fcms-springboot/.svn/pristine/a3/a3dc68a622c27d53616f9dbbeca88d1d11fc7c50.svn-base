package com.yhlt.showcase.base.utils;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSONObject;
import com.yhlt.showcase.base.modules.SpringContextHolder;
import com.yhlt.showcase.base.properties.BlockChainProperties;
import com.yhlt.showcase.blockchain.command.Chain;
import com.yhlt.showcase.blockchain.model.dto.MultiBalance;
import com.yhlt.showcase.blockchain.model.dto.asset.BaseBalanceAsset;
import com.yhlt.showcase.blockchain.model.dto.datamod.DataModItem;
import com.yhlt.showcase.blockchain.model.dto.transaction.WalletTransaction;
import com.yhlt.showcase.blockchain.model.dto.transaction.WalletTransactionDetail;

/**
 * 区块链工具类
 * 
 * @author zhangweite
 * @date 2017-12-8
 * */
public class BlockChainUtil {

	private static BlockChainProperties blockChainProperties = SpringContextHolder.getBean(BlockChainProperties.class);

	static Chain command = new Chain(blockChainProperties.getIp(), blockChainProperties.getPort(), blockChainProperties.getLogin(), blockChainProperties.getPassword());
	
	//dataModName
	//场馆认证  VENUE_AUTH / 教练认证 COACH_AUTH
	//场馆评价  VENUE_VEAL / 教练评价 COACH_VEAL
	//场馆投诉  VENUE_COMP / 教练投诉 COACH_COMP
	
	
	// 向数据模块写入数据(写入jsonobject结构)
	public static String sendItem(String dataModName, String key,JSONObject dataobj) {
		try {
			return command.getDataModCommand().sendItem(dataModName, key, dataobj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 查询数据模块
	public static List<DataModItem> getAllData(String dataModName,
			@RequestParam(value = "page", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "rows", defaultValue = "10") Integer pageRows) {
		List<DataModItem> data = new ArrayList<DataModItem>();
		try {
			List<DataModItem> items = command.getDataModCommand().showDataItems(dataModName, pageRows, (pageNum-1)*pageRows);
			for (DataModItem dataModItem : items) {
				data.add(dataModItem);
//				System.err.println(dataModItem.getData());
//				System.err.println(dataModItem.getDataobj());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}
	
	// 根据key值查询数据模块(获取String)
	public static List<DataModItem> getDatabyKey(String dataModName, String key) {
		List<DataModItem> data = new ArrayList<DataModItem>();
		try {
			List<DataModItem> itemsByKey = command.getDataModCommand().showDataItemsByKey(dataModName, key, 10, 0);
			for (DataModItem dataModItem : itemsByKey) {
				data.add(dataModItem);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}
	//根据key查询数据模块最近的一条数据
	public static DataModItem getLastestDataItemByKey(String datamodName, String key) {
		DataModItem data = new DataModItem();
		try {
			data = command.getDataModCommand().showLastestDataItemByKey(datamodName, key, false);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return data;
	}
	// 创建新的钱包地址
	public static String createAddress() throws Exception {
		return command.getAddressCommand().addNewAddr();
	}
	
	// 新增交易
	public static String sendData(String address,String name ,double qty, String text) {
		try {
			List<BaseBalanceAsset> assets = new ArrayList<BaseBalanceAsset>();
			BaseBalanceAsset asset1 = new BaseBalanceAsset();
			asset1.setName(name);
			asset1.setQty(qty);
			assets.add(asset1);
			JSONObject dataobj = new JSONObject();
			dataobj.put("text", text);
			return command.getSendCommand().sendDataFrom(blockChainProperties.getAddress(),address, assets, dataobj);
			//System.out.println(s);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 获取资产情况
	public static MultiBalance getBalance(String address) {
		try {
			MultiBalance balance = command.getAddressCommand().showAllBals(address);
			/*for (String key : balance.keySet()) {
				System.out.println(key + ":" + balance.get(key));
			}*/
			return balance;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 获取交易详情
	public static List<WalletTransactionDetail> getDeals(String address,
			@RequestParam(value = "page", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "rows", defaultValue = "10") Integer pageRows) {
		try {
			List<WalletTransactionDetail> list = command.getTransactionCommand().showAddrDeals(address,  pageRows, (pageNum-1)*pageRows, true);
			/*for (WalletTransactionDetail detail : list) {
				System.out.println(detail.getTxid());
				System.out.println(detail.getData());
			}*/
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 获取单条交易详情
	public static WalletTransaction showWalletDealWithoutDetail(String address, String txid) {
		try {
			WalletTransaction  walletTransaction = command.getTransactionCommand().showAddrDeal(address,txid,true);
			/*for (WalletTransactionDetail detail : list) {
				System.out.println(detail.getTxid());
				System.out.println(detail.getData());
			}*/
			return walletTransaction;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
