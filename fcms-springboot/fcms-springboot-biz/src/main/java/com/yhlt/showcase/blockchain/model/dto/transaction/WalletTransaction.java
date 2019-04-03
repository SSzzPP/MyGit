package com.yhlt.showcase.blockchain.model.dto.transaction;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Transient;

import com.yhlt.showcase.blockchain.model.dto.Item;
import com.yhlt.showcase.blockchain.model.dto.balance.Balance;
import com.yhlt.showcase.blockchain.model.dto.balance.BalanceAsset;
import com.yhlt.showcase.blockchain.model.dto.permission.PermissionDetail;

/**
 * 交易
 * @author stone
 * @date 2018年3月5日 下午4:13:24
 */
public class WalletTransaction extends BaseTransaction{
	private Balance balance;
	private List<String> myaddresses;
	private List<String> addresses;
	private List<PermissionDetail> permissions;
	private BalanceAsset sell;
	private List<String> data;
	private List<Item> items;
	@Transient
	private String timeStr;
	@Transient
	private String blocktimeStr;
	public WalletTransaction() {
		super();
		balance = new Balance();
		myaddresses = new ArrayList<String>();
		addresses = new ArrayList<String>();
		permissions = new ArrayList<PermissionDetail>();
		sell = new BalanceAsset();
		data = new ArrayList<String>();
		items = new ArrayList<>();
	}
	public WalletTransaction(WalletTransaction transaction) {
		super(transaction);
		balance = transaction.getBalance();
		myaddresses = transaction.getAddresses();
		addresses = transaction.getAddresses();
		permissions = transaction.getPermissions();
		sell = transaction.getsell();
		data = transaction.getData();
		items = transaction.getItems();
	}

	public WalletTransaction(BaseTransaction base) {
		super(base);
		balance = new Balance();
		myaddresses = new ArrayList<String>();
		addresses = new ArrayList<String>();
		permissions = new ArrayList<PermissionDetail>();
		sell = new BalanceAsset();
		data = new ArrayList<String>();
		items = new ArrayList<>();
	}
	public Balance getBalance() {
		return balance;
	}
	public void setBalance(Balance balance) {
		this.balance = balance;
	}
	public List<String> getMyaddresses() {
		return myaddresses;
	}
	public void setMyaddresses(List<String> myaddresses) {
		this.myaddresses = myaddresses;
	}
	public List<String> getAddresses() {
		return addresses;
	}
	public void setAddresses(List<String> addresses) {
		this.addresses = addresses;
	}
	public List<PermissionDetail> getPermissions() {
		return permissions;
	}
	public void setPermissions(List<PermissionDetail> permissions) {
		this.permissions = permissions;
	}
	public BalanceAsset getsell() {
		return sell;
	}
	public void setsell(BalanceAsset sell) {
		this.sell = sell;
	}
	public List<String> getData() {
		return data;
	}
	public void setData(List<String> data) {
		this.data = data;
	}
	public List<Item> getItems() {
		return items;
	}
	public void setItems(List<Item> items) {
		this.items = items;
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
	public String getBlocktimeStr() {
		if(getBlocktime() != 0) {
			Date date = new Date(getBlocktime()*1000);
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return sd.format(date);
		}
		return "";
	}
	public void setBlocktimeStr(String blocktimeStr) {
		this.blocktimeStr = blocktimeStr;
	}
	
}
