package com.yhlt.showcase.blockchain.model.dto.transaction;

import java.util.ArrayList;
import java.util.List;

import com.yhlt.showcase.blockchain.model.dto.permission.Permission;


/**
 *
 * @author stone
 * @date 2018年3月6日 上午9:53:09
 */
public class WalletTransactionVout extends WalletTransactionVInfo{
	long n;
	List<Permission> permissions;
	public WalletTransactionVout() {
		super();
		permissions = new ArrayList<Permission>();
	}
	public WalletTransactionVout(WalletTransactionVInfo info) {
		super(info);
		permissions = new ArrayList<Permission>();
	}
	public long getN() {
		return n;
	}
	public void setN(long n) {
		this.n = n;
	}
	public List<Permission> getPermissions() {
		return permissions;
	}
	public void setPermissions(List<Permission> permissions) {
		this.permissions = permissions;
	}

}
