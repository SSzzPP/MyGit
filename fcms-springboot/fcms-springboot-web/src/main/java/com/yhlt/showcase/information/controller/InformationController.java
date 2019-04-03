package com.yhlt.showcase.information.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.AccessRequired;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.utils.CopyPropertiesUtil;
import com.yhlt.showcase.information.entity.InformationEntity;
import com.yhlt.showcase.information.service.InformationService;
import com.yhlt.showcase.system.service.UserService;
import com.yhlt.showcase.system.utils.FileUtil;

/**
 * 资讯管理
 * 
 * @author linannan
 * 
 */
@Controller
@RequestMapping(value = "/admin/information/info")
public class InformationController extends BaseController<InformationEntity, InformationService> {
	@Autowired
	private UserService userService;

	@Override
	public String index(Model model) {
		return "information/information_index";
	}
	
	

	@RequestMapping(value = "/toAddPage")
	public String add(HttpServletRequest request, Model model, Long infoId) {
		/*
		 * InformationEntity infoEntity = new InformationEntity(); if (infoId != null) {
		 * infoEntity = service.findOne(infoId); } request.setAttribute("infoEntity",
		 * infoEntity);
		 */
		return "information/information_add";
	}

	@RequestMapping(value = "/toEditPage")
	public String toEditPage(HttpServletRequest request, Model model, Long infoId) {
		InformationEntity infoEntity = new InformationEntity();
		if (infoId != null) {
			infoEntity = service.findOne(infoId);
		}
		request.setAttribute("infoEntity", infoEntity);
		return "information/information_add";
	}
	
	@RequestMapping(value = "/toShowPage")
	public String toShowPage(HttpServletRequest request, Model model, Long infoId) {
		InformationEntity infoEntity = new InformationEntity();
		if (infoId != null) {
			infoEntity = service.findOne(infoId);
		}
		request.setAttribute("infoEntity", infoEntity);
		return "information/information_show";
	}
	
	@RequestMapping(value = "/toCheckPage")
	public String toCheckPage(HttpServletRequest request, Model model) {
		return "information/information_check";
	}
	
	@RequestMapping(value = "/toCheckReason")
	public String toCheckReason(HttpServletRequest request, Model model, Long InfoId) {
		request.setAttribute("infoId", InfoId);
		return "information/information_check_reason";
	}

	@RequestMapping(value = "/saveCoverImage")
	@ResponseBody
	public Map<String, Object> uploadImage(Model model, HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			MultipartHttpServletRequest servletRequest = (MultipartHttpServletRequest) request;
			MultipartFile coverImg = servletRequest.getFile("CoverImage");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String fileName = coverImg.getOriginalFilename();
			List<Object> fileList = FileUtil.getNewFile(fileName, "informationCover", request);
			File newFile = (File) fileList.get(0);
			coverImg.transferTo(newFile);
			result.put("success", true);
			result.put("msg", "上传成功");
			result.put("imgPath", fileList.get(1));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	/**
	 * 保存资讯和封面图片
	 */
	@RequestMapping(value = "/saveInformation")
	@ResponseBody
	public Map<String, Object> savePromotion(InformationEntity entity, String imgurlStr, String coverImagePath,
			HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		if (entity.getId() != null) {
			// 删除旧图片
			InformationEntity temp = service.findOne(entity.getId());
			CopyPropertiesUtil.copyPropertiesIgnoreNull(entity, temp);
			temp.setGmtModified(new Date());
			temp.setLastModifiedById(LoginContextHolder.get().getUserId());
			entity = temp;
		} else {
			entity.setCreateById(LoginContextHolder.get().getUserId());
			entity.setStatus(0L);
			entity.setGmtCreate(new Date());
		}
		entity.setHeadImage(coverImagePath);
		if (userService.findOne(LoginContextHolder.get().getUserId()) != null) {
			entity.setType(0L);
		} else {
			entity.setType(1L);
		}
		entity.setUuid(UUID.randomUUID().toString());
		entity = service.save(entity);
		result.put("success", true);
		return result;
	}

	@RequestMapping(value = "/coverImgCallBack")
	public void coverImgCallBack(String coverImgPath, HttpServletRequest request, HttpServletResponse response) {
		service.coverImgCallBack(coverImgPath, response);
	}

	@RequestMapping(value = "/fileCallBack")
	public void imageCallBack(String fileName, HttpServletRequest request, HttpServletResponse response) {
		service.fileCallBack(fileName, response, FileUtil.getFileSavePath());
	}

	@AccessRequired("管理员")
	@RequestMapping(value = "/deleteInformation")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam("ids") Long id, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		if (id != null) {
			result = super.delete(id, model, request, response);
		} else {
			result.put("success", false);
			result.put("msg", "删除失败！");
		}
		return result;
	}

	@RequestMapping(value = "/send")
	@ResponseBody
	public Map<String, Object> send(Long InfoId, Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		if (InfoId != null) {
			InformationEntity informationEntity = service.findOne(InfoId);
			informationEntity.setStatus(1L);
			service.save(informationEntity);
		} else {
			result.put("success", false);
			result.put("msg", "推送失败！");
		}
		result.put("success", true);
		result.put("msg", "推送成功！");
		return result;
	}
	//审核通过
	@RequestMapping(value = "/pass")
	@ResponseBody
	public Map<String, Object> pass(Long InfoId, Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		if (InfoId != null) {
			InformationEntity informationEntity = service.findOne(InfoId);
			informationEntity.setStatus(1L);
			service.save(informationEntity);
		} else {
			result.put("success", false);
			result.put("msg", "操作失败！");
		}
		result.put("success", true);
		result.put("msg", "操作成功！");
		return result;
	}
	//驳回
	@RequestMapping(value = "/reject")
	@ResponseBody
	public Map<String, Object> reject(Long id,String reason, Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		if (id != null) {
			InformationEntity informationEntity = service.findOne(id);
			informationEntity.setStatus(3L);
			informationEntity.setReason(reason);
			service.save(informationEntity);
		} else {
			result.put("success", false);
			result.put("msg", "操作失败！");
		}
		result.put("success", true);
		result.put("msg", "操作成功！");
		return result;
	}
}
