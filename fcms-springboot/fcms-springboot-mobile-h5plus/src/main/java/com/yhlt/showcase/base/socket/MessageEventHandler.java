package com.yhlt.showcase.base.socket;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.SocketIOServer;
import com.corundumstudio.socketio.annotation.OnConnect;
import com.corundumstudio.socketio.annotation.OnDisconnect;
import com.corundumstudio.socketio.annotation.OnEvent;
import com.yhlt.showcase.base.utils.ConstantsUtils;
import com.yhlt.showcase.base.utils.RedisUtil;
import com.yhlt.showcase.venue.entity.VenueUserEntity;

@Component
public class MessageEventHandler {

	public static SocketIOServer socketIoServer;
	static final int limitSeconds = 60;
	//存放用户id（也可能会改成存用户sessionId）和socketSessionId
	static Map<String, Object> userMap = new HashMap<String, Object>();

	@Autowired
	public MessageEventHandler(SocketIOServer server) {
		this.socketIoServer = server;
	}

	@OnConnect
	public void onConnect(SocketIOClient client) {
		// sendBuyLogEvent();
		System.out.println("客户端:" + client.getSessionId() + "已连接");
		socketIoServer.getClient(client.getSessionId()).sendEvent("connect", "back data");
	}

	@OnDisconnect
	public void onDisconnect(SocketIOClient client) {
		System.out.println("客户端:" + client.getSessionId() + "断开连接");
		String sessionId = client.getSessionId().toString();
		String removeKey = "";
		//断开连接时将该用户从Map移除
		Set<String> keys = userMap.keySet();
		for (String key : keys) {
			if (userMap.get(key).toString().equals(sessionId)) {
				removeKey = key;
				break;
			}
		}
		userMap.remove(removeKey);
	}

	@OnEvent(value = "userreg")
	public void onEvent(SocketIOClient client, AckRequest request, Map<String, Object> data) {
		System.out.println("用户注册：" + data.get("sessionId") + " Socket.io SessionId：" + client.getSessionId());
		//注册时将id和socketSessionId放入Map
		VenueUserEntity venueUserEntity = RedisUtil.get(ConstantsUtils.SESSION_KEY_PREFIX_USER_ENTITY + data.get("sessionId"));
		userMap.put(venueUserEntity.getId().toString(), client.getSessionId());
		socketIoServer.getClient(client.getSessionId()).sendEvent("user-reg", "back data");
	}

	@OnEvent(value = "messageevent")
	public void onEvent(SocketIOClient client, AckRequest request, MessageInfo data, String sessionId) {
		System.out.println("发来消息：" + data.getMsgContent());
		VenueUserEntity venueUserEntity = RedisUtil.get(ConstantsUtils.SESSION_KEY_PREFIX_USER_ENTITY + data.getSessionId());
		data.setSourceClientId(venueUserEntity.getId().toString());
		//监听到发来消息时，如果接收方在线，则同时推送发送方和接收方，否则仅推送发送方
		if (userMap.get(data.getTargetClientId().toString()) != null) {
			socketIoServer.getClient((UUID) userMap.get(data.getTargetClientId().toString())).sendEvent("enewbuy",data);
		}
		socketIoServer.getClient(client.getSessionId()).sendEvent("enewbuy", data);
	}
}
