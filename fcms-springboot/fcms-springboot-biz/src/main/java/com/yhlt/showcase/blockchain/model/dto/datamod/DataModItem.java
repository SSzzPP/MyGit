package com.yhlt.showcase.blockchain.model.dto.datamod;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * 数据模块里面的数据信息
 * @author stone
 * @date 2018年3月3日 下午8:21:47
 */
public class DataModItem {
	/**
	 * 发布人（地址）
	 */
	private List<String> senditemers;
	private List<String> keys;
	private String data;
	private JSONObject dataobj;
	boolean outchain;
	long confirmations;
	String blockhash;
	long blockindex;
	long blocktime;
	String txid;
	long vout;
	boolean valid;
	long time;
	String timeStr;
	long timereceived;
	String timereceivedStr;
	public List<String> getSenditemers() {
		return senditemers;
	}
	public void setSenditemers(List<String> senditemers) {
		this.senditemers = senditemers;
	}
	public List<String> getKeys() {
		return keys;
	}
	public void setKeys(List<String> keys) {
		this.keys = keys;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public long getConfirmations() {
		return confirmations;
	}
	public void setConfirmations(long confirmations) {
		this.confirmations = confirmations;
	}
	public String getBlockhash() {
		return blockhash;
	}
	public void setBlockhash(String blockhash) {
		this.blockhash = blockhash;
	}
	public long getBlockindex() {
		return blockindex;
	}
	public void setBlockindex(long blockindex) {
		this.blockindex = blockindex;
	}
	public long getBlocktime() {
		return blocktime;
	}
	public void setBlocktime(long blocktime) {
		this.blocktime = blocktime;
	}
	public String getTxid() {
		return txid;
	}
	public void setTxid(String txid) {
		this.txid = txid;
	}
	public long getVout() {
		return vout;
	}
	public void setVout(long vout) {
		this.vout = vout;
	}
	public boolean isValid() {
		return valid;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
	public long getTime() {
		return time;
	}
	public void setTime(long time) {
		this.time = time;
	}
	public String getTimeStr() {
		if(getTime() != 0) {
			Date date = new Date(getTime()*1000);
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return sd.format(date);
		}
		return "";
	}
	public void setTimeStr(String timeStr) {
		this.timeStr = timeStr;
	}
	public String getTimereceivedStr() {
		if(getTimereceived() != 0) {
			Date date = new Date(getTimereceived()*1000);
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return sd.format(date);
		}
		return "";
	}
	public void setTimereceivedStr(String timereceivedStr) {
		this.timereceivedStr =timereceivedStr;
	}
	public long getTimereceived() {
		return timereceived;
	}
	public void setTimereceived(long timereceived) {
		this.timereceived = timereceived;
	}
	public JSONObject getDataobj() {
		if(StringUtils.isNotBlank(data)){
			if(data.indexOf("{")>-1){
				//转json结构
				JSONObject obj=JSON.parseObject(data);
				return obj.getJSONObject("json");
			}
		}
		return dataobj;
	}
	public void setDataobj(JSONObject dataobj) {
		this.dataobj = dataobj;
	}
	public boolean isOutchain() {
		return outchain;
	}
	public void setOutchain(boolean outchain) {
		this.outchain = outchain;
	}
	@Override
	public String toString() {
		return super.toString();
	}

}
