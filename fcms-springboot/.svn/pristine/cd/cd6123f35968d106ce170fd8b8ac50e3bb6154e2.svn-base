package com.yhlt.showcase.blockchain.model.dto.transaction;

import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author stone
 * @date 2018年3月5日 下午4:40:28
 */
public class Transaction extends GeneralTransaction{
	List<TransactionDetail> details;
	String hex;
	public List<TransactionDetail> getDetails() {
		return details;
	}
	public void setDetails(List<TransactionDetail> details) {
		this.details = details;
	}
	public String getHex() {
		return hex;
	}
	public void setHex(String hex) {
		this.hex = hex;
	}
	public Transaction() {
		super();
		details = new ArrayList<TransactionDetail>();
	}
	public Transaction(BaseTransaction BaseTransaction) {
		super(BaseTransaction);
		details = new ArrayList<TransactionDetail>();
	}

}
