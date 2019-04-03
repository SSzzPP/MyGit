package com.yhlt.showcase.venue.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.AccessRequired;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.venue.entity.VenueUserEntity;
import com.yhlt.showcase.venue.entity.VenueUserRecordEntity;
import com.yhlt.showcase.venue.service.VenueUserRecordService;
import com.yhlt.showcase.venue.service.VenueUserService;

/**
 * 教练履历
 * 
 * @author linannan
 */
@Controller
@RequestMapping(value = "/admin/venue/user/record")
public class VenueUserRecordController extends BaseController<VenueUserRecordEntity, VenueUserRecordService> {

	@Autowired
	private VenueUserService venueUserService;

	@Override
	public String index(Model model) {
		return null;
	}

	/**
	 * 跳转到新增页面
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/toAddRecord")
	public String toAddPage(Long venueUserId, Long id, HttpServletRequest request, Model model) {
		VenueUserRecordEntity entity = new VenueUserRecordEntity();
		if (id != null) {
			entity = service.findOne(id);
		} else {
			VenueUserEntity venueUserEntity = venueUserService.findOne(venueUserId);
			entity.setVenueUserName(venueUserEntity.getName());
			entity.setVenueUserId(venueUserId);
		}
		request.setAttribute("entity", entity);
		return "venue/user/user_record_add";
	}

	/**
	 * 跳转到新增页面
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/toRecordDetail")
	public String toRecordDetail(Long venueUserId, HttpServletRequest request, Model model) {
		request.setAttribute("venueUserId", venueUserId);
		return "venue/user/user_record_detail";
	}

	/**
	 * 保存更新方法<br>
	 * 带验证
	 * 
	 * @param t
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@AccessRequired("管理员")
	@RequestMapping(value = "/saveRecord")
	@ResponseBody
	public Map<String, Object> saveRecord(@ModelAttribute("T") VenueUserRecordEntity t, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (t.getId() != null) {
			VenueUserRecordEntity temp = service.findOne(t.getId());
			BeanUtils.copyProperties(t, temp);
			temp.setGmtModified(new Date());
			temp.setLastModifiedById(LoginContextHolder.get().getUserId());
			t = temp;
		} else {
			t.setGmtCreate(new Date());
			t.setCreateById(LoginContextHolder.get().getUserId());
		}
		// 验证实体类
		Set<ConstraintViolation<VenueUserRecordEntity>> constraintViolations = validator.getValidator().validate(t);
		// 如果大于0，说明有验证未通过信息
		if (constraintViolations.size() > 0) {
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("success", false);
			result.put("msg", constraintViolations.iterator().next().getMessage());
			return result;
		}
		Map<String, Object> result = service.saveMap(t);
		result.put("success", true);
		result.put("msg", "保存成功！");
		return result;
	}

}
