package com.yhlt.showcase.blockchain.model.dto.datamod;
/**
 * 数据模块信息
 * @author stone
 * @date 2018年3月4日 上午11:11:55
 */
public class DataMod {
	private String name;
	private String setuptxid;
	private String datamodref;
	private boolean open;
	private Object details;
	private boolean ordered;
	private boolean synchronized_;
	private int items;
	private int confirmed;
	private int keys;
	private int senditemers;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSetuptxid() {
		return setuptxid;
	}
	public void setSetuptxid(String setuptxid) {
		this.setuptxid = setuptxid;
	}
	public String getDatamodref() {
		return datamodref;
	}
	public void setDatamodref(String datamodref) {
		this.datamodref = datamodref;
	}
	public boolean isOpen() {
		return open;
	}
	public void setOpen(boolean open) {
		this.open = open;
	}
	public Object getDetails() {
		return details;
	}
	public void setDetails(Object details) {
		this.details = details;
	}
	public boolean isOrdered() {
		return ordered;
	}
	public void setOrdered(boolean ordered) {
		this.ordered = ordered;
	}
	public boolean isSynchronized_() {
		return synchronized_;
	}
	public void setSynchronized_(boolean synchronized_) {
		this.synchronized_ = synchronized_;
	}
	public int getItems() {
		return items;
	}
	public void setItems(int items) {
		this.items = items;
	}
	public int getConfirmed() {
		return confirmed;
	}
	public void setConfirmed(int confirmed) {
		this.confirmed = confirmed;
	}
	public int getKeys() {
		return keys;
	}
	public void setKeys(int keys) {
		this.keys = keys;
	}
	public int getSenditemers() {
		return senditemers;
	}
	public void setSenditemers(int senditemers) {
		this.senditemers = senditemers;
	}

}
