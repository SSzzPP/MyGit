package com.yhlt.showcase.venue.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * 场馆人员视图（有分类）
 * 
 * @author swy
 *
 */
@Entity
@Table(name = "v_fcms_venue_user_type")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class VenueUserTypeViewEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 名称
	 */
	private String name;
	
	/**
	 * 性别
	 */
	private Integer sex;
	
	/**
	 * 生日
	 */
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+08:00")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;
	
	/**
	 * 手机号
	 */
	private String mobile;
	
	/**
	 * 邮箱
	 */
	private String email;
	
	/**
	 * 健身场馆id
	 */
	private Long venueId;
	
	/**
	 * 类型
	 * （0：管理；1：教练；2：普通用户）
	 */
	private Long type;
	
	/**
	 * 状态
	 * （0;正常1：离职/0：未认证1：已认证）
	 */
	private Long status;
	
	/**
	 * 教练类型
	 */
	private Long coachingTypeId;
	/*@Formula("(select d.name from tc_system_dict d where d.id = coaching_type_id)")
	private String coachingTypeName;*/
	
	/**
	 * 头像地址
	 */
	private String imgUrl;
	
	/**
	 * 头像uuid
	 */
	private String uuid;
	
	/**
	 * 个人经历（用户是教练type=1）个性签名（普通用户type=2）
	 */
	private String experience;
	
	/**
	 * 钱包地址
	 */
	private String blockChainAddress;
	
	/**
	 * 积分总数
	 */
	private Long blockChainTotal;

	/**
	 * 场馆名称
	 */
	private String venueName;

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

	/**
	 * 多运动爱好（用户是教练type=1）擅长项目（普通用户type=2）
	 */
	private String goodSport;
	
	@Formula(value = "(select img.uuid from tm_image_main img where img.venue_id = id and img.delete_flag = 0 and img.module = 1 and img.img_type = 480 )")
	private String mainImageUuid;

	@Formula(value = "(select group_concat(img.uuid) from tm_image_main img where img.venue_id = id and img.delete_flag = 0 and img.module = 1 and img.img_type = 481 )")
	private String environmentImgUuids;
	/**
	 * 交通方式
	 */
	private String transportationMode;//TRANSPORTATION_MODE
	/**
	 * 器械租赁
	 */
	private String equipmentLease;//EQUIPMENT_LEASE
	/**
	 * 器械维护
	 */
	private String equipmentMaintenance;//EQUIPMENT_MAINTENANCE
	/**
	 * 洗浴设施
	 */
	private String scouringBath;//SCOURING_BATH
	/**
	 * 场馆卖品
	 */
	private String saleArticle;//SALE_ARTICLE
	/**
	 * 发票
	 */
	private String invoice;//INVOICE
	/**
	 * 其他服务
	 */
	private String otherServices;//OTHER_SERVICES
	/**
	 * 任教时间
	 */
	@Formula(value = "(select (case when YEAR(CURDATE())-year(cc.teach_start)>0 then concat(YEAR(CURDATE())-year(cc.teach_start),'年') when MONTH(CURDATE())-MONTH(cc.teach_start)>0 then concat(MONTH(CURDATE())-MONTH(cc.teach_start),'个月') when DAY(CURDATE())-DAY(cc.teach_start)>0 then concat(DAY(CURDATE())-DAY(cc.teach_start),'天') else '无' end) from tm_fcms_coach_certificate cc where cc.CREATE_BY_ID = id and cc.status = 1)")
	private String teachTimeStr;
	
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

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Long getVenueId() {
		return venueId;
	}

	public void setVenueId(Long venueId) {
		this.venueId = venueId;
	}

	public Long getType() {
		return type;
	}

	public void setType(Long type) {
		this.type = type;
	}

	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}

	public Long getCoachingTypeId() {
		return coachingTypeId;
	}

	public void setCoachingTypeId(Long coachingTypeId) {
		this.coachingTypeId = coachingTypeId;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public String getBlockChainAddress() {
		return blockChainAddress;
	}

	public void setBlockChainAddress(String blockChainAddress) {
		this.blockChainAddress = blockChainAddress;
	}

	public Long getBlockChainTotal() {
		return blockChainTotal;
	}

	public void setBlockChainTotal(Long blockChainTotal) {
		this.blockChainTotal = blockChainTotal;
	}

	public String getVenueName() {
		return venueName;
	}

	public void setVenueName(String venueName) {
		this.venueName = venueName;
	}

	public String getGoodSport() {
		return goodSport;
	}

	public void setGoodSport(String goodSport) {
		this.goodSport = goodSport;
	}

	public String getTeachTimeStr() {
		return teachTimeStr;
	}

	public void setTeachTimeStr(String teachTimeStr) {
		this.teachTimeStr = teachTimeStr;
	}

}
