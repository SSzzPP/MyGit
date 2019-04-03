package com.yhlt.showcase.system.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.system.dao.GradeDao;
import com.yhlt.showcase.system.entity.GradeEntity;

/**
 * @Description: 年级 service
 * @author szp
 * @date 2019-02-25 14:24
 */
@Component
@Transactional
@BusinessLog(service = "年级")
@DataPermission
public class GradeService extends BaseService<GradeEntity, GradeDao> {

}
