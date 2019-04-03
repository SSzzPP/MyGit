package com.yhlt.showcase.login.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.util.VerifyCodeUtils;
import com.yhlt.showcase.base.utils.ConstantsUtils;
import com.yhlt.showcase.base.utils.HttpUtil;
import com.yhlt.showcase.base.utils.MD5Util;
import com.yhlt.showcase.base.utils.RedisUtil;
import com.yhlt.showcase.dict.DictService;
import com.yhlt.showcase.system.entity.LoginLogEntity;
import com.yhlt.showcase.system.service.LoginLogService;
import com.yhlt.showcase.system.service.UserService;
import com.yhlt.showcase.venue.entity.VenueUserEntity;
import com.yhlt.showcase.venue.service.VenueUserService;

@Controller
@RequestMapping(value = "/login")
public class LoginController {

/*	@Autowired
	private UserService userService;
	
	@Autowired
	private DictService dictService;*/

	@Autowired
	private LoginLogService loginLogService;
	
	@Autowired
	private VenueUserService venueUserService;

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
		String loginName = request.getParameter("username");
		String password = request.getParameter("password");
		// String version = request.getParameter("version");

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

		String sessionId = request.getHeader("sessionId");

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
	
}
