package com.yhlt.showcase.blockchain.model.dto.asset;

import com.yhlt.showcase.blockchain.utils.ParameterUtil;

/**
 * 简化版balanceasset
 * @author stone
 * @date 2018年3月4日 下午1:50:23
 */
public class BaseBalanceAsset {
	private String name;
	private String assetref;
	private double qty;
	private long raw;

	public void validate() throws Exception {
		ParameterUtil.valueIsPositive("qty", getQty());
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAssetref() {
		return assetref;
	}
	public void setAssetref(String assetref) {
		this.assetref = assetref;
	}
	public double getQty() {
		return qty;
	}
	public void setQty(double qty) {
		this.qty = qty;
	}
	public long getRaw() {
		return raw;
	}
	public void setRaw(long raw) {
		this.raw = raw;
	}
	@Override
	public String toString() {
		return "BaseBalanceAsset [name=" + name + ", assetref=" + assetref + ", qty=" + qty + ", raw=" + raw + "]";
	}

}
