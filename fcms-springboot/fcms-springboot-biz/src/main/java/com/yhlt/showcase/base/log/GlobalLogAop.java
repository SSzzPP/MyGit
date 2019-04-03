package com.yhlt.showcase.base.log;

import java.lang.reflect.Method;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.core.config.Order;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.yhlt.showcase.base.log.factory.LogTaskFactory;
import com.yhlt.showcase.base.properties.EnvProperties;
import com.yhlt.showcase.base.utils.ToolUtil;

/**
 * 日志记录
 *
 * @author wangyoutao
 * @date 2018年05月07日 下午2:48:30
 */
@Aspect
@Component
@Order(5)
public class GlobalLogAop {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ThreadLocal<Long> startTime = new ThreadLocal<>();
	@Autowired
	private EnvProperties envProperties;

	// @Pointcut(value = "execution(public * com.yhlt.showcase..*.*(..))")
	@Pointcut(value = "@annotation(org.springframework.web.bind.annotation.RequestMapping)")
	public void cutService() {
	}

	@Around("cutService()")
	public Object recordSysLog(ProceedingJoinPoint point) throws Throwable {
		Boolean requestLogEnabled = envProperties.getRequestLogEnabled();
		Boolean reqeustLogNoException = envProperties.getRequestLogNoException();
		
		startTime.set(System.currentTimeMillis());

		Boolean hasException = false;
		Exception exception = null;
		Object result = null;
			try {
				// 先执行业务
				result = point.proceed();
			} catch (Exception e) {
				exception = e;
				hasException = true;
				logger.error("业务执行出错！", e);
			}
		
		if(requestLogEnabled) {
			try {
				if (!reqeustLogNoException && !hasException)
					return result;
				handle(point, result, exception, hasException);
			} catch (Exception e) {
				logger.error("日志记录出错!", e);
			}
		}
		return result;
		
	}

	private void handle(ProceedingJoinPoint point, Object result, Exception exception, Boolean hasException)
			throws Exception {

		// 获取拦截的方法名
		Signature sig = point.getSignature();
		MethodSignature msig = null;
		if (!(sig instanceof MethodSignature)) {
			throw new IllegalArgumentException("该注解只能用于方法");
		}
		msig = (MethodSignature) sig;
		Object target = point.getTarget();
		String className = StringUtils.defaultString(target.getClass().getName(), "");
		Method currentMethod = target.getClass().getMethod(msig.getName(), msig.getParameterTypes());
		String methodName = StringUtils.defaultString(currentMethod.getName(), "");
		GlobalLogIgnore annotation = currentMethod.getAnnotation(GlobalLogIgnore.class);
		if (annotation != null) {
			// 跳过全局日志拦截
			return;
		}

		// 接收到请求，记录请求内容
		ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		HttpServletRequest request = attributes.getRequest();

		String requestIP = request.getRemoteAddr();
		String requestUrl = request.getRequestURL().toString();
		String requestMethod = request.getMethod();
		Long requestTotalTime = System.currentTimeMillis() - startTime.get();

		// 获取拦截方法的参数
		Object[] params = point.getArgs();
		StringBuilder paramsSb = new StringBuilder();
		for (Object param : params) {
			paramsSb.append(param);
			paramsSb.append(" & ");
		}
		String paramsStr = paramsSb.toString();

		String msg = "";
		Integer code = 200;
		Long hasExceptionLong = 0L;
		Date time = new Date();
		if (hasException) {
			code = 500;
			hasExceptionLong = 1L;
			msg = ToolUtil.getStrByLength(ToolUtil.getExceptionMsg(exception), 2000);
		}
		String resultStr = ToolUtil.getStrByLength(ToolUtil.toStr(result, "{}"), 2000);
		// 记录下请求内容
		logger.info("IP : " + requestIP);
		logger.info("TOTAL_TIME : " + requestTotalTime);
		logger.info("URL : " + requestUrl);
		logger.info("HTTP_METHOD : " + requestMethod);
		logger.info("CLASS_METHOD : " + className + "." + methodName);
		logger.info("EXCEPTION_MSG : " + msg);
		logger.info("ARGS : " + paramsStr);
		logger.info("RESULT : " + resultStr);
		
		// 延迟10毫秒保存Log日志
		LogManager.me().executeLog(LogTaskFactory.requestLog(requestIP, requestUrl, requestTotalTime, requestMethod,
				className, methodName, code, paramsStr, resultStr, hasExceptionLong, msg, 1L, time));

		// 如果当前用户未登录，不做日志
		// ShiroUser user = ShiroKit.getUser();
		// if (null == user) {
		// return;
		// }

		// 获取操作名称
		// BussinessLog annotation = currentMethod.getAnnotation(BussinessLog.class);
		// String bussinessName = annotation.value();
		// String key = annotation.key();
		// Class dictClass = annotation.dict();

		// 如果涉及到修改,比对变化
		// String msg;
		// if (bussinessName.indexOf("修改") != -1 || bussinessName.indexOf("编辑") != -1) {
		// Object obj1 = LogObjectHolder.me().get();
		// Map<String, String> obj2 = HttpKit.getRequestParameters();
		// msg = Contrast.contrastObj(dictClass, key, obj1, obj2);
		// } else {
		// Map<String, String> parameters = HttpKit.getRequestParameters();
		// AbstractDictMap dictMap = (AbstractDictMap) dictClass.newInstance();
		// msg = Contrast.parseMutiKey(dictMap,key,parameters);
		// }
		//
	}
}