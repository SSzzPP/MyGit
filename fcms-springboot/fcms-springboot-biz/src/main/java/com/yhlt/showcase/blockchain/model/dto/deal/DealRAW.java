package com.yhlt.showcase.blockchain.model.dto.deal;

import java.util.List;
/**
 *
 * @author stone
 * @date 2018年3月5日 上午10:27:02
 */
public class DealRAW {
	String txid;
	int version;
	long locktime;
	List<DealRAWVin> vin;
	List<DealRAWVout> vout;
	List<String> data;
	public String getTxid() {
		return txid;
	}
	public void setTxid(String txid) {
		this.txid = txid;
	}
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	public long getLocktime() {
		return locktime;
	}
	public void setLocktime(long locktime) {
		this.locktime = locktime;
	}
	public List<DealRAWVin> getVin() {
		return vin;
	}
	public void setVin(List<DealRAWVin> vin) {
		this.vin = vin;
	}
	public List<DealRAWVout> getVout() {
		return vout;
	}
	public void setVout(List<DealRAWVout> vout) {
		this.vout = vout;
	}
	public List<String> getData() {
		return data;
	}
	public void setData(List<String> data) {
		this.data = data;
	}

}
