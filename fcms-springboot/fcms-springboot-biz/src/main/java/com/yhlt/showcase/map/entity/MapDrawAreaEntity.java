package com.yhlt.showcase.map.entity;

import com.yhlt.showcase.base.entity.BaseEntity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Formula;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;

/**
 * @Description: 绘制区域 Entity
 * @author swy
 * @date 2018-08-22 14:47
 */
@Entity
@Table(name = "tm_fcms_map_draw_area")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class MapDrawAreaEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1699601977784769336L;
	/**
	 * 区域名称
	 */
	@NotNull(message = "区域名称不能为空")
	private String areaName;
	/**
	 * 坐标点字符串
	 */
	@NotNull(message = "区域绘制不能为空")
	private String points;
	/**
	 * 坐标数量
	 */
	private String pointsNumber;
	/**
	 * 巡查路线坐标点字符串
	 */
	@NotNull(message = "巡查路线不能为空")
	private String linePoints;
	/**
	 * 负责人id
	 */
	private Long userId;
	@Formula("(select vu.name from tm_fcms_venue_user vu where vu.id = user_id)")
	private String venueUserName;
	/**
	 * 负责人编号
	 */
	private String userNumber;
	/**
	 * 负责人姓名
	 */
	private String userName;
	/**
	 * 职位
	 */
	private String position;
	/**
	 * 部门
	 */
	private String department;
	/**
	 * 电话
	 */
	private String tel;
	/**
	 * 头像地址
	 */
	private String headImgUrl;
	/**
	 * 地图绘图样式id
	 */
	private Long mapStyleId;
	
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public String getPoints() {
		return points;
	}
	public void setPoints(String points) {
		this.points = points;
	}
	public String getPointsNumber() {
		return pointsNumber;
	}
	public void setPointsNumber(String pointsNumber) {
		this.pointsNumber = pointsNumber;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(String userNumber) {
		this.userNumber = userNumber;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getHeadImgUrl() {
		return headImgUrl;
	}
	public void setHeadImgUrl(String headImgUrl) {
		this.headImgUrl = headImgUrl;
	}
	public Long getMapStyleId() {
		return mapStyleId;
	}
	public void setMapStyleId(Long mapStyleId) {
		this.mapStyleId = mapStyleId;
	}
	public String getLinePoints() {
		return linePoints;
	}
	public void setLinePoints(String linePoints) {
		this.linePoints = linePoints;
	}
	public String getVenueUserName() {
		return venueUserName;
	}
	public void setVenueUserName(String venueUserName) {
		this.venueUserName = venueUserName;
	}

}

