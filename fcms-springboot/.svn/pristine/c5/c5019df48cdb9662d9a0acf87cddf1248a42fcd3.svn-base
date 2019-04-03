package com.yhlt.showcase.venue.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.yhlt.showcase.base.entity.BaseEntity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Formula;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

/**
 * @Description: 场馆人员管理 Entity
 * @author swy
 * @date 2018-07-24 14:24
 */
@Entity
@Table(name = "TM_FCMS_VENUE_USER")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class VenueUserEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
//	@NotNull(message = "用户名不能为空")
//	@Size(min = 2, max = 20, message = "用户名长度限制2-20位")
	private String loginName;
	// 不显示在Restful接口的属性.
//	@NotNull(message = "密码不能为空")
//	@Size(min = 3, max = 32, message = "密码长度限制3-32位")
//	@JsonIgnore
	private String password;
//	@NotNull(message = "真实姓名不能为空")
//	@Size(min = 2, max = 12, message = "真实姓名长度限制2-12位")
	private String name;
	@NotNull(message = "性别不能为空")
	private Integer sex;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+08:00")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;
//	@NotNull(message = "手机号不能为空")
//	@Size(min= 11, max = 11, message = "手机号不正确")
	private String mobile;
	private String email;
	//健身场馆id
	private Long venueId;
	@Formula("(select v.name from tm_fcms_venue_info v where v.id = venue_id)")
	private String venueName;
	//类型（0：管理；1：教练；2：普通用户）
	private Long type;
	//状态（0;正常1：离职/0：未认证1：已认证）
	private Long status;
	//教练类型（暂不明确含义）
	private Long coachingTypeId;
	@Formula("(select d.name from tc_system_dict d where d.id = coaching_type_id)")
	private String coachingTypeName;
	//头像地址
	private String imgUrl;
	//头像uuid
	private String uuid;
	//个人经历（用户是教练type=1）个性签名（普通用户type=2）
	private String experience;
	//钱包地址
	private String blockChainAddress;
	//积分总数
	private Long blockChainTotal;
	//个人履历
	@JsonIgnore
	@OneToMany(mappedBy="venueUserId",fetch=FetchType.LAZY,cascade = CascadeType.REMOVE)
	private Set<VenueUserRecordEntity> userRecordEntities;
	
	//用户所在街道
	private String street;
	
	//在市北用户id
	private String zsbAppId;
	/**
	 * 免打扰  0关闭（默认）  1 开启
	 */
	private Integer undisturb;
	
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getVenueName() {
		return venueName;
	}
	public void setVenueName(String venueName) {
		this.venueName = venueName;
	}
	public Long getCoachingTypeId() {
		return coachingTypeId;
	}
	public void setCoachingTypeId(Long coachingTypeId) {
		this.coachingTypeId = coachingTypeId;
	}
	public String getCoachingTypeName() {
		return coachingTypeName;
	}
	public void setCoachingTypeName(String coachingTypeName) {
		this.coachingTypeName = coachingTypeName;
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
	public Set<VenueUserRecordEntity> getUserRecordEntities() {
		return new HashSet<>(userRecordEntities);
	}
	public void setUserRecordEntities(Set<VenueUserRecordEntity> userRecordEntities) {
		this.userRecordEntities = userRecordEntities;
	}
	public Integer getUndisturb() {
		return undisturb;
	}
	public void setUndisturb(Integer undisturb) {
		this.undisturb = undisturb;
	}
	
	public void setStreet(String street) {
		this.street = street;
	}
	public String getStreet() {
		return street;
	}
	
	public String getZsbAppId() {
		return zsbAppId;
	}
	public void setZsbAppId(String zsbAppId) {
		this.zsbAppId = zsbAppId;
	}
}

