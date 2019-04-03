package com.yhlt.showcase.channel;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.information.entity.InformationEntity;
import com.yhlt.showcase.information.service.InformationService;

/**
 * 健身频道
 * 
 * @author linannan
 * 
 */
@Controller
@RequestMapping(value = "/mobile/channel")
public class ChannelController extends BaseController<InformationEntity, InformationService> {
	/**
	 * index
	 * 
	 * @param model
	 * @return
	 * @author linannan
	 * @date 2014-11-19 下午3:01:44
	 */
	@RequestMapping(value = "/toSportsChannel")
	public String index(HttpServletRequest request, Model model) {
		return "channel/sports_channel_index";
	}

}
