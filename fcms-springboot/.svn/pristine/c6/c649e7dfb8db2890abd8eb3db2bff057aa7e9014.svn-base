package com.yhlt.showcase.venue.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhlt.showcase.Image.entity.ImageEntity;
import com.yhlt.showcase.Image.service.ImageService;
import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.properties.EnvProperties;

@Controller
@RequestMapping(value = "/mobile/image")
public class ImageController extends BaseController<ImageEntity, ImageService> {
	@Autowired
	private EnvProperties envProperties;

	@RequestMapping(value = "/showImage")
	public void showImage(String uuid, HttpServletRequest request, HttpServletResponse response) {
		ImageEntity imageEntity = service.findOneByUuid(uuid);
		if (imageEntity != null && imageEntity.getSysFilePath() != null) {
			service.coverImgCallBack(imageEntity.getSysFilePath(), response);
		} else {
			service.coverImgCallBack(envProperties.getNoFile(), response);
		}
	}
}
