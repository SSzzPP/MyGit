package com.yhlt.showcase.video.controller;

import java.io.File;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.AccessRequired;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.utils.VideoUtil;
import com.yhlt.showcase.system.utils.FileUtil;
import com.yhlt.showcase.video.entity.VideoMainEntity;
import com.yhlt.showcase.video.service.VideoMainService;
/**
* 健身设施
* 
* @author swy
* */
@Controller
@RequestMapping(value = "/admin/video")
public class VideoController extends BaseController<VideoMainEntity, VideoMainService>{

	
	@Override
	public String index(Model model) {
		return "video/video_index";
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
		VideoMainEntity entity = new VideoMainEntity();
		if (id != null) {
			entity = service.findOne(id);
		}
		request.setAttribute("entity", entity);
		return "video/video_add";
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
	@RequestMapping(value = "/saveInfo")
	@ResponseBody
	public Map<String, Object> save(@ModelAttribute("T") VideoMainEntity t,Model model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (t.getId() != null) {
			VideoMainEntity temp = service.findOne(t.getId());
			BeanUtils.copyProperties(t, temp);
			temp.setGmtModified(new Date());
			temp.setLastModifiedById(LoginContextHolder.get().getUserId());
			t = temp;
		} else {
			t.setGmtCreate(new Date());
			t.setCreateById(LoginContextHolder.get().getUserId());
		}
		// 验证实体类
		Set<ConstraintViolation<VideoMainEntity>> constraintViolations = validator.getValidator().validate(t);
		// 如果大于0，说明有验证未通过信息
		if (constraintViolations.size() > 0) {
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("success", false);
			result.put("msg", constraintViolations.iterator().next().getMessage());
			return result;
		}

		Map<String, Object> result = new HashMap<String, Object>();
		
		MultipartHttpServletRequest servletRequest = (MultipartHttpServletRequest) request;
		MultipartFile PageImg = servletRequest.getFile("PageImg");
		MultipartFile video = servletRequest.getFile("video");
		if(video.getOriginalFilename() == null) {
			result.put("success", false);
			result.put("msg", "请选择视频");
			return result;
		}else if(!video.getOriginalFilename().endsWith(".mp4")){
			result.put("success", false);
			result.put("msg", "请选择正确的视频格式");
			return result;
		}
		if (PageImg != null && PageImg.getSize() != 0) {
			String pageName = PageImg.getOriginalFilename();
			if (!imgFlag(pageName)) {
				result.put("success", false);
				result.put("msg", "请选择正确的图片格式");
				return result;
			}
		}
		uploadImage(PageImg, video,t, request);
		service.save(t);
		result.put("success", true);
		result.put("obj", t);
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
	/**
	 * 图片和视频上传
	 * 
	 * @param t
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public VideoMainEntity uploadImage(MultipartFile pageImg,MultipartFile multipartFile, VideoMainEntity videoMainEntity, HttpServletRequest request) {
		try {
			if (multipartFile != null && multipartFile.getSize() != 0) {
				String fileName = multipartFile.getOriginalFilename();
				List<Object> fileList = FileUtil.getNewFile(fileName, "video", request);
				File newFile = (File) fileList.get(0);
				videoMainEntity.setSysFileName(newFile.getName().toLowerCase());
				videoMainEntity.setSysFilePath(fileList.get(1).toString());
				videoMainEntity.setDeleteFlag(0L);
				videoMainEntity.setFileSize((long) multipartFile.getBytes().length);
				videoMainEntity.setConvertFileSize(FileUtil.convertFileSize(multipartFile.getSize()));
				multipartFile.transferTo(newFile);
				videoMainEntity.setGmtCreate(new Date());
				videoMainEntity.setCreateById(LoginContextHolder.get().getUserId());
				videoMainEntity.setUuid(UUID.randomUUID().toString());
				String pageName = "";
				if (pageImg != null && pageImg.getSize() != 0) {
					pageName = pageImg.getOriginalFilename();
					List<Object> pageFileList = FileUtil.getNewFile(pageName, "pageVideo", request);
					File newPageFile = (File) pageFileList.get(0);
					videoMainEntity.setImgUrl(pageFileList.get(1).toString());
					pageImg.transferTo(newPageFile);
				}
				if(StringUtils.isBlank(pageName)){
					pageName = multipartFile.getOriginalFilename();
					pageName = pageName.substring(0, pageName.lastIndexOf('.'));
					pageName += ".jpg";
					List<Object> pageFileList = FileUtil.getNewFile(pageName, "pageVideo", request);
					//没有上传封面图，默认保存视频第五帧
					VideoUtil.fetchFrame(fileList.get(1).toString(), pageFileList.get(1).toString());
					videoMainEntity.setImgUrl(pageFileList.get(1).toString());
				}
			}
			return videoMainEntity;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	//判断是否是图片格式
	private Boolean imgFlag(String pageName) {
		if ((!StringUtils.isBlank(pageName))&&((pageName.endsWith(".jpg") || pageName.endsWith(".gif") || pageName.endsWith(".bmp")
				|| pageName.endsWith(".png") || pageName.endsWith(".jpeg") ))) {
			return true;
		}
		return false;
	}
}
