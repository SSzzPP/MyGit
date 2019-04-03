package com.yhlt.showcase.blockchain.model.dto.address;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yhlt.showcase.blockchain.model.dto.asset.BaseBalanceAsset;
import com.yhlt.showcase.blockchain.utils.ParameterUtil;
/**
 *
 * @author stone
 * @date 2018年3月5日 上午10:52:34
 */
public class AddressBalanceAsset implements AddressBalance {
	String address;
	List<BaseBalanceAsset> assets;

	public AddressBalanceAsset() {
		assets = new ArrayList<BaseBalanceAsset>();
	}

	public void validate() throws Exception {
		ParameterUtil.isNotNullOrEmpty("address", address);
		for (BaseBalanceAsset asset : assets) {
			asset.validate();
		}
	}

	public Map<String, Double> getValue() throws Exception {
		Map<String, Double> mapAssets = new HashMap<String, Double>();
		for (BaseBalanceAsset asset : assets) {
			asset.validate();
			mapAssets.put(asset.getName(), new Double(asset.getQty()));
		}
		return mapAssets;
	}


	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the assets
	 */
	public List<BaseBalanceAsset> getAssets() {
		return assets;
	}

	/**
	 * @param assets the assets to set
	 */
	public void setAssets(List<BaseBalanceAsset> assets) {
		this.assets = assets;
	}

	public void addAsset(BaseBalanceAsset asset) {
		if (asset != null) {
			this.assets.add(asset);
		}
	}


}
