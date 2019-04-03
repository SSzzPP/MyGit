package com.yhlt.showcase.blockchain.model.dto.deal;

import java.util.ArrayList;
import java.util.List;

import com.yhlt.showcase.blockchain.model.dto.Item;
import com.yhlt.showcase.blockchain.model.dto.balance.BalanceAsset;
import com.yhlt.showcase.blockchain.model.dto.permission.Permission;
import com.yhlt.showcase.blockchain.model.dto.script.ScriptPubKey;

/**
 *
 * @author stone
 * @date 2018年3月5日 上午10:23:58
 */
public class DealRAWVout {
	private double value;
	private long n;
	private ScriptPubKey scriptPubKey;
	private List<BalanceAsset> assets;
	private List<Permission> permissions;
	private List<Item> items;
	public double getValue() {
		return value;
	}
	public void setValue(double value) {
		this.value = value;
	}
	public long getN() {
		return n;
	}
	public void setN(long n) {
		this.n = n;
	}
	public ScriptPubKey getScriptPubKey() {
		return scriptPubKey;
	}
	public void setScriptPubKey(ScriptPubKey scriptPubKey) {
		this.scriptPubKey = scriptPubKey;
	}
	public List<BalanceAsset> getAssets() {
		return assets;
	}
	public void setAssets(List<BalanceAsset> assets) {
		this.assets = assets;
	}
	public List<Permission> getPermissions() {
		return permissions;
	}
	public void setPermissions(List<Permission> permissions) {
		this.permissions = permissions;
	}
	public List<Item> getItems() {
		return items;
	}
	public void setItems(List<Item> items) {
		this.items = items;
	}
	public DealRAWVout() {
		super();
		scriptPubKey = new ScriptPubKey();
		assets = new ArrayList<BalanceAsset>();
		permissions = new ArrayList<Permission>();
		items = new ArrayList<Item>();
	}

}
