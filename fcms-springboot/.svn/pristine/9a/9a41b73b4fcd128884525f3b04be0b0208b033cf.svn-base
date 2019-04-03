package com.yhlt.showcase.venueUser.controller.information;

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
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
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
import com.yhlt.showcase.venue.entity.VenueUserEntity;
import com.yhlt.showcase.venue.service.VenueUserService;

/**
 * 场馆资讯管理
 * 
 * @author linannan
 * 
 */
@Controller
@RequestMapping(value = "/venue/information")
public class VenueInformationController extends BaseController<InformationEntity, InformationService> {
	@Autowired
	private UserService userService;
	@Autowired
	private VenueUserService venueUserService;

	@Override
	public String index(Model model) {
		return "venuePages/information/information_index";
	}

	@RequestMapping(value = "/toAddPage")
	public String add(HttpServletRequest request, Model model, Long infoId) {
		/*
		 * InformationEntity infoEntity = new InformationEntity(); if (infoId !=
		 * null) { infoEntity = service.findOne(infoId); }
		 * request.setAttribute("infoEntity", infoEntity);
		 */
		return "venuePages/information/information_add";
	}

	@RequestMapping(value = "/toEditPage")
	public String toEditPage(HttpServletRequest request, Model model, Long infoId) {
		InformationEntity infoEntity = new InformationEntity();
		if (infoId != null) {
			infoEntity = service.findOne(infoId);
		}
		request.setAttribute("infoEntity", infoEntity);
		return "venuePages/information/information_add";
	}

	@RequestMapping(value = "/toShowPage")
	public String toShowPage(HttpServletRequest request, Model model, Long infoId) {
		InformationEntity infoEntity = new InformationEntity();
		if (infoId != null) {
			infoEntity = service.findOne(infoId);
		}
		request.setAttribute("infoEntity", infoEntity);
		return "venuePages/information/information_show";
	}

	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(@RequestParam(value = "page", defaultValue = "1") Integer pageNum, @RequestParam(value = "rows", defaultValue = "10") Integer pageRows, @RequestParam(value = "sort", defaultValue = "id") String sort, @RequestParam(value = "order", defaultValue = "desc") String order, HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		Order o = new Order("desc".equals(order) ? Direction.DESC : Direction.ASC, sort);
		// 获取登录人的id
		Long userId = LoginContextHolder.get().getUserId();
		searchParams.put("EQ_createById", userId);
		Map<String, Object> result = service.findByParamsMap(searchParams, new PageRequest(pageNum - 1, pageRows, new Sort(o)));
		return result;
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
	public Map<String, Object> savePromotion(InformationEntity entity, String imgurlStr, String coverImagePath, HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		if (entity.getId() != null) {
			// 删除旧图片
			InformationEntity temp = service.findOne(entity.getId());
			CopyPropertiesUtil.copyPropertiesIgnoreNull(entity, temp);
			temp.setGmtModified(new Date());
			temp.setLastModifiedById(LoginContextHolder.get().getUserId());
			if (temp.getStatus() == 3)
				temp.setStatus(2L);
			entity = temp;
		} else {
			entity.setCreateById(LoginContextHolder.get().getUserId());
			entity.setStatus(0L);
			entity.setGmtCreate(new Date());
		}
		VenueUserEntity venueUserEntity = venueUserService.findOne(LoginContextHolder.get().getUserId());
		if (venueUserEntity != null) {
			entity.setVenueId(venueUserEntity.getVenueId());
		}
		entity.setHeadImage(coverImagePath);
		entity.setType(1L);
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

	@RequestMapping(value = "/send")
	@ResponseBody
	public Map<String, Object> send(Long InfoId, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		if (InfoId != null) {
			InformationEntity informationEntity = service.findOne(InfoId);
			// 场馆发布资讯后需要管理人员审核
			informationEntity.setStatus(2L);
			service.save(informationEntity);
		} else {
			result.put("success", false);
			result.put("msg", "推送失败！");
		}
		result.put("success", true);
		result.put("msg", "推送成功！");
		return result;
	}

	// 查询是否存在该登陆场馆的场馆介绍
	@RequestMapping(value = "/checkExistIntroduce")
	@ResponseBody
	public Map<String, Object> checkExistIntroduce(HttpServletRequest request) {
		VenueUserEntity venueUserEntity = venueUserService.findOne(LoginContextHolder.get().getUserId());
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("EQ_venueId", venueUserEntity.getVenueId());
		params.put("EQ_moduleId", 503l);
		InformationEntity entity = service.findOneByParams(params);
		Map<String, Object> result = new HashMap<String, Object>();
		if (entity != null) {
			result.put("success", true);
		} else {
			result.put("success", false);
		}
		result.put("obj", entity);
		return result;
	}
}
