package com.yhlt.showcase.blockchain.model.dto;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yhlt.showcase.blockchain.model.dto.asset.BaseAsset;
/**
 * raw参数
 * @author stone
 * @date 2018年3月5日 下午3:25:49
 */
public class RawParam {
	private String address;
	private double amount=0;
	List<BaseAsset> assets;
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public List<BaseAsset> getAssets() {
		return assets;
	}
	public void setAssets(List<BaseAsset> assets) {
		this.assets = assets;
	}
	public boolean isFilled() {
		if (address == null || "".equals(address)) {
			return false;
		}
		if (amount != 0.0) {
			return true;
		} else {
			if (assets == null || assets.size() == 0) {
				return false;
			}
			boolean assetReturn = false;
			for (BaseAsset asset : assets) {
				assetReturn = assetReturn || asset.isFilled();
			}
		}

		return true;
	}

	public Object getValue() {
		if (amount != 0.0) {
			return amount;
		} else {
			Map<String, Double> filledAssets = new HashMap<String, Double>();
			if (assets != null && assets.size() != 0) {
				for (BaseAsset asset : assets) {
					if (asset.isFilled()) {
						filledAssets.put(asset.getName(), new Double(asset.getQuantity()));
					}
				}
			}
			return filledAssets;
		}
	}
}
