package com.yhlt.showcase.blockchain.model.dto.address;

import com.yhlt.showcase.blockchain.utils.ParameterUtil;

/**
 * @author stone
 */
public class AddressBalanceCurrency implements AddressBalance {
	String address;
	double currencyValue;

	public AddressBalanceCurrency() {
	}

	public void validate() throws Exception {
		ParameterUtil.isNotNullOrEmpty("address", address);
		ParameterUtil.valueIsNotNegative("currency value", currencyValue);
	}

	public Double getValue() {
		return new Double(currencyValue);
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
	 * @return the currencyValue
	 */
	public double getCurrencyValue() {
		return currencyValue;
	}

	/**
	 * @param currencyValue the currencyValue to set
	 */
	public void setCurrencyValue(double currencyValue) {
		this.currencyValue = currencyValue;
	}



}
