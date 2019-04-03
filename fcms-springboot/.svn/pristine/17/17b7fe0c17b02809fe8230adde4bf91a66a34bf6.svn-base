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

import org.apache.commons.lang3.StringUtils;
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

import com.alibaba.fastjson.JSONObject;
import com.yhlt.showcase.Image.entity.ImageEntity;
import com.yhlt.showcase.Image.service.ImageService;
import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.properties.BlockChainProperties;
import com.yhlt.showcase.base.security.AccessRequired;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.utils.BlockChainUtil;
import com.yhlt.showcase.base.utils.ImageUtils;
import com.yhlt.showcase.dict.DictEntity;
import com.yhlt.showcase.dict.DictService;
import com.yhlt.showcase.system.utils.FileUtil;
import com.yhlt.showcase.venue.entity.VenueInfoEntity;
import com.yhlt.showcase.venue.entity.VenueTypeEntity;
import com.yhlt.showcase.venue.service.VenueInfoService;
import com.yhlt.showcase.venue.service.VenueTypeService;

/**
 * 场馆管理
 * 
 * @authorlinannan
 * 
 */
@Controller
@RequestMapping(value = "/admin/venue/info")
public class VenueInfoController extends BaseController<VenueInfoEntity, VenueInfoService> {
	@Autowired
	private VenueTypeService venueTypeService;
	@Autowired
	private ImageService imageService;
	@Autowired
	private DictService dictService;
	@Autowired
	private BlockChainProperties blockChainProperties;

	@Override
	public String index(Model model) {
		return "venue/venue_index";
	}

	@RequestMapping(value = "/add")
	public String add(HttpServletRequest request, Model model, Long venueId) {
		VenueInfoEntity venueInfoEntity = new VenueInfoEntity();
		String venueTypeIds = "";
		if (venueId != null) {
			venueInfoEntity = service.findOne(venueId);
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("EQ_venueId", venueId);
			List<VenueTypeEntity> venueTypeEntities = venueTypeService.findByParams(params);
			if (!venueTypeEntities.isEmpty()) {
				for (VenueTypeEntity venueTypeEntity : venueTypeEntities) {
					venueTypeIds += venueTypeEntity.getTypeId() + ",";
				}
			}
		}
		if (!"".equals(venueTypeIds)) {
			String ids = venueTypeIds.substring(0, venueTypeIds.length() - 1);
			request.setAttribute("venueTypeIds", ids);
		} else {
			request.setAttribute("venueTypeIds", venueTypeIds);
		}
		request.setAttribute("venueInfoEntity", venueInfoEntity);
		return "venue/venue_add";
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
	public Map<String, Object> save(@ModelAttribute("T") VenueInfoEntity t, String typeIds, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Long venueId = t.getId();
		// 判断是修改还是新增
		boolean newFlag = true;
		if (t.getId() != null) {
			newFlag = false;
			VenueInfoEntity temp = service.findOne(t.getId());
			BeanUtils.copyProperties(t, temp);
			temp.setGmtModified(new Date());
			temp.setLastModifiedById(LoginContextHolder.get().getUserId());
			t = temp;
		} else {
			t.setGmtCreate(new Date());
			t.setCreateById(LoginContextHolder.get().getUserId());
		}
		// 验证实体类
		Set<ConstraintViolation<VenueInfoEntity>> constraintViolations = validator.getValidator().validate(t);
		// 如果大于0，说明有验证未通过信息
		if (constraintViolations.size() > 0) {
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("success", false);
			result.put("msg", constraintViolations.iterator().next().getMessage());
			return result;
		}
		VenueInfoEntity venueInfoEntity = service.save(t);
		// 区块链存场馆认证
		if (newFlag) {
			if (blockChainProperties.getEnabled()) {
				DictEntity dictEntity = dictService.findDict("CERTIFICATION_STATUS", "1");
				if (dictEntity != null && venueInfoEntity.getCertificationStatus().equals(dictEntity.getId())) {
					JSONObject dataobj = new JSONObject();
					dataobj.put("name", venueInfoEntity.getName());
					dataobj.put("status", "认证通过！");
					BlockChainUtil.sendItem("VENUE_AUTH", venueInfoEntity.getId().toString(), dataobj);
				}
			}
		}
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("EQ_venueId", venueInfoEntity.getId());
		List<VenueTypeEntity> venueTypeEntities = venueTypeService.findByParams(params);
		if (!venueTypeEntities.isEmpty()) {
			venueTypeService.delete(venueTypeEntities);
		}
		if (StringUtils.isNotBlank(typeIds)) {
			String[] typeId = typeIds.split(",");
			for (String id : typeId) {
				VenueTypeEntity venueTypeEntity = new VenueTypeEntity();
				venueTypeEntity.setTypeId(Long.valueOf(id));
				venueTypeEntity.setVenueId(venueInfoEntity.getId());
				venueTypeEntity.setGmtCreate(new Date());
				venueTypeEntity.setCreateById(LoginContextHolder.get().getUserId());
				venueTypeService.saveMap(venueTypeEntity);
			}
		}
		if (venueId == null) {
			MultipartHttpServletRequest servletRequest = (MultipartHttpServletRequest) request;
			MultipartFile PageImg = servletRequest.getFile("PageImg");
			List<MultipartFile> EnvironmentImg = servletRequest.getFiles("EnvironmentImg");
			MultipartFile LicenseImg = servletRequest.getFile("LicenseImg");
			uploadImage(PageImg, venueInfoEntity.getId(), request, "PageImg");
			uploadImages(EnvironmentImg, venueInfoEntity.getId(), request, "EnvironmentImg");
			uploadImage(LicenseImg, venueInfoEntity.getId(), request, "LicenseImg");
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		result.put("obj", venueInfoEntity);
		return result;
	}

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

	// 多文件上传
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

	public ImageEntity uploadImage(MultipartFile multipartFile, Long venueId, HttpServletRequest request, String imageType) {
		try {
			if (multipartFile != null && multipartFile.getSize() != 0) {
				ImageEntity imageEntity = new ImageEntity();
				String fileName = multipartFile.getOriginalFilename();
				List<Object> fileList = FileUtil.getNewFile(fileName, imageType, request);
				File newFile = (File) fileList.get(0);
				imageEntity.setVenueId(venueId);
				imageEntity.setSysFileName(newFile.getName().toLowerCase());
				imageEntity.setSysFilePath(fileList.get(1).toString());
				imageEntity.setDeleteFlag(0L);
				imageEntity.setModule(1L);
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

	@RequestMapping(value = "/venueImg")
	public void venueImg(String uuid, HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("EQ_uuid", uuid);
		ImageEntity imageEntity = imageService.findOneByParams(map);
		ImageUtils.imgToStream(imageEntity.getSysFilePath(), response);
	}
}
