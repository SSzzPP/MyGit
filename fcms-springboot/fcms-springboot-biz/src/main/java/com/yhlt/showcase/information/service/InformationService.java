package com.yhlt.showcase.information.service;

import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.base.utils.ImageUtils;
import com.yhlt.showcase.information.dao.InformationDao;
import com.yhlt.showcase.information.entity.InformationEntity;

/**
 * @Description: 资讯管理 service
 * @author linannan
 * @date 2018-07-23 16:34
 */
@Component
@Transactional
@BusinessLog(service = "资讯管理")
@DataPermission
public class InformationService extends BaseService<InformationEntity, InformationDao> {
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
