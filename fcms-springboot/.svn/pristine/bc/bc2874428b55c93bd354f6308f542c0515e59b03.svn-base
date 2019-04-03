package com.yhlt.showcase.dict;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.yhlt.showcase.base.entity.BaseEntity;

/**
 * 数据字典
 * @author lls
 *
 */
@Entity
@Table(name="tc_system_dict")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class DictEntity extends BaseEntity<Long>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7186651772219188691L;

	/**
	 * 字典项名
	 */
	@NotNull(message = "名称不能为空")
	@Size(min = 1, max = 20, message = "名称长度限制1-20位")
	private String name;
	/**
	 * 字典项类型
	 */
	@NotNull(message = "类型不能为空")
	@Size(min = 1, max = 20, message = "类型长度限制1-20位")
	private String type;
	/**
	 * 字典项值
	 */
	@Size(min = 0, max = 20, message = "数值长度限制20位")
	private String value;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	
}
