package com.yhlt.showcase.system.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.system.dao.StudentDao;
import com.yhlt.showcase.system.entity.StudentEntity;
/**
 * @Description: 学生管理 service
 * @author szp
 * @date 2019-02-25 14:24
 */
@Component
@Transactional
@BusinessLog(service = "学生管理")
@DataPermission
public class StudentService extends BaseService<StudentEntity, StudentDao>{

}
