package com.yhlt.showcase.blockchain.command;

import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.yhlt.showcase.blockchain.model.dto.datamod.DataModItem;
import com.yhlt.showcase.blockchain.model.dto.datamod.DataModSenderDto;
import com.yhlt.showcase.blockchain.utils.ConvertUtil;


/**
 * 数据模块
 *
 * @author stone
 * @date 2018年3月3日 上午9:21:01
 */
public class DataModCommand extends BaseCommand{

	public DataModCommand(String ip, String port, String login, String password){
		try {
			initialize(ip, port, login, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 创建名为datamodName的数据模块
	 *
	 * @param datamodName
	 * @param open
	 *            Anyone can senditem to this datamod
	 * @return
	 * @throws Exception
	 * @command setupdatamod
	 */
	public String setupDataMod(String datamodName, boolean open) throws Exception {
		JSONObject resultObj = exec(CommandEnum.SETUPDATAMOD, datamodName, open);
		return ConvertUtil.getResult(resultObj, String.class);
	}

	/**
	 * {@link #setupDataMod(String,Boolean) with open at false}
	 *
	 * 创建名为datamodName的数据模块
	 *
	 * @param datamodName
	 * @return
	 * @throws Exception
	 */
	public String setupDataMod(String datamodName) throws Exception {
		return setupDataMod(datamodName, false);
	}

	/**
	 * 订阅数据模块
	 *
	 * @param datamodName
	 *            数据模块名称
	 * @param rescan
	 *            是否重新扫描
	 * @throws Exception
	 * @command order
	 */
	public void order(String datamodName, boolean rescan) throws Exception {
		exec(CommandEnum.ORDER, datamodName, rescan);
	}

	/**
	 * {@link #order(String,Boolean) with rescan at false}
	 *
	 * 订阅数据模块
	 *
	 * @param datamodName
	 * @param rescan
	 *            default=true
	 * @throws Exception
	 */
	public void order(String datamodName) throws Exception {
		exec(CommandEnum.ORDER, datamodName);
	}

	/**
	 * 取消订阅数据模块
	 *
	 * @param datamodName
	 * @throws Exception
	 */
	public void noOrder(String datamodName) throws Exception {
		exec(CommandEnum.NOORDER, datamodName);
	}

	/**
	 * 向数据模块中写入内容
	 *
	 * @param dataModName
	 * @param key
	 * @param dataHex
	 * @return txid
	 * @throws Exception
	 *
	 * @command senditem
	 */
	public String sendItem(String dataModName, String key, String dataHex) throws Exception {
		JSONObject resultObj = exec(CommandEnum.SENDITEM, dataModName, key, dataHex);
		return ConvertUtil.getResult(resultObj, String.class);
	}
	/**
	 * 写入数据模块（单个key 写入json结构数据）
	 * @param dataModName
	 * @param key
	 * @param dataobj
	 * @return
	 * @throws Exception
	 */
	public String sendItem(String dataModName, String key,JSONObject dataobj) throws Exception{
		JSONObject json=new JSONObject();
		json.put("json", dataobj);
		JSONObject resultObj = exec(CommandEnum.SENDITEM, dataModName, key, json);
		return ConvertUtil.getResult(resultObj, String.class);
	}
	/**
	 * 多key值项数据模块写入内容
	 * @param dataModName
	 * @param keys
	 * @param dataHex
	 * @return
	 * @throws Exception
	 */
	public String sendItem(String dataModName,String[] keys,String dataHex) throws Exception{
		JSONArray arr=new JSONArray(keys.length);
		for (String string : keys) {
			arr.add(string);
		}
		JSONObject resultObj = exec(CommandEnum.SENDITEM, dataModName, arr, dataHex);
		return ConvertUtil.getResult(resultObj, String.class);
	}
	/**
	 * 多个key值，并存json结构
	 * @param dataModName
	 * @param keys
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public String sendItem(String dataModName,String[] keys,JSONObject obj) throws Exception{
		JSONArray arr=new JSONArray(keys.length);
		for (String string : keys) {
			arr.add(string);
		}
		JSONObject json=new JSONObject();
		json.put("json", obj);
		JSONObject resultObj = exec(CommandEnum.SENDITEM, dataModName, arr, json);
		return ConvertUtil.getResult(resultObj, String.class);
	}

	/**
	 * 从fromaddr向dataModName中写入内容
	 *
	 * @param fromAddr
	 * @param dataModName
	 * @param key
	 * @param dataHex
	 * @return
	 * @throws Exception
	 */
	public String sendItemFrom(String fromAddr, String dataModName, String key, String dataHex)
			throws Exception {
		JSONObject resultObj = exec(CommandEnum.SENDITEMFROM, fromAddr, dataModName, key, dataHex);
		return ConvertUtil.getResult(resultObj, String.class);
	}

	/**
	 * 数据模块值
	 *
	 * @param datamodName
	 *            DatamodId - include: txid, reference, name.
	 * @param count
	 *            Default=10
	 * @param skip
	 * @param localordering
	 *            If true, items in wallet, If false - items in
	 *            block(default=false)
	 * @return
	 * @throws Exception
	 * @command showdataitems
	 */
	public List<DataModItem> showDataItems(String datamodName, int count, int skip, boolean localordering)
			throws Exception {
		JSONObject resultObj = exec(CommandEnum.SHOWDATAITEMS, datamodName, count, skip, localordering);
		return ConvertUtil.getArrayResult(resultObj, DataModItem.class);
	}

	/**
	 * 数据模块值
	 *
	 * @param datamodName
	 *            DatamodId - include: txid, reference, name.
	 * @param count
	 *            Default=10
	 * @param skip
	 * @param localordering
	 *            default=false
	 * @return
	 * @throws Exception
	 * @command showdataitems
	 */
	public List<DataModItem> showDataItems(String datamodName, int count, int skip) throws Exception {
		return showDataItems(datamodName, count, skip, false);
	}

	/**
	 * 根据txid查询数据模块单条数据
	 * @param datamodName
	 * @param txid
	 * @return
	 * @throws Exception
	 * @command showdataitem
	 */
	public DataModItem showDataItem(String datamodName, String txid, boolean verbose) throws Exception {
		JSONObject resultObj = exec(CommandEnum.SHOWDATAITEM, datamodName, txid, verbose);
		return ConvertUtil.getResult(resultObj, DataModItem.class);
	}

	/**
	 * 根据key值查询数据模块
	 *
	 * @param datamodName
	 * @param key
	 * @param count
	 * @param skip
	 * @param verbose
	 *            Default=false If true, items in wallet, if false - items in
	 *            blockchain
	 * @return
	 * @throws Exception
	 */
	public List<DataModItem> showDataItemsByKey(String datamodName, String key, int count, int skip,
			boolean verbose) throws Exception {
		JSONObject resultObj = exec(CommandEnum.SHOWDATAKEYITEMS, datamodName, key, count, skip, verbose);
		return ConvertUtil.getArrayResult(resultObj, DataModItem.class);
	}
	/**
	 * {@link #showDataItemsByKey(String,String,Integer,Integer,Boolean) with verbose at false}
	 * @param datamodName
	 * @param key
	 * @param count
	 * @param skip
	 * @return
	 * @throws Exception
	 */
	public List<DataModItem> showDataItemsByKey(String datamodName, String key, int count, int skip) throws Exception {
		return showDataItemsByKey(datamodName, key, count, skip,false);
	}
	/**
	 * 根据key值查询最近的一条数据
	 *
	 * @param datamodName
	 * @param key
	 * @param verbose
	 * @return
	 * @throws Exception
	 */
	public DataModItem showLastestDataItemByKey(String datamodName, String key, boolean verbose)
			throws Exception {
		List<DataModItem> dataModKeyItems = showDataItemsByKey(datamodName, key, 1, -1, verbose);
		if (dataModKeyItems != null && dataModKeyItems.size() > 0) {
			return dataModKeyItems.get(0);
		}
		return null;
	}

	/**
	 * 查询address写入datamodName的数据模块数据
	 *
	 * @param datamodName
	 * @param address
	 * @param detail
	 *            是否显示详细信息
	 * @param count
	 * @param start
	 * @param verbose
	 *            Default=false If true, items in wallet, if false - in
	 *            blockchain
	 * @return
	 * @throws Exception
	 *
	 *
	 */
	public List<DataModItem> showDataSenderItems(String datamodName, String address, boolean detail,
			int count, int start, boolean verbose) throws Exception {
		JSONObject resultObj = exec(CommandEnum.SHOWDATASENDERITEMS, datamodName, address, detail, count,
				start, verbose);
		return ConvertUtil.getArrayResult(resultObj, DataModItem.class);
	}

	/**
	 * 查询address写入datamodName的数据模块数据
	 *
	 * @param datamodName
	 * @param address
	 * @param detail
	 *            Dafault=fasle
	 * @param count
	 *            Default=10
	 * @param start
	 * @param verbose
	 *            Dafault=false
	 * @return
	 * @throws Exception
	 */
	public List<DataModItem> showDataSenderItems(String datamodName, String address) throws Exception {
		JSONObject resultObj = exec(CommandEnum.SHOWDATASENDERITEMS, datamodName, address);
		return ConvertUtil.getArrayResult(resultObj, DataModItem.class);
	}

	/**
	 * 查询datamodName的写入情况
	 *
	 * @param datamodName
	 * @return
	 * @throws Exception
	 */
	public List<DataModSenderDto> showDataSenders(String datamodName) throws Exception {
		JSONObject resultObj = exec(CommandEnum.SHOWDATASENDERS, datamodName);
		return ConvertUtil.getArrayResult(resultObj, DataModSenderDto.class);
	}

	/**
	 * 查询datamodName中address的写入情况
	 *
	 * @param datamodName
	 * @param address
	 *            Default="*"
	 * @return
	 * @throws Exception
	 */
	public List<DataModSenderDto> showDataSenders(String datamodName, String address) throws Exception {
		return showDataSenders(datamodName, address, false);
	}

	/**
	 * 查询datamodName中addresses的写入情况
	 *
	 * @param datamodName
	 * @param address
	 * @param detail
	 *            Default=false 是否显示详情，将显示第一次写入数据模块和最后一次写入的情况
	 * @return
	 * @throws Exception
	 */
	public List<DataModSenderDto> showDataSenders(String datamodName, String address, boolean detail)
			throws Exception {
		JSONObject resultObj = exec(CommandEnum.SHOWDATASENDERS, datamodName, address, detail);
		return ConvertUtil.getArrayResult(resultObj, DataModSenderDto.class);
	}

	/**
	 * 查询datamodName中addresses的写入情况 可根据count和skip做分页
	 *
	 * @param datamodName
	 * @param address
	 * @param detail
	 * @param count
	 * @param skip
	 * @param verbose
	 *            Default=false If true, items in wallet, if false - in
	 *            blockchain
	 * @return
	 * @throws Exception
	 */
	public List<DataModSenderDto> showDataSenders(String datamodName, String address, boolean detail, int count,
			int skip, boolean verbose) throws Exception {
		JSONObject resultObj = exec(CommandEnum.SHOWDATASENDERS, datamodName, address, detail, count, skip,
				verbose);
		return ConvertUtil.getArrayResult(resultObj, DataModSenderDto.class);
	}

	/**
	 * 查询datamodName中addresses的写入情况
	 *
	 * @param datamodName
	 * @param addresses
	 * @return
	 * @throws Exception
	 */
	public List<DataModSenderDto> showDataSenders(String datamodName, String[] addresses) throws Exception {
		return showDataSenders(datamodName, addresses, false);
	}

	/**
	 * 查询datamodName中addresses的写入情况
	 *
	 * @param datamodName
	 * @param addresses
	 * @return
	 * @throws Exception
	 */
	public List<DataModSenderDto> showDataSenders(String datamodName, String[] addresses, boolean detail)
			throws Exception {
		JSONObject resultObj = exec(CommandEnum.SHOWDATASENDERS, datamodName, addresses, detail);
		return ConvertUtil.getArrayResult(resultObj, DataModSenderDto.class);
	}

	/**
	 * 查询datamodName中addresses的写入情况
	 *
	 * @param datamodName
	 * @param addresses
	 * @param detail
	 * @param count
	 * @param skip
	 * @param verbose
	 *            Default=false If true, items in wallet, if false - in
	 *            blockchain
	 * @return
	 * @throws Exception
	 */
	public List<DataModSenderDto> showDataSenders(String datamodName, String[] addresses, boolean detail,
			int count, int skip, boolean verbose) throws Exception {
		JSONObject resultObj = exec(CommandEnum.SHOWDATASENDERS, datamodName, addresses, detail);
		return ConvertUtil.getArrayResult(resultObj, DataModSenderDto.class);
	}

	/**
	 * 查询datamodName中txid这笔交易的信息
	 *
	 * @param datamodName
	 * @param txid
	 * @param verbose
	 *            Default=false If true, returns info about item transaction
	 * @return
	 * @throws Exception
	 */
	public List<DataModItem> showDataTxItems(String datamodName, String txid) throws Exception {
		JSONObject resultObj = exec(CommandEnum.SHOWDATATXITEMS, datamodName, txid);
		return ConvertUtil.getArrayResult(resultObj, DataModItem.class);
	}

	/**
	 * 查询datamodName中txid这笔交易的信息
	 *
	 * @param datamodName
	 * @param txid
	 * @param verbose
	 *            Default=false If true, returns info about item transaction
	 * @return
	 * @throws Exception
	 */
	public List<DataModItem> showDataTxItems(String datamodName, String txid, boolean verbose)
			throws Exception {
		JSONObject resultObj = exec(CommandEnum.SHOWDATATXITEMS, datamodName, txid, verbose);
		return ConvertUtil.getArrayResult(resultObj, DataModItem.class);
	}

	/**
	 * Return datamod json object items summary for specific key.
	 *
	 * @param datamodName
	 * @param key
	 * @param modes
	 *            Comma delimited list of the following: jsonobjectmerge
	 *            (required) - merge json objects recursive - merge json
	 *            sub-objects recursively noupdate - preserve first value for
	 *            each key instead of taking the last omitnull - omit keys with
	 *            null values ignoreother - ignore items that cannot be included
	 *            in summary (otherwise returns an error) ignoremissing - ignore
	 *            missing outchain items (otherwise returns an error)
	 * @return
	 * @throws Exception
	 */
	public JSONObject showDataKeySumm(String datamodName, String key, String[] modes) throws Exception {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < modes.length; i++) {
			sb.append(modes[i]);
			if (i != modes.length - 1) {
				sb.append(",");
			}
		}
		JSONObject resultObj = exec(CommandEnum.SHOWDATAKEYSUMM, datamodName, key, sb.toString());
		return ConvertUtil.getResult(resultObj, JSONObject.class);
	}
	/**
	 * {@link #showDataKeySumm(String,String,String[]) with modes at jsonobjectmerge","ignore}
	 * @param datamodName
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public JSONObject showDataKeySumm(String datamodName, String key) throws Exception{
		return showDataKeySumm(datamodName, key,new String[]{"jsonobjectmerge","ignore"});
	}

	/**
	 * Return datamod json object items summary for specific senditemer.
	 *
	 * @param datamodName
	 *            datamodName Include: datamod txid, datamod reference, datamod
	 *            name.
	 * @param address
	 *            Sender address
	 * @param modes
	 *            Comma delimited list of the following: jsonobjectmerge
	 *            (required) - merge json objects recursive - merge json
	 *            sub-objects recursively noupdate - preserve first value for
	 *            each key instead of taking the last omitnull - omit keys with
	 *            null values ignoreother - ignore items that cannot be included
	 *            in summary (otherwise returns an error) ignoremissing - ignore
	 *            missing outchain items (otherwise returns an error)
	 * @return
	 * @throws Exception
	 */
	public JSONObject showDataSenderSumm(String datamodName, String address, String[] modes) throws Exception {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < modes.length; i++) {
			sb.append(modes[i]);
			if (i != modes.length - 1) {
				sb.append(",");
			}
		}
		JSONObject resultObj = exec(CommandEnum.SHOWDATASENDERSUMM, datamodName, address, sb.toString());
		return ConvertUtil.getResult(resultObj, JSONObject.class);
	}

}
