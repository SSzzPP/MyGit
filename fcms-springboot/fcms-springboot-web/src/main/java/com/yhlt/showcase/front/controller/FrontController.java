package com.yhlt.showcase.front.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhlt.showcase.activity.service.ActivityItemService;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.security.SessionSecurityConstants;
import com.yhlt.showcase.base.utils.IpUtil;
import com.yhlt.showcase.front.entity.FrontTotalEntity;
import com.yhlt.showcase.front.service.FrontTotalService;
import com.yhlt.showcase.information.entity.InformationEntity;
import com.yhlt.showcase.information.service.InformationService;
import com.yhlt.showcase.venue.entity.VenueEquipmentTypeEntity;
import com.yhlt.showcase.venue.entity.VenueInfoEntity;
import com.yhlt.showcase.venue.entity.VenueUserEntity;
import com.yhlt.showcase.venue.service.VenueEquipmentTypeService;
import com.yhlt.showcase.venue.service.VenueInfoService;
import com.yhlt.showcase.venue.service.VenueUserService;

@Controller
@RequestMapping("/front")
public class FrontController {
	@Autowired
	private VenueInfoService venueInfoService;
	@Autowired
	private VenueEquipmentTypeService equipmentService;
	@Autowired
	private InformationService informationService;
	@Autowired
	private VenueUserService venueUserService;
	@Autowired 
	private ActivityItemService activityItemService;
	@Autowired
	private FrontTotalService frontTotalService;
	/**
	 * 首页
	 * 
	 * @author swy
	 */
	@RequestMapping()
	public String index(HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		// 当前服务器时间
		//request.setAttribute(SessionSecurityConstants.KEY_SYSTEM_DATETIME, DateFormatUtils.format(new Date(), "yyyy-MM-dd HH:mm:ss"));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		Date today = calendar.getTime();
		calendar.add(Calendar.DAY_OF_MONTH, +1);// +1今天的时间加一天
		Date today1 = calendar.getTime();
		String ip = IpUtil.getIpAddress(request);
		Map<String, Object> searchParams = new HashMap<String, Object>();
		try {
			String custName = "";
			if (LoginContextHolder.get() != null) {
				custName = LoginContextHolder.get().getUserName();
			}
			searchParams.put("EQ_requestIp", ip);
			searchParams.put("GTE_gmtCreate", sdf.format(today));
			searchParams.put("LT_gmtCreate", sdf.format(today1));
			List<FrontTotalEntity> counts = frontTotalService.findByParams(searchParams);
			FrontTotalEntity fentity = new FrontTotalEntity();
			fentity.setRequestIp(ip);
			fentity.setRequestTime(new Date());
			if (StringUtils.isNotBlank(custName)) {
				fentity.setRequestName(custName);
			}
			if (counts.size() == 0) {
				fentity.setIpv(1L);
			} else {
				fentity.setIpv(0L);
			}
			frontTotalService.save(fentity);
			searchParams.clear();
			searchParams.put("GTE_gmtCreate", sdf.format(today));
			searchParams.put("LT_gmtCreate", sdf.format(today1));
			searchParams.put("EQ_ipv", 1);
			httpSession.setAttribute(SessionSecurityConstants.KEY_TODAY_COUNT, frontTotalService.findByParams(searchParams).size());
			searchParams.clear();
			searchParams.put("EQ_ipv", 1);
			httpSession.setAttribute(SessionSecurityConstants.KEY_ALL_COUNT, frontTotalService.findByParams(searchParams).size());
			httpSession.setAttribute(SessionSecurityConstants.KEY_ALLIPV_COUNT, frontTotalService.findAll().size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "front/index";
	}

	@RequestMapping("/toVenueDetails")
	public String toVenueDetails(HttpServletRequest request, Model model, Long venueId) {
		VenueInfoEntity venueInfoEntity = new VenueInfoEntity();
		if (venueId != null) {
			venueInfoEntity = venueInfoService.findOne(venueId);
		}
		request.setAttribute("venueInfoEntity", venueInfoEntity);
		return "front/venue/venue_details";
	}

	@RequestMapping("/venue")
	public String venue() {
		return "front/venue/venue";
	}

	@RequestMapping("/toEquipmentDetails")
	public String toEquipmentDetails(HttpServletRequest request, Model model, Long equipmentId) {
		VenueEquipmentTypeEntity venueEquipmentTypeEntity = new VenueEquipmentTypeEntity();
		if (equipmentId != null) {
			venueEquipmentTypeEntity = equipmentService.findOne(equipmentId);
		}
		request.setAttribute("venueEquipmentTypeEntity", venueEquipmentTypeEntity);
		return "front/pubEquipment/equipment_details";
	}

	@RequestMapping("/pubEquipment")
	public String pubEquipment() {
		return "front/pubEquipment/pubEquipment";
	}

	/**
	 * 资讯列表 （所有资讯跳得同一个页面）
	 * 
	 * @author swy
	 */
	@RequestMapping("information")
	public String information(Long type, String moduleName, HttpServletRequest request) {
		if (type != null) {
			request.setAttribute("type", type);
			if(type == 1) {
				request.setAttribute("title", "健身资讯");
			}
		}else if (!StringUtils.isBlank(moduleName)) {
			request.setAttribute("moduleName", moduleName);
			if("banner".equals(moduleName)){
				request.setAttribute("title", "系统资讯");
			}else if("events".equals(moduleName)){
				request.setAttribute("title", "赛事资讯");
			}else if("regulation".equals(moduleName)){
				request.setAttribute("title", "法律法规");
			}
		}
		return "front/information/venue_info";
	}

	/**
	 * 资讯详情
	 * 
	 * @author swy
	 */
	@RequestMapping("/toInformationDetails")
	public String toInformationDetails(HttpServletRequest request, Model model, Long id) {
		InformationEntity entity = informationService.findOne(id);
		request.setAttribute("entity", entity);
		return "front/information/venue_info_details";
	}

	/**
	 * 健身教练/教练预约
	 * 
	 * @author swy
	 */
	@RequestMapping("/coach")
	public String coach() {
		return "front/coach/venue_coach";
	}

	/**
	 * 教练详情
	 * 
	 * @author swy
	 */
	@RequestMapping("/coachDetails")
	public String coachDetails(HttpServletRequest request, Model model, Long id) {
		VenueUserEntity entity = venueUserService.findOne(id);
		request.setAttribute("entity", entity);

		return "front/coach/venue_coach_info";
	}

	/**
	 * 场地管理
	 * 
	 * @author swy
	 */
	@RequestMapping("/venueEquipment")
	public String venueEquipment() {
		return "front/venue/venue_equipment";
	}

	/**
	 * 场地详情
	 * 
	 * @author swy
	 */
	@RequestMapping("/toVenueEquipmentDetails")
	public String toVenueEquipmentDetails(HttpServletRequest request, Model model, Long id) {
		VenueEquipmentTypeEntity venueEquipmentTypeEntity = equipmentService.findOne(id);
		request.setAttribute("venueEquipmentTypeEntity", venueEquipmentTypeEntity);
		VenueInfoEntity venueInfoEntity = venueInfoService.findOne(venueEquipmentTypeEntity.getVenueId());
		request.setAttribute("venueInfoEntity", venueInfoEntity);
		return "front/venue/venue_equipment_details";
	}

	@RequestMapping("/userMap")
	public String userMap() {
		return "front/map/user_map";
	}

	@RequestMapping("/userPoint")
	public String userPoint(HttpServletRequest request) {
		VenueUserEntity venueUserEntity = venueUserService.findOne(LoginContextHolder.get().getUserId());
		request.setAttribute("entity", venueUserEntity);
		return "front/point/user_point";
	}
	
	@RequestMapping("/sportCircle")
	public String sportCircle(HttpServletRequest request) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_id_1", 3499L);
		searchParams.put("EQ_id_2", 4399L);
		searchParams.put("EQ_id_3", 4400L);
		request.setAttribute("items", activityItemService.findByParams(searchParams));
		return "front/sportCircle/sport_circle";
	}
	
	/**
	 * 问卷调查
	 * 
	 * @author swy
	 */
	@RequestMapping("/survey")
	public String survey() {
		return "front/survey/survey_paper_list";
	}
}
