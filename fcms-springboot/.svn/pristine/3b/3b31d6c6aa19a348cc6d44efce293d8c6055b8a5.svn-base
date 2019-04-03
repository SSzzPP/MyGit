package com.yhlt.showcase.blockchain.model.dto.transaction;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Transient;

/**
 * 钱包交易详情
 * @author stone
 * @date 2018年3月6日 上午9:47:45
 */
public class WalletTransactionDetail extends WalletTransaction{
	private List<WalletTransactionVin> vin;
	private List<WalletTransactionVout> vout;
	private String hex;
	public List<WalletTransactionVin> getVin() {
		return vin;
	}
	public void setVin(List<WalletTransactionVin> vin) {
		this.vin = vin;
	}
	public List<WalletTransactionVout> getVout() {
		return vout;
	}
	public void setVout(List<WalletTransactionVout> vout) {
		this.vout = vout;
	}
	public String getHex() {
		return hex;
	}
	public void setHex(String hex) {
		this.hex = hex;
	}
	public WalletTransactionDetail() {
		super();
		vin=new ArrayList<>();
		vout=new ArrayList<>();
		hex="";
	}
	public WalletTransactionDetail(BaseTransaction base) {
		super(base);
		vin=new ArrayList<>();
		vout=new ArrayList<>();
		hex="";
	}
	public WalletTransactionDetail(WalletTransaction transaction) {
		super(transaction);
		vin=new ArrayList<>();
		vout=new ArrayList<>();
		hex="";
	}

}
