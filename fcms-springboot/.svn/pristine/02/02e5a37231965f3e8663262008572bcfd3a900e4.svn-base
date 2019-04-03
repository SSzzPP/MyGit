package com.yhlt.showcase.checklist.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;

import com.yhlt.showcase.checklist.entity.ChecklistBillDetailEntity;
import com.yhlt.showcase.checklist.utils.RiskConstants;

/**
 * 
 * @author admin
 * 
 */
public class ChecklistBillDto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1051329324848119861L;

	private Long id;
	private Long billId;
	/**
	 * 名称
	 */
	private String name;
	/**
	 * 检查标准
	 */
	private String remark;

	private Set<ChecklistBillDto> children = new LinkedHashSet<ChecklistBillDto>();
	// 检查依据图片数量
	private long pictureCount = 0;

	/**
	 * 0符合,1不符合,2未检查,3不适用
	 */
	private Integer status = 0;

	private String statusWrapper;
	
	// 该条检查标准不符合条数
	private long notFitCount = 0;
	
	// 修改日志数目
	private long editLogCount = 0;
	
	/**
	 * 检查结果集合
	 */
	private List<ChecklistBillDetailEntity> resultList = new ArrayList<ChecklistBillDetailEntity>();

	public ChecklistBillDto() {
	}

	
	public ChecklistBillDto(Long id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public ChecklistBillDto(Long id, String name, String remark) {
		super();
		this.id = id;
		this.name = name;
		this.remark = remark;
	}
	
	

	public ChecklistBillDto(Long id,
			List<ChecklistBillDetailEntity> resultList, String name) {
		super();
		this.id = id;
		this.name = name;
		this.resultList = resultList;
	}


	public long getEditLogCount() {
		return editLogCount;
	}

	public void setEditLogCount(long editLogCount) {
		this.editLogCount = editLogCount;
	}

	public ChecklistBillDto(Long id, String name, String remark,
			Integer status) {
		super();
		this.id = id;
		this.name = name.replaceAll("<p>|</p>|\n|\r", "").trim();
		this.remark = remark;
		this.status = status;
	}

	public Long getBillId() {
		return billId;
	}


	public void setBillId(Long billId) {
		this.billId = billId;
	}


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public long getPictureCount() {
		return pictureCount;
	}

	public void setPictureCount(long pictureCount) {
		this.pictureCount = pictureCount;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	/**
	 * 0符合,1不符合,2未检查,3不适用
	 */
	public String getStatusWrapper() {
		switch (status) {
		case 0:
			statusWrapper = "符合";
			break;
		case 1:
			statusWrapper = "不符合";
			break;
		case 2:
			statusWrapper = "未检查";
			break;
		case 3:
			statusWrapper = "不适用";
			break;
		default:
			statusWrapper = "";
			break;
		}
		return statusWrapper;
	}

	public void addRemark(String remark, int status) {
		if (StringUtils.isBlank(this.remark)) {
			this.remark = "";
		}
		switch (status) {
		case RiskConstants.SECURITY_ASSURANCE_STATUS_ERROR:
			this.remark += "<span style='color:red;'>" + remark + "</span>";
			break;
		case RiskConstants.SECURITY_ASSURANCE_STATUS_INAPPROPRIATE:
			this.remark += "<span style='color:blue;'>" + remark + "</span>";
			break;
		default:
			this.remark += remark;
			break;
		}
	}

	public Set<ChecklistBillDto> getChildren() {
		return children;
	}

	public void setChildren(Set<ChecklistBillDto> children) {
		this.children = children;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ChecklistBillDto other = (ChecklistBillDto) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	public long getNotFitCount() {
		return notFitCount;
	}

	public void setNotFitCount(long notFitCount) {
		this.notFitCount = notFitCount;
	}


	public List<ChecklistBillDetailEntity> getResultList() {
		return resultList;
	}


	public void setResultList(List<ChecklistBillDetailEntity> resultList) {
		this.resultList = resultList;
	}

	
}
