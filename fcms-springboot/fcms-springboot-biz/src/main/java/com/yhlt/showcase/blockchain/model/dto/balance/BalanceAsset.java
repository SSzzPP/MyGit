package com.yhlt.showcase.blockchain.model.dto.balance;

import java.util.ArrayList;
import java.util.List;

import com.yhlt.showcase.blockchain.model.dto.asset.BaseBalanceAsset;
/**
 *
 * @author stone
 * @date 2018年3月5日 上午10:18:12
 */
public class BalanceAsset extends BaseBalanceAsset{
	String assetref;
	long multiple;
	double units;
	boolean open;
	Object details;
	String type;
	long raw;
	String selltxid;
	List<String> addresses = new ArrayList<String>();
	boolean sell;
	public String getAssetref() {
		return assetref;
	}
	public void setAssetref(String assetref) {
		this.assetref = assetref;
	}
	public long getMultiple() {
		return multiple;
	}
	public void setMultiple(long multiple) {
		this.multiple = multiple;
	}
	public double getUnits() {
		return units;
	}
	public void setUnits(double units) {
		this.units = units;
	}
	public boolean isOpen() {
		return open;
	}
	public void setOpen(boolean open) {
		this.open = open;
	}
	public Object getDetails() {
		return details;
	}
	public void setDetails(Object details) {
		this.details = details;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public long getRaw() {
		return raw;
	}
	public void setRaw(long raw) {
		this.raw = raw;
	}
	public String getSelltxid() {
		return selltxid;
	}
	public void setSelltxid(String selltxid) {
		this.selltxid = selltxid;
	}
	public List<String> getAddresses() {
		return addresses;
	}
	public void setAddresses(List<String> addresses) {
		this.addresses = addresses;
	}
	public boolean isSell() {
		return sell;
	}
	public void setSell(boolean sell) {
		this.sell = sell;
	}

}
