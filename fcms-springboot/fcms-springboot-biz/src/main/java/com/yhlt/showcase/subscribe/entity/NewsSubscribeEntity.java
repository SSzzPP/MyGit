package com.yhlt.showcase.subscribe.entity;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

import com.yhlt.showcase.base.entity.BaseEntity;
/**
 *@Description :消息订阅 Entity
 *@author zhuwenkai
 *@date 2018-09-03 11:00
 */
@Entity
@Table(name="TR_NEWS_SUBSCRIBE")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class NewsSubscribeEntity extends BaseEntity<Long>{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 用户ID
	 */
	private Long userId;
	
	/**
	 * 健身圈和赛事消息分类ID
	 */
	private Long itemId;
	@Formula("(select i.name from tm_fcms_activity_item i where i.id=item_id )")
	private String itemName;
	/**
	 * 订阅开关 0订阅  1关闭 默认0
	 */ 
	private Integer enabled;
	
	/**
	 * 消息类型 0体育赛事 1 法律法规 2健身圈消息 3赛事信息
	 */
	private Integer type;
	
	public NewsSubscribeEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NewsSubscribeEntity(Long userId, Integer enabled, Integer type) {
		super();
		this.userId = userId;
		this.enabled = enabled;
		this.type = type;
	}
	
	public NewsSubscribeEntity(Long userId, Long itemId, Integer enabled, Integer type) {
		super();
		this.userId = userId;
		this.itemId = itemId;
		this.enabled = enabled;
		this.type = type;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getItemId() {
		return itemId;
	}

	public Integer getEnabled() {
		return enabled;
	}

	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}
}
