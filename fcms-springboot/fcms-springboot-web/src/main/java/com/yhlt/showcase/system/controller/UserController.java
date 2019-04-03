package com.yhlt.showcase.system.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.AccessRequired;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.utils.MD5Util;
import com.yhlt.showcase.system.entity.UserEntity;
import com.yhlt.showcase.system.service.CompanyService;
import com.yhlt.showcase.system.service.DepartmentService;
import com.yhlt.showcase.system.service.UserService;

/**
 * 用户信息管理
 * 
 * @author zhangweite
 * @date 2017-11-8 14:26
 */
@Controller
@RequestMapping(value = "/admin/system/user")
@AccessRequired("用户管理")
public class UserController extends BaseController<UserEntity, UserService> {
	@Autowired
	private CompanyService companyService;
	@Autowired
	private DepartmentService departmentService;

	@Override
	public String index(Model model) {
		return "system/user/user_index";
	}

	/**
	 * 跳转到新增页面-基本信息
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/toAddUserPageByCom")
	public String toAddUserPage(HttpServletRequest request, Model model) {
		Long companyId = Long.parseLong(request.getParameter("company"));
		Long departmentId = Long.parseLong(request.getParameter("dep"));
		UserEntity userEntity = new UserEntity();
		userEntity.setCompanyEntity(companyService.findOne(companyId));
		userEntity.setDepartmentEntity(departmentService.findOne(departmentId));
		request.setAttribute("entity", userEntity);
		return "system/user/user_add";
	}

	@RequestMapping(value = "/toAddUserPage")
	public String toAddUserPag(HttpServletRequest request, Model model, Long userId) {
		UserEntity userEntity = new UserEntity();
		if (userId != null) {
			userEntity = service.findOne(userId);
		}
		request.setAttribute("entity", userEntity);
		return "system/user/user_add";
	}

	/* @AccessRequired("管理员") */
	@Override
	public Map<String, Object> save(UserEntity t, Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
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
			if (StringUtils.isBlank(t.getPassword())) {
				t.setPassword("123456");
			}
		}
		if (t.getId() != null) {
			UserEntity temp = service.findOne(t.getId());
			BeanUtils.copyProperties(t, temp);
			temp.setGmtModified(new Date());
			temp.setLastModifiedById(LoginContextHolder.get().getUserId());
			t = temp;
		} else {
			t.setGmtCreate(new Date());
			t.setCreateById(LoginContextHolder.get().getUserId());
			t.setPassword(MD5Util.MD5(t.getPassword()));
		}
		Map<String, Object> result = service.saveMap(t);
		UserEntity user = (UserEntity) result.get("obj");
		result.put("success", true);
		result.put("msg", "保存成功！");
		result.put("userId", user.getId());
		result.put("password", user.getPassword());
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
		List<UserEntity> userEntities = service.findByParams(searchParams);

		// flag=true 没有注册，false已被注册
		boolean flag = userEntities == null || userEntities.size() == 0;
		return flag;
	}

	/**
	 * 重置密码
	 * 
	 * @param request
	 * @param model
	 * @return hubaojie
	 */
	@AccessRequired("管理员")
	@RequestMapping(value = "/resetPwd")
	@ResponseBody
	public Map<String, Object> resetPwd(HttpServletRequest request, Model model) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String id = request.getParameter("id");
			UserEntity user = service.findOne(Long.parseLong(id));
			user.setPassword(MD5Util.MD5("123456"));//
			service.save(user);
			result.put("flag", true);
			result.put("msg", "重置成功！");
		} catch (Exception e) {
			result.put("flag", false);
			result.put("msg", "重置失败！");
		}
		return result;
	}

	/**
	 * 跳转至修改密码
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/toPassword")
	public String toPassword(Model model) {
		return "system/password/password_index";
	}

	/**
	 * 修改密码
	 * 
	 * @param newPasswrod
	 * @return
	 */
	@RequestMapping("/saveNewPassword")
	@ResponseBody
	public Map<String, Object> saveNewPassword(String newPassword, String oldPassword) {
		Map<String, Object> result = new HashMap<>();
		result.put("success", false);

		Long userId = LoginContextHolder.get().getUserId();
		UserEntity userEntity = service.findOne(userId);
		String NewPassword = MD5Util.MD5(newPassword);

		if (!userEntity.getPassword().equals(MD5Util.MD5(oldPassword))) {
			result.put("msg", "当前密码输入错误！");
			return result;
		}

		if (userEntity.getPassword().equals(NewPassword)) {
			result.put("msg", "新密码不能与当前密码一致！");
			return result;
		}

		userEntity.setPassword(NewPassword);
		service.save(userEntity);
		result.put("success", true);
		result.put("msg", "保存成功！");
		return result;
	}

}
