package com.yhlt.showcase.login.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.ValidatorFactory;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.yhlt.showcase.base.des.DesUtils;
import com.yhlt.showcase.base.properties.BlockChainProperties;
import com.yhlt.showcase.base.util.VerifyCodeUtils;
import com.yhlt.showcase.base.utils.BlockChainUtil;
import com.yhlt.showcase.base.utils.ConstantsUtils;
import com.yhlt.showcase.base.utils.CookieUtils;
import com.yhlt.showcase.base.utils.HttpUtil;
import com.yhlt.showcase.base.utils.MD5Util;
import com.yhlt.showcase.base.utils.RedisUtil;
import com.yhlt.showcase.subscribe.entity.NewsSubscribeEntity;
import com.yhlt.showcase.subscribe.service.NewsSubscribeService;
import com.yhlt.showcase.system.entity.LoginLogEntity;
import com.yhlt.showcase.system.service.LoginLogService;
import com.yhlt.showcase.venue.entity.VenueUserEntity;
import com.yhlt.showcase.venue.service.VenueUserService;

@Controller
@RequestMapping(value = "/h5plus/login")
public class LoginController {

	@Autowired
	private LoginLogService loginLogService;
	
	@Autowired
	private VenueUserService venueUserService;
	
	@Autowired
	private BlockChainProperties blockChainProperties;
	
	@Autowired
	protected ValidatorFactory validator;
	
	@Autowired
	private NewsSubscribeService newsSubscribeService;
	
	/**
	 * 刚进系统跳转至首页并初始化cookie
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/toHome")
	public String toHome (HttpServletRequest request,HttpServletResponse response) {
		//初始化cookie
		if(StringUtils.isBlank(CookieUtils.getCookie(request, "sessionId"))) {			
			CookieUtils.setCookie(response, "sessionId", "no_login");
		}
//		request.setAttribute("directLogin", 1);
		return "/system/main/home";
	}
	
	/**
	 * 跳转登录
	 * @return
	 */
	@RequestMapping(value = "/toLogin")
	public String toLogin () {
		return "/login";
	}
	
	/**
	 * 注册
	 * @return
	 */
	@RequestMapping(value = "toRegister")
	public String toRegister () {
		return "/system/register/register";
	}

	/**
	 * mobile 登录
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/loginMobile")
	@ResponseBody
	public Map<String, Object> loginMobile(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		request.setAttribute("directLogin", 0);
		String loginName = request.getParameter("username");
		String password = request.getParameter("password");

		String plusOsName = request.getParameter("plusOsName");
		String plusOsVersion = request.getParameter("plusOsVersion");
		String plusOsVendor = request.getParameter("plusOsVendor");
		String deviceUuid = request.getParameter("deviceUuid");
		// 推送消息使用的clientId
		// String clientId = request.getParameter("clientId");
		// plusOsName:plus.os.name,plusOsVersion:plus.os.version,plusOsVersion:plus.os.vendor
		// String verifyCode = request.getParameter("verifiyCode");

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", false);

		if (StringUtils.isBlank(loginName) || StringUtils.isBlank(password)) {
			result.put("msg", "用户名密码不能为空");
			return result;
		}

		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_loginName", loginName);
		searchParams.put("EQ_password", MD5Util.MD5(password));
		VenueUserEntity venueUserEntity = venueUserService.findOneByParams(searchParams);
		// UserEntity userEntity = userService.findOneByParams(searchParams);
		if (venueUserEntity == null) {
			result.put("msg", "用户名或密码错误，请重新输入！");
			return result;
		}
		// HttpSession httpSession = request.getSession();

		// 记录用户登录日志
		String agent = request.getHeader("User-Agent");
		String requestIp = HttpUtil.getIpAddress(request);
		LoginLogEntity loginLog = new LoginLogEntity();
		loginLog.setIpAddress(requestIp);
		loginLog.setOsName(plusOsName);
		loginLog.setOsVersion(plusOsVersion);
		loginLog.setOsArch(plusOsVendor);
		loginLog.setRemoteHost(request.getRemoteHost());
		loginLog.setUserAgent(agent);
		loginLog.setCreateById(venueUserEntity.getId());
		loginLog.setGmtCreate(new Date());
		loginLog.setOsUuid(deviceUuid);
		loginLogService.noLogsave(loginLog);

		String sessionId = UUID.randomUUID().toString();
		RedisUtil.set(ConstantsUtils.SESSION_KEY_PREFIX_USER + sessionId, venueUserEntity.getId().toString());
		RedisUtil.set(ConstantsUtils.SESSION_KEY_PREFIX_USER_ENTITY + sessionId, venueUserEntity);
		CookieUtils.setCookie(response, "sessionId", sessionId);

		// httpSession.setAttribute(SessionSecurityConstants.KEY_USER, userEntity);
		// httpSession.setAttribute(SessionSecurityConstants.KEY_USER_ID,userEntity.getId());
		// httpSession.setAttribute(SessionSecurityConstants.KEY_LOGIN_NME,userEntity.getLoginName());
		// httpSession.setAttribute(SessionSecurityConstants.KEY_USER_NICK_NAME,userEntity.getName());

		result.put("success", true);
		result.put("sessionId", sessionId);
		result.put("jsessionid", request.getSession().getId());
		result.put("obj", venueUserEntity);
		return result;
	}

	/**
	 * 登出
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/loginOutMobile")
	@ResponseBody
	public Map<String, Object> loginOutMobile(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> result = new HashMap<>();
		result.put("success", false);

		String sessionId = CookieUtils.getCookie(request, response, "sessionId");

		RedisUtil.del(ConstantsUtils.SESSION_KEY_PREFIX_USER + sessionId);
		RedisUtil.del(ConstantsUtils.SESSION_KEY_PREFIX_USER_ENTITY + sessionId);

		// HttpSession session = request.getSession();
		// // 登出清空通知状态记录
		// String loginName = (String)
		// session.getAttribute(SessionSecurityConstants.KEY_LOGIN_NAME);
		//
		// session.removeAttribute(SessionSecurityConstants.KEY_USER);
		// session.removeAttribute(SessionSecurityConstants.KEY_USER_ID);
		// session.removeAttribute(SessionSecurityConstants.KEY_LOGIN_NAME);
		//
		// session.removeAttribute(SessionSecurityConstants.KEY_USER_NICK_NAME);
		//
		// session.invalidate();
		// Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		return result;
	}

	/**
	 * 跳转到app下载中间有页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/downloadApp")
	public String downloadApp(HttpServletRequest request, HttpServletResponse response) throws IOException {
		return "downloadApp";
	}
	
	/**
	 * 验证码
	 * @param request
	 * @param response
	 * @param verifyCodeImgId
	 */
	@RequestMapping(value = "/code")
	@ResponseBody
	public void code(HttpServletRequest request, HttpServletResponse response, String verifyCodeImgId) {
		int w = 200, h = 80;
		response.reset();
		try {
			String verifyCode = VerifyCodeUtils.outputVerifyImage(w, h, response.getOutputStream(), 4);
			RedisUtil.set(verifyCodeImgId, verifyCode);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/loginByToken")
	public String loginByToken(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String token = request.getParameter("token");
		System.out.println(token);
		CookieUtils.setCookie(response, "success", "false");
		// token = "6e69a61e1a27b4812c90ecb7e562bc4d99214aba2c784c4809419d9cfbe2ed906054eb0af8ed080b00930e05ccc693f1ab82394af5580399de25986d5247a31ef4ef6d8be9d27eb1ec82a0c0186855c76256222c3ddaa98a17cb7917f474eedd0a3a1ef940362132c9f3d37af74e13ea4bbf78a29810f55fa09c8c4def4088a18cc876eef84e78792614a5ab50b9d06b0e6b0b6506513db9155633c823b4cb3717592bff29240e473d7dfb4ded164b95043b45a3d69ab1142f231192279ced6db6b17529ec5d8c8e749b04da094fedb4fbd13a73f9d314d1e3c600fddde9acb64d8a7ca53adfa51f6f3fd3d9ad52ebf965fd3856ef9891fac96ec04eda912ec8e20370b97a226c91e264de0644c22b43ef2eaa94cb4f4607b738460d7af4a1d3";

		if (StringUtils.isBlank(token)) {
			CookieUtils.setCookie(response, "msg", "系统错误");
			return "redirect:/h5plus/login/toHome";
		}
		token = token.toUpperCase();
		System.out.println("token:" + token);
		String tokenResult = DesUtils.decrypt("fcms2o18", token);
		System.out.println("tokenResult:" + tokenResult);
		Map<String, Object> map = (Map<String, Object>) JSONArray.parse(tokenResult);

		String userFlag = map.get("userFlag").toString();
		if (StringUtils.isBlank(userFlag)) {
			CookieUtils.setCookie(response, "msg", "用户信息错误");
			return "redirect:/h5plus/login/toHome";
		}

		if ("loginUser".equals(userFlag)) {
			String zsbAppId = map.get("id").toString();
			if (StringUtils.isBlank(zsbAppId)) {
				CookieUtils.setCookie(response, "msg", "用户信息错误");
				return "redirect:/h5plus/login/toHome";
			}

			String loginName = map.get("loginName").toString();
			String sex = map.get("sex").toString();
			String mobile = map.get("mobile").toString();
			String nickName = map.get("nickName").toString();
			String userDesc = "";
			try {
				userDesc = map.get("userDesc").toString();
			} catch (Exception e) {
				userDesc = null;
			}
			String area = "";
			try {
				area = map.get("area").toString();
			} catch (Exception e) {
				area = null;
			}
			String userPhoto = map.get("userPhoto").toString();
			String birthdayStr = "";
			try {
				birthdayStr = map.get("birthday").toString();
			} catch (Exception e) {
				birthdayStr = null;
			}
			Long birthday = null;
			Date birthdayDate = new Date();
			if (StringUtils.isNotBlank(birthdayStr)) {
				birthday = Long.valueOf(birthdayStr);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String time = sdf.format(birthday);
				birthdayDate = sdf.parse(time);
			}

			Integer sexInteger = 0;
			if ("0".equals(sex)) {
				sexInteger = 1;
			}

			Map<String, Object> searchParams = new HashMap<String, Object>();
			searchParams.put("EQ_zsbAppId", zsbAppId);
			VenueUserEntity entity = venueUserService.findOneByParams(searchParams);
			if (entity != null) {
				if (StringUtils.isNotBlank(loginName) && !loginName.equals(entity.getLoginName())) {
					entity.setLoginName(loginName);
				} else if (entity.getLoginName() != null) {
						entity.setLoginName(loginName);
				}
				
				if (StringUtils.isNotBlank(nickName) && !nickName.equals(entity.getName())) {
					entity.setName(nickName);
				} else if (entity.getName() != null) {
					entity.setName(nickName);
				}

				if (!sexInteger.equals(entity.getSex())) {
					entity.setSex(sexInteger);
				}

				if (StringUtils.isNotBlank(mobile) && !mobile.equals(entity.getMobile())) {
					entity.setMobile(mobile);
				} else if (entity.getMobile() != null) {
					entity.setMobile(mobile);
				}

				if (StringUtils.isNotBlank(area) && !area.equals(entity.getStreet())) {
					entity.setStreet(area);
				} else if (entity.getStreet() != null) {
					entity.setStreet(area);
				}

				if (StringUtils.isNotBlank(userDesc) && !userDesc.equals(entity.getExperience())) {
					entity.setExperience(userDesc);
				} else if (entity.getExperience() != null) {
					entity.setExperience(userDesc);
				}

				if (!userPhoto.equals(entity.getImgUrl())) {
					entity.setImgUrl(userPhoto);
				}

				if (birthday != null) {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					if (!sdf.format(birthdayDate).equals(sdf.format(entity.getBirthday()))) {
						entity.setBirthday(birthdayDate);
					}
				} else {
					entity.setBirthday(null);
				}

				Set<ConstraintViolation<VenueUserEntity>> constraintViolations = validator.getValidator().validate(entity);
				// 如果大于0，说明有验证未通过信息
				if (constraintViolations.size() > 0) {
					CookieUtils.setCookie(response, "msg", constraintViolations.iterator().next().getMessage());
					return "redirect:/h5plus/login/toHome";
				}
				venueUserService.save(entity);
			} else {
				VenueUserEntity t = new VenueUserEntity();
				t.setZsbAppId(zsbAppId);
				if (StringUtils.isNotBlank(loginName)) {
					t.setLoginName(loginName);
				}
				t.setSex(sexInteger);
				if (StringUtils.isNotBlank(nickName)) {
					t.setName(nickName);
				}
				if (StringUtils.isNotBlank(mobile)) {
					t.setMobile(mobile);
				}
				if (StringUtils.isNotBlank(userPhoto)) {
					t.setImgUrl(userPhoto);
				}
				
				if (birthday != null) {
					t.setBirthday(birthdayDate);
				}
				if (StringUtils.isNotBlank(userDesc)) {
					t.setExperience(userDesc);
				}
				if (StringUtils.isNotBlank(area)) {
					t.setStreet(area);
				}
				t.setUuid(UUID.randomUUID().toString());
				t.setType(2L);
				t.setStatus(0L);

				Set<ConstraintViolation<VenueUserEntity>> constraintViolations = validator.getValidator().validate(t);
				// 如果大于0，说明有验证未通过信息
				if (constraintViolations.size() > 0) {
					CookieUtils.setCookie(response, "msg", constraintViolations.iterator().next().getMessage());
					return "redirect:/h5plus/login/toHome";
				}
				entity = venueUserService.save(t);
				NewsSubscribeEntity lawEntity = new NewsSubscribeEntity(entity.getId(),0,1);
				NewsSubscribeEntity matchEntity = new NewsSubscribeEntity(entity.getId(),0,0);
				newsSubscribeService.save(matchEntity);
				newsSubscribeService.save(lawEntity);
				// 区块链存交易
				if (blockChainProperties.getEnabled()) {
					String address = venueUserService.getAddress(entity.getId());
					BlockChainUtil.sendData(address, "FCMS", 10, "register");
					venueUserService.upadateUserTotal(10L, entity.getId());
				}
			}

			String agent = request.getHeader("User-Agent");
			String requestIp = HttpUtil.getIpAddress(request);
			LoginLogEntity loginLog = new LoginLogEntity();
			loginLog.setIpAddress(requestIp);
			// loginLog.setOsName(plusOsName);
			// loginLog.setOsVersion(plusOsVersion);
			// loginLog.setOsArch(plusOsVendor);
			loginLog.setRemoteHost(request.getRemoteHost());
			loginLog.setUserAgent(agent);
			loginLog.setCreateById(entity.getId());
			loginLog.setGmtCreate(new Date());
			// loginLog.setOsUuid(deviceUuid);
			loginLogService.noLogsave(loginLog);

			String sessionId = UUID.randomUUID().toString();
			RedisUtil.set(ConstantsUtils.SESSION_KEY_PREFIX_USER + sessionId, entity.getId().toString());
			RedisUtil.set(ConstantsUtils.SESSION_KEY_PREFIX_USER_ENTITY + sessionId, entity);

			CookieUtils.setCookie(response, "sessionId", sessionId);
			CookieUtils.setCookie(response, "success", "true");
			CookieUtils.setCookie(response, "uuid", entity.getUuid());
			if (StringUtils.isNotBlank(entity.getName())) {
				CookieUtils.setCookie(response, "nickName", entity.getName());
			}
			CookieUtils.setCookie(response, "type", entity.getType().toString());
			CookieUtils.setCookie(response, "userPhoto", entity.getImgUrl());

			// result.put("success", true);
			// result.put("sessionId", sessionId);
			// result.put("jsessionid", request.getSession().getId());
			// result.put("obj", entity);

			return "redirect:/h5plus/login/toHome";
		} else {
			CookieUtils.setCookie(response, "msg", "未登录状态部分功能不可用");
			return "redirect:/h5plus/login/toHome";
		}
	}
}
