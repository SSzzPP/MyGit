package com.yhlt.showcase.base.security.interceptor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.yhlt.showcase.base.properties.EnvProperties;
import com.yhlt.showcase.base.security.LoginContext;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.utils.ConstantsUtils;
import com.yhlt.showcase.base.utils.IpUtil;
import com.yhlt.showcase.base.utils.RedisUtil;
import com.yhlt.showcase.venue.entity.VenueUserEntity;

/**
 * 从session中读取用户信息，设置到线程上线文中
 * 
 * @author xunxun
 * @date 2015-1-7 下午2:06:38
 */
@Component
public class MobileLoginContextInterceptor extends HandlerInterceptorAdapter {

	private Logger logger = LoggerFactory.getLogger(MobileLoginContextInterceptor.class);
	private EnvProperties envProperties;

	public MobileLoginContextInterceptor() {

	}

	@Override
	public void postHandle(HttpServletRequest request,HttpServletResponse response, Object handler,ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception {
		super.afterConcurrentHandlingStarted(request, response, handler);
	}

	/**
	 * 在业务处理器处理请求之前被调用 如果返回false 从当前的拦截器往回执行所有拦截器的afterCompletion(),再退出拦截器链
	 * 
	 * 如果返回true 执行下一个拦截器,直到所有的拦截器都执行完毕 再执行被拦截的Controller 然后进入拦截器链,
	 * 从最后一个拦截器往回执行所有的postHandle() 接着再从最后一个拦截器往回执行所有的afterCompletion()
	 */
	@SuppressWarnings("unchecked")
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception {
		// 是否需要拦截
		boolean flag = true;
		
		String sessionId = request.getHeader("sessionId");
		if ("no_login".equals(sessionId)) {
			return flag;
		}
		
		String userId = RedisUtil.get(ConstantsUtils.SESSION_KEY_PREFIX_USER + sessionId);
		
		// String path = request.getServletPath();
		// boolean isContains = isContainsUrl(path);

		// if (!isContains) {// 包含的话：doFilter
		if (userId == null) {// 通过登录系统第一次跳转过来
			// ajax 超时检测
			if (request.getHeader("X-Requested-With") != null) {
				response.setContentType("json/html;charset=utf-8");
				response.getWriter().print("{'statusCode':301}");// 如果请求为异步请求，则向页面打印
				return false;
			}
			// request.getRequestDispatcher("/account/login").forward(request,
			// response);
			response.sendRedirect(envProperties.getServerDynamic());
			return false;
		} else {
			VenueUserEntity venueUserEntity = RedisUtil.get(ConstantsUtils.SESSION_KEY_PREFIX_USER_ENTITY + sessionId);
			LoginContext loginContext = null;
			if (venueUserEntity != null) {
				loginContext = buildLoginContext(venueUserEntity, request);
				LoginContextHolder.put(loginContext, request);
			}

			if (loginContext == null) {
				response.sendRedirect(envProperties.getServerDynamic());
				return false;
			}

			// 判断前台用户不能访问后台方法
			// 获取后台resource菜单,如果没有后台菜单，则智能访问@FrontAccessRequired注解的方法
//			List<MobileUserRoleResourceEntity> resourcesEntities = (List<MobileUserRoleResourceEntity>) session.getAttribute(SessionSecurityConstants.KEY_USER_RESOURCES);
//			if (resourcesEntities == null || resourcesEntities.size() == 0) {
////				if (!frontUserAccess(request, response, handler, loginContext))
//					return false;
//			}
//			flag = methodAccess(request, response, handler, session,loginContext);
		}
		// }
		return flag;
	}

	/*	@SuppressWarnings("unused")
	private boolean methodAccess(HttpServletRequest request,HttpServletResponse response, Object handler, HttpSession session,LoginContext loginContext) throws ServletException, IOException {
		if (handler instanceof HandlerMethod) {
			// 后台方法拦截器
			HandlerMethod handlerMethod = (HandlerMethod) handler;
			Method method = handlerMethod.getMethod();

			// 获取类注解
			AccessRequired clazzRequired = handlerMethod.getBean().getClass().getAnnotation(AccessRequired.class);
			// 获取方法注解
			AccessRequired methodRequired = handlerMethod.getMethodAnnotation(AccessRequired.class);
			// 类和方法都带有AccessRequired的标签,并且value不为空的方法，需要验证
			if (clazzRequired != null&& StringUtils.isNoneBlank(clazzRequired.value())&& methodRequired != null&& StringUtils.isNoneBlank(methodRequired.value())) {
				// 将类验证器+方法验证器拼接成'xxx_xxx'字符串
				String authorization = clazzRequired.value() + "_"+ methodRequired.value();
				@SuppressWarnings("unchecked")
				List<UserRoleResourceEntity> resourcesEntities = (List<UserRoleResourceEntity>) session.getAttribute(SessionSecurityConstants.KEY_USER_RESOURCES);
				for (UserRoleResourceEntity userRoleResourceEntity : resourcesEntities) {
					// 功能菜单
					if (userRoleResourceEntity.getType() == Constants.RESOURCE_TYPE_FCUNTION&& userRoleResourceEntity.getDescription().equals(authorization)) {
						// 验证通过
						return true;
					}
				}
				// 记录日志
				Long id = loginContext.getUserId();
				String name = loginContext.getUserName();
				logger.warn(new StringBuffer().append("用户").append(id).append("-").append(name).append("尝试访问没有权限的方法,")
						.append(handlerMethod.getBean().getClass()).append("-")
						.append(method.getName()));
				// 验证失败跳转MainController-noAccess方法,然后返回json
				request.getRequestDispatcher("/main/noAccess").forward(request,
						response);
				// 验证失败
				return false;
			}
		}
		return true;
	}*/

	/**
	 * 只允许用户访问带FrontAccessRequired注解的controller
	 * 
	 * @param request
	 * @param response
	 * @param handler
	 * @param loginContext
	 * @return false-访问了没有FrontAccessRequired注解的方法
	 * @throws ServletException
	 * @throws IOException
	 */
	/*@SuppressWarnings("unused")
	private boolean frontUserAccess(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			LoginContext loginContext) throws ServletException, IOException {
		if (handler instanceof HandlerMethod) {
			// 后台方法拦截器
			HandlerMethod handlerMethod = (HandlerMethod) handler;
			Method method = handlerMethod.getMethod();

			// 获取方法注解
			FrontAccessRequired clazzRequired = handlerMethod.getBean().getClass().getAnnotation(FrontAccessRequired.class);
			if (clazzRequired != null) {
				return true;
			} else {
				// 记录日志
				Long id = loginContext.getUserId();
				String name = loginContext.getUserName();
				logger.warn(new StringBuffer().append("用户").append(id)
						.append("-").append(name).append("尝试访问没有权限的方法,")
						.append(handlerMethod.getBean().getClass()).append("-")
						.append(method.getName()));
				// 验证失败跳转MainController-noAccess方法,然后返回json
				request.getRequestDispatcher("/front/main/noAccess").forward(
						request, response);
				// 验证失败
				return false;
			}
		}
		return true;
	}*/

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
	protected LoginContext buildLoginContext(VenueUserEntity venueUserEntity, HttpServletRequest request) {
		LoginContext loginContext = new LoginContext();
		loginContext.setUserId(venueUserEntity.getId());
		loginContext.setUserName(venueUserEntity.getLoginName());
		// loginContext.setRealName(userEntity.getName());
		loginContext.setIp(IpUtil.getIpAddress(request));
		return loginContext;
	}

}
