package com.yhlt.showcase.information.entity;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * @Description: 资讯管理 Entity
 * @author linannan
 * @date 2018-07-23 16:34
 */
@Entity
@Table(name = "TM_INFORMATION_MAIN")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class InformationEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 标题
	 */
	private String title;

	/**
	 * 封面图
	 */
	private String headImage;

	/**
	 * 作者
	 */
	private String author;

	/**
	 * 类型（0体育局1场馆）
	 */
	private Long type;

	/**
	 * 内容
	 */
	private String content;

	/**
	 * 状态（0未发布1已发布2待审核3驳回）
	 */
	private Long status;

	private String uuid;

	private Long moduleId;

	@Formula("(select d.name from tc_system_dict d where d.id = module_id)")
	private String moduleName;
	/**
	 * 场馆Id
	 */
	private Long venueId;
	/**
	 * 审核意见
	 */
	private String reason;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getHeadImage() {
		return headImage;
	}

	public void setHeadImage(String headImage) {
		this.headImage = headImage;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Long getType() {
		return type;
	}

	public void setType(Long type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public Long getModuleId() {
		return moduleId;
	}

	public void setModuleId(Long moduleId) {
		this.moduleId = moduleId;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public Long getVenueId() {
		return venueId;
	}

	public void setVenueId(Long venueId) {
		this.venueId = venueId;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

}
