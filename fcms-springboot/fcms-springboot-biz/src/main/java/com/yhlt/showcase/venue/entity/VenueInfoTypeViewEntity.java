package com.yhlt.showcase.venue.entity;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * 场馆视图（有分类）
 * 
 * @author gs
 *
 */
@Entity
@Table(name = "v_fcms_venue_info_type")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class VenueInfoTypeViewEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 名称
	 */
	private String name;

	/**
	 * 电话
	 */
	private String tel;

	/**
	 * 地址
	 */
	private String location;

	/**
	 * 经度
	 */
	private String lng;

	/**
	 * 纬度
	 */
	private String lat;

	/**
	 * 别名
	 */
	private String otherName;

	/**
	 * 营业时间
	 */
	private String businessHours;

	/**
	 * 描述
	 */
	private String description;

	/**
	 * 星级
	 */
	private String star;

	/**
	 * 人均
	 */
	private String perCapita;

	/**
	 * 统一社会信用代码
	 */
	private String creditCode;

	/**
	 * 所属单位
	 */
	private String unit;

	/**
	 * 所在商区
	 */
	private Long businessArea;

	/**
	 * 所在行政区
	 */
	private Long administrativeArea;

	/**
	 * 认证状态
	 */
	private Long certificationStatus;
	/**
	 * 分类
	 */
	private Long typeId;

	@Formula(value = "(select img.uuid from tm_image_main img where img.venue_id = id and img.delete_flag = 0 and img.module = 1 and img.img_type = 480 )")
	private String mainImageUuid;

	@Formula(value = "(select group_concat(img.uuid) from tm_image_main img where img.venue_id = id and img.delete_flag = 0 and img.module = 1 and img.img_type = 481 )")
	private String environmentImgUuids;
	
	private String transportationMode;//TRANSPORTATION_MODE
	
	private String equipmentLease;//EQUIPMENT_LEASE
	
	private String equipmentMaintenance;//EQUIPMENT_MAINTENANCE
	
	private String scouringBath;//SCOURING_BATH
	
	private String saleArticle;//SALE_ARTICLE
	
	private String invoice;//INVOICE
	
	private String otherServices;//OTHER_SERVICES
	
	/**
	 * 注意事项
	 */
	private String attendtion;
	
	/**
	 * 温馨提示
	 */
	private String tips;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
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

	public String getOtherName() {
		return otherName;
	}

	public void setOtherName(String otherName) {
		this.otherName = otherName;
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

	public String getStar() {
		return star;
	}

	public void setStar(String star) {
		this.star = star;
	}

	public String getPerCapita() {
		return perCapita;
	}

	public void setPerCapita(String perCapita) {
		this.perCapita = perCapita;
	}

	public String getCreditCode() {
		return creditCode;
	}

	public void setCreditCode(String creditCode) {
		this.creditCode = creditCode;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Long getBusinessArea() {
		return businessArea;
	}

	public void setBusinessArea(Long businessArea) {
		this.businessArea = businessArea;
	}

	public Long getAdministrativeArea() {
		return administrativeArea;
	}

	public void setAdministrativeArea(Long administrativeArea) {
		this.administrativeArea = administrativeArea;
	}

	public Long getCertificationStatus() {
		return certificationStatus;
	}

	public void setCertificationStatus(Long certificationStatus) {
		this.certificationStatus = certificationStatus;
	}

	public Long getTypeId() {
		return typeId;
	}

	public void setTypeId(Long typeId) {
		this.typeId = typeId;
	}

	public String getMainImageUuid() {
		return mainImageUuid;
	}

	public void setMainImageUuid(String mainImageUuid) {
		this.mainImageUuid = mainImageUuid;
	}

	public String getEnvironmentImgUuids() {
		return environmentImgUuids;
	}

	public void setEnvironmentImgUuids(String environmentImgUuids) {
		this.environmentImgUuids = environmentImgUuids;
	}

	public String getTransportationMode() {
		return transportationMode;
	}

	public void setTransportationMode(String transportationMode) {
		this.transportationMode = transportationMode;
	}

	public String getEquipmentLease() {
		return equipmentLease;
	}

	public void setEquipmentLease(String equipmentLease) {
		this.equipmentLease = equipmentLease;
	}

	public String getEquipmentMaintenance() {
		return equipmentMaintenance;
	}

	public void setEquipmentMaintenance(String equipmentMaintenance) {
		this.equipmentMaintenance = equipmentMaintenance;
	}

	public String getScouringBath() {
		return scouringBath;
	}

	public void setScouringBath(String scouringBath) {
		this.scouringBath = scouringBath;
	}

	public String getSaleArticle() {
		return saleArticle;
	}

	public void setSaleArticle(String saleArticle) {
		this.saleArticle = saleArticle;
	}

	public String getInvoice() {
		return invoice;
	}

	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}

	public String getOtherServices() {
		return otherServices;
	}

	public void setOtherServices(String otherServices) {
		this.otherServices = otherServices;
	}
	
	public String getAttendtion() {
		return attendtion;
	}

	public void setAttendtion(String attendtion) {
		this.attendtion = attendtion;
	}

	public String getTips() {
		return tips;
	}

	public void setTips(String tips) {
		this.tips = tips;
	}


}
