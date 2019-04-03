package com.yhlt.showcase.video.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.properties.EnvProperties;
import com.yhlt.showcase.video.entity.VideoMainEntity;
import com.yhlt.showcase.video.service.VideoMainService;

/**
 * 学习中心
 * 
 * @author linannan
 * 
 */
@Controller
@RequestMapping(value = "/mobile/video/main")
public class VideoMainController extends BaseController<VideoMainEntity, VideoMainService> {

	@Autowired
	private EnvProperties envProperties;

	/**
	 * index
	 * 
	 * @param model
	 * @return
	 * @author linannan
	 * @date 2014-11-19 下午3:01:44
	 */
	@RequestMapping(value = "/toVideo")
	public String index(HttpServletRequest request, Model model) {
		return "video/video_index";
	}

	/**
	 * index
	 * 
	 * @param model
	 * @return
	 * @author linannan
	 * @date 2014-11-19 下午3:01:44
	 */
	@RequestMapping(value = "/toVideoDetail")
	public String toVideoDetail(HttpServletRequest request, Model model, String uuid) {
		VideoMainEntity videoMainEntity = service.findOneByUuid(uuid);
		// String sysPath =
		// request.getSession().getServletContext().getRealPath("");
		String name = videoMainEntity.getSysFileName();
		Date gmtCreate = videoMainEntity.getGmtCreate();
		SimpleDateFormat today = new SimpleDateFormat("yyyyMMdd");
		String dateFormat = today.format(gmtCreate);
		String src = "Files\\video\\" + dateFormat + "\\" + name;
		String newURL = src.replaceAll("\\\\", "/");
		request.setAttribute("videoSrc", newURL);
		return "video/video_detail";
	}

	@RequestMapping(value = "/showVideoImage")
	public void showImage(String uuid, HttpServletRequest request, HttpServletResponse response) {
		VideoMainEntity videoEntity = service.findOneByUuid(uuid);
		if (videoEntity.getImgUrl() != null) {
			service.coverImgCallBack(videoEntity.getImgUrl(), response);
		} else {
			service.coverImgCallBack(envProperties.getNoFile(), response);
		}
	}

	/**
	 * 视频文件播放，返回Base64字符串
	 * 
	 * @param uuid
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/videoPlay")
	@ResponseBody
	public Map<String, Object> soundPlayByUuid(String uuid, HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", false);
		VideoMainEntity videoMainEntity = service.findOneByUuid(uuid);
		String soundBase64 = service.soundToBase64(videoMainEntity.getSysFilePath());
		if (StringUtils.isNotBlank(soundBase64)) {
			result.put("success", true);
			result.put("data", soundBase64);
		}
		return result;
	}

}
