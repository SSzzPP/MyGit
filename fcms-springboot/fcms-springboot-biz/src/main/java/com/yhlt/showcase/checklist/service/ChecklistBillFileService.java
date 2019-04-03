package com.yhlt.showcase.checklist.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.checklist.dao.ChecklistBillFileDao;
import com.yhlt.showcase.checklist.entity.ChecklistBillFileEntity;

/**
 * 检查单明细附件
 * 
 * @author admin
 *
 */
@Component
@Transactional
@BusinessLog(service = "检查单明细附件管理")
@DataPermission
public class ChecklistBillFileService extends BaseService<ChecklistBillFileEntity, ChecklistBillFileDao> {

}
