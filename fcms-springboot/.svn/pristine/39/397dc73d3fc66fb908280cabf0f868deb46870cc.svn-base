package com.yhlt.showcase.blockchain.model.dto.transaction;

import java.util.ArrayList;
import java.util.List;

import com.yhlt.showcase.blockchain.model.dto.balance.BalanceAsset;
/**
 *
 * @author stone
 * @date 2018年3月5日 下午5:11:59
 */
public class WalletTransactionVInfo {
	List<String> addresses;
	String type;
	boolean ismine;
	boolean iswatchonly;
	List<BalanceAsset> assets;
	double amount;

	public WalletTransactionVInfo() {
		super();
		addresses = new ArrayList<String>();
		assets = new ArrayList<BalanceAsset>();
		type = "";
	}
	public WalletTransactionVInfo(WalletTransactionVInfo info) {
		this.addresses = info.getAddresses();
		this.type = info.getType();
		this.ismine = info.isIsmine();
		this.iswatchonly = info.isIswatchonly();
		this.assets = info.getAssets();
	}
	public List<String> getAddresses() {
		return addresses;
	}
	public void setAddresses(List<String> addresses) {
		this.addresses = addresses;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public boolean isIsmine() {
		return ismine;
	}
	public void setIsmine(boolean ismine) {
		this.ismine = ismine;
	}
	public boolean isIswatchonly() {
		return iswatchonly;
	}
	public void setIswatchonly(boolean iswatchonly) {
		this.iswatchonly = iswatchonly;
	}
	public List<BalanceAsset> getAssets() {
		return assets;
	}
	public void setAssets(List<BalanceAsset> assets) {
		this.assets = assets;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}

}
