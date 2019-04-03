package com.yhlt.showcase.venue.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhlt.showcase.Image.service.ImageService;
import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.properties.EnvProperties;
import com.yhlt.showcase.base.utils.ImageUtils;
import com.yhlt.showcase.venue.entity.VenueUserTypeViewEntity;
import com.yhlt.showcase.venue.service.VenueUserTypeViewService;

@Controller
@RequestMapping(value = "/mobile/user/view")
public class VenueUserTypeViewController extends BaseController<VenueUserTypeViewEntity, VenueUserTypeViewService> {
	@Autowired
	private EnvProperties envProperties;


	/**
	 * 显示头像
	 * 
	 * @param uuid
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/showImg")
	public void showImg(String uuid, HttpServletRequest request, HttpServletResponse response) {
		VenueUserTypeViewEntity venueUserTypeViewEntity = service.findOneByUuid(uuid);

		try {
			if (venueUserTypeViewEntity.getImgUrl() != null) {
				ImageUtils.imgToStream(venueUserTypeViewEntity.getImgUrl(), response);
			} else {
				ImageUtils.imgToStream(envProperties.getNoUserImg(), response);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}

}
