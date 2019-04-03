package com.yhlt.showcase.video.service;

import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.base.utils.ImageUtils;
import com.yhlt.showcase.video.dao.VideoMainDao;
import com.yhlt.showcase.video.entity.VideoMainEntity;

/**
 * @Description: 视频 service
 * @author swy
 * @date 2018-08-16 17:34
 */
@Component
@Transactional
@BusinessLog(service = "视频")
@DataPermission
public class VideoMainService extends BaseService<VideoMainEntity, VideoMainDao> {
	
	public void coverImgCallBack(String coverImgPath, HttpServletResponse response) {
		try {
			ImageUtils.imgToStream(coverImgPath, response);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	/**
	 * 视频文件转换为Base64格式
	 * @param coverImgPath
	 * @param response
	 * @return
	 */
	public String soundToBase64(String soundPath) {
		try {
			return ImageUtils.getBase64VideoShow(soundPath);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
}
