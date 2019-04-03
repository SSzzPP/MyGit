package com.yhlt.showcase.certificate.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.properties.BlockChainProperties;
import com.yhlt.showcase.base.util.DateUtil;
import com.yhlt.showcase.base.utils.BlockChainUtil;
import com.yhlt.showcase.certificate.entity.CoachCertificateEntity;
import com.yhlt.showcase.certificate.service.CoachCertificateService;
import com.yhlt.showcase.venue.controller.VenueUserController;
import com.yhlt.showcase.venue.entity.VenueUserEntity;
import com.yhlt.showcase.venue.service.VenueUserService;

@Controller
@RequestMapping("/admin/coach/certificate")
public class CoachCertificateController extends BaseController<CoachCertificateEntity, CoachCertificateService>{
	@Autowired
	private BlockChainProperties blockChainProperties;
	@Autowired
	private VenueUserService venueUserService;
	@Override
	public String index(Model model) {
		return "certificate/coach_certificate_index";
	}
	
	@RequestMapping("/editStatus")
	@ResponseBody
	public Map<String, Object> editStatus(Long id,Integer type){
		Map<String, Object> result = new HashMap<String, Object>();
		CoachCertificateEntity entity = service.findOne(id);
		//传值type 1 或2  对应通过/否决  对应status 审核成功/审核失败
		entity.setStatus(type);
		service.save(entity);
		VenueUserEntity venueUserEntity = venueUserService.findOne(entity.getCreateById());
		if(type == 1 ) {
			venueUserEntity.setType(1L);//设置用户类型为教练
			venueUserEntity.setStatus(1L);//设置用户状态为已认证
			venueUserEntity.setVenueId(entity.getVenueId());
			venueUserService.save(venueUserEntity);
		}
		if(blockChainProperties.getEnabled()) {
			String key = entity.getId().toString()+"."+entity.getCreateById().toString();
			JSONObject dataobj = new JSONObject();
			dataobj.put("name",entity.getRealName());
			dataobj.put("time", DateUtil.formatDate2Str(new Date(), "yyyy-MM-dd HH:mm:ss"));
			String isPass = type==1?"通过":"否决";
			dataobj.put("isPass",isPass);
			BlockChainUtil.sendItem("COACH_AUTH", key, dataobj);
		}
		result.put("success",true);
		result.put("msg","操作成功");
		return result;
	}
}
