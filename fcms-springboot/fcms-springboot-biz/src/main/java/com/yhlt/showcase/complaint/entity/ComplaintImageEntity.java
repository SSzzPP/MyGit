package com.yhlt.showcase.complaint.entity;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * @Description: 消费投诉图片 Entity
 * @author swy
 * @date 2018-08-09 09:34
 */
@Entity
@Table(name = "TR_COMPLAINT_IMAGE")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class ComplaintImageEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 投诉id
	 */
	private Long complaintId;

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
	 * uuid
	 */
	private String uuid;

	public Long getComplaintId() {
		return complaintId;
	}

	public void setComplaintId(Long complaintId) {
		this.complaintId = complaintId;
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

	public String getConvertFileSize() {
		return convertFileSize;
	}

	public void setConvertFileSize(String convertFileSize) {
		this.convertFileSize = convertFileSize;
	}

	public Long getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Long deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

}
