package com.yhlt.showcase.message.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.information.entity.InformationEntity;
import com.yhlt.showcase.message.entity.MessageImageEntity;
import com.yhlt.showcase.message.service.MessageImageService;
import com.yhlt.showcase.system.utils.FileUtil;

@Controller
@RequestMapping(value = "/mobile/message/image")
public class MessageImageController extends BaseController<MessageImageEntity, MessageImageService> {
	
	@RequestMapping(value = "/showImage")
	public void showImage(String uuid, HttpServletRequest request, HttpServletResponse response) {
		MessageImageEntity messageImageEntity = service.findOneByUuid(uuid);
		service.coverImgCallBack(messageImageEntity.getImgUrl(), response);
	}
	
	@RequestMapping(value = "/showContentImage")
	public void showContentImage(String fileName, HttpServletRequest request, HttpServletResponse response) {
		String name = fileName.substring(fileName.indexOf("=") + 1);
		service.fileCallBack(name, response, FileUtil.getFileSavePath());
	}
}
