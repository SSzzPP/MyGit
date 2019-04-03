package com.yhlt.showcase.front.controller.venue;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhlt.showcase.Image.entity.ImageEntity;
import com.yhlt.showcase.Image.service.ImageService;
import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.properties.EnvProperties;
import com.yhlt.showcase.base.utils.ImageUtils;
import com.yhlt.showcase.venue.entity.VenueInfoTypeViewEntity;
import com.yhlt.showcase.venue.service.VenueInfoTypeViewService;

@Controller
@RequestMapping(value = "/front/venue/view")
public class FrontVenueInfoTypeViewController extends BaseController<VenueInfoTypeViewEntity, VenueInfoTypeViewService> {
	@Autowired
	private EnvProperties envProperties;
	@Autowired
	private ImageService imageService;
	

	/**
	 * 显示首页图
	 * 
	 * @param uuid
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/showImg")
	public void showImg(String uuid, HttpServletRequest request, HttpServletResponse response) {
		ImageEntity imageEntity = imageService.findOneByUuid(uuid);
		try {
			if (imageEntity != null && imageEntity.getSysFilePath() != null) {
				ImageUtils.imgToStream(imageEntity.getSysFilePath(), response);
			} else {
				ImageUtils.imgToStream(envProperties.getNoFile(), response);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}

	@Override
	public String index(Model model) {
		// TODO Auto-generated method stub
		return null;
	}

}
