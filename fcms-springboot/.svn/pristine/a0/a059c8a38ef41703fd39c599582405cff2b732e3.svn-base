package com.yhlt.showcase.checklist.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.checklist.dao.ChecklistEntityDao;
import com.yhlt.showcase.checklist.dto.ChecklistBillDto;
import com.yhlt.showcase.checklist.entity.ChecklistEntity;
import com.yhlt.showcase.checklist.utils.RiskConstants;

/**
 * 检查单配置
 * 
 * @author admin
 *
 */
@Component
@Transactional
@BusinessLog(service = "检查单配置管理")
@DataPermission
public class ChecklistService extends BaseService<ChecklistEntity, ChecklistEntityDao> {

	public int findUserSortNumberMax() {
		Integer result = dao.findUserSortNumberMax();
		return result == null ? 0 : result;
	}

	/**
	 * 判断是否有type=0的，没有的话创建
	 * 
	 * @param fixId
	 * @param departmentId
	 */
	public void creatParentType(Integer fixId, Long departmentId) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		if (fixId == RiskConstants.Checklist_FIX) {
			searchParams.put("EQ_fix", RiskConstants.Checklist_FIX);
			searchParams.put("EQ_type", RiskConstants.Checklist_TYPE_CATEGORY);
			if (this.count(searchParams) == 0) {
				ChecklistEntity category = new ChecklistEntity();
				category.setName("固定检查项目");
				category.setFix(RiskConstants.Checklist_FIX);
				category.setType(RiskConstants.Checklist_TYPE_CATEGORY);
				category.setParentId(0l);
				category.setCreateById(LoginContextHolder.get().getUserId());
				category.setGmtCreate(new Date());

				Integer sortNumber = this.findUserSortNumberMax();
				sortNumber = sortNumber == null ? 1 : sortNumber + 1;
				category.setSortNumber(sortNumber);

				category = this.save(category);
			}
		} else {
			searchParams.put("EQ_departmentId", departmentId);
			searchParams.put("EQ_fix", RiskConstants.Checklist_CUSTOM);
			searchParams.put("EQ_type", RiskConstants.Checklist_TYPE_CATEGORY);
			if (this.count(searchParams) == 0) {
				ChecklistEntity category = new ChecklistEntity();
				category.setName("自定义检查项目");
				category.setFix(RiskConstants.Checklist_CUSTOM);
				category.setType(RiskConstants.Checklist_TYPE_CATEGORY);
				category.setParentId(0l);
				category.setCreateById(LoginContextHolder.get().getUserId());
				category.setGmtCreate(new Date());
				category.setDepartmentId(departmentId);

				Integer sortNumber = this.findUserSortNumberMax();
				sortNumber = sortNumber == null ? 1 : sortNumber + 1;
				category.setSortNumber(sortNumber);
				this.save(category);
			}
		}
	}


	/**
	 * 安全检查模板基础数据 四级结构 大分类、小分类、检查依据、标准
	 * 
	 * @param uuid
	 *            大分类
	 * @return
	 */
	public ChecklistBillDto getBillDto(String uuid) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_uuid", uuid);
		// 小分类
		ChecklistEntity typeEntity = this.findOneByParams(searchParams);
		ChecklistBillDto typeDto = new ChecklistBillDto(typeEntity.getId(), typeEntity.getName());

		// 检查项
		searchParams.clear();
		searchParams.put("EQ_parentId", typeEntity.getId());
		List<ChecklistEntity> proEntities = this.findByParams(searchParams);
		for (ChecklistEntity proEntity : proEntities) {
			ChecklistBillDto proDto = new ChecklistBillDto(proEntity.getId(), proEntity.getName());
			// 检查依据
			searchParams.clear();
			searchParams.put("EQ_parentId", proEntity.getId());
			List<ChecklistEntity> gistEntities = this.findByParams(searchParams);
			for (ChecklistEntity gistEntity : gistEntities) {

				ChecklistBillDto gistDto = new ChecklistBillDto(gistEntity.getId(), gistEntity.getName());
				// 检查标准
				searchParams.clear();
				searchParams.put("EQ_parentId", gistDto.getId());
				List<ChecklistEntity> standardEntities = this.findByParams(searchParams);
				for (ChecklistEntity standardEntity : standardEntities) {
					ChecklistBillDto standardDto = new ChecklistBillDto(standardEntity.getId(),
							standardEntity.getRemark());
					gistDto.getChildren().add(standardDto);
				}

				proDto.getChildren().add(gistDto);
			}

			typeDto.getChildren().add(proDto);
		}

		return typeDto;
	}

}
