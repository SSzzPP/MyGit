package com.yhlt.showcase.base.error;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorAttributes;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.context.request.WebRequest;

import com.yhlt.showcase.base.log.GlobalLogIgnore;
import com.yhlt.showcase.base.log.LogManager;
import com.yhlt.showcase.base.log.factory.LogTaskFactory;
import com.yhlt.showcase.base.properties.EnvProperties;
import com.yhlt.showcase.base.utils.ToolUtil;

@Controller
@RequestMapping(value = "/error")
public class GlobalErrorController implements ErrorController {

	private static final Logger logger = LoggerFactory.getLogger(GlobalErrorController.class);
	@Autowired
	private ErrorAttributes errorAttributes;
	@Autowired
	private EnvProperties envProperties;

	@Override
	public String getErrorPath() {
		logger.info("出错啦！进入自定义错误控制器");
		return "{success: false, msg: '请求出错！'}";
	}

	@ResponseBody
	@RequestMapping
	@GlobalLogIgnore
	public String error(HttpServletRequest request, HttpServletResponse response) {
		Boolean includeStackTrace = true;
		Boolean requestLogEnabled = envProperties.getRequestLogEnabled();

		String requestIP = request.getRemoteAddr();
		Integer requestPort = request.getServerPort();
		String requestMethod = request.getMethod();

		Map<String, Object> errorAttributes = getErrorAttributes(request, includeStackTrace);
		String message = "";
		Integer code = (Integer) errorAttributes.get("status");
		;
		Long hasExceptionLong = 1L;
		String path = (String) errorAttributes.get("path");
		String requestUrl = requestIP + ":" + requestPort + path;
		String messageFound = (String) errorAttributes.get("message");
		String error = (String) errorAttributes.get("error");
		Date time = new Date();
		String trace = "";
		if (!StringUtils.isEmpty(path)) {
			message = String.format("Requested path %s with result %s", path, messageFound);
		}
		if (includeStackTrace) {
			trace = (String) errorAttributes.get("trace");
			if (!StringUtils.isEmpty(trace)) {
				message += String.format(" and trace %s", trace);
			}
		}
		message = ToolUtil.getStrByLength(message, 2000);
		if (requestLogEnabled) {
			LogManager.me().executeLog(LogTaskFactory.requestLog(requestIP, requestUrl, 0L, requestMethod, "", "", code,
					"", error, hasExceptionLong, message, 1L, time));
		}
		logger.info(message);
		return getErrorPath();
	}

	private Map<String, Object> getErrorAttributes(HttpServletRequest request, boolean includeStackTrace) {
		WebRequest webRequest = new ServletWebRequest(request);
		return errorAttributes.getErrorAttributes(webRequest, includeStackTrace);
	}

}