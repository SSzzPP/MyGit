package com.yhlt.showcase.order.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * @Description: 上周场馆预约情况 Entity
 * @author shiguoqin
 * @date 2018-09-06 14:53
 */
@Entity
@Table(name = "V_ORDER_VENUE_TYPE")
public class OrderVenueTypeViewEntity extends BaseEntity<Long> {

	private static final long serialVersionUID = 1L;

	/**
	 * 姓名
	 */
	private String name;

	/**
	 * 联系方式
	 */
	private String mobile;
	
	/**
	 * 预约类型 1.预约场馆 2.预约教练
	 */
	private Integer type;
	
	/**
	 * 场馆ID
	 */
	private Long venueId;

	/**
	 * 设施ID
	 */
	private Long equipmentId;
	
	/**
	 * 教练Id
	 */
	private Long coachId;
	
	/**
	 * 课程Id
	 */
	private Long courseId;
	
	/**
	 * 预约时间
	 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+08:00")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date orderTime;
	/**
	 * 预约时间
	 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+08:00")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date orderEndTime;
	/**
	 * 是否节点0未接单1已接单
	 */
	private Integer status;

	/**
	 * 预约场地数量/预约教练课时
	 */
	private Integer count;
	
	private String uuid;
	/**
	 * 是否已经评价0否1是 默认0
	 */
	private Integer vealuateStatus;
	/**
	 * 投诉id
	 */
	private Long complaintId;
	/**
	 * 退订状态null正常0退订等待商家审核中1退订完成2退订失败
	 */
	private Integer cancleStatus;
	/**
	 * 改签状态null正常0改签等待商家审核中1改签完成2改签失败
	 */
	private Integer editStatus;
	
	private Long typeId;
	
	@Formula("(select dt.name from tc_system_dict dt where type_id = dt.id)")
	private String typeName;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public Long getVenueId() {
		return venueId;
	}

	public void setVenueId(Long venueId) {
		this.venueId = venueId;
	}

	public Long getEquipmentId() {
		return equipmentId;
	}

	public void setEquipmentId(Long equipmentId) {
		this.equipmentId = equipmentId;
	}

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public Integer getVealuateStatus() {
		return vealuateStatus;
	}

	public void setVealuateStatus(Integer vealuateStatus) {
		this.vealuateStatus = vealuateStatus;
	}

	public Long getComplaintId() {
		return complaintId;
	}

	public void setComplaintId(Long complaintId) {
		this.complaintId = complaintId;
	}

	public Date getOrderEndTime() {
		return orderEndTime;
	}

	public void setOrderEndTime(Date orderEndTime) {
		this.orderEndTime = orderEndTime;
	}

	public Integer getCancleStatus() {
		return cancleStatus;
	}

	public void setCancleStatus(Integer cancleStatus) {
		this.cancleStatus = cancleStatus;
	}

	public Integer getEditStatus() {
		return editStatus;
	}

	public void setEditStatus(Integer editStatus) {
		this.editStatus = editStatus;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Long getCoachId() {
		return coachId;
	}

	public void setCoachId(Long coachId) {
		this.coachId = coachId;
	}

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}
	
	public Long getTypeId() {
		return typeId;
	}
	public void setTypeId(Long typeId) {
		this.typeId = typeId;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getTypeName() {
		return typeName;
	}
}

