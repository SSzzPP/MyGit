package com.yhlt.showcase.venue.controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yhlt.showcase.Image.entity.ImageEntity;
import com.yhlt.showcase.Image.service.ImageService;
import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.properties.EnvProperties;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.utils.ImageUtils;
import com.yhlt.showcase.dict.DictEntity;
import com.yhlt.showcase.dict.DictService;
import com.yhlt.showcase.system.utils.FileUtil;
import com.yhlt.showcase.venue.entity.VenueEquipmentTypeEntity;
import com.yhlt.showcase.venue.service.VenueEquipmentTypeService;

@Controller
@RequestMapping(value = "/mobile/venue/equipment")
public class VenueEquipmentTypeController extends BaseController<VenueEquipmentTypeEntity, VenueEquipmentTypeService> {
	
	@Autowired
	private ImageService imageService;
	@Autowired
	private EnvProperties envProperties;
	@Autowired
	private DictService dictService;
	
	/**
	 * 健身路径跳转
	 * @return
	 */
	@RequestMapping("/toPubEquip")
	public String toPubEquip() {
		return "publicEquipment/pub_equip";
	}
	
	/**
	 * 健身路径详情跳转
	 * @param model
	 * @param pubEquipId
	 * @return
	 */
	@RequestMapping("/toPubEquipDetail")
	public String toPubEquipDetail(Model model,Long pubEquipId) {
		model.addAttribute("pubEquipId", pubEquipId);
		return "publicEquipment/pub_equip_detail";
	}
	/**
	 * 场地管理跳转
	 * @return
	 */
	@RequestMapping("/toEquipment")
	public String toEquipment() {
		return "equipment/equipment_index";
	}
	
	/**
	 * 健身路径环境图上传跳转
	 * @param model
	 * @param pubEquipId
	 * @return
	 */
	@RequestMapping("/toUploadEnvironment")
	public String toUploadEnvironment(Model model,Long pubEquipId) {
		model.addAttribute("pubEquipId", pubEquipId);
		return "publicEquipment/pub_equip_upload";
	}
	
	/**
	 * 健身路径定位上传跳转
	 * @param model
	 * @param pubEquipId
	 * @return
	 */
	@RequestMapping("/toPoint")
	public String toPoint(HttpServletRequest request,Long pubEquipId) {
		VenueEquipmentTypeEntity entity = service.findOne(pubEquipId);
		request.setAttribute("entity", entity);
		return "publicEquipment/pub_equip_point";
	}
	
	/**
	 * 场馆设施
	 * 
	 * @param venueId
	 * @return
	 */
	@RequestMapping(value = "/venueEquipment")
	@ResponseBody
	public List<VenueEquipmentTypeEntity> venueEquipment(Long venueId) {
		Map<String, Object> searchParams = new HashMap<String, Object>();

		searchParams.put("EQ_venueId", venueId);
		searchParams.put("EQ_publicFlag", 1L);

		List<VenueEquipmentTypeEntity> list = service.findByParams(searchParams);
		return list;
	}

	@RequestMapping(value = "/getName")
	@ResponseBody
	public Map<String, Object> getName(Long equipmentId) {
		Map<String, Object> result = new HashMap<String, Object>();
		if (equipmentId != null) {
			VenueEquipmentTypeEntity equipmentTypeEntity = service.findOne(equipmentId);
			result.put("success", true);
			result.put("venueName", equipmentTypeEntity.getVenueName());
			result.put("equipmentName", equipmentTypeEntity.getName());
		} else {
			result.put("success", false);
			result.put("msg", "功能异常，请联系客服！");
		}
		return result;
	}
	
	/**
	 * 显示首页图
	 * 
	 * @param uuid
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/showImg")
	public void showImg(String uuid, HttpServletRequest request, HttpServletResponse response) {
		ImageEntity imageEntity = imageService.findOneByUuid(uuid);
		try {
			if (imageEntity != null && imageEntity.getSysFilePath() != null) {
				ImageUtils.imgToStream(imageEntity.getSysFilePath(), response);
			} else {
				ImageUtils.imgToStream(envProperties.getNoFile(), response);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}
	
	/**
	 * 保存环境图
	 * 
	 * @param entity
	 * @param mediaId
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/saveEnvironmentImg")
	@ResponseBody
	public Map<String, Object> saveEnvironmentImg(Long pubEquipId, HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			// 转换成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			
			// 判断指定格式
			Iterator<String> suffixIter = multiRequest.getFileNames();
			while (suffixIter.hasNext()) {
				// 取得上传文件
				MultipartFile multipartFile = multiRequest.getFile(suffixIter.next());
				String fileName = multipartFile.getOriginalFilename().toLowerCase();
				if (!(fileName.endsWith(".jpg") || fileName.endsWith(".gif") || fileName.endsWith(".bmp")
						|| fileName.endsWith(".png") || fileName.endsWith(".mp4") || fileName.endsWith(".mov")
						|| fileName.endsWith(".wav")|| fileName.endsWith(".jpeg") )) {
					result.put("errorMsg", "图片或视频格式不正确");// 只能上传jpg/png/bmp/gif/mp4/mov格式图片视频，
					return result;
				}
			}
			// 取得request中的所有文件名
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				// 取得上传文件
				List<MultipartFile> multipartFileList = multiRequest.getFiles(iter.next());
				for (MultipartFile multipartFile : multipartFileList) {
					if (multipartFile != null) {
						uploadImage(multipartFile, pubEquipId, request);
					}
				}
			}
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 图片上传
	 * 
	 * @param t
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ImageEntity uploadImage(MultipartFile multipartFile, Long equipmentId, HttpServletRequest request) {
		try {
			if (multipartFile != null && multipartFile.getSize() != 0) {
				ImageEntity imageEntity = new ImageEntity();
				String fileName = multipartFile.getOriginalFilename();
				List<Object> fileList = FileUtil.getNewFile(fileName, "EquipmentEnvironmentImg", request);
				File newFile = (File) fileList.get(0);
				imageEntity.setEquipmentId(equipmentId);
				imageEntity.setSysFileName(newFile.getName().toLowerCase());
				imageEntity.setSysFilePath(fileList.get(1).toString());
				imageEntity.setDeleteFlag(0L);
				imageEntity.setModule(2L);
				imageEntity.setFileSize((long) multipartFile.getBytes().length);
				imageEntity.setConvertFileSize(FileUtil.convertFileSize(multipartFile.getSize()));
				multipartFile.transferTo(newFile);
				imageEntity.setGmtCreate(new Date());
				imageEntity.setCreateById(LoginContextHolder.get().getUserId());
				imageEntity.setUuid(UUID.randomUUID().toString());
				Map<String, Object> params = new HashMap<String, Object>();
				params.put("EQ_type", "IMG_TYPE");
				params.put("EQ_value", "EnvironmentImg");
				DictEntity dict = dictService.findOneByParams(params);
				imageEntity.setImgType(dict.getId());
				imageEntity = imageService.save(imageEntity);
				return imageEntity;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 保存定位
	 * 
	 * @param entity
	 * @param mediaId
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/savePoint")
	@ResponseBody
	public Map<String, Object> savePoint(Long id, String lng, String lat, HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			service.updateEquipment(id, lng, lat);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
