package com.yhlt.showcase.video.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.properties.EnvProperties;
import com.yhlt.showcase.video.entity.VideoMainEntity;
import com.yhlt.showcase.video.service.VideoMainService;

/**
 * 视频
 * 
 * @author linannan
 * 
 */
@Controller
@RequestMapping(value = "/mobile/video/main")
public class VideoMainController extends BaseController<VideoMainEntity, VideoMainService> {

	@Autowired
	private EnvProperties envProperties;

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
	 * 视频文件播放，返回path
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
		if (videoMainEntity != null) {
			result.put("success", true);
			result.put("path", videoMainEntity.getSysFilePath());
			result.put("title", videoMainEntity.getTitle());
		}
		return result;
	}

}
