package com.yhlt.showcase.base.entity;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlSchemaType;


/**
 * 基类EntityID
 * 
 * @param <PK>
 * @author xunxun
 * @date 2014-11-15 下午1:56:01
 */
@XmlRootElement
@MappedSuperclass
public class IdEntity<PK extends Serializable> implements Serializable {
	private static final long serialVersionUID = -8738664891492378190L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	protected PK id;
	@XmlElement(type=Long.class)
    @XmlSchemaType(name="anySimpleType")
	public PK getId() {
		return id;
	}

	public void setId(PK id) {
		this.id = id;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		IdEntity other = (IdEntity) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

//	@Override
//	public String toString() {
//		return ToStringBuilder.reflectionToString(this);
//	}
}
