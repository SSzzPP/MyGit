package com.yhlt.showcase.venue.controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.AccessRequired;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.utils.ImageUtils;
import com.yhlt.showcase.base.utils.MD5Util;
import com.yhlt.showcase.system.utils.FileUtil;
import com.yhlt.showcase.venue.entity.VenueUserEntity;
import com.yhlt.showcase.venue.service.VenueUserService;
/**
* 场馆人员
* 
* @author swy
* */
@Controller
@RequestMapping(value = "/admin/venue/user")
public class VenueUserController extends BaseController<VenueUserEntity, VenueUserService>{

	@Override
	public String index(Model model) {
		return "venue/user/venue_user_index";
	}
	
	/**
	 * 跳转到新增页面
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/add")
	public String toAddPage(Long id, HttpServletRequest request, Model model) {
		VenueUserEntity entity = new VenueUserEntity();
		if (id != null) {
			entity = service.findOne(id);
		}
		request.setAttribute("entity", entity);
		return "venue/user/venue_user_add";
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
	@RequestMapping(value = "/saveInfo")
	@ResponseBody
	public Map<String, Object> saveInfo(@ModelAttribute("T") VenueUserEntity t,Model model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		boolean isNotExists = true;
		// 新用户注册
		if (t.getId() == null) {
			// 检查用户注册情况
			if (!checkUser(t.getLoginName())) {
				Map<String, Object> result = new HashMap<String, Object>();
				isNotExists = false;
				result.put("success", isNotExists);
				result.put("msg", isNotExists ? "" : "登录名已被注册");
				return result;
			}
		}
		if (t.getId() != null) {
			VenueUserEntity temp = service.findOne(t.getId());
			t.setPassword(temp.getPassword());
			BeanUtils.copyProperties(t, temp, "userRecordEntities");
			//BeanUtils.copyProperties(t, temp);
			temp.setGmtModified(new Date());
			temp.setLastModifiedById(LoginContextHolder.get().getUserId());
			t = temp;
		} else {
			t.setGmtCreate(new Date());
			t.setCreateById(LoginContextHolder.get().getUserId());
			t.setPassword(MD5Util.MD5("123456"));
			t.setUuid(UUID.randomUUID().toString());
		}
		// 验证实体类
		Set<ConstraintViolation<VenueUserEntity>> constraintViolations = validator.getValidator().validate(t);
		// 如果大于0，说明有验证未通过信息
		if (constraintViolations.size() > 0) {
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("success", false);
			result.put("msg", constraintViolations.iterator().next().getMessage());
			return result;
		}
		Map<String, Object> result = new HashMap<String, Object>();
		MultipartHttpServletRequest servletRequest = (MultipartHttpServletRequest) request;
		MultipartFile headImg = servletRequest.getFile("headImg");
		if (headImg != null && headImg.getSize() != 0) {
			t=uploadImage(headImg, t, request,"headImg");
		}
		service.save(t);
		result.put("success", true);
		result.put("msg", "保存成功！");
		//result.put("userId", user.getId());
		//result.put("password", user.getPassword());
		return result;
	}
	/**
	 * 检查用户名重复情况
	 * 
	 * @param loginName
	 * @return
	 */
	private boolean checkUser(String loginName) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_loginName", loginName);
		List<VenueUserEntity> venueUserEntities = service.findByParams(searchParams);

		// flag=true 没有注册，false已被注册
		boolean flag = venueUserEntities == null || venueUserEntities.size() == 0;
		return flag;
	}
	/**
	 * 删除
	 * 
	 * @param t
	 * @param model
	 * @param request
	 * @param responses
	 * @return
	 * @throws Exception
	 */
	@AccessRequired("管理员")
	@RequestMapping(value = "/deleteInfo")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam("ids") Long id, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		if (id != null) {
			result = super.delete(id, model, request, response);
		} else {
			result.put("success", false);
			result.put("msg", "删除失败！");
		}
		return result;
	}
	/**
	 * 重置密码
	 * 
	 * @param request
	 * @param model
	 * @return swy
	 */
	@AccessRequired("管理员")
	@RequestMapping(value = "/resetPwd")
	@ResponseBody
	public Map<String, Object> resetPwd(HttpServletRequest request, Model model) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String id = request.getParameter("id");
			VenueUserEntity venueUserEntity = service.findOne(Long.parseLong(id));
			venueUserEntity.setPassword(MD5Util.MD5("123456"));//
			service.save(venueUserEntity);
			result.put("flag", true);
			result.put("msg", "重置成功！");
		} catch (Exception e) {
			result.put("flag", false);
			result.put("msg", "重置失败！");
		}
		return result;
	}
	/**
	 * 图片上传
	 * 
	 * @param t
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public VenueUserEntity uploadImage(MultipartFile multipartFile, VenueUserEntity t, HttpServletRequest request,String imageType) {
		try {
			if (multipartFile != null && multipartFile.getSize() != 0) {
				String fileName = multipartFile.getOriginalFilename();
				List<Object> fileList = FileUtil.getNewFile(fileName, imageType, request);
				File newFile = (File) fileList.get(0);
				multipartFile.transferTo(newFile);
				t.setImgUrl(fileList.get(1).toString());
				return t;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value = "/userHeadImg")
	public void userHeadImg(String uuid, HttpServletRequest request, HttpServletResponse response) {
		VenueUserEntity venueUserEntity = service.findOneByUuid(uuid);
		
			try {
				if (venueUserEntity.getImgUrl() != null) {
					ImageUtils.imgToStream(venueUserEntity.getImgUrl(), response);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
	}
}
