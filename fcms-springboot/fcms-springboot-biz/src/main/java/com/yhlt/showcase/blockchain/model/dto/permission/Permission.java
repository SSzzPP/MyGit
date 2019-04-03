package com.yhlt.showcase.blockchain.model.dto.permission;
/**
 *
 * @author stone
 * @date 2018年3月5日 下午5:10:59
 */
public class Permission {
	String address;
	String type;
	long startblock;
	long endblock;
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public long getStartblock() {
		return startblock;
	}
	public void setStartblock(long startblock) {
		this.startblock = startblock;
	}
	public long getEndblock() {
		return endblock;
	}
	public void setEndblock(long endblock) {
		this.endblock = endblock;
	}
}
