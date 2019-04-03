package com.yhlt.showcase.manage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhlt.showcase.Image.entity.ImageEntity;
import com.yhlt.showcase.Image.service.ImageService;
import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.properties.BlockChainProperties;
import com.yhlt.showcase.base.utils.BlockChainUtil;
import com.yhlt.showcase.complaint.entity.ComplaintMainEntity;
import com.yhlt.showcase.complaint.service.ComplaintMainService;
import com.yhlt.showcase.venue.entity.VenueEquipmentTypeEntity;
import com.yhlt.showcase.venue.entity.VenueInfoEntity;
import com.yhlt.showcase.venue.entity.VenueTypeEntity;
import com.yhlt.showcase.venue.entity.VenueUserEntity;
import com.yhlt.showcase.venue.service.VenueEquipmentTypeService;
import com.yhlt.showcase.venue.service.VenueInfoService;
import com.yhlt.showcase.venue.service.VenueTypeService;
import com.yhlt.showcase.venue.service.VenueUserService;

/**
 * 监管信息管理
 * 
 * @authorlinannan
 * 
 */
@Controller
@RequestMapping(value = "/admin/manage/info")
public class VenueManageController extends BaseController<VenueInfoEntity, VenueInfoService> {
	
	@Autowired
	private VenueTypeService venueTypeService;
	@Autowired
	private VenueInfoService venueInfoService;
	@Autowired
	private ImageService imageService;
	@Autowired
	private ComplaintMainService complaintService;
	@Autowired
	private VenueEquipmentTypeService venueEquipmentTypeService;
	@Autowired
	private VenueUserService venueUserService;
	@Autowired
	private BlockChainProperties blockChainProperties;
	//所有场馆信息列表页面
	@Override
	public String index(Model model) {
		return "manage/mymanage_index";
	}
	//基础数据 场馆投诉
	@RequestMapping(value = "/toComplaint")
	public String toComplaint(Long venueId, HttpServletRequest request, Model model) {
		request.setAttribute("venueId", venueId);
		return "manage/complaint_index";
	}
	//双击展示场馆信息
	@RequestMapping(value = "/toVenueInfo")
	public String toVenueInfo(HttpServletRequest request, Model model, Long venueId) {
		VenueInfoEntity venueInfoEntity = new VenueInfoEntity();
		String venueTypeIds = "";
		if (venueId != null) {
			venueInfoEntity = service.findOne(venueId);
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("EQ_venueId", venueId);
			List<VenueTypeEntity> venueTypeEntities = venueTypeService.findByParams(params);
			if (!venueTypeEntities.isEmpty()) {
				for (VenueTypeEntity venueTypeEntity : venueTypeEntities) {
					venueTypeIds += venueTypeEntity.getTypeId() + ",";
				}
			}
		}
		request.setAttribute("venueTypeIds", venueTypeIds);
		request.setAttribute("venueInfoEntity", venueInfoEntity);
		return "manage/venue_info";
	}
	//tab页分页面之单个场馆信息
	@RequestMapping("/tovenueInfo")
	public String toVenueInfo(Long id,HttpServletRequest request){
		if(blockChainProperties.getEnabled()) {
			request.setAttribute("dataModItem", BlockChainUtil.getLastestDataItemByKey("VENUE_AUTH", id.toString()));
		}
		request.setAttribute("venueInfo", venueInfoService.findOne(id));
		return "manage/venueinfo";
	}
	//tab页分页面之某个场馆设施信息
	@RequestMapping("/tovenueequip")
	public String toVenueEquip(Long id,HttpServletRequest request){
		Map<String, Object> params=new HashMap<String,Object>();
		params.put("EQ_venueId",id);
		List<VenueEquipmentTypeEntity> list = 
				venueEquipmentTypeService.findByParams(params);
		request.setAttribute("equipments", list);
		return "manage/venue_equipment";
	}
	
	//tab页分页面之场馆教练信息
	@RequestMapping("/toVenueCoach")
	public String toVenueCoach(Long id,HttpServletRequest request){
		Map<String, Object> params=new HashMap<String,Object>();
		params.put("EQ_venueId",id);
		params.put("EQ_type",1);
		List<VenueUserEntity> list=venueUserService.findByParams(params);
		request.setAttribute("coachs", list);
		return "manage/venue_coach";
	}
	//tab页分页面之用户评价
	@RequestMapping("/toVenueVealuate")
	public String toVenueVealuate(Long id,HttpServletRequest request){
		request.setAttribute("venueId", id);
		return "manage/venue_vealuate";
	}
	//tab页分页面之用户投诉页面
	@RequestMapping("/toVenueComplaint")
	public String toVenueComplaint(Long id,HttpServletRequest request){
		request.setAttribute("venueId",id);
		return "manage/venue_complaint";
	}
	//tab页总页面
	@RequestMapping("/toVenue")
	public String toVenue(Long venueId, HttpServletRequest request, Model model){
		request.setAttribute("venueId", venueId);
		return "manage/myvenueinfo_index";
	}
	

	
}
