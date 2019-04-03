package com.yhlt.showcase.base.log.factory;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.TimerTask;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.yhlt.showcase.base.modules.SpringContextHolder;
import com.yhlt.showcase.requestLog.service.RequestLogService;

/**
 * 日志操作任务创建工厂
 *
 * @author fengshuonan
 * @date 2016年12月6日 下午9:18:27
 */
public class LogTaskFactory {

	private static Logger logger = LoggerFactory.getLogger(LogTaskFactory.class);
	private static RequestLogService requestLogService = SpringContextHolder.getBean(RequestLogService.class);

	// public static TimerTask loginLog(final Integer userId, final String ip) {
	// return new TimerTask() {
	// @Override
	// public void run() {
	// try {
	// LoginLog loginLog = LogFactory.createLoginLog(LogType.LOGIN, userId, null,
	// ip);
	// loginLogMapper.insert(loginLog);
	// } catch (Exception e) {
	// logger.error("创建登录日志异常!", e);
	// }
	// }
	// };
	// }

	// public static TimerTask loginLog(final String username, final String msg,
	// final String ip) {
	// return new TimerTask() {
	// @Override
	// public void run() {
	// LoginLog loginLog = LogFactory.createLoginLog(
	// LogType.LOGIN_FAIL, null, "账号:" + username + "," + msg, ip);
	// try {
	// loginLogMapper.insert(loginLog);
	// } catch (Exception e) {
	// logger.error("创建登录失败异常!", e);
	// }
	// }
	// };
	// }

	public static TimerTask requestLog(String requestIp, String requestUrl, Long requestTotalTime, String requestMethod,
			String className, String methodName, Integer code, String params, String result, Long hasException,
			String exceptionMsg, Long userId,Date time) {
		return new TimerTask() {
			@Override
			public void run() {
				Map<String, Object> parameter = new HashMap<>();
				parameter.put("requestIp", requestIp);
				parameter.put("requestUrl", requestUrl);
				parameter.put("requestTotalTime", requestTotalTime);
				parameter.put("requestMethod", requestMethod);
				parameter.put("className", className);
				parameter.put("methodName", methodName);
				parameter.put("code", code);
				parameter.put("params", params);
				parameter.put("resultStr", result);
				parameter.put("hasException", hasException);
				parameter.put("exceptionMsg", exceptionMsg);
				parameter.put("userId", userId);
				parameter.put("gmtCreate", time);
				// RequestLogEntity requestLog = LogFactory.createOperationLog(requestIp,requestUrl, requestTotalTime, requestMethod, className, methodName, code,params, result, hasException, exceptionMsg, userId);
				try {
					// requestLogService.noLogSave(requestLog);
					requestLogService.saveRequestLogException(parameter);
				} catch (Exception e) {
					logger.error("创建业务日志异常!", e);
				}
			}
		};
	}

}