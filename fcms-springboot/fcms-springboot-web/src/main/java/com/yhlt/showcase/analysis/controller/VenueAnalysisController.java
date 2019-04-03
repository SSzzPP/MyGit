package com.yhlt.showcase.analysis.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.venue.dto.VenueAnalysisDto;
import com.yhlt.showcase.venue.entity.VenueInfoEntity;
import com.yhlt.showcase.venue.service.VenueInfoService;

/**
 * 场馆使用分析
 * 
 * @author lnn
 * 
 */
@Controller
@RequestMapping(value = "/admin/venue/analysis")
public class VenueAnalysisController extends BaseController<VenueInfoEntity, VenueInfoService> {

	@Override
	public String index(Model model) {
		return "analysis/venue_analysis_index";
	}

	@RequestMapping(value = "/findVenueAnalysisData")
	@ResponseBody
	public Map<String, Object> findVenueAnalysisData(Long venueId, HttpServletRequest request, Model model) {
		Map<String, Object> params = new HashMap<String, Object>();
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String dateDay = format.format(date);
		params.put("dateDay", dateDay);
		params.put("venueId", venueId);
		List<VenueAnalysisDto> analysisDtos = service.findVenueAnalysisData(params);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("rows", analysisDtos);
		result.put("total", analysisDtos.size());
		result.put("code", "200");
		result.put("msg", "");
		return result;

	}

}
