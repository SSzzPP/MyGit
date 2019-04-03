package com.yhlt.showcase.Image.service;

import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.base.utils.ImageUtils;
import com.yhlt.showcase.Image.entity.ImageEntity;
import com.yhlt.showcase.Image.dao.ImageDao;

/**
 * @Description: 图片管理 service
 * @author linannan
 * @date 2018-07-20 11:26
 */
@Component
@Transactional
@BusinessLog(service = "图片管理")
@DataPermission
public class ImageService extends BaseService<ImageEntity, ImageDao> {
	
	public void coverImgCallBack(String coverImgPath, HttpServletResponse response) {
		try {
			ImageUtils.imgToStream(coverImgPath, response);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}

