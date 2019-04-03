package com.yhlt.showcase.venue.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yhlt.showcase.Image.entity.ImageEntity;
import com.yhlt.showcase.Image.service.ImageService;
import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.properties.EnvProperties;
import com.yhlt.showcase.base.security.AccessRequired;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.utils.ImageUtils;
import com.yhlt.showcase.dict.DictEntity;
import com.yhlt.showcase.dict.DictService;
import com.yhlt.showcase.system.utils.FileUtil;
import com.yhlt.showcase.venue.entity.VenueEquipmentTypeEntity;
import com.yhlt.showcase.venue.entity.VenueUserTypeViewEntity;
import com.yhlt.showcase.venue.service.VenueEquipmentTypeService;

/**
 * 健身设施
 * 
 * @author swy
 */
@Controller
@RequestMapping(value = "/admin/venue/equipment/type")
public class VenueEquipmentTypeController extends BaseController<VenueEquipmentTypeEntity, VenueEquipmentTypeService> {

	@Autowired
	private ImageService imageService;
	@Autowired
	private DictService dictService;
	@Autowired
	private EnvProperties envProperties;

	@Override
	public String index(Model model) {
		return "venue/equipment/venue_equipment_type";
	}
	@RequestMapping("/toPubEquipIndex")
	public String toPubEquipIndex() {
		return "pubEquipment/pub_equipmen_index";
	}
	/**
	 * 跳转到新增/修改页面
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/add")
	public String toAddPage(Long id, HttpServletRequest request, Model model) {
		VenueEquipmentTypeEntity entity = new VenueEquipmentTypeEntity();
		if (id != null) {
			entity = service.findOne(id);
		}
		request.setAttribute("entity", entity);
		return "venue/equipment/venue_equipment_add";
	}
	/**
	 * 跳转到健身路径新增/修改页面
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/addPub")
	public String toAddPubPage(Long id, HttpServletRequest request, Model model) {
		VenueEquipmentTypeEntity entity = new VenueEquipmentTypeEntity();
		if (id != null) {
			entity = service.findOne(id);
		}
		request.setAttribute("entity", entity);
		return "pubEquipment/pub_equipment_add";
	}
	/**
	 * 跳转到修改经纬度页面
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/toEditInfo")
	public String toEditInfo(Long id, HttpServletRequest request, Model model) {
		VenueEquipmentTypeEntity entity = new VenueEquipmentTypeEntity();
		if (id != null) {
			entity = service.findOne(id);
		}
		request.setAttribute("equipmentEntity", entity);
		return "venue/equipment/equipment_edit";
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
	@AccessRequired("管理员")
	@RequestMapping(value = "/saveVenue")
	@ResponseBody
	public Map<String, Object> save(@ModelAttribute("T") VenueEquipmentTypeEntity t, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (t.getId() != null) {
			VenueEquipmentTypeEntity temp = service.findOne(t.getId());
			BeanUtils.copyProperties(t, temp);
			temp.setGmtModified(new Date());
			temp.setLastModifiedById(LoginContextHolder.get().getUserId());
			t = temp;
		} else {
			t.setGmtCreate(new Date());
			t.setCreateById(LoginContextHolder.get().getUserId());
		}
		// 验证实体类
		Set<ConstraintViolation<VenueEquipmentTypeEntity>> constraintViolations = validator.getValidator().validate(t);
		// 如果大于0，说明有验证未通过信息
		if (constraintViolations.size() > 0) {
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("success", false);
			result.put("msg", constraintViolations.iterator().next().getMessage());
			return result;
		}

		Map<String, Object> result = new HashMap<String, Object>();
		VenueEquipmentTypeEntity venueEquipmentTypeEntity = service.save(t);

		MultipartHttpServletRequest servletRequest = (MultipartHttpServletRequest) request;
		MultipartFile PageImg = servletRequest.getFile("PageImg");
		List<MultipartFile> EnvironmentImg = servletRequest.getFiles("EnvironmentImg");
		uploadImage(PageImg, venueEquipmentTypeEntity.getId(), request, "PageImg");
		uploadImages(EnvironmentImg, venueEquipmentTypeEntity.getId(), request, "EnvironmentImg");
		result.put("success", true);
		result.put("obj", venueEquipmentTypeEntity);
		return result;
	}

	/**
	 * 删除
	 * 
	 * @param t
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@AccessRequired("管理员")
	@RequestMapping(value = "/deleteInfo")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam("ids") Long id, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		if (id != null) {
			result = super.delete(id, model, request, response);
		} else {
			result.put("success", false);
			result.put("msg", "删除失败！");
		}
		return result;
	}

	/**
	 * 多图片上传
	 * 
	 * @param t
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public List<ImageEntity> uploadImages(List<MultipartFile> multipartFiles, Long venueId, HttpServletRequest request, String imageType) {
		try {
			List<ImageEntity> list = new ArrayList<ImageEntity>();
			if (multipartFiles != null && !multipartFiles.isEmpty()) {
				// 循环获取file数组中得文件
				for (MultipartFile multipartFile : multipartFiles) {
					list.add(uploadImage(multipartFile, venueId, request, imageType));
				}
				return list;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
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
	public ImageEntity uploadImage(MultipartFile multipartFile, Long equipmentId, HttpServletRequest request, String imageType) {
		try {
			if (multipartFile != null && multipartFile.getSize() != 0) {
				ImageEntity imageEntity = new ImageEntity();
				String fileName = multipartFile.getOriginalFilename();
				List<Object> fileList = FileUtil.getNewFile(fileName, "Equipment" + imageType, request);
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
				params.put("EQ_value", imageType);
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
	 * 修改经纬度
	 * 
	 * @param t
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@AccessRequired("管理员")
	@RequestMapping(value = "/updateInfo")
	@ResponseBody
	public Map<String, Object> updateInfo(Long id, String lng, String lat, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		if (id != null) {
			service.updateEquipment(id, lng, lat);
			result.put("success", true);
		} else {
			result.put("success", false);
			result.put("msg", "保存失败！");
		}

		return result;
	}
	/**
	 * 跳转健身路径tab页  详情页面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/toPubDetail")
	public String toPubDetail(Long id,Model model) {
		model.addAttribute("pubEntity", service.findOne(id));
		return "pubEquipment/pub_equipment_detail";
	}
	/**
	 * 跳转健身路径tab页总页
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/toPubEquipTabs")
	public String toPubEquipTabs(Long id,Model model) {
		model.addAttribute("pubEquipId", id);
		return "pubEquipment/pub_equipment_tabs";
	}
	/**
	 * 跳转健身路径tab页  全景预览
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/toPubView")
	public String toPubView(Long id,Model model) {
		model.addAttribute("pubEntity", service.findOne(id));
		return "pubEquipment/pub_equipment_view";
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
}
