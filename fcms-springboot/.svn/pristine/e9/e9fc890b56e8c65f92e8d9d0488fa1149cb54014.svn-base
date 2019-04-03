package com.yhlt.showcase.checklist.controller;

import java.io.File;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.properties.EnvProperties;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.base.utils.ImageUtils;
import com.yhlt.showcase.checklist.dto.ChecklistBillDto;
import com.yhlt.showcase.checklist.entity.ChecklistBillEntity;
import com.yhlt.showcase.checklist.service.ChecklistBillService;
import com.yhlt.showcase.checklist.utils.RiskConstants;
import com.yhlt.showcase.system.utils.FileUtil;

/**
 * 检查单
 * 
 * @author admin
 * 
 */
@Controller
@RequestMapping(value = "/mobile/checklistbill")
public class ChecklistBillController extends BaseController<ChecklistBillEntity, ChecklistBillService> {
	
	@Autowired
	private EnvProperties envProperties;
	
	/**
	 * 手机创建集团安全检查单
	 * 
	 * @param t
	 */
	@RequestMapping(value = "/createBill")
	@ResponseBody
	public Map<String, Object> createBill(ChecklistBillEntity t, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// t.setUuid(UUID.randomUUID().toString());
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", false);
		try {
			t.setBillDate(DateUtils.truncate(new Date(), Calendar.DATE));
			t.setGmtCreate(new Date());
			t.setCreateById(LoginContextHolder.get().getUserId());
			t.setType(RiskConstants.ChecklistTask_Type_0);
			result = service.createBillByMobile(t);
		} catch (Exception e) {
			e.printStackTrace();
			if (StringUtils.isNotBlank(e.getMessage()) && e.getMessage().split(":").length > 0) {
				String[] mess = e.getMessage().split(":");
				result.put("errorMsg", "操作失败，" + mess[mess.length - 1]);
			} else {
				result.put("errorMsg", "操作失败");
			}
			return result;
		}
		result.put("success", true);
		return result;
	}

	/**
	 * 保存更新方法<br>
	 * 带验证
	 * 
	 * @param t
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getBill")
	@ResponseBody
	public Map<String, Object> getBill(String billUuid, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 查询检查单列表
		List<ChecklistBillDto> typeOne = service.getBillDto(billUuid);

		// 查询检查单实体
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_uuid", billUuid);
		ChecklistBillEntity billEntity = service.findOneByParams(searchParams);

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		result.put("obj", typeOne);
		result.put("billEntity", billEntity);
		return result;
	}

	/**
	 * 获取签名图片
	 * 
	 * @param billUuid
	 * @param model
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/getBillSignature")
	public void getBillSignature(String billUuid, Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// 查询检查单实体
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_uuid", billUuid);
		ChecklistBillEntity billEntity = service.findOneByParams(searchParams);
		if (billEntity != null && StringUtils.isNotBlank(billEntity.getSignatureImage())) {
			ImageUtils.imgToStream(billEntity.getSignatureImage(), response);
		}
	}

	/**
	 * 检查单 签名上传
	 * 
	 * @param t
	 * @param images
	 */
	@RequestMapping(value = "/saveSignature")
	@ResponseBody
	public Map<String, Object> saveSignature(String billUuid, String base64Str, Integer status, String remark,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_uuid", billUuid);
		ChecklistBillEntity billEntity = service.findOneByParams(searchParams);
		// 保存图片
		if (StringUtils.isNotBlank(base64Str)) {
			List<Object> list = FileUtil.getNewFile("base64.jpg", "checklistSign", request);
			File file = (File) list.get(0);
			String sysPath = (String) list.get(1);
			base64Str = base64Str.substring(base64Str.indexOf("base64") + 7);
			ImageUtils.base64ToImg(base64Str, file.getPath());

			billEntity.setSignatureImage(sysPath.toString());
		}
		billEntity.setStatus(status);
		billEntity.setRemark(remark);
		try {
			return service.saveMap(billEntity);
		} catch (Exception e) {
			e.printStackTrace();
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("success", false);
			if (StringUtils.isNotBlank(e.getMessage()) && e.getMessage().split(":").length > 0) {
				String[] mess = e.getMessage().split(":");
				result.put("errorMsg", "操作失败，" + mess[mess.length - 1]);
			} else {
				result.put("errorMsg", "操作失败");
			}
			return result;
		}

	}

	/**
	 * 分页查询，包含search_查询条件<br>
	 * 返回Map{row:{},total:{}}
	 * 
	 * @param pageNum
	 * @param pageRows
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/listChecklistBill")
	@ResponseBody
	public Map<String, Object> list(@RequestParam(value = "page", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "rows", defaultValue = "10") Integer pageRows,
			@RequestParam(value = "sort", defaultValue = "gmtCreate") String sort,
			@RequestParam(value = "order", defaultValue = "desc") String order, HttpServletRequest request, Model model)
			throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_", true);
		// 指派的 && settingUserId是自己
		searchParams.put("EQ_settingUserId_1", LoginContextHolder.get().getUserId());
		searchParams.put("EQ_type_1", RiskConstants.ChecklistTask_Type_1);

		// 自己创建的 && createById是自己
		searchParams.put("EQ_createById_2", LoginContextHolder.get().getUserId());
		searchParams.put("EQ_type_2", RiskConstants.ChecklistTask_Type_0);

		// 排序字段 多个用List
		Order o = new Order("desc".equals(order) ? Direction.DESC : Direction.ASC, sort);
		Map<String, Object> result = service.findByParamsMap(searchParams,
				new PageRequest(pageNum - 1, pageRows, new Sort(o)));
		return result;
	}

	/**
	 * @author hbj
	 * @Description:删除自己创建的检查单，同时删除详情 @param：
	 */
	@RequestMapping(value = "/deleteByUuid")
	@ResponseBody
	public Map<String, Object> deleteByUuid(String uuid, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", false);
		try {
			result = service.deleteBill(uuid);
			result.put("success", true);
		} catch (Exception e) {
			return result;
		}
		return result;
	}
	/**
	 * @author swy
	 * @Description:显示图片 
	 * @param:uuid
	 */
	@RequestMapping(value = "/showImage")
	public void showImage(String uuid, HttpServletRequest request, HttpServletResponse response) {
		ChecklistBillEntity checklistBillEntity = service.findOneByUuid(uuid);
		if (checklistBillEntity.getSignatureImage() != null) {
			service.coverImgCallBack(checklistBillEntity.getSignatureImage(), response);
		} else {
			service.coverImgCallBack(envProperties.getNoFile(), response);
		}
	}
	
}
