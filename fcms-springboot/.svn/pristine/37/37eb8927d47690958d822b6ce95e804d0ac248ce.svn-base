package com.yhlt.showcase.order.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * @Description: 场馆预约 Entity
 * @author linannan
 * @date 2018-08-06 10:15
 */
@Entity
@Table(name = "TM_ORDER_MAIN")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class OrderEntity extends BaseEntity<Long> {

	/**
	 * 接单、改签、退订、评价 1、评价 ：只有接单以后才能写评价（写评价的按钮才会显示），评价后默认为消费完成，不能再改签或退订 2、改签
	 * 已接单，场馆只显示同意改签按钮 未接单，场馆显示接单按钮，并且接单后直接将改签状态置1 3、退订，场馆只显示同意退订按钮 4、改签时退订
	 * 场馆只显示同意退订按钮，修改退订状态为退订完成，不修改改签状态
	 */
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
	
	/**
	 * 教练姓名
	 */
	@Formula("(select u.name from tm_fcms_venue_user u where u.id = coach_id)")
	private String coachName;
	
	/**
	 * 课程名称
	 */
	@Formula("(select c.name from tm_fcms_venue_course c where c.id = course_id)")
	private String courseName;
	
	/**
	 * 场馆名称
	 */
	@Formula("(select v.name from tm_fcms_venue_info v where v.id = venue_id)")
	private String venueName;
	
	/**
	 * 设施名称
	 */
	@Formula("(select v.name from tm_fcms_venue_equipment_type v where v.id = equipment_id)")
	private String equipmentName;

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

	public String getVenueName() {
		return venueName;
	}

	public void setVenueName(String venueName) {
		this.venueName = venueName;
	}

	public String getEquipmentName() {
		return equipmentName;
	}

	public void setEquipmentName(String equipmentName) {
		this.equipmentName = equipmentName;
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

	public String getCoachName() {
		return coachName;
	}

	public void setCoachName(String coachName) {
		this.coachName = coachName;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	
}
