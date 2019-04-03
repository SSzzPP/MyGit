package com.yhlt.showcase.venue.entity;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Formula;

import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * 健身设施
 * 
 * @author swy
 * 
 */
@Entity
@Table(name = "tm_fcms_venue_equipment_type")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class VenueEquipmentTypeEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7477552105341888956L;
	// 健身场馆id
	private Long venueId;
	@Formula("(select v.name from tm_fcms_venue_info v where v.id = venue_id)")
	private String venueName;
	// 设施名称
	private String name;
	// 分类id
	private Long typeId;
	@Formula("(select d.name from tc_system_dict d where d.id = type_id)")
	private String typeName;
	// 数量
	@NotNull(message = "数量不能为空")
	private Integer num;
	// 运营模式id
	private Long modeId;
	@Formula("(select d.name from tc_system_dict d where d.id = mode_id)")
	private String modeName;
	// 是否公共(0：是；1：不是)
	private Long publicFlag;
	// 所属街道
	private Long streetId;
	@Formula("(select d.name from tc_system_dict d where d.id = street_id)")
	private String streetName;
	// 位置
	private String location;
	// 百度地图坐标_经度
	private String lng;
	// 百度地图坐标_纬度
	private String lat;
	/**
	 * 营业时间
	 */
	private String businessHours;

	/**
	 * 项目描述
	 */
	private String description;
	/**
	 * 地板
	 */
	@Size(min = 0, max = 20, message = "地板最大长度限制20位")
	private String floor;
	/**
	 * 灯光
	 */
	@Size(min = 0, max = 20, message = "灯光最大长度限制20位")
	private String lighting;
	/**
	 * 休息区
	 */
	@Size(min = 0, max = 20, message = "休息区最大长度限制20位")
	private String restingArea;
	/**
	 * 场地图片Uuid字符串
	 */
	@Formula(value = "(select group_concat(img.uuid) from tm_image_main img where img.equipment_id = id and img.img_type = 481)")
	private String equipmentImgUuids;
	/**
	 * 顺序号（只有有图的健身路径才有顺序号）
	 */
	private Integer sortNumber;

	@Formula(value = "(select group_concat(img.uuid) from tm_image_main img where img.equipment_id = id and img.img_type = 480)")
	private String mainImgUuids;
	
	@Formula(value = "(select min(img.uuid) from tm_image_main img where img.equipment_id = id and img.delete_flag = 0 and img.module = 2 and img.img_type = 480)")
	private String mainImageUuid;

	public Long getVenueId() {
		return venueId;
	}

	public void setVenueId(Long venueId) {
		this.venueId = venueId;
	}

	public String getVenueName() {
		return venueName;
	}

	public void setVenueName(String venueName) {
		this.venueName = venueName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getTypeId() {
		return typeId;
	}

	public void setTypeId(Long typeId) {
		this.typeId = typeId;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getStreetName() {
		return streetName;
	}

	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	public Long getModeId() {
		return modeId;
	}

	public void setModeId(Long modeId) {
		this.modeId = modeId;
	}

	public Long getPublicFlag() {
		return publicFlag;
	}

	public void setPublicFlag(Long publicFlag) {
		this.publicFlag = publicFlag;
	}

	public Long getStreetId() {
		return streetId;
	}

	public void setStreetId(Long streetId) {
		this.streetId = streetId;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getModeName() {
		return modeName;
	}

	public void setModeName(String modeName) {
		this.modeName = modeName;
	}

	public String getBusinessHours() {
		return businessHours;
	}

	public void setBusinessHours(String businessHours) {
		this.businessHours = businessHours;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getFloor() {
		return floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}

	public String getLighting() {
		return lighting;
	}

	public void setLighting(String lighting) {
		this.lighting = lighting;
	}

	public String getRestingArea() {
		return restingArea;
	}

	public void setRestingArea(String restingArea) {
		this.restingArea = restingArea;
	}

	public String getEquipmentImgUuids() {
		return equipmentImgUuids;
	}

	public void setEquipmentImgUuids(String equipmentImgUuids) {
		this.equipmentImgUuids = equipmentImgUuids;
	}

	public Integer getSortNumber() {
		return sortNumber;
	}

	public void setSortNumber(Integer sortNumber) {
		this.sortNumber = sortNumber;
	}

	public String getMainImgUuids() {
		return mainImgUuids;
	}

	public void setMainImgUuids(String mainImgUuids) {
		this.mainImgUuids = mainImgUuids;
	}

	public String getMainImageUuid() {
		return mainImageUuid;
	}

	public void setMainImageUuid(String mainImageUuid) {
		this.mainImageUuid = mainImageUuid;
	}

}
