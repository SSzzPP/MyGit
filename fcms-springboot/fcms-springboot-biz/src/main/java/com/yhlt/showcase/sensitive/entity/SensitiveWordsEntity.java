package com.yhlt.showcase.sensitive.entity;

import com.yhlt.showcase.base.entity.BaseEntity;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;

/**
 * @Description: 敏感词 Entity
 * @author swy
 * @date 2018-08-21 14:43
 */
@Entity
@Table(name = "TM_FCMS_SENSITIVE_WORDS")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class SensitiveWordsEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	* 敏感词
	*/ 
	private String content;
	
	/**
	 * 敏感词使用次数查询
	 */ 
	@Formula("(select count(1) from v_fcms_sensitive_words_type v where v.content like concat('%',content,'%'))")
	private Long num;
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}

}

