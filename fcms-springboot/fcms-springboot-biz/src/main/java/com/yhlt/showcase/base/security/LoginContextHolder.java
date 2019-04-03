package com.yhlt.showcase.base.security;

import javax.servlet.http.HttpServletRequest;

/**
 * 将当期登录者信息保存到线程上下文中
 * 
 * @author xunxun
 * @date 2015-1-7 上午11:00:06
 */
public final class LoginContextHolder {
	private static final ThreadLocal<HttpServletRequest> REQUESTLOCAL = new ThreadLocal<HttpServletRequest>();
	private static final ThreadLocal<LoginContext> CONTEXT = new ThreadLocal<LoginContext>();

	private LoginContextHolder() {
	}

	public static void put(LoginContext context, HttpServletRequest request) {
		CONTEXT.set(context);
		REQUESTLOCAL.set(request);
	}

	public static LoginContext get() {
		return CONTEXT.get();
	}

//	public static HttpSession getSession() {
//		return (HttpSession) ((HttpServletRequest) REQUESTLOCAL.get())
//				.getSession();
//	}

	public static void clear() {
		CONTEXT.remove();
		REQUESTLOCAL.remove();
	}

}
