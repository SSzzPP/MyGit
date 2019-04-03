package com.yhlt.showcase.blockchain.command;

import java.io.IOException;

import javax.xml.bind.DatatypeConverter;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSONObject;
/**
 *
 * @author stone
 * @date 2018年3月26日 下午10:18:23
 */
public class BaseCommand {

	private final static Logger logger = Logger.getLogger(BaseCommand.class);
	private HttpPost httpPost = null;
	private HttpClient httpClient = null;

	public void initialize(String ip, String port, String login, String password) throws Exception {
		httpPost = new HttpPost("http://" + ip + ":" + port);
		httpClient = HttpClients.custom().build();
		httpPost.setHeader("Access-Control-Allow-Headers", "X-Requested-With");
		String encodingRpcConfig=DatatypeConverter
				.printBase64Binary((login + ":" + password).getBytes("UTF-8"));
		httpPost.setHeader(
				"Authorization",
				"Basic "+encodingRpcConfig);
	}
	/**
	 *
	 * @param methodName
	 * @return
	 * @throws Exception
	 */
	public JSONObject exec(CommandEnum methodName) throws Exception{
		return exec(methodName,null);
	}
	/**
	 *
	 * @param methodName
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public JSONObject exec(CommandEnum methodName, Object... params)
			throws Exception {
		JSONObject obj = new JSONObject();
		obj.put("method", methodName.toString().toLowerCase());
		if (params != null && params.length > 0) {
			obj.put("configs", params);
		}
		return JSONObject.parseObject(sendPostRequest(obj));
	}
	/**
	 *
	 * @param methodName
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public JSONObject exec(String methodName, Object... params)
			throws Exception {
		JSONObject obj = new JSONObject();
		obj.put("method", methodName.toLowerCase());
		if (params != null && params.length > 0) {
			obj.put("configs", params);
		}
		return JSONObject.parseObject(sendPostRequest(obj));
	}
	/**
	 *
	 * @param param
	 * @return
	 * @throws ClientProtocolException
	 * @throws IOException
	 */
	public String sendPostRequest(JSONObject param)
			throws ClientProtocolException, IOException {
		HttpClientContext context = HttpClientContext.create();
		logger.info("请求参数:" + param.toString());
		StringEntity entity = new StringEntity(param.toString(), "utf-8");// 解决中文乱码问题
		entity.setContentEncoding("UTF-8");
		entity.setContentType("application/json");
		httpPost.setEntity(entity);
		HttpResponse httpResponse = httpClient.execute(httpPost, context);
		String result = EntityUtils.toString(httpResponse.getEntity(), "GBK");
		return result;
	}



}
