package com.yhlt.showcase.bigData.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.util.DateUtil;
import com.yhlt.showcase.system.dto.BigDataAgeDto;
import com.yhlt.showcase.system.dto.BigDataVisitDto;
import com.yhlt.showcase.system.service.BigDataAgeService;
import com.yhlt.showcase.system.service.BigDataVisitService;

/**
 * 数据统计
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "admin/bigData")
public class BigDataController {
	
	@Autowired
	private BigDataAgeService bigDataAgeService;
	@Autowired
	private BigDataVisitService bigDataVisitService;
	
	@RequestMapping(value = "count")
	public String count(Model model) {
		return "bigData/big_data_count";
	}
	/**
	 * 用户健身详情
	 */
	@RequestMapping(value = "toUserCase")
	public String toUserCase( HttpServletRequest request,Model model,Long index) {
		request.setAttribute("index", index);
		return "bigData/user_case";
	}
	
	/**
	 * 健身人群年龄段分布统计
	 * 
	 * @author swy
	 */
	@RequestMapping(value = "/findListOfAge")
	@ResponseBody
	public List<BigDataAgeDto> findListOfAge(HttpServletRequest request, Model model) {
		
		return bigDataAgeService.findList();
	}
	
	/**
	 * 访问量
	 * 
	 * @author swy
	 */
	@RequestMapping(value = "/findListOfVisit")
	@ResponseBody
	public List<BigDataVisitDto> findListOfVisit(HttpServletRequest request, Model model) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		/*SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date date = DateUtil.before(new Date(), 20) ;
		String startDateStr= sdf.format(date);
		searchParams.put("startDateStr", startDateStr);*/
		return bigDataVisitService.findListbyParam(searchParams);
	}
	
}
