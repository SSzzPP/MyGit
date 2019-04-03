package com.yhlt.showcase.certificate.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.utils.DateUtil;
import com.yhlt.showcase.base.utils.EmailUtil;
import com.yhlt.showcase.base.utils.SensitiveWordsUtil;
import com.yhlt.showcase.certificate.entity.CoachCertificateEntity;
import com.yhlt.showcase.certificate.service.CoachCertificateService;
import com.yhlt.showcase.email.entity.EmailTemplateEntity;
import com.yhlt.showcase.email.service.EmailTemplateService;

/**
 * 教练认证controller
 * 
 * @author zwk
 *
 */
@Controller
@RequestMapping("/mobile/coach/certificate")
public class CoachCertificateController extends BaseController<CoachCertificateEntity, CoachCertificateService> {

	@Autowired
	private EmailTemplateService emailService;

	@Value("${mail.toMail.addr}")
	private String toMailAddr;

	@RequestMapping("/toCoachCertificate")
	public String toCoachCertificate() {
		return "certificate/coach_certificate";
	}

	/**
	 * 新增教练认证
	 * 
	 * @param realName
	 * @param venueId
	 * @param teachStart
	 * @param mobile
	 * @param achievement
	 * @return
	 */
	@RequestMapping("/saveCoachCertificate")
	@ResponseBody
	public Map<String, Object> saveCoachCertificate(String realName, Long venueId, String teachStart, String mobile, String achievement, Integer certificateType) {
		Map<String, Object> result = new HashMap<>();
		result.put("success", false);
		if (SensitiveWordsUtil.sensitiveFlag(realName)) {
			result.put("msg", "您填写的姓名不符合规范！");
			return result;
		}
		if (SensitiveWordsUtil.sensitiveFlag(achievement)) {
			result.put("msg", "您填写的成就与荣誉不符合规范！");
			return result;
		}
		CoachCertificateEntity entity = new CoachCertificateEntity();
		entity.setCertificateType(certificateType);
		entity.setRealName(realName);
		entity.setAchievement(achievement);
		if (certificateType == 1) {
			entity.setTeachStart(DateUtil.parseDate(teachStart));
		}
		entity.setMobile(mobile);
		entity.setCreateById(LoginContextHolder.get().getUserId());
		entity.setStatus(0);
		if (venueId != 0 && venueId != 1) {
			entity.setVenueId(venueId);
		}
		service.save(entity);
		EmailTemplateEntity emailTemplateEntity = emailService.findOne(2);
		EmailUtil.sendHtmlEmail(toMailAddr, emailTemplateEntity.getTitle(), emailTemplateEntity.getContent());
		result.put("success", true);
		result.put("msg", "提交成功，请耐心等待审核");
		return result;
	}

	/**
	 * 根据当前登录用户查询认证
	 * 
	 * @return
	 */
	@RequestMapping("/certificateDetail")
	@ResponseBody
	public Map<String, Object> certificateDetail() {
		Long userId = LoginContextHolder.get().getUserId();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("EQ_createById", userId);
		param.put("NEQ_status", 2);
		Map<String, Object> result = new HashMap<String, Object>();
		CoachCertificateEntity entity = service.findOneByParams(param);
		if (entity == null) {
			result.put("success", false);
		} else {
			result.put("success", true);
			result.put("obj", entity);
		}
		return result;
	}
}
