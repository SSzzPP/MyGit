package com.yhlt.showcase.map.entity;

import com.yhlt.showcase.base.entity.BaseEntity;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;

/**
 * @Description: 地图绘制样式 Entity
 * @author swy
 * @date 2018-08-22 15:05
 */
@Entity
@Table(name = "tm_fcms_map_draw_style")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class MapDrawStyleEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7477552105341888956L;
	/**
	 * 
	 */
	private Integer sortNumber;
	/**
	 * 边线粗细
	 */
	private Integer strokeWeight;
	/**
	 * 边线透明度
	 */
	private Double strokeOpacity;
	/**
	 * 填充透明度
	 */
	private Double fillOpacity;
	/**
	 * 填充色
	 */
	private String fillColor;
	/**
	 * 边线颜色
	 */
	private String strokeColor;
	/**
	 * 边线样式
	 */
	private String strokeStyle;
	
	public Integer getSortNumber() {
		return sortNumber;
	}
	public void setSortNumber(Integer sortNumber) {
		this.sortNumber = sortNumber;
	}
	public Integer getStrokeWeight() {
		return strokeWeight;
	}
	public void setStrokeWeight(Integer strokeWeight) {
		this.strokeWeight = strokeWeight;
	}
	public Double getStrokeOpacity() {
		return strokeOpacity;
	}
	public void setStrokeOpacity(Double strokeOpacity) {
		this.strokeOpacity = strokeOpacity;
	}
	public Double getFillOpacity() {
		return fillOpacity;
	}
	public void setFillOpacity(Double fillOpacity) {
		this.fillOpacity = fillOpacity;
	}
	public String getFillColor() {
		return fillColor;
	}
	public void setFillColor(String fillColor) {
		this.fillColor = fillColor;
	}
	public String getStrokeColor() {
		return strokeColor;
	}
	public void setStrokeColor(String strokeColor) {
		this.strokeColor = strokeColor;
	}
	public String getStrokeStyle() {
		return strokeStyle;
	}
	public void setStrokeStyle(String strokeStyle) {
		this.strokeStyle = strokeStyle;
	}

}

