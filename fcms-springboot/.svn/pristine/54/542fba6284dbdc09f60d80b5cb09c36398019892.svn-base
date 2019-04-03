package com.yhlt.showcase.requestLog.entity;

import com.yhlt.showcase.base.entity.BaseEntity;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;

/**
 * @Description: WEB访问日志 Entity
 * @author wangyoutao
 * @date 2018-05-07 17:20
 */
@Entity
@Table(name = "tc_system_request_log")
@SequenceGenerator(name = "SEQ", sequenceName = "SEQ_SYS_FCMS", allocationSize = 1, initialValue = 1)
public class RequestLogEntity extends BaseEntity<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4090074265190760983L;
	
	private String requestIp;

	private String requestUrl;

	private Long requestTotalTime;

	private String requestMethod;

	private String className;

	private String methodName;
	
	private Integer code;

	private String params;

	private String result;

	private Long hasException;

	private String exceptionMsg;

	public String getRequestIp() {
		return requestIp;
	}

	public void setRequestIp(String requestIp) {
		this.requestIp = requestIp;
	}

	public String getRequestUrl() {
		return requestUrl;
	}

	public void setRequestUrl(String requestUrl) {
		this.requestUrl = requestUrl;
	}

	public Long getRequestTotalTime() {
		return requestTotalTime;
	}

	public void setRequestTotalTime(Long requestTotalTime) {
		this.requestTotalTime = requestTotalTime;
	}

	public String getRequestMethod() {
		return requestMethod;
	}

	public void setRequestMethod(String requestMethod) {
		this.requestMethod = requestMethod;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getMethodName() {
		return methodName;
	}

	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}

	public Integer getCode() {
		return code;
	}
	
	public void setCode(Integer code) {
		this.code = code;
	}
	
	public String getParams() {
		return params;
	}

	public void setParams(String params) {
		this.params = params;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Long getHasException() {
		return hasException;
	}

	public void setHasException(Long hasException) {
		this.hasException = hasException;
	}

	public String getExceptionMsg() {
		return exceptionMsg;
	}

	public void setExceptionMsg(String exceptionMsg) {
		this.exceptionMsg = exceptionMsg;
	}

}
