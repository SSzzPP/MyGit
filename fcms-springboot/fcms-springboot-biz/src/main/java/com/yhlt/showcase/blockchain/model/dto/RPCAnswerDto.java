package com.yhlt.showcase.blockchain.model.dto;

import java.util.Map;

/**
 * RPC回答
 * @author stone
 * @date 2018年3月4日 上午11:33:55
 */
public class RPCAnswerDto {
	Object result;
	Map<String, Object> error;
	String id;
	public Object getResult() {
		return result;
	}
	public void setResult(Object result) {
		this.result = result;
	}
	public Map<String, Object> getError() {
		return error;
	}
	public void setError(Map<String, Object> error) {
		this.error = error;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "RPCAnswerDto [result=" + result + ", error=" + error + ", id=" + id + "]";
	}


}
