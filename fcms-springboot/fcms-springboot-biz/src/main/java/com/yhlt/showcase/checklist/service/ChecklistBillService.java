package com.yhlt.showcase.checklist.service;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.base.utils.ImageUtils;
import com.yhlt.showcase.checklist.dao.ChecklistBillDao;
import com.yhlt.showcase.checklist.dao.ChecklistBillDetailDao;
import com.yhlt.showcase.checklist.dto.ChecklistBillDto;
import com.yhlt.showcase.checklist.entity.ChecklistBillDetailEntity;
import com.yhlt.showcase.checklist.entity.ChecklistBillEntity;
import com.yhlt.showcase.checklist.entity.ChecklistBillFileEntity;
import com.yhlt.showcase.checklist.entity.ChecklistEntity;
import com.yhlt.showcase.checklist.utils.RiskConstants;
import com.yhlt.showcase.system.entity.UserEntity;
import com.yhlt.showcase.system.service.DepartmentService;
import com.yhlt.showcase.venue.entity.VenueUserEntity;
import com.yhlt.showcase.venue.service.VenueUserService;

/**
 * 检查单
 * 
 * @author admin
 *
 */
@Component
@Transactional
@BusinessLog(service = "检查单管理")
@DataPermission
public class ChecklistBillService extends BaseService<ChecklistBillEntity, ChecklistBillDao> {
	@Autowired
	private ChecklistService checklistService;

	@Autowired
	private ChecklistBillDetailDao checklistBillDetailDao;

	@Autowired
	private ChecklistBillDetailService checklistBillDetailService;

	@Autowired
	private ChecklistBillFileService checklistBillFileService;
	
	@Autowired
	private VenueUserService venueUserService;

	public ChecklistBillService() {
	}

	/**
	 * 发送短信
	 * 
	 * @param userEntity
	 */
	public void sendSMSMessage(UserEntity userEntity) {
	}

	private synchronized int getMaxNoSeed() {
		int seed = 0;
		Integer result = dao.findMaxSeed(Calendar.getInstance().get(Calendar.YEAR) + "");
		if (result != null) {
			seed = result;
		}
		return seed;
	}

	private synchronized String createBillNo(int seed) {
		StringBuffer billNo = new StringBuffer();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		billNo.append(simpleDateFormat.format(new Date()));
		DecimalFormat decimalFormat = new DecimalFormat("0000");
		billNo.append("-" + decimalFormat.format(++seed));
		return billNo.toString();
	}

	/**
	 * 发起流程:适应于安保检查单此类情况：流程key 和 查询key不统一；searchKey用于查询所有该key的流程
	 * 
	 * @param t
	 *            实体
	 * @param workflowKey
	 *            流程KEY：用于发起流程
	 * @param workflowName
	 *            流程名称
	 * @param variables
	 *            流程变量
	 * @param searchKey
	 *            查询流程列表
	 * @return
	 */
	public Map<String, Object> createBill(ChecklistBillEntity t, String workflowKey, String workflowName,
			Map<String, Object> variables, String searchKey) {
		Map<String, Object> result = new HashMap<String, Object>();
		// result.put("success", false);
		// if (variables == null) {
		// variables = new HashMap<String, Object>();
		// }
		// 设置流程必须变量
		// variables.put(WorkflowConstantsUtils.WORKFLOW_REQUIRED_VARIABLES_KEY,
		// searchKey);
		// variables.put(WorkflowConstantsUtils.WORKFLOW_REQUIRED_VARIABLES_NAME,
		// workflowName);
		// if((Long)variables.get(
		// WorkflowConstantsUtils.WORKFLOW_REQUIRED_VARIABLES_STARTUSER) == null){
		// variables.put(WorkflowConstantsUtils.WORKFLOW_REQUIRED_VARIABLES_STARTUSER,
		// LoginContextHolder.get().getUserId());
		// }
		// // 发起流程
		// ProcessInstance pi = customService.startWorkflow(workflowKey, workflowKey +
		// "." + t.getId(), variables,
		// workflowName);
		// result.put("success", true);
		// 回填流程id
		// t.setProcessId(pi.getId());
		// t.setApprovalStatus(ConstantsUtils.WORKFLOW_APPROVAL_STATUS_3);
		t = dao.save(t);
		result.put("success", true);
		result.put("obj", t);
		return result;
	}

	/**
	 * 手机自发创建集团级安保检查单
	 * 
	 * @param t
	 * @return
	 */
	public Map<String, Object> createBillByMobile(ChecklistBillEntity t) {
		Map<String, Object> result = new HashMap<String, Object>();
		// try {
		// DepartmentEntity departmentEntity =
		// departmentService.findOne(t.getDepartmentEntity().getId());
		// CompanyEntity companyEntity = departmentEntity.getCompanyEntity();
		// t.setCompanyEntity(companyEntity);
		// t.setDepartmentEntity(departmentEntity);
		// 检查单模板超过一个，算综合检查单
		// if (t.getChecklistType().length > 1) {
		// t.setBillType("ZH");
		// } else if (t.getChecklistType().length == 1) {
		// // 如果检查单模板只有一个，则当前检查检查单类型为模板类型
		// ChecklistEntity checklistEntity =
		// checklistService.findOne(t.getChecklistType()[0]);
		// ChecklistEntity checklistType =
		// checklistService.findOne(checklistEntity.getParentId());
		// t.setBillType(checklistType.getBillNo());
		// }

		// // 启动流程
		// Map<String, Object> variables = new HashMap<String, Object>();
		// variables.put("agent", t.getCreateById() + "");
		// variables.put("workflow-key", "anbao");
		// if (t.getType() == 1) {// 任务指派
		// variables.put("agent", t.getSettingUserId() + "");
		// }
		// int maxSeed = getMaxNoSeed();
		// String billNo = t.getBillType() + "-" + createBillNo(maxSeed);
		// t.setBillNo(billNo);
		// t.setNoSeed(++maxSeed);
		// String title = getProcessInstanceTitle(t, billNo);
		// variables.put("workflow-name", title);
		// ProcessInstance pi = customService.startWorkflow(
		// WorkflowConstantsUtils.WORKFLOW_DEFINE_KEY_USER_ANBAO,
		// WorkflowConstantsUtils.WORKFLOW_DEFINE_KEY_USER_ANBAO + "."
		// + t.getId(), variables, title);
		// t.setProcessId(pi.getId());
		// t = dao.save(t);

		int maxSeed = getMaxNoSeed();
		VenueUserEntity venueUserEntity = venueUserService.findOne(LoginContextHolder.get().getUserId());
		String billNo =  venueUserEntity.getName() + "-" + createBillNo(maxSeed);
		t.setBillNo(billNo);
		t.setNoSeed(++maxSeed);

		// 创建流程
		// String title = getProcessInstanceTitle(t, billNo);
		// String workflowKey = WorkflowConstantsUtils.WORKFLOW_DEFINE_KEY_USER_ANBAO;

		// Map<String, Object> variables = new HashMap<String, Object>();
		// variables.put("agent", t.getCreateById() + "");
		// if (t.getType() == 1) {// 任务指派
		// variables.put("agent", t.getSettingUserId() + "");
		// }
		// try {
		// result = this.createBill(t, workflowKey, title, variables, workflowKey);
		// } catch (SysException e) {
		// throw new SysException(e.getMessage(), e);
		// } catch (Exception e) {
		// throw new RuntimeException(e.getMessage(), e);
		// }

		t = dao.save(t);
		List<ChecklistBillDetailEntity> checklistBillDetailEntities = new ArrayList<ChecklistBillDetailEntity>();
		// 检查项目循环 type=0
		for (Long checklistTypeId : t.getChecklistType()) {
			ChecklistEntity checklistEntity = checklistService.findOne(checklistTypeId);
			fillChecklistBillDetail(t, checklistBillDetailEntities, checklistEntity);
		}
		checklistBillDetailDao.saveAll(checklistBillDetailEntities);

		// // 前台滚动信息
		// CarouselInfoEntity carouselInfo = new CarouselInfoEntity();
		// carouselInfo.setGmtCreate(new Date());
		// carouselInfo.setCreateById(LoginContextHolder.get().getUserId());
		// carouselInfo.setType(CarouselConstants.CAROUSEL_TYPE_SECURITY_5);
		// carouselInfo.setUuid(t.getUuid());
		// carouselInfo.setContent("发起了一条安全检查任务");
		// String username = LoginContextHolder.get().getRealName().substring(0, 1) +
		// "**";
		// carouselInfo.setScrollContent(
		// username + "于 " + DateUtil.formatDate2Str(carouselInfo.getGmtCreate(),
		// "yyyy-MM-dd HH:mm:ss") + " "
		// + carouselInfo.getContent());
		// carouselInfoService.save(carouselInfo);

		result.put("success", true);
		result.put("obj", t);
		return result;
	}

	/**
	 * 删除bill和详情
	 * 
	 * @param bill的uuid
	 */
	public Map<String, Object> deleteBill(String uuid) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", false);

		// 查询bill实体
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_uuid", uuid);
		ChecklistBillEntity billEntity = this.findOneByParams(searchParams);

		if (billEntity.getStatus() == 1) {// 1：完成检查
			result.put("errorMsg", "该检查单已经检查完成，不允许删除！");
			return result;
		}

		// 删除流程
		// customService.deleteProcessInstance(billEntity.getProcessId());

		// 查询bill附件
		searchParams.clear();
		searchParams.put("EQ_billId", billEntity.getId());
		List<ChecklistBillFileEntity> detailFileList = checklistBillFileService.findByParams(searchParams);
		checklistBillFileService.delete(detailFileList);

		// 查询bill详情实体
		searchParams.clear();
		searchParams.put("EQ_checklistBillEntity.uuid", uuid);
		List<ChecklistBillDetailEntity> detailList = checklistBillDetailService.findByParams(searchParams);
		checklistBillDetailService.delete(detailList);

		dao.delete(billEntity);

		result.put("success", true);
		return result;
	}

	/**
	 * 填充固定项billdetail
	 * 
	 * @param t
	 * @param departmentEntity
	 * @param companyEntity
	 * @param checklistBillDetailEntities
	 * @param checklistEntity
	 */
	private void fillChecklistBillDetail(ChecklistBillEntity t,
			List<ChecklistBillDetailEntity> checklistBillDetailEntities, ChecklistEntity checklistEntity) {
		// 具体检查项 type=3
		for (ChecklistEntity checklistTypeJcx : checklistEntity.getChildren2()) {
			// 检查项目明细
			ChecklistBillDetailEntity checklistBillDetailEntity = new ChecklistBillDetailEntity();
			// checklistBillDetailEntity.setUuid(UUID.randomUUID().toString());
			// 检查单
			checklistBillDetailEntity.setChecklistBillEntity(t);
			// checklistBillDetailEntity.setCompanyEntity(companyEntity);
			// checklistBillDetailEntity.setDepartmentEntity(departmentEntity);
			// 大分类 type=0
			checklistBillDetailEntity.setChecklistTypeOneId(checklistEntity.getId());
			checklistBillDetailEntity.setChecklistTypeOneName(checklistEntity.getName());
			// 检查依据type=1
			checklistBillDetailEntity.setChecklistStandardId(checklistTypeJcx.getId());
			checklistBillDetailEntity.setChecklistStandardName(checklistTypeJcx.getName());
			// 检查项是否为固定项
			checklistBillDetailEntity.setFix(checklistTypeJcx.getFix());
			// 检查状态，默未检查
			checklistBillDetailEntity.setStatus(RiskConstants.SECURITY_ASSURANCE_STATUS_UNUSED);
			// 当前登录人
			checklistBillDetailEntity.setCreateById(LoginContextHolder.get().getUserId());
			checklistBillDetailEntity.setGmtCreate(new Date());
			checklistBillDetailEntities.add(checklistBillDetailEntity);
		}
	}

	public List<ChecklistBillDto> getBillDto(String billUuid) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_uuid", billUuid);
		ChecklistBillEntity securityAssuranceBillEntity = this.findOneByParams(searchParams);

		// 整理大分类信息
		Map<Long, ChecklistBillDto> typeOneMap = new LinkedHashMap<Long, ChecklistBillDto>();
		// 整理标准
		Map<Long, ChecklistBillDto> standardMap = new HashMap<Long, ChecklistBillDto>();

		List<ChecklistBillDetailEntity> securityAssuranceBillDetailEntities = securityAssuranceBillEntity
				.getChecklistBillDetailEntities();
		for (ChecklistBillDetailEntity securityAssuranceBillDetailEntity : securityAssuranceBillDetailEntities) {
			// 整理大分类
			Long oneId = securityAssuranceBillDetailEntity.getChecklistTypeOneId();
			if (!typeOneMap.containsKey(oneId)) {
				typeOneMap.put(oneId,
						new ChecklistBillDto(oneId, securityAssuranceBillDetailEntity.getChecklistTypeOneName(), null));
			}

			// 整理标准
			Long standardId = securityAssuranceBillDetailEntity.getChecklistStandardId();
			if (!standardMap.containsKey(standardId)) {
				ChecklistBillDto securityAssuranceBillDto = new ChecklistBillDto(standardId,
						securityAssuranceBillDetailEntity.getChecklistStandardName(),
						securityAssuranceBillDetailEntity.getRemark(), securityAssuranceBillDetailEntity.getStatus());

				searchParams = new HashMap<String, Object>();
				searchParams.put("EQ_billId", securityAssuranceBillEntity.getId());
				searchParams.put("EQ_checklistStandardId", standardId);
				long fileCount = checklistBillFileService.count(searchParams);
				securityAssuranceBillDto.setPictureCount(fileCount)	;

				standardMap.put(standardId, securityAssuranceBillDto);

			}
		}
		// 拼接数据
		for (ChecklistBillDetailEntity securityAssuranceBillDetailEntity : securityAssuranceBillDetailEntities) {
			Long oneId = securityAssuranceBillDetailEntity.getChecklistTypeOneId();
			Long standardId = securityAssuranceBillDetailEntity.getChecklistStandardId();
			// 获取一级分类
			ChecklistBillDto typeOneDto = typeOneMap.get(oneId);
			ChecklistBillDto standardDto = standardMap.get(standardId);

			typeOneDto.getChildren().add(standardDto);
		}

		return new ArrayList<ChecklistBillDto>(typeOneMap.values());
	}

	public void coverImgCallBack(String coverImgPath, HttpServletResponse response) {
		try {
			ImageUtils.imgToStream(coverImgPath, response);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
