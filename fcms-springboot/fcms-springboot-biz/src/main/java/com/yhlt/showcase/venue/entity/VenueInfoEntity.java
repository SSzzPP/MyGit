package com.yhlt.showcase.venue.entity;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Formula;

import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * @Description: 场馆管理 Entity
 * @author linannan
 * @date 2018-07-20 11:09
 */
@Entity
@Table(name = "tm_fcms_venue_info")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class VenueInfoEntity extends BaseEntity<Long> {

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

	@Formula("(select d.name from tc_system_dict d where d.id = business_area)")
	private String businessAreaStr;

	@Formula("(select d.name from tc_system_dict d where d.id = administrative_area)")
	private String administrativeAreaStr;

	@Formula("(select d.name from tc_system_dict d where d.id = certification_status)")
	private String certificationStatusStr;
	/**
	 * 认证状态
	 */
	private Long certificationStatus;

	/**
	 * 交通方式
	 */
	@Size(min = 0, max = 500, message = "交通方式最大长度限制500位")
	private String transportationMode;
	/**
	 * 器械租赁
	 */
	@Size(min = 0, max = 20, message = "器械租赁最大长度限制20位")
	private String equipmentLease;
	/**
	 * 器械维护
	 */
	@Size(min = 0, max = 20, message = "器械维护最大长度限制20位")
	private String equipmentMaintenance;
	/**
	 * 洗浴设施
	 */
	@Size(min = 0, max = 20, message = "洗浴设施最大长度限制20位")
	private String scouringBath;
	/**
	 * 场馆卖品
	 */
	@Size(min = 0, max = 20, message = "场馆卖品最大长度限制20位")
	private String saleArticle;
	/**
	 * 发票
	 */
	@Size(min = 0, max = 20, message = "发票最大长度限制20位")
	private String invoice;
	/**
	 * 其他服务
	 */
	@Size(min = 0, max = 20, message = "其他服务最大长度限制50位")
	private String otherServices;
	/**
	 * 首页图
	 */
	@Formula(value = "(select img.uuid from tm_image_main img where img.venue_id = id and img.delete_flag = 0 and img.module = 1 and img.img_type = 480 )")
	private String mainImageUuid;
	/**
	 * 环境图
	 */
	@Formula(value = "(select group_concat(img.uuid) from tm_image_main img where img.venue_id = id and img.delete_flag = 0 and img.module = 1 and img.img_type = 481 )")
	private String environmentImgUuids;
	/**
	 * 营业执照图
	 */
	@Formula(value = "(select group_concat(img.uuid) from tm_image_main img where img.venue_id = id and img.delete_flag = 0 and img.module = 1 and img.img_type = 482 )")
	private String licenseImgUuids;
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

	public String getBusinessAreaStr() {
		return businessAreaStr;
	}

	public void setBusinessAreaStr(String businessAreaStr) {
		this.businessAreaStr = businessAreaStr;
	}

	public String getAdministrativeAreaStr() {
		return administrativeAreaStr;
	}

	public void setAdministrativeAreaStr(String administrativeAreaStr) {
		this.administrativeAreaStr = administrativeAreaStr;
	}

	public String getCertificationStatusStr() {
		return certificationStatusStr;
	}

	public void setCertificationStatusStr(String certificationStatusStr) {
		this.certificationStatusStr = certificationStatusStr;
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

	public String getLicenseImgUuids() {
		return licenseImgUuids;
	}

	public void setLicenseImgUuids(String licenseImgUuids) {
		this.licenseImgUuids = licenseImgUuids;
	}

}
