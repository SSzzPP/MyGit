package com.yhlt.showcase.message.service;

import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.base.utils.ImageUtils;
import com.yhlt.showcase.message.entity.MessageImageEntity;
import com.yhlt.showcase.message.dao.MessageImageDao;

/**
 * @Description: 社区圈照片 service
 * @author swy
 * @date 2018-07-27 13:47
 */
@Component
@Transactional
@BusinessLog(service = "社区圈照片")
@DataPermission
public class MessageImageService extends BaseService<MessageImageEntity, MessageImageDao> {
	/**
	 * 图片上传至页面
	 * @param coverImgPath
	 * @param response
	 */
	public void coverImgCallBack(String coverImgPath, HttpServletResponse response) {
		try {
			ImageUtils.imgToStream(coverImgPath, response);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public void fileCallBack(String fileName, HttpServletResponse response, String fileSavePath) {
		try {
			String imagePath = fileSavePath + fileName;
			ImageUtils.imgToStream(imagePath, response);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}

