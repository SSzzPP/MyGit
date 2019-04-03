package com.yhlt.showcase.email.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * 邮件模版entity
 * @author zwk
 * 2018.10.22
 */
@Entity
@Table(name="TC_SYSTEM_EMAIL_TEMPLATE")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class EmailTemplateEntity extends BaseEntity<Long>{
	

	private static final long serialVersionUID = 1646222215881911793L;
	/**
	 * 标题
	 */
    @Column
    private String title;
    /**
	 * 内容
	 */
    @Column
    private String content;
    /**
     * 收件人
     */
    @Column
    private String receiveUser;
    @Column
    private Integer defaultFlag;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReceiveUser() {
		return receiveUser;
	}
	public void setReceiveUser(String receiveUser) {
		this.receiveUser = receiveUser;
	}
	public Integer getDefaultFlag() {
		return defaultFlag;
	}
	public void setDefaultFlag(Integer defaultFlag) {
		this.defaultFlag = defaultFlag;
	}
    
    
}
