package com.yhlt.showcase.blockchain.model.dto.transaction;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author stone
 * @date 2018年3月5日 下午4:39:20
 */
public abstract class GeneralTransaction extends BaseTransaction{
	double amount;
	double fee;
	List<String> walletconflicts;
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public double getFee() {
		return fee;
	}
	public void setFee(double fee) {
		this.fee = fee;
	}
	public List<String> getWalletconflicts() {
		return walletconflicts;
	}
	public void setWalletconflicts(List<String> walletconflicts) {
		this.walletconflicts = walletconflicts;
	}
	public GeneralTransaction() {
		super();
		walletconflicts=new ArrayList<String>();
	}
	public GeneralTransaction(BaseTransaction baseTransaction) {
		super(baseTransaction);
		walletconflicts=new ArrayList<String>();
	}

}
