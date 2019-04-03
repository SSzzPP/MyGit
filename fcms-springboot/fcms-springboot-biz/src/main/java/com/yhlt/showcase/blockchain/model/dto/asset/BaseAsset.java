package com.yhlt.showcase.blockchain.model.dto.asset;
/**
 *
 * @author stone
 * @date 2018年3月5日 下午3:22:38
 */
public class BaseAsset {
	private String name;
	private double quantity;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getQuantity() {
		return quantity;
	}
	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}
	public boolean isFilled() {
		//name可以为空，表示原生资产
		/*if (name == null || "".equals(name)) {
			return false;
		}*/
		return true;
	}
	public BaseAsset() {
		super();
	}
	public BaseAsset(String name, double quantity) {
		super();
		this.name = name;
		this.quantity = quantity;
	}
}
