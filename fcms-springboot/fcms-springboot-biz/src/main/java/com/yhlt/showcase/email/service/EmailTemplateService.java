package com.yhlt.showcase.email.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.email.dao.EmailTemplateDao;
import com.yhlt.showcase.email.entity.EmailTemplateEntity;
/**
 * 邮件模版service
 * @author zwk
 * 2018.10.22
 */
@Component
@Transactional
@DataPermission

public class EmailTemplateService extends BaseService<EmailTemplateEntity,EmailTemplateDao>{

}
