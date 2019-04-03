package com.yhlt.showcase.checklist.controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.utils.ImageUtils;
import com.yhlt.showcase.checklist.entity.ChecklistBillEntity;
import com.yhlt.showcase.checklist.entity.ChecklistBillGpsEntity;
import com.yhlt.showcase.checklist.service.ChecklistBillGpsService;
import com.yhlt.showcase.checklist.service.ChecklistBillService;
import com.yhlt.showcase.system.utils.FileUtil;

/**
 * 检查单
 * 
 * @author admin
 * 
 */
@Controller
@RequestMapping(value = "/mobile/checklistbillgps")
public class ChecklistBillGpsController extends BaseController<ChecklistBillGpsEntity, ChecklistBillGpsService> {

	@Autowired
	private ChecklistBillService checklistBillService;
	
	/**
	 * 保存gps
	 * 
	 * @param t
	 * @param images
	 */
	@RequestMapping(value = "/saveInfo")
	@ResponseBody
	public Map<String, Object> saveSignature(String billUuid, ChecklistBillGpsEntity t,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (t.getId() != null) {
			ChecklistBillGpsEntity temp = service.findOne(t.getId());
			BeanUtils.copyProperties(t, temp);
			temp.setGmtModified(new Date());
			temp.setLastModifiedById(LoginContextHolder.get().getUserId());
			t = temp;
		} else {
			t.setGmtCreate(new Date());
			t.setCreateById(LoginContextHolder.get().getUserId());
		}
		// 验证实体类
		Set<ConstraintViolation<ChecklistBillGpsEntity>> constraintViolations = validator
				.getValidator().validate(t);
		// 如果大于0，说明有验证未通过信息
		if (constraintViolations.size() > 0) {
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("success", false);
			result.put("msg", constraintViolations.iterator().next()
					.getMessage());
			return result;
		}
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_uuid", billUuid);
		ChecklistBillEntity billEntity = checklistBillService.findOneByParams(searchParams);
		t.setBillId(billEntity.getId());
		Map<String, Object> result = service.saveMap(t);
		return result;

	}

}
