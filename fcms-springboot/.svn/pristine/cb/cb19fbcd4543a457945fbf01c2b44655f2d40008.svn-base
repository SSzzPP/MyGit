package com.yhlt.showcase.front.controller.login;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.security.LoginContextHolder;
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



//front前台登录controller

@Controller
@RequestMapping(value = "/front/login")
public class FrontLoginController {

	@Autowired
	private LoginLogService loginLogService;

	@Autowired
	private VenueUserService venueUserService;

	@RequestMapping("")
	public String index(HttpServletRequest request, HttpServletResponse response) {
		// 当前服务器时间
		request.setAttribute(SessionSecurityConstants.KEY_SYSTEM_DATETIME, DateFormatUtils.format(new Date(), "yyyy-MM-dd HH:mm:ss"));
		return "front/index";
	}

	/**
	 * @Description:发送图片验证码
	 * @author swy
	 * @param：
	 * @return
	 */
	@RequestMapping(value = "/sendPictureCode")
	@ResponseBody
	public void sendPictureCode(HttpServletRequest request,HttpServletResponse response)
			throws Exception {

		// 禁止图像缓存。
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");
        //生成随机字串 
        String verifyCode = VerifyCodeUtils.generateVerifyCode(4); 
        //存入会话session 
        HttpSession session = request.getSession(true); 
        //删除以前的
        session.removeAttribute(SessionSecurityConstants.KEY_CHECKCODE);
        session.setAttribute(SessionSecurityConstants.KEY_CHECKCODE, verifyCode.toLowerCase()); 
        //生成图片 
        int w = 100, h = 30; 
        VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode);
	}
	
	/**
	 * 用户登录
	 * （带验证码）
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/venueLoginWithCheckcode")
	@ResponseBody
	public Map<String,Object> venueLoginWithCheckcode(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", false);
		//因为LoginContextInterceptor不拦截/login，判断session用户登录情况
		HttpSession httpSession = request.getSession();
//		String sessionLoginName = (String) httpSession
//				.getAttribute(SessionSecurityConstants.KEY_LOGIN_NAME);
//		if(StringUtils.isNotBlank(sessionLoginName)){
//			return "redirect:/front/main";
//		}
		
		String loginName = request.getParameter("username");
		String password = request.getParameter("password");
		String pictureCord = request.getParameter("pictureCord");

		if (StringUtils.isBlank(loginName) || StringUtils.isBlank(password)) {
			result.put("errorMsg", "请填写用户名或者密码！");
			return result;
		}
		
		if(StringUtils.isBlank(pictureCord)){
			result.put("errorMsg", "请填写验证码！");
			return result;
		}
		
		String rdnu = (String) request.getSession().getAttribute(SessionSecurityConstants.KEY_CHECKCODE);
		request.getSession().removeAttribute(SessionSecurityConstants.KEY_CHECKCODE);
		if(StringUtils.isBlank(rdnu)||!pictureCord.equalsIgnoreCase(rdnu)){
			result.put("errorMsg", "验证码错误！");
			return result;
		}
		
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_loginName", loginName);
		searchParams.put("EQ_password", MD5Util.MD5(password));
		VenueUserEntity venueUserEntity = venueUserService.findOneByParams(searchParams);
		if (venueUserEntity == null) {
			result.put("errorMsg", "用户名或密码错误，请重新输入！");
			return result;
		}
		// 记录用户登录日志
		String agent = request.getHeader("User-Agent");
		String requestIp = HttpUtil.getIpAddress(request);
		LoginLogEntity loginLog = new LoginLogEntity();
		loginLog.setIpAddress(requestIp);
		loginLog.setRemoteHost(request.getRemoteHost());
		loginLog.setUserAgent(agent);
		loginLog.setCreateById(venueUserEntity.getId());
		loginLog.setGmtCreate(new Date());
		loginLog.setOsName("web");
		loginLogService.noLogsave(loginLog);

		String sessionId = UUID.randomUUID().toString();
		RedisUtil.set(ConstantsUtils.SESSION_KEY_PREFIX_FRONT_VENUE + sessionId, venueUserEntity.getId().toString());
		RedisUtil.set(ConstantsUtils.SESSION_KEY_PREFIX_FRONT_VENUE_ENTITY + sessionId, venueUserEntity);
		CookieUtils.setCookie(response, "frontSessionId", sessionId);
		
		httpSession.setAttribute(SessionSecurityConstants.KEY_USER, venueUserEntity);
		httpSession.setAttribute(SessionSecurityConstants.KEY_USER_ID,
				venueUserEntity.getId());
		httpSession.setAttribute(SessionSecurityConstants.KEY_LOGIN_NAME,
				venueUserEntity.getLoginName());
		httpSession.setAttribute(SessionSecurityConstants.KEY_USER_NICK_NAME,
				venueUserEntity.getName());
		result.put("sessionId", sessionId);
		result.put("success", true);
		return result;
	}
	//登出
	@RequestMapping(value = "/venueLogout")
	@ResponseBody
	public Map<String, Object> venueLogout(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> result = new HashMap<>();
		result.put("success", false);

		String sessionId = CookieUtils.getCookie(request, "frontSessionId");

		HttpSession session = request.getSession();
		// 登出清空通知状态记录
		// String loginName = (String)
		// session.getAttribute(SessionSecurityConstants.KEY_LOGIN_NAME);
		// LoginListener.loginedUserNoitceStatus.remove(loginName);

		// 登出
		// LoginListener.loginedUser.remove(loginName);

		session.removeAttribute(SessionSecurityConstants.KEY_USER);
		session.removeAttribute(SessionSecurityConstants.KEY_USER_ID);
		session.removeAttribute(SessionSecurityConstants.KEY_LOGIN_NAME);
		session.removeAttribute(SessionSecurityConstants.KEY_USER_NICK_NAME);
		//
		// session.invalidate();
		//
		//
		// CookieUtils.getCookie(request, response, "sessionId");

		RedisUtil.del(ConstantsUtils.SESSION_KEY_PREFIX_FRONT_VENUE + sessionId);
		RedisUtil.del(ConstantsUtils.SESSION_KEY_PREFIX_FRONT_VENUE_ENTITY + sessionId);
		result.put("success", true);
		return result;
	}
}
