package com.yhlt.showcase.video.entity;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * @Description: 视频 Entity
 * @author swy
 * @date 2018-08-16 17:34
 */
@Entity
@Table(name = "tm_video_main")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class VideoMainEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * uuid
	 */
	private String uuid;

	/**
	* 标题
	*/ 
	private String title;

	/**
	* 封面图片路径
	*/ 
	private String imgUrl;

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

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
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


}

