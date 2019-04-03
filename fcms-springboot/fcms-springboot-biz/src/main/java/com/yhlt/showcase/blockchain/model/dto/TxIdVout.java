package com.yhlt.showcase.blockchain.model.dto;
/**
 *
 */
public class TxIdVout {
	private String txid;
	private int vout;
	public String getTxid() {
		return txid;
	}
	public void setTxid(String txid) {
		this.txid = txid;
	}
	public int getVout() {
		return vout;
	}
	public void setVout(int vout) {
		this.vout = vout;
	}

}
