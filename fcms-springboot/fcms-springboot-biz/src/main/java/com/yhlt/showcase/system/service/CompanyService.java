package com.yhlt.showcase.system.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.system.dao.CompanyDao;
import com.yhlt.showcase.system.entity.CompanyEntity;

/**
 * 组织机构-公司
 * 
 * @author wj
 * @date 2014年12月25日20:22:24
 */
@Component
@Transactional
@BusinessLog(service = "公司信息管理")
@DataPermission
public class CompanyService extends BaseService<CompanyEntity, CompanyDao> {

}
