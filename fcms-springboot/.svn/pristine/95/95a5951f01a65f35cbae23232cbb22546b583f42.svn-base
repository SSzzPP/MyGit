package com.yhlt.showcase.checklist.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Formula;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.yhlt.showcase.base.entity.BaseEntity;
import com.yhlt.showcase.checklist.utils.RiskConstants;

/**
 * 安保专项检查单
 * 
 * @author GCK
 * 
 */
@Entity
@Table(name = "TM_FCMS_CHECKLIST_BILL")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class ChecklistBillEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2014346741173663583L;

	/**
	 * uuid
	 */
	@Column(insertable = true, updatable = false)
	private String uuid = UUID.randomUUID().toString();

	/**
	 * 单据类型 KF,XF,YX,ZH
	 */
	private String billType;


	/**
	 * 检查单日期
	 */
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+08:00")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date billDate;

	/**
	 * 被检查人签名
	 */
	private String signatureImage;

	private String signatureImage2;

	/**
	 * 0检查中，1检查完成
	 */
	private Integer status = 0;

	/**
	 * 检查详情
	 */
	private String remark;

	/**
	 * 指令说明
	 */
	private String instruction;

	// 关联流程信息
	// private String processId;
	// 流程审批
	// @Transient
	// private String taskId;
	// 公告信息流程审批状态(-1作废、未发起、1审批中、重新填写、审批完成)
	// private int approvalStatus = 1;

	// @Transient
	// private String approvalStatusWrapper;

	// 任务派发人
	private Long settingUserId;

	@Formula(value = "(select t.name from tc_system_user t  where t.id=setting_user_id)")
	private String settingUserName;

	// 类型0自己创建,1派发任务
	private int type = 0;

	@Transient
	private String typeWrapper;

	@JsonIgnore
	@OneToMany(mappedBy = "checklistBillEntity", fetch = FetchType.LAZY, cascade = { CascadeType.REMOVE,
			CascadeType.MERGE })
	private List<ChecklistBillDetailEntity> checklistBillDetailEntities = new ArrayList<ChecklistBillDetailEntity>();

	/**
	 * 新建检查单，此检查单下的检查依据
	 */
	@Transient
	private Long[] checklistType;

	@Formula(value = "(select t.name from tc_system_user t  where t.id=create_by_id)")
	private String createUserName;

	@Transient
	private String iconCls = "icon2 r4_c4";

	// 不符合项目数目
	@Formula(value = "(SELECT count(*) from TM_FCMS_CHECKLIST_BILL_DETAIL t WHERE t.bill_id= id and t.status = 1)")
	private Integer errorCount;

	/**
	 * 检查截止时间
	 */
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+08:00")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date finishDate;

	/**
	 * 实际完成时间
	 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date actualFinishTime;

	/**
	 * 日期（天）+00000
	 * 
	 */
	private String billNo;

	private Integer noSeed;

	/**
	 * 周期类型,0无,1日,2周,3月,4季度,5半年,6年,7其他
	 */
	private int periodType = 0;
	@Transient
	private String periodTypeWrapper;

	/**
	 * 负责区域id
	 */
	private Long areaId;
	@Formula(value = "(select mda.area_name from tm_fcms_map_draw_area mda  where mda.id=area_id)")
	private String areaName;
	
	public String getBillNo() {
		return billNo;
	}

	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}

	public Integer getNoSeed() {
		return noSeed;
	}

	public void setNoSeed(Integer noSeed) {
		this.noSeed = noSeed;
	}

	public void setNoSeed(int noSeed) {
		this.noSeed = noSeed;
	}

	public Date getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}


	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public ChecklistBillEntity() {
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public Date getBillDate() {
		return billDate;
	}

	public void setBillDate(Date billDate) {
		this.billDate = billDate;
	}

	public String getSignatureImage() {
		return signatureImage;
	}

	public void setSignatureImage(String signatureImage) {
		this.signatureImage = signatureImage;
	}

	public String getSignatureImage2() {
		return signatureImage2;
	}

	public void setSignatureImage2(String signatureImage2) {
		this.signatureImage2 = signatureImage2;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	// public String getProcessId() {
	// return processId;
	// }
	//
	// public void setProcessId(String processId) {
	// this.processId = processId;
	// }
	//
	// public String getTaskId() {
	// return taskId;
	// }
	//
	// public void setTaskId(String taskId) {
	// this.taskId = taskId;
	// }
	//
	// public int getApprovalStatus() {
	// return approvalStatus;
	// }
	//
	// public void setApprovalStatus(int approvalStatus) {
	// this.approvalStatus = approvalStatus;
	// }
	//
	// public String getApprovalStatusWrapper() {
	// if (approvalStatus == -1) {
	// approvalStatusWrapper = "作废";
	// } else if (approvalStatus == 0) {
	// approvalStatusWrapper = "未发起";
	// } else if (approvalStatus == 1) {
	// approvalStatusWrapper = "审批中";
	// } else if (approvalStatus == 2) {
	// approvalStatusWrapper = "重新填写";
	// } else if (approvalStatus == 3) {
	// approvalStatusWrapper = "审批完成";
	// }
	// return approvalStatusWrapper;
	// }
	//
	// public void setApprovalStatusWrapper(String approvalStatusWrapper) {
	// this.approvalStatusWrapper = approvalStatusWrapper;
	// }

	public Long[] getChecklistType() {
		return checklistType;
	}

	public List<ChecklistBillDetailEntity> getChecklistBillDetailEntities() {
		return checklistBillDetailEntities;
	}

	public void setChecklistBillDetailEntities(List<ChecklistBillDetailEntity> checklistBillDetailEntities) {
		this.checklistBillDetailEntities = checklistBillDetailEntities;
	}

	public void setChecklistType(Long[] checklistType) {
		this.checklistType = checklistType;
	}

	public String getStatusWrapper() {
		// 0符合,1不符合,2未检查,3不适用
		if (this.status == RiskConstants.SECURITY_ASSURANCE_BILL_STATUS_NORMAL)
			return "检查中";
		else if (this.status == RiskConstants.SECURITY_ASSURANCE_BILL_STATUS_FINISH)
			return "完成";
		else
			return "";
	}

	public String getCreateUserName() {
		return createUserName;
	}

	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	}

	public Long getSettingUserId() {
		return settingUserId;
	}

	public void setSettingUserId(Long settingUserId) {
		this.settingUserId = settingUserId;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getTypeWrapper() {
		return type == 1 ? "指派" : "自发";
	}

	public void setTypeWrapper(String typeWrapper) {
		this.typeWrapper = typeWrapper;
	}

	public Integer getErrorCount() {
		if (errorCount == null) {
			return 0;
		}
		return errorCount;
	}

	public void setErrorCount(Integer errorCount) {
		this.errorCount = errorCount;
	}

	public String getBillType() {
		return billType;
	}

	public void setBillType(String billType) {
		this.billType = billType;
	}

	public String getSettingUserName() {
		return settingUserName;
	}

	public void setSettingUserName(String settingUserName) {
		this.settingUserName = settingUserName;
	}


	public String getInstruction() {
		return instruction;
	}

	public void setInstruction(String instruction) {
		this.instruction = instruction;
	}

	public int getPeriodType() {
		return periodType;
	}

	public void setPeriodType(int periodType) {
		this.periodType = periodType;
	}

	/**
	 * 周期类型,0无,1日,2周,3月,4季度,5半年,6年,7其他
	 * 
	 * @return
	 */
	public String getPeriodTypeWrapper() {
		if (periodType == 0) {
			periodTypeWrapper = "无";
		} else if (periodType == 1) {
			periodTypeWrapper = "日检查";
		} else if (periodType == 2) {
			periodTypeWrapper = "周检查";
		} else if (periodType == 3) {
			periodTypeWrapper = "月检查";
		} else if (periodType == 4) {
			periodTypeWrapper = "季度检查";
		} else if (periodType == 5) {
			periodTypeWrapper = "半年检查";
		} else if (periodType == 6) {
			periodTypeWrapper = "年检查";
		} else if (periodType == 7) {
			periodTypeWrapper = "其他检查";
		}
		return periodTypeWrapper;
	}

	public void setPeriodTypeWrapper(String periodTypeWrapper) {
		this.periodTypeWrapper = periodTypeWrapper;
	}

	public Date getActualFinishTime() {
		return actualFinishTime;
	}

	public void setActualFinishTime(Date actualFinishTime) {
		this.actualFinishTime = actualFinishTime;
	}

	public Long getAreaId() {
		return areaId;
	}

	public void setAreaId(Long areaId) {
		this.areaId = areaId;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

}
