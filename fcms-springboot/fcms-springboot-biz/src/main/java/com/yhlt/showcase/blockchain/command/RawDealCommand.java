package com.yhlt.showcase.blockchain.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.alibaba.fastjson.JSONObject;
import com.yhlt.showcase.blockchain.model.dto.Raw;
import com.yhlt.showcase.blockchain.model.dto.RawParam;
import com.yhlt.showcase.blockchain.model.dto.deal.DealRAW;
import com.yhlt.showcase.blockchain.utils.ConvertUtil;

/**
 * 原始交易相关的命令
 *
 * @author stone
 * @date 2018年3月5日 上午9:55:39
 */
public class RawDealCommand extends BaseCommand{

	public RawDealCommand(String ip, String port, String login, String password){
		try {
			initialize(ip, port, login, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * Add change output to raw deal, containing any remaining assets
	 *
	 * @param hexString
	 *            The hex string of the raw deal
	 * @param address
	 *            The address to send the change to
	 * @return Hex string of the deal
	 * @throws Exception
	 */
	public String addRawChange(String hexString, String address) throws Exception {
		JSONObject resultObj = exec(CommandEnum.ADDRAWCHANGE, hexString, address);
		return ConvertUtil.getResult(resultObj, String.class);
	}

	/**
	 * Add change output to raw deal, containing any remaining assets
	 *
	 * @param hexString
	 *            The hex string of the raw deal
	 * @param address
	 *            The address to send the change to
	 * @param fee
	 *            Native currency value deducted from that amount so it becomes
	 *            a deal fee. Default - calculated automatically
	 * @return Hex string of the deal
	 * @throws Exception
	 */
	public String addRawChange(String hexString, String address, double fee) throws Exception {
		JSONObject resultObj = exec(CommandEnum.ADDRAWCHANGE, hexString, address);
		return ConvertUtil.getResult(resultObj, String.class);
	}

	/**
	 * Add new output to existing raw deal Return hex-encoded raw deal.
	 *
	 * @param txHex
	 *            The deal hex string
	 * @param dataHex
	 *            Data
	 * @return Hex string of the deal
	 */
	public String addRawData(String txHex, String dataHex) throws Exception {
		JSONObject resultObj = exec(CommandEnum.ADDRAWDATA, txHex, dataHex);
		return ConvertUtil.getResult(resultObj, String.class);
	}

	/**
	 *
	 * @param hex
	 *            The deal hex string
	 * @return { "txid" : "id", The TXID "version" : n, The version "locktime" :
	 *         ttt, The lock time "vin" : [ { "txid": "id", The TXID "vout": n,
	 *         The VOUT "scriptSig": { The script "asm": "asm", asm "hex": "hex"
	 *         hex }, "sequence": n The script sequence number } ,... ], "vout"
	 *         : [ { "value" : x.xxx, The value "n" : n, Index "scriptPubKey" :
	 *         { "asm" : "asm", The asm "hex" : "hex", The hex "reqSigs" : n,
	 *         The required signs "type" : "pubkeyhash", The type, eg
	 *         'pubkeyhash' "addresses" : [ "address" address ,... ] } } ,... ],
	 *         }
	 * @throws Exception
	 */
	public DealRAW decodeRawDeal(String hex) throws Exception {
		JSONObject resultObj = exec(CommandEnum.DECODERAWDEAL, hex);
		return ConvertUtil.getResult(resultObj, DealRAW.class);
	}

	/**
	 * Return the raw deal data
	 *
	 * @param txid
	 * @param verbose
	 *            Default=0, if 0, return a string, other return a json object
	 * @return Outputs (if verbose is set to 0): (string)"data" The Hex-encoded
	 *         data for 'txid'
	 *
	 *         Outputs (if verbose > 0): { "hex" : "data", The Hex-encoded data
	 *         for 'txid' "txid" : "id", The TXID "version" : n, The version
	 *         "locktime" : ttt, The lock time "vin" : [ { "txid": "id", The
	 *         TXID "vout": n, "scriptSig": { The script "asm": "asm", asm
	 *         "hex": "hex" hex }, "sequence": n The script sequence number }
	 *         ,... ], "vout" : [ { "value" : x.xxx, The value in yqf "n" : n,
	 *         index "scriptPubKey" : { "asm" : "asm", The asm "hex" : "hex",
	 *         The hex "reqSigs" : n, The required signs "type" : "pubkeyhash",
	 *         The type, eg 'pubkeyhash' "addresses" : [ "address" address ,...
	 *         ] } } ,... ], "blockhash" : "hash", The block hash
	 *         "confirmations" : n, The confirmations "time" : ttt, The deal
	 *         time in seconds since epoch (Jan 1 1970 GMT) "blocktime" : ttt
	 *         The block time in seconds since epoch (Jan 1 1970 GMT) }
	 * @throws Exception
	 */
	public Object showRawDeal(String txid, int verbose) throws Exception {
		JSONObject resultObj=exec(CommandEnum.SHOWRAWDEAL, txid,verbose);
		if(verbose==0){
			return resultObj.getString("result");
		}else{
			return ConvertUtil.getResult(resultObj, DealRAW.class);
		}
	}
	/**
	 * @param txid
	 * @return
	 * @throws Exception
	 */
	public DealRAW showRawDeal(String txid) throws Exception{
		return (DealRAW)showRawDeal(txid, 1);
	}
	/**
	 * @param txid
	 * @return
	 * @throws Exception
	 */
	public String showRawDealWithoutDeal(String txid) throws Exception{
		return (String)showRawDeal(txid,0);
	}
	/**
	 *
	 * @param address
	 * @param rawParams
	 * @param data
	 * @param action  Default "" Additional actions: "lock", "sign", "lock,sign", "sign,lock", "send"
	 * @return
	 * @throws Exception
	 */
	public String setupRAWSendFrom(String address, List<RawParam> rawParams, String[] data, String action) throws Exception{
		Map<String, Object> mapParams = new HashMap<String, Object>();
		for (RawParam param : rawParams) {
			if (param.isFilled()) {
				mapParams.put(param.getAddress(), param.getValue());
			}
		}

		String[] dataFormated = null;
		if (data != null) {
			dataFormated = new String[data.length];
			for (int i = 0; i < data.length; i++) {
				dataFormated[i] = data[i];
			}
		} else {
			dataFormated = new String[0];
		}
		JSONObject resultObj=null;
		if(StringUtils.isBlank(action)){
			resultObj=exec(CommandEnum.SETUPRAWSENDFROM, address, mapParams, dataFormated);
		}else{
			resultObj=exec(CommandEnum.SETUPRAWSENDFROM, address, mapParams, dataFormated,action);
		}
		return resultObj.get("result").toString();
	}
	/**
	 * Submits raw deal (serialized, hex-encoded) to local node and network.
	 * @param hexString The hex string of the raw deal
	 * @return The deal hash in hex
	 * @throws Exception
	 */
	public String sendRawDeal(String hexString) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SENDRAWDEAL, hexString);
		return ConvertUtil.getResult(resultObj, String.class);
	}
	/**
	 * Sign inputs for raw deal (serialized, hex-encoded)
	 * @param hexString The deal hex string
	 * @return
	 * @throws Exception
	 */
	public Raw signRawDeal(String hexString) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SIGNRAWDEAL, hexString);
		return ConvertUtil.getResult(resultObj, Raw.class);
	}
}
