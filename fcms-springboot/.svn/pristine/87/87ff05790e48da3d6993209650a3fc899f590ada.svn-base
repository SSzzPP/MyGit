package com.yhlt.showcase.system.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.security.SessionSecurityConstants;
import com.yhlt.showcase.base.util.VerifyCodeUtils;
import com.yhlt.showcase.base.utils.ConstantsUtils;
import com.yhlt.showcase.base.utils.CookieUtils;
import com.yhlt.showcase.base.utils.HttpUtil;
import com.yhlt.showcase.base.utils.MD5Util;
import com.yhlt.showcase.base.utils.RedisUtil;
import com.yhlt.showcase.system.entity.LoginLogEntity;
import com.yhlt.showcase.system.entity.UserEntity;
import com.yhlt.showcase.system.service.LoginLogService;
import com.yhlt.showcase.system.service.UserService;
import com.yhlt.showcase.venue.entity.VenueUserEntity;
import com.yhlt.showcase.venue.service.VenueUserService;

@Controller
@RequestMapping(value = "/login")
public class LoginController {

	@Autowired
	private UserService userService;

	@Autowired
	private LoginLogService loginLogService;

	@Autowired
	private VenueUserService venueUserService;

	@RequestMapping("")
	public String index(HttpServletRequest request, HttpServletResponse response) {
		String sessionId = CookieUtils.getCookie(request, "sessionId");
		// 因为LoginContextInterceptor不拦截/login，判断用户登录情况
		UserEntity userEntity = RedisUtil.get(ConstantsUtils.SESSION_KEY_PREFIX_USER_ENTITY + sessionId);
		VenueUserEntity venueUserEntity = RedisUtil.get(ConstantsUtils.SESSION_KEY_PREFIX_VENUE_ENTITY + sessionId);
		if (userEntity != null) {
			return "redirect:/admin/main";
		} else if (venueUserEntity != null) {
			return "redirect:/venue/main";
		} else {
			return "user_login";
		}
	}

	@RequestMapping("/user")
	public String user(HttpServletRequest request, HttpServletResponse response) {
		return "user_login";
	}

	@RequestMapping("/venue")
	public String toVenueLogin(HttpServletRequest request, HttpServletResponse response) {
		return "venue_login";
	}

	/**
	 * 登陆
	 * 
	 * @throws IOException
	 */
	@RequestMapping("/userLogin")
	@ResponseBody
	public Map<String, Object> login(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", false);

		// String sessionId = request.getHeader("sessionId");
		String loginName = request.getParameter("username");
		String password = request.getParameter("password");

		if (StringUtils.isBlank(loginName) || StringUtils.isBlank(password)) {
			result.put("msg", "用户名或密码不能为空！");
			return result;
		}
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_loginName", loginName);
		searchParams.put("EQ_password", MD5Util.MD5(password));
		UserEntity userEntity = userService.findOneByParams(searchParams);
		if (userEntity == null) {
			result.put("msg", "用户名或密码错误，请重新输入！");
			return result;
		}
		// 记录用户登录日志
		String agent = request.getHeader("User-Agent");
		String requestIp = HttpUtil.getIpAddress(request);
		LoginLogEntity loginLog = new LoginLogEntity();
		loginLog.setIpAddress(requestIp);
		// loginLog.setOsName(System.getProperty("os.name"));
		// loginLog.setOsVersion(System.getProperty("os.version"));
		// loginLog.setOsArch(System.getProperty("os.arch"));
		loginLog.setRemoteHost(request.getRemoteHost());
		loginLog.setUserAgent(agent);
		loginLog.setCreateById(userEntity.getId());
		loginLog.setGmtCreate(new Date());
		loginLog.setOsName("web");
		loginLogService.noLogsave(loginLog);

		String sessionId = UUID.randomUUID().toString();
		RedisUtil.set(ConstantsUtils.SESSION_KEY_PREFIX_USER + sessionId, userEntity.getId().toString());
		RedisUtil.set(ConstantsUtils.SESSION_KEY_PREFIX_USER_ENTITY + sessionId, userEntity);
		CookieUtils.setCookie(response, "sessionId", sessionId);

		result.put("sessionId", sessionId);
		result.put("success", true);

		return result;// "redirect:/admin/main"
	}

	/**
	 * 登陆 （写路径跳转登录）
	 * 
	 * @throws IOException
	 */
	@RequestMapping("/adminLogin")
	public String adminLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// String sessionId = request.getHeader("sessionId");
		String loginName = request.getParameter("username");
		String password = request.getParameter("password");

		if (StringUtils.isBlank(loginName) || StringUtils.isBlank(password)) {
			return "user_login";
		}
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_loginName", loginName);
		searchParams.put("EQ_password", MD5Util.MD5(password));
		UserEntity userEntity = userService.findOneByParams(searchParams);
		if (userEntity == null) {
			return "user_login";
		}
		// 记录用户登录日志
		String agent = request.getHeader("User-Agent");
		String requestIp = HttpUtil.getIpAddress(request);
		LoginLogEntity loginLog = new LoginLogEntity();
		loginLog.setIpAddress(requestIp);
		// loginLog.setOsName(System.getProperty("os.name"));
		// loginLog.setOsVersion(System.getProperty("os.version"));
		// loginLog.setOsArch(System.getProperty("os.arch"));
		loginLog.setRemoteHost(request.getRemoteHost());
		loginLog.setUserAgent(agent);
		loginLog.setCreateById(userEntity.getId());
		loginLog.setGmtCreate(new Date());
		loginLog.setOsName("web");
		loginLogService.noLogsave(loginLog);

		String sessionId = UUID.randomUUID().toString();
		RedisUtil.set(ConstantsUtils.SESSION_KEY_PREFIX_USER + sessionId, userEntity.getId().toString());
		RedisUtil.set(ConstantsUtils.SESSION_KEY_PREFIX_USER_ENTITY + sessionId, userEntity);
		CookieUtils.setCookie(response, "sessionId", sessionId);

		return "redirect:/admin/main";
	}
	
	@RequestMapping(value = "/code")
	@ResponseBody
	public void code(HttpServletRequest request, HttpServletResponse response) {
		int w = 200, h = 80;
		response.reset();
		try {
			String verifyCode = VerifyCodeUtils.outputVerifyImage(w, h, response.getOutputStream(), 4);
			request.getSession().setAttribute(SessionSecurityConstants.KEY_USER_VERIFICATION_CODE, verifyCode);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/logout")
	@ResponseBody
	public Map<String, Object> logout(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> result = new HashMap<>();
		result.put("success", false);

		String sessionId = CookieUtils.getCookie(request, "sessionId");

		// HttpSession session = request.getSession();
		// 登出清空通知状态记录
		// String loginName = (String)
		// session.getAttribute(SessionSecurityConstants.KEY_LOGIN_NAME);
		// LoginListener.loginedUserNoitceStatus.remove(loginName);

		// 登出
		// LoginListener.loginedUser.remove(loginName);

		// session.removeAttribute(SessionSecurityConstants.KEY_USER);
		// session.removeAttribute(SessionSecurityConstants.KEY_USER_ID);
		// session.removeAttribute(SessionSecurityConstants.KEY_LOGIN_NAME);
		//
		// session.removeAttribute(SessionSecurityConstants.KEY_USER_NICK_NAME);
		//
		// session.invalidate();
		//
		//
		// CookieUtils.getCookie(request, response, "sessionId");

		RedisUtil.del(ConstantsUtils.SESSION_KEY_PREFIX_USER + sessionId);
		RedisUtil.del(ConstantsUtils.SESSION_KEY_PREFIX_USER_ENTITY + sessionId);
		result.put("success", true);

		return result;
	}

	@RequestMapping(value = "/venueLogout")
	@ResponseBody
	public Map<String, Object> venueLogout(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> result = new HashMap<>();
		result.put("success", false);

		String sessionId = CookieUtils.getCookie(request, "sessionId");

		// HttpSession session = request.getSession();
		// 登出清空通知状态记录
		// String loginName = (String)
		// session.getAttribute(SessionSecurityConstants.KEY_LOGIN_NAME);
		// LoginListener.loginedUserNoitceStatus.remove(loginName);

		// 登出
		// LoginListener.loginedUser.remove(loginName);

		// session.removeAttribute(SessionSecurityConstants.KEY_USER);
		// session.removeAttribute(SessionSecurityConstants.KEY_USER_ID);
		// session.removeAttribute(SessionSecurityConstants.KEY_LOGIN_NAME);
		//
		// session.removeAttribute(SessionSecurityConstants.KEY_USER_NICK_NAME);
		//
		// session.invalidate();
		//
		//
		// CookieUtils.getCookie(request, response, "sessionId");

		RedisUtil.del(ConstantsUtils.SESSION_KEY_PREFIX_VENUE + sessionId);
		RedisUtil.del(ConstantsUtils.SESSION_KEY_PREFIX_VENUE_ENTITY + sessionId);
		result.put("success", true);

		return result;
	}

	/**
	 * 跳转到app下载中间有页面
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/downloadApp")
	public String downloadApp(HttpServletRequest request, HttpServletResponse response) throws IOException {
		return "downloadApp";
	}

	/**
	 * 登陆
	 * 
	 * @throws IOException
	 */
	@RequestMapping("/venueLogin")
	@ResponseBody
	public Map<String, Object> venueLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", false);

		// String sessionId = request.getHeader("sessionId");
		String loginName = request.getParameter("username");
		String password = request.getParameter("password");

		if (StringUtils.isBlank(loginName) || StringUtils.isBlank(password)) {
			result.put("msg", "用户名或密码不能为空！");
			return result;
		}
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_loginName", loginName);
		searchParams.put("EQ_password", MD5Util.MD5(password));
		VenueUserEntity venueUserEntity = venueUserService.findOneByParams(searchParams);
		if (venueUserEntity == null) {
			result.put("msg", "用户名或密码错误，请重新输入！");
			return result;
		}
		// 记录用户登录日志
		String agent = request.getHeader("User-Agent");
		String requestIp = HttpUtil.getIpAddress(request);
		LoginLogEntity loginLog = new LoginLogEntity();
		loginLog.setIpAddress(requestIp);
		// loginLog.setOsName(System.getProperty("os.name"));
		// loginLog.setOsVersion(System.getProperty("os.version"));
		// loginLog.setOsArch(System.getProperty("os.arch"));
		loginLog.setRemoteHost(request.getRemoteHost());
		loginLog.setUserAgent(agent);
		loginLog.setCreateById(venueUserEntity.getId());
		loginLog.setGmtCreate(new Date());
		loginLog.setOsName("web");
		loginLogService.noLogsave(loginLog);

		String sessionId = UUID.randomUUID().toString();
		RedisUtil.set(ConstantsUtils.SESSION_KEY_PREFIX_VENUE + sessionId, venueUserEntity.getId().toString());
		RedisUtil.set(ConstantsUtils.SESSION_KEY_PREFIX_VENUE_ENTITY + sessionId, venueUserEntity);
		CookieUtils.setCookie(response, "sessionId", sessionId);

		result.put("sessionId", sessionId);
		result.put("success", true);

		return result;// "redirect:/admin/main"
	}
	
}
