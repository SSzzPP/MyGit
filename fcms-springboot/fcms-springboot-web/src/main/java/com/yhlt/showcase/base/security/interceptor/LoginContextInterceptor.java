package com.yhlt.showcase.base.security.interceptor;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.yhlt.showcase.base.modules.SpringContextHolder;
import com.yhlt.showcase.base.properties.EnvProperties;
import com.yhlt.showcase.base.security.AccessRequired;
import com.yhlt.showcase.base.security.LoginContext;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.utils.ConstantsUtils;
import com.yhlt.showcase.base.utils.CookieUtils;
import com.yhlt.showcase.base.utils.IpUtil;
import com.yhlt.showcase.base.utils.RedisUtil;
import com.yhlt.showcase.system.entity.UserEntity;
import com.yhlt.showcase.venue.entity.VenueUserEntity;

/**
 * 从session中读取用户信息，设置到线程上线文中
 * 
 * @author xunxun
 * @date 2015-1-7 下午2:06:38
 */
public class LoginContextInterceptor extends HandlerInterceptorAdapter {

	private Logger logger = LoggerFactory.getLogger(LoginContextInterceptor.class);

	public LoginContextInterceptor() {

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		super.afterConcurrentHandlingStarted(request, response, handler);
	}

	private EnvProperties envProperties = SpringContextHolder.getBean("envProperties");

	/**
	 * 在业务处理器处理请求之前被调用 如果返回false 从当前的拦截器往回执行所有拦截器的afterCompletion(),再退出拦截器链
	 * 
	 * 如果返回true 执行下一个拦截器,直到所有的拦截器都执行完毕 再执行被拦截的Controller 然后进入拦截器链,
	 * 从最后一个拦截器往回执行所有的postHandle() 接着再从最后一个拦截器往回执行所有的afterCompletion()
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String sessionId = CookieUtils.getCookie(request, "sessionId"); // request.getHeader("sessionId");
		String userId = RedisUtil.get(ConstantsUtils.SESSION_KEY_PREFIX_USER + sessionId);
		String venueUserId = RedisUtil.get(ConstantsUtils.SESSION_KEY_PREFIX_VENUE + sessionId);
		// 是否需要拦截
		boolean flag = true;
		if (userId == null && venueUserId == null) {
			// ajax 超时检测
			if (request.getHeader("X-Requested-With") != null) {
				response.setContentType("json/html;charset=utf-8");
				response.getWriter().print("{'statusCode':301}");// 如果请求为异步请求，则向页面打印
				return false;
			}
			response.sendRedirect(envProperties.getServerDynamic());
			return false;
		}
		UserEntity userEntity = RedisUtil.get(ConstantsUtils.SESSION_KEY_PREFIX_USER_ENTITY + sessionId);
		LoginContext loginContext = null;
		// HttpSession httpSession = request.getSession();
		if (userEntity != null) {
			// httpSession.setAttribute(SessionSecurityConstants.KEY_USER,
			// userEntity);
			// httpSession.setAttribute(SessionSecurityConstants.KEY_USER_ID,
			// userEntity.getId());
			// httpSession.setAttribute(SessionSecurityConstants.KEY_LOGIN_NAME,
			// userEntity.getLoginName());
			// httpSession.setAttribute(SessionSecurityConstants.KEY_USER_NICK_NAME,
			// userEntity.getName());
			loginContext = buildLoginContext(userEntity, request);
			LoginContextHolder.put(loginContext, request);
			return methodAccess(request, response, handler, loginContext);
		}
		VenueUserEntity venueUserEntity = RedisUtil.get(ConstantsUtils.SESSION_KEY_PREFIX_VENUE_ENTITY + sessionId);
		if (venueUserEntity != null) {
			// httpSession.setAttribute(SessionSecurityConstants.KEY_USER,
			// userEntity);
			// httpSession.setAttribute(SessionSecurityConstants.KEY_USER_ID,
			// userEntity.getId());
			// httpSession.setAttribute(SessionSecurityConstants.KEY_LOGIN_NAME,
			// userEntity.getLoginName());
			// httpSession.setAttribute(SessionSecurityConstants.KEY_USER_NICK_NAME,
			// userEntity.getName());
			loginContext = buildVenueLoginContext(venueUserEntity, request);
			LoginContextHolder.put(loginContext, request);
			return venueMethodAccess(request, response, handler, loginContext);
		}
		if (loginContext == null) {
			response.sendRedirect(envProperties.getServerDynamic());
			return false;
		}
		return flag;

	}

	private boolean methodAccess(HttpServletRequest request, HttpServletResponse response, Object handler, LoginContext loginContext) throws ServletException, IOException {
		if (handler instanceof HandlerMethod) {
			// 后台方法拦截器
			HandlerMethod handlerMethod = (HandlerMethod) handler;
			Method method = handlerMethod.getMethod();

			// 获取类注解
			AccessRequired clazzRequired = handlerMethod.getBean().getClass().getAnnotation(AccessRequired.class);
			// 获取方法注解
			AccessRequired methodRequired = handlerMethod.getMethodAnnotation(AccessRequired.class);
			// 类和方法都带有AccessRequired的标签,并且value不为空的方法，需要验证
			if (clazzRequired != null && StringUtils.isNoneBlank(clazzRequired.value()) && methodRequired != null && StringUtils.isNoneBlank(methodRequired.value())) {
				// 将类验证器+方法验证器拼接成'xxx_xxx'字符串

				Long id = loginContext.getUserId();
				String name = loginContext.getUserName();
				logger.warn(new StringBuffer().append("用户").append(id).append("-").append(name).append("尝试访问没有权限的方法,").append(handlerMethod.getBean().getClass()).append("-").append(method.getName()).toString());
				// 验证失败跳转MainController-noAccess方法,然后返回json
				request.getRequestDispatcher("/main/noAccess").forward(request, response);
				// 验证失败
				return false;
			}
		}
		return true;
	}

	private boolean venueMethodAccess(HttpServletRequest request, HttpServletResponse response, Object handler, LoginContext loginContext) throws ServletException, IOException {
		if (handler instanceof HandlerMethod) {
			// 后台方法拦截器
			HandlerMethod handlerMethod = (HandlerMethod) handler;
			Method method = handlerMethod.getMethod();

			// 获取类注解
			AccessRequired clazzRequired = handlerMethod.getBean().getClass().getAnnotation(AccessRequired.class);
			// 获取方法注解
			AccessRequired methodRequired = handlerMethod.getMethodAnnotation(AccessRequired.class);
			// 类和方法都带有AccessRequired的标签,并且value不为空的方法，需要验证
			if (clazzRequired != null && StringUtils.isNoneBlank(clazzRequired.value()) && methodRequired != null && StringUtils.isNoneBlank(methodRequired.value())) {
				// 将类验证器+方法验证器拼接成'xxx_xxx'字符串

				Long id = loginContext.getUserId();
				String name = loginContext.getUserName();
				logger.warn(new StringBuffer().append("用户").append(id).append("-").append(name).append("尝试访问没有权限的方法,").append(handlerMethod.getBean().getClass()).append("-").append(method.getName()).toString());
				// 验证失败跳转MainController-noAccess方法,然后返回json
				request.getRequestDispatcher("/main/noAccess").forward(request, response);
				// 验证失败
				return false;
			}
		}
		return true;
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		LoginContextHolder.clear();
		super.afterCompletion(request, response, handler, ex);
	}

	/**
	 * 当前登录用户上下文信息
	 * 
	 * @param assertion
	 * @param request
	 * @return
	 * @author xunxun
	 * @date 2015-7-15 上午11:01:11
	 */
	protected LoginContext buildLoginContext(UserEntity userEntity, HttpServletRequest request) {
		LoginContext loginContext = new LoginContext();
		loginContext.setUserId(userEntity.getId());
		loginContext.setUserName(userEntity.getLoginName());
		loginContext.setIp(IpUtil.getIpAddress(request));
		return loginContext;
	}

	protected LoginContext buildVenueLoginContext(VenueUserEntity venueUserEntity, HttpServletRequest request) {
		LoginContext loginContext = new LoginContext();
		loginContext.setUserId(venueUserEntity.getId());
		loginContext.setUserName(venueUserEntity.getLoginName());
		loginContext.setIp(IpUtil.getIpAddress(request));
		return loginContext;
	}

}