package com.yhlt.showcase.blockchain.model.dto;

import java.util.HashMap;
import java.util.List;

import com.yhlt.showcase.blockchain.model.dto.asset.BaseBalanceAsset;


/**
 *
 * @author stone
 * @date 2018年3月4日 下午1:54:34
 */
public class MultiBalance extends HashMap<String, List<BaseBalanceAsset>>{

	/**
	 *
	 */
	private static final long serialVersionUID = -4668772192636352274L;
	@Override
	public String toString() {
		String multiBalance = "MultiBalance [";
		for (String key : this.keySet()) {
			multiBalance += key + ":";

			List<BaseBalanceAsset> listBalanceAsset = this.get(key);
			for (BaseBalanceAsset balanceAsset : listBalanceAsset) {
				multiBalance += balanceAsset.toString() + ",";
			}
		}
		multiBalance += "]";

		return multiBalance;
	}
}
