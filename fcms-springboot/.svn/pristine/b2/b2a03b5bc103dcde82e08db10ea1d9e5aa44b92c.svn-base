package com.yhlt.showcase.Image.entity;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * @Description: 图片管理 Entity
 * @author linannan
 * @date 2018-07-20 11:26
 */
@Entity
@Table(name = "tm_image_main")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class ImageEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 场馆Id
	 */
	private Long venueId;

	/**
	 * 设施Id
	 */
	private Long equipmentId;

	/**
	 * 图片类型（首页图/环境图/营业执照图）
	 */
	private Long imgType;

	/**
	 * 保存路径
	 */
	private String sysFilePath;
	/**
	 * 文件名
	 */
	private String sysFileName;
	/**
	 * 文件大小
	 */
	private Long fileSize;
	/**
	 * 转换后的文件大小
	 */
	private String convertFileSize;
	/**
	 * 0正常1删除
	 */
	private Long deleteFlag;
	/**
	 * 1场馆2设施
	 */
	private Long module;
	@Formula(value = "(select t.name from tc_system_user t  where t.id=create_by_id)")
	private String createUserName;
	/**
	 * uuid
	 */
	private String uuid;

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

	public Long getImgType() {
		return imgType;
	}

	public void setImgType(Long imgType) {
		this.imgType = imgType;
	}

	public String getSysFilePath() {
		return sysFilePath;
	}

	public void setSysFilePath(String sysFilePath) {
		this.sysFilePath = sysFilePath;
	}

	public String getSysFileName() {
		return sysFileName;
	}

	public void setSysFileName(String sysFileName) {
		this.sysFileName = sysFileName;
	}

	public Long getFileSize() {
		return fileSize;
	}

	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}

	public Long getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Long deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public Long getModule() {
		return module;
	}

	public void setModule(Long module) {
		this.module = module;
	}

	public String getConvertFileSize() {
		return convertFileSize;
	}

	public void setConvertFileSize(String convertFileSize) {
		this.convertFileSize = convertFileSize;
	}

	public String getCreateUserName() {
		return createUserName;
	}

	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

}
