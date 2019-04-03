package com.yhlt.showcase.checklist.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.base.utils.ImageUtils;
import com.yhlt.showcase.checklist.entity.ChecklistBillEntity;
import com.yhlt.showcase.checklist.entity.ChecklistBillFileEntity;
import com.yhlt.showcase.checklist.service.ChecklistBillFileService;
import com.yhlt.showcase.checklist.service.ChecklistBillService;
import com.yhlt.showcase.system.utils.FileUtil;

/**
 * 安保专项检查单明细附件
 * 
 * @author wj
 * 
 */
@Controller
@RequestMapping(value = "/mobile/checklistbillfile")
public class ChecklistBillFileController extends BaseController<ChecklistBillFileEntity, ChecklistBillFileService> {

	@Autowired
	private ChecklistBillService securityAssuranceBillService;

	/**
	 * 检查单图片上传
	 * 
	 * @param t
	 * @param images
	 */
	@RequestMapping(value = "/saveAndUpload")
	@ResponseBody
	public Map<String, Object> saveAndUpload(String billUuid, Long standardId, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		// 创建一个通用的多部分解析器
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		// 判断 request 是否有文件上传,即多部分请求
		if (multipartResolver.isMultipart(request)) {
			// 转换成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// 取得request中的所有文件名
			Iterator<String> iter = multiRequest.getFileNames();
			List<ChecklistBillFileEntity> saveFileList = new ArrayList<ChecklistBillFileEntity>();

			// 获取主表信息
			Map<String, Object> searchParams = new HashMap<String, Object>();
			searchParams.put("EQ_uuid", billUuid);
			ChecklistBillEntity billEntity = securityAssuranceBillService.findOneByParams(searchParams);
			while (iter.hasNext()) {
				// 取得上传文件
				MultipartFile multipartFile = multiRequest.getFile(iter.next());
				if (multipartFile != null) {
					String fileName = multipartFile.getOriginalFilename();
					List<Object> list = FileUtil.getNewFile(fileName, "checklistBill", request);
					File file = (File) list.get(0);
					String sysPath = (String) list.get(1);
					// 保存附件
					multipartFile.transferTo(file);

					// 保存文件信息
					ChecklistBillFileEntity fileEntity = new ChecklistBillFileEntity();
					fileEntity.setBillId(billEntity.getId());
					fileEntity.setChecklistStandardId(standardId);
					// fileEntity.setSecurityAssuranceStandardId(securityAssuranceStandardId);
					fileEntity.setFileName(fileName);
					fileEntity.setSysFileName(file.getName());
					fileEntity.setSysFilePath(sysPath.toString());
					fileEntity.setFileSize(file.length());
					fileEntity.setConvertFileSize(FileUtil.convertFileSize(file.length()));
					fileEntity.setContentType(file.getName().split("\\.")[1]);
					// fileEntity.setDownloadUrl(downloadUrl);
					fileEntity.setGmtCreate(new Date());
					fileEntity.setCreateById(LoginContextHolder.get().getUserId());

					saveFileList.add(fileEntity);
				}
			}
			result = service.save(saveFileList);
		}
		return result;
	}

	/**
	 * 根据search_查找全部
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/searchFile")
	@ResponseBody
	public List<ChecklistBillFileEntity> searchFile(String billUuid, Long standardId, HttpServletRequest request,
			Model model) throws Exception {

		// 获取主表信息
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_uuid", billUuid);
		ChecklistBillEntity billEntity = securityAssuranceBillService.findOneByParams(searchParams);
		if (billEntity != null) {
			searchParams = Servlets.getParametersStartingWith(request, "search_", true);
			searchParams.put("EQ_billId", billEntity.getId());
			searchParams.put("EQ_checklistStandardId", standardId);
			return service.findByParams(searchParams);
		} else {
			return null;
		}
	}

	/**
	 * 删除file
	 * 
	 * @param fileUuid
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteFile")
	@ResponseBody
	public Map<String, Object> deleteFile(String fileUuid, HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", false);
		// 获取主表信息
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_uuid", fileUuid);
		ChecklistBillFileEntity assuranceBillDetailFileEntity = service.findOneByParams(searchParams);
		if (assuranceBillDetailFileEntity != null) {
			service.delete(assuranceBillDetailFileEntity);
			result.put("success", true);
		}
		return result;
	}
	
	

	@RequestMapping(value = "/showImage")
	public void showImage(String uuid, Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// 查询检查单实体
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_uuid", uuid);
		ChecklistBillFileEntity entity = service.findOneByParams(searchParams);
		if (entity != null && StringUtils.isNotBlank(entity.getSysFilePath())) {
			ImageUtils.imgToStream(entity.getSysFilePath(), response);
		}
	}

}
