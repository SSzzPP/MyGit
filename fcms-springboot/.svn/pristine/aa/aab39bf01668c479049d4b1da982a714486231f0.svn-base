package com.yhlt.showcase.checklist.entity;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Formula;

import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * 检查单-检查依据文件信息
 * 
 * @author wj
 * 
 */
@Entity
@Table(name = "TM_FCMS_CHECKLIST_BILL_FILE")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class ChecklistBillFileEntity extends BaseEntity<Long> {

	/**
	 * @Fields serialVersionUID :
	 */
	private static final long serialVersionUID = 7727363889760934295L;

	@Column(insertable = true, updatable = false)
	private String uuid = UUID.randomUUID().toString();
	// 检查单id
	private Long billId;
	// 检查依据ID
	// private Long checklistGistId;
	// 检查单标准id
	private Long checklistStandardId;

	private String remark;

	/**
	 * 名称
	 */
	@NotNull(message = "名称不能为空")
	@Size(min = 2, max = 100, message = "名称长度限制2-100位")
	private String fileName;

	private String sysFileName;
	private String sysFilePath;
	private Long fileSize;
	private String convertFileSize;
	private String contentType;
	private String downloadUrl;

	@Formula(value = "(select t.login_name from tc_system_user t  where t.id=create_by_id)")
	private String createUserName;

	public ChecklistBillFileEntity() {
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public Long getBillId() {
		return billId;
	}

	public void setBillId(Long billId) {
		this.billId = billId;
	}

	// public Long getChecklistGistId() {
	// return checklistGistId;
	// }
	//
	// public void setChecklistGistId(Long checklistGistId) {
	// this.checklistGistId = checklistGistId;
	// }

	public Long getChecklistStandardId() {
		return checklistStandardId;
	}

	public void setChecklistStandardId(Long checklistStandardId) {
		this.checklistStandardId = checklistStandardId;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getSysFileName() {
		return sysFileName;
	}

	public void setSysFileName(String sysFileName) {
		this.sysFileName = sysFileName;
	}

	public String getSysFilePath() {
		return sysFilePath;
	}

	public void setSysFilePath(String sysFilePath) {
		this.sysFilePath = sysFilePath;
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

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getDownloadUrl() {
		return downloadUrl;
	}

	public void setDownloadUrl(String downloadUrl) {
		this.downloadUrl = downloadUrl;
	}

	public String getCreateUserName() {
		return createUserName;
	}

	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	}

}
