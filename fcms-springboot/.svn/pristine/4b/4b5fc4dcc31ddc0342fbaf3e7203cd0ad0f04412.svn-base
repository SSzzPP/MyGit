package com.yhlt.showcase.base.log.factory;

import com.yhlt.showcase.base.utils.ToolUtil;
import com.yhlt.showcase.requestLog.entity.RequestLogEntity;

/**
 * 日志对象创建工厂
 *
 * @author wangyoutao
 * @date 2018年05月07日 下午5:18:27
 */
public class LogFactory {

    /**
     * 创建操作日志
     */
    public static RequestLogEntity createOperationLog(String requestIp, String requestUrl, Long requestTotalTime, String requestMethod,
			String className, String methodName, Integer code, String params, String result, Long hasException, String exceptionMsg, Long userId) {
    	RequestLogEntity requestLog = new RequestLogEntity();
    	requestLog.setRequestIp(requestIp);
    	requestLog.setRequestUrl(requestUrl);
    	requestLog.setRequestTotalTime(requestTotalTime);
    	requestLog.setRequestMethod(requestMethod);
    	requestLog.setClassName(className);
    	requestLog.setMethodName(methodName);
    	requestLog.setCode(code);
    	requestLog.setParams(ToolUtil.getStrByLength(params, 4000));
    	requestLog.setResult(ToolUtil.getStrByLength(result, 4000));
    	requestLog.setHasException(hasException);
    	requestLog.setExceptionMsg(ToolUtil.getStrByLength(exceptionMsg, 4000));
    	requestLog.setCreateById(userId);
        return requestLog;
    }

}
