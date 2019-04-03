package com.yhlt.showcase.events.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.information.entity.InformationEntity;
import com.yhlt.showcase.information.service.InformationService;

/**
 * 竞技赛事
 * 
 * @author linannan
 * 
 */
@Controller
@RequestMapping(value = "/mobile/events")
public class EventsController extends BaseController<InformationEntity, InformationService> {
	/**
	 * index
	 * 
	 * @param model
	 * @return
	 * @author linannan
	 * @date 2014-11-19 下午3:01:44
	 */
	@RequestMapping(value = "/toEvents")
	public String index(HttpServletRequest request, Model model) {
		return "events/events_index";
	}

}
