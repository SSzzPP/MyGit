package com.yhlt.showcase.blockchain.model.dto.transaction;

import java.util.ArrayList;
import java.util.List;

import com.yhlt.showcase.blockchain.model.dto.balance.BalanceAsset;
import com.yhlt.showcase.blockchain.model.dto.script.ScriptPubKey;
/**
 *
 * @author stone
 * @date 2018年3月5日 下午4:50:38
 */
public class TxOut {
	String bestblock;
	long confirmations;
	double value;
	ScriptPubKey scriptPubKey;
	long version;
	boolean coinbase;
	List<BalanceAsset> assets;

	public TxOut() {
		super();
		scriptPubKey=new ScriptPubKey();
		assets=new ArrayList<BalanceAsset>();
	}
	public String getBestblock() {
		return bestblock;
	}
	public void setBestblock(String bestblock) {
		this.bestblock = bestblock;
	}
	public long getConfirmations() {
		return confirmations;
	}
	public void setConfirmations(long confirmations) {
		this.confirmations = confirmations;
	}
	public double getValue() {
		return value;
	}
	public void setValue(double value) {
		this.value = value;
	}
	public ScriptPubKey getScriptPubKey() {
		return scriptPubKey;
	}
	public void setScriptPubKey(ScriptPubKey scriptPubKey) {
		this.scriptPubKey = scriptPubKey;
	}
	public long getVersion() {
		return version;
	}
	public void setVersion(long version) {
		this.version = version;
	}
	public boolean isCoinbase() {
		return coinbase;
	}
	public void setCoinbase(boolean coinbase) {
		this.coinbase = coinbase;
	}
	public List<BalanceAsset> getAssets() {
		return assets;
	}
	public void setAssets(List<BalanceAsset> assets) {
		this.assets = assets;
	}

}
