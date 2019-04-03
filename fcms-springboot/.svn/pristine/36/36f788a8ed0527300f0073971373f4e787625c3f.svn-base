package com.yhlt.showcase.checklist.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.checklist.entity.ChecklistBillDetailEntity;
import com.yhlt.showcase.checklist.service.ChecklistBillDetailService;

/**
 * 安全专项检查单
 * 
 * @author admin
 * 
 */
@Controller
@RequestMapping(value = "/mobile/checklistBillDetail")
public class ChecklistBillDetailController
		extends
		BaseController<ChecklistBillDetailEntity, ChecklistBillDetailService> {

	
	/** 
	* @author hbj
	* @Description: 修改detail的状态
	* @param：   
	*/
	@RequestMapping(value = "/changeStandardStatus")
	@ResponseBody
	public Map<String, Object> changeStandardStatus(String billUuid,Integer status,Long standardId,
			String remark,HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String,Object> searchParams = new HashMap<String,Object>();
		Map<String,Object> result = new HashMap<String,Object>();
		searchParams.put("EQ_checklistBillEntity.uuid", billUuid);
		searchParams.put("EQ_checklistStandardId",standardId);
		ChecklistBillDetailEntity detailEntity = service.findOneByParams(searchParams);
		detailEntity.setStatus(status);
		detailEntity.setRemark(remark);
		service.save(detailEntity);
		
		result.put("success", true);
		result.put("msg", "处理成功！");
		return result;
	}


}
