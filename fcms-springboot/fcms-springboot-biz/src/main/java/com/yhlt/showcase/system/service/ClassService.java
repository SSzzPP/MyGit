package com.yhlt.showcase.system.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.system.dao.ClassDao;
import com.yhlt.showcase.system.entity.ClassEntity;
/**
 * @Description: 班级 service
 * @author szp
 * @date 2019-02-25 14:24
 */
@Component
@Transactional
@BusinessLog(service = "班级")
@DataPermission
public class ClassService extends BaseService<ClassEntity, ClassDao> {

}
