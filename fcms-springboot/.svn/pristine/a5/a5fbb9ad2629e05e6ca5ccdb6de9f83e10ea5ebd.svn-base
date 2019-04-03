package com.yhlt.showcase.blockchain.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.yhlt.showcase.blockchain.model.dto.asset.BaseBalanceAsset;
import com.yhlt.showcase.blockchain.utils.ConvertUtil;

/**
 * 和发起转账相关的命令
 * @author stone
 * @date 2018年3月4日 下午4:04:18
 */
public class SendCommand extends BaseCommand{
	public SendCommand() {

	}
	
	public SendCommand(String ip, String port, String login, String password){
		try {
			initialize(ip, port, login, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * {@link #send(String, double, String, String) without comment at "" and commnetTo at ""}
	 * 发给address amount的原生资产
	 * @param address
	 * @param amount
	 * @return txid
	 * @throws Exception
	 *
	 * @command send
	 */
	public String send(String address,double amount) throws Exception{
		return send(address, amount, "", "");
	}
	/**
	 * {@link #send(String, List, String, String) without comment at "" and commnetTo at ""}
	 * 给address转 object包含的资产类型(原生|数字资产)及其数量的数字资产
	 * @param address
	 * @param list
	 * @return txid
	 * @throws Exception
	 *
	 * @command send
	 */
	public String send(String address,List<BaseBalanceAsset> assets) throws Exception{
		return send(address, assets, "", "");
	}
	/**
	 *
	 * @param address
	 * @param amount
	 * @param comment    A comment used to store what the deal is for(not in block).
	 * @param commentTo  A comment to store the name of the person or organization(not in block).
	 * @return txid
	 * @throws Exception
	 *
	 * @command send
	 */
	public String send(String address,double amount,String comment,String commentTo) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SEND, address,amount,comment,commentTo);
		return ConvertUtil.getResult(resultObj, String.class);
	}
	/**
	 * 给address转 object包含的资产类型及其数量的数字资产
	 * @param address
	 * @param object
	 * 			{
      				"asset-name" : asset-count,
      				"":   nativecurrency-count          Native currency use ""
      				,...
    			}
	 * @param comment
	 * @param commentTo
	 * @return txid
	 * @throws Exception
	 *
	 * @command send
	 */
	public String send(String address,List<BaseBalanceAsset> assets,String comment,String commentTo) throws Exception{
		Map<String, Double> assetsMap=new HashMap<String, Double>();
		for (BaseBalanceAsset baseBalanceAsset : assets) {
			baseBalanceAsset.validate();
			assetsMap.put(baseBalanceAsset.getName(), baseBalanceAsset.getQty());
		}
		JSONObject resultObj=exec(CommandEnum.SEND, address,assetsMap,comment,commentTo);
		return ConvertUtil.getResult(resultObj, String.class);
	}
	/**
	 * 从fromAddr转给toAddr amount个原生资产
	 * @param fromAddr
	 * @param toAddr
	 * @param amount
	 * @return txid
	 * @throws Exception
	 *
	 * @command sendfrom
	 */
	public String sendFrom(String fromAddr,String toAddr,double amount) throws Exception{
		return sendFrom(fromAddr, toAddr, amount, "", "");
	}
	/**
	 * {@link #sendFrom(String, String, List, String, String) without comment at "" and commnetTo at ""}
	 * 从fromAddr转给给toAddr转 object包含的资产类型及其数量的数字资产
	 * @param fromAddr
	 * @param toAddr
	 * @param assets
	 * @return
	 * @throws Exception
	 */
	public String sendFrom(String fromAddr,String toAddr,List<BaseBalanceAsset> assets) throws Exception{
		return sendFrom(fromAddr, toAddr, assets, "", "");
	}
	/**
	 * 从fromAddr转给toAddr amount个原生资产
	 * @param fromAddr
	 * @param toAddr
	 * @param amount
	 * @param comment
	 * @param commentTo
	 * @return txid
	 * @throws Exception
	 *
	 * @command sendfrom
	 */
	public String sendFrom(String fromAddr,String toAddr,double amount,String comment,String commentTo) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SENDFROM,fromAddr,toAddr,amount,comment,commentTo);
		return ConvertUtil.getResult(resultObj, String.class);
	}
	/**
	 * 从fromAddr转给给toAddr转 object包含的资产类型及其数量的数字资产
	 * @param fromAddr
	 * @param toAddr
	 * @param object
	 * 			{
      				"asset-name" : asset-count,
      				"":   nativecurrency-count          Native currency use ""
      				,...
    			}
	 * @param comment
	 * @param commentTo
	 * @return
	 * @throws Exception
	 */
	public String sendFrom(String fromAddr,String toAddr,List<BaseBalanceAsset> assets,String comment,String commentTo) throws Exception{
		Map<String, Double> assetsMap=new HashMap<String, Double>();
		for (BaseBalanceAsset baseBalanceAsset : assets) {
			baseBalanceAsset.validate();
			assetsMap.put(baseBalanceAsset.getName(), baseBalanceAsset.getQty());
		}
		JSONObject resultObj=exec(CommandEnum.SENDFROM, fromAddr,toAddr,assetsMap,comment,commentTo);
		return ConvertUtil.getResult(resultObj, String.class);
	}
	/**
	 * 发送资产 如果 nativeAmount不为0 则将nativeAmount个原生资产发送给address
	 * @param address
	 * @param assetName
	 * @param assetAmount
	 * @param nativeAmount
	 * @param comment
	 * @param commentTo
	 * @return
	 * @throws Exception
	 */
	public String sendAsset(String address,String assetName,double assetAmount,double nativeAmount,String comment,String commentTo) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SENDASSET, address,assetName,assetAmount,nativeAmount,comment,commentTo);
		return ConvertUtil.getResult(resultObj, String.class);
	}
	/**
	 * 发送资产（只能是数字资产不能是原生）
	 * @param address
	 * @param assetName
	 * @param assetAmount
	 * @return
	 * @throws Exception
	 */
	public String sendAsset(String address,String assetName,double assetAmount) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SENDASSET, address,assetName,assetAmount);
		return ConvertUtil.getResult(resultObj, String.class);
	}
	/**
	 * 从某个地址发送资产到另一个地址
	 * @param fromAddr
	 * @param toAddr
	 * @param assetName
	 * @param assetAmount
	 * @param nativeAmount
	 * @param comment
	 * @param commentTo
	 * @return
	 * @throws Exception
	 */
	public String sendAssetFrom(String fromAddr,String toAddr,String assetName,double assetAmount,double nativeAmount,String comment,String commentTo) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SENDASSETFROM, fromAddr,toAddr,assetName,assetAmount,nativeAmount,comment,commentTo);
		return ConvertUtil.getResult(resultObj, String.class);
	}
	/**
	 *
	 * @param fromAddr
	 * @param toAddr
	 * @param assetName
	 * @param assetAmount
	 * @return
	 * @throws Exception
	 */
	public String sendAssetFrom(String fromAddr,String toAddr,String assetName,double assetAmount) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SENDASSETFROM, fromAddr,toAddr,assetName,assetAmount);
		return ConvertUtil.getResult(resultObj, String.class);
	}
	/**
	 * Send an amount (or several asset amounts) using specific address.
	 * @param fromAddress Address to send from.
	 * @param toAddress   The amount in native currency to send. eg 0.1
	 * @param assets
	 * @param comment     A comment used to store what the deal is for(not in block)
	 * @param comment-to  A comment to store the name of the person or organization(not in block)
	 * @return The TXID
	 * @throws Exception
	 */
	public String sendFromAddr(String fromAddress, String toAddress,List<BaseBalanceAsset> assets,String comment,String commentTo) throws Exception{
		Map<String, Double> assetsMap=ConvertUtil.baseBalanceAsset2Map(assets);
		JSONObject resultObj=exec(CommandEnum.SENDFROMADDR, fromAddress,toAddress,assetsMap,comment,commentTo);
		return ConvertUtil.getResult(resultObj, String.class);
	}
	/**
	 * {@link #sendFromAddr(String, String, List, String, String) without comment at "" and commnetTo at ""}
	 * @param fromAddress
	 * @param toAddress
	 * @param assets
	 * @return
	 * @throws Exception
	 */
	public String sendFromAddr(String fromAddress, String toAddress,List<BaseBalanceAsset> assets) throws Exception{
		return sendFromAddr(fromAddress, toAddress, assets, "", "");
	}
	/**
	 * Send an several asset amounts to a given address
	 * @param address
	 * @param assets
	 * @param comment    A comment used to store what the deal is for(not in block).
	 * @param commentTo  A comment to store the name of the person or organization(not in block).
	 * @return
	 * @throws Exception
	 */
	public String sendToAddr(String address, List<BaseBalanceAsset> assets,String comment,String commentTo) throws Exception{
		Map<String, Double> assetsMap=ConvertUtil.baseBalanceAsset2Map(assets);
		JSONObject resultObj=exec(CommandEnum.SENDTOADDR, address,assetsMap,comment,commentTo);
		return ConvertUtil.getResult(resultObj, String.class);
	}
	/**
	 * {@link #sendToAddr(String, List, String, String) without comment at "" and commnetTo at ""}
	 * Send an several asset amounts to a given address
	 * @param address
	 * @param assets
	 * @return
	 * @throws Exception
	 */
	public String sendToAddr(String address, List<BaseBalanceAsset> assets) throws Exception{
		return sendToAddr(address, assets, "", "");
	}
	/**
	 * Send an amount to a given address.
	 * @param address
	 * @param amount
	 * @param comment    A comment used to store what the deal is for(not in block).
	 * @param commentTo  A comment to store the name of the person or organization(not in block).
	 * @return
	 * @throws Exception
	 */
	public String sendToAddr(String address,Double amount,String comment,String commentTo) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SENDTOADDR, address,amount,comment,commentTo);
		return ConvertUtil.getResult(resultObj, String.class);
	}
	/**
	 * {@link #sendToAddr(String, Double, String, String) without comment at "" and commnetTo at ""}
	 * Send an amount to a given address.
	 * @param address
	 * @param amount
	 * @return
	 * @throws Exception
	 */
	public String sendToAddr(String address,Double amount) throws Exception{
		return sendToAddr(address, amount, "", "");
	}
	/**
	 * Send an amount to a given address with appended metadata.
	 * @param address
	 * @param amount
	 * @param hexData Data, see help with-data for details.
	 * @return         The TXID.
	 * @throws Exception
	 */
	public String sendData(String address,Double amount,String hexData) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SENDDATA, address,amount,hexData);
		return ConvertUtil.getResult(resultObj, String.class);
	}
	/**
	 * Send several asset amounts to a given address with appended metadata.
	 * @param address
	 * @param assets
	 * @param hexData  Data, see help with-data for details.
	 * @return  The TXID.
	 * @throws Exception
	 */
	public String sendData(String address,List<BaseBalanceAsset> assets,String hexData) throws Exception{
		Map<String, Double> assetsMap=ConvertUtil.baseBalanceAsset2Map(assets);
		JSONObject resultObj=exec(CommandEnum.SENDDATA, address,assetsMap,hexData);
		return ConvertUtil.getResult(resultObj, String.class);
	}
	/**
	 *
	 * @param address
	 * @param assets
	 * @param object
	 * @return
	 * @throws Exception
	 */
	public String sendData(String address,List<BaseBalanceAsset> assets,JSONObject object) throws Exception{
		Map<String, Double> assetsMap=ConvertUtil.baseBalanceAsset2Map(assets);
		JSONObject resultObj=exec(CommandEnum.SENDDATA, address,assetsMap,object);
		return ConvertUtil.getResult(resultObj, String.class);
	}
	/**
	 * Send an amount using specific address
	 * @param fromAddress
	 * @param toAddress
	 * @param amount
	 * @param hexData   Data, see help with-data for details.
	 * @return The TXID.
	 * @throws Exception
	 */
	public String sendDataFrom(String fromAddress,String toAddress,Double amount,String hexData) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SENDDATAFROM, fromAddress,toAddress,amount,hexData);
		return ConvertUtil.getResult(resultObj, String.class);
	}
	/**
	 * Send an several asset amounts using specific address.
	 * @param fromAddress
	 * @param toAddress
	 * @param assets
	 * @param hexData  Data, see help with-data for details.
	 * @return The TXID.
	 * @throws Exception
	 */
	public String sendDataFrom(String fromAddress,String toAddress,List<BaseBalanceAsset> assets,String hexData) throws Exception{
		Map<String, Double> assetsMap=ConvertUtil.baseBalanceAsset2Map(assets);
		JSONObject resultObj=exec(CommandEnum.SENDDATAFROM, fromAddress,toAddress,assetsMap,hexData);
		return ConvertUtil.getResult(resultObj, String.class);
	}
	
	public String sendDataFrom(String fromAddress,String toAddress,List<BaseBalanceAsset> assets,JSONObject object) throws Exception{
		Map<String, Double> assetsMap=ConvertUtil.baseBalanceAsset2Map(assets);
		JSONObject resultObj=exec(CommandEnum.SENDDATAFROM, fromAddress,toAddress,assetsMap,object);
		return ConvertUtil.getResult(resultObj, String.class);
	}
}
