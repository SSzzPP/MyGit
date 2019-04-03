package com.yhlt.showcase.venue.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.venue.entity.VenueCourseEntity;
import com.yhlt.showcase.venue.service.VenueCourseService;

@Controller
@RequestMapping(value = "/mobile/venue/course")
public class VenueCourseController extends BaseController<VenueCourseEntity, VenueCourseService>{

	@RequestMapping(value = "/countCourse")
	@ResponseBody
	public Long countCourse(Long userId) {
		Map<String, Object> search = new HashMap<String, Object>();
		search.put("EQ_userId", userId);

		return service.count(search);
	}
}
