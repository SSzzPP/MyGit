package com.yhlt.showcase.base.socket;

public class MessageInfo {

	// 源客户端id
	private String sourceClientId;
	// 目标客户端id
	private String targetClientId;
	// 消息类型
	private String msgType;
	// 消息内容
	private String msgContent;

	private String sessionId;

	private String uuid;

	public String getTargetClientId() {
		return targetClientId;
	}

	public void setTargetClientId(String targetClientId) {
		this.targetClientId = targetClientId;
	}

	public String getSourceClientId() {
		return sourceClientId;
	}

	public void setSourceClientId(String sourceClientId) {
		this.sourceClientId = sourceClientId;
	}

	public String getMsgType() {
		return msgType;
	}

	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

}
