package com.yhlt.showcase.system.entity;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * 文件实体
 * 
 * @author xunxun
 * @date 2015-1-20 上午11:29:34
 */
@Entity
@Table(name = "tc_system_file")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class FileEntity extends BaseEntity<Long> {

	/**
	 * @Fields serialVersionUID TODO
	 */
	private static final long serialVersionUID = -4400018889935606134L;

	/**
	 * UUID
	 */
	@Column(insertable = true, updatable = false)
	private String uuid = UUID.randomUUID().toString();
	/**
	 * 系统模块
	 */
	private String module;

	/**
	 * 文件名
	 */
	private String fileName;
	/**
	 * 系统文件名
	 */
	private String sysFileName;
	/**
	 * 系统存放路径
	 */
	private String sysFilePath;

	/**
	 * 文件大小 单位B
	 */
	private Long fileSize;

	/**
	 * 转换后文件大小带单位
	 */
	private String convertFileSize;

	/**
	 * 文件类型
	 */
	private String contentType;

	/**
	 * 下载路径
	 */
	private String downloadUrl;

	/**
	 * pdf路径
	 */
	private String pdfPath;

	/**
	 * swf路径
	 */
	private String swfPath;

	private int totalPages;

	/**
	 * 删除标记
	 */
	private Long deleteFlag;
	public FileEntity() {
	}

	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
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

	public Long getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Long deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public String getPdfPath() {
		return pdfPath;
	}

	public void setPdfPath(String pdfPath) {
		this.pdfPath = pdfPath;
	}

	public String getSwfPath() {
		return swfPath;
	}

	public void setSwfPath(String swfPath) {
		this.swfPath = swfPath;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

}
