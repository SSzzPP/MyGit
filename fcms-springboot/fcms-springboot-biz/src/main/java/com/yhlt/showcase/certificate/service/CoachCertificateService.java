package com.yhlt.showcase.certificate.service;

import org.springframework.stereotype.Component;
import javax.transaction.Transactional;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.certificate.dao.CoachCertificateDao;
import com.yhlt.showcase.certificate.entity.CoachCertificateEntity;
/**
 * 教练认证Service
 * @author zwk
 *
 */
@Component
@Transactional
@DataPermission
public class CoachCertificateService extends BaseService<CoachCertificateEntity, CoachCertificateDao>{

}
