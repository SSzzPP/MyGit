package com.yhlt.showcase.base.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

import com.baidu.ueditor.define.ActionMap;
import com.yhlt.showcase.base.modules.SpringContextHolder;
import com.yhlt.showcase.base.properties.EnvProperties;

/**
 * 改造原有Ueditor
 * 
 * @author admin
 * 
 */
public final class ConfigManager {

	private final String rootPath;
	private final String originalPath;
	@SuppressWarnings("unused")
	private final String contextPath;
	private static final String configFileName = "config.json";
	private String parentPath = null;
	private JSONObject jsonConfig = null;
	private final static String SCRAWL_FILE_NAME = "scrawl";
	private final static String REMOTE_FILE_NAME = "remote";
	private final static EnvProperties envProperties = SpringContextHolder.getBean(EnvProperties.class);

	private ConfigManager(String rootPath, String contextPath, String uri)
			throws FileNotFoundException, IOException {

		rootPath = rootPath.replace("\\", "/");

		this.rootPath = rootPath;
		this.contextPath = contextPath;

		if (contextPath.length() > 0) {
			this.originalPath = this.rootPath
					+ uri.substring(contextPath.length());
		} else {
			this.originalPath = this.rootPath + uri;
		}

		this.initEnv();

	}

	public static ConfigManager getInstance(String rootPath,
			String contextPath, String uri) {

		try {
			return new ConfigManager(rootPath, contextPath, uri);
		} catch (Exception e) {
			return null;
		}

	}

	public boolean valid() {
		return this.jsonConfig != null;
	}

	public JSONObject getAllConfig() {

		return this.jsonConfig;

	}

	public Map<String, Object> getConfig(int type) {

		Map<String, Object> conf = new HashMap<String, Object>();
		String savePath = null;
		try {

			switch (type) {

			case ActionMap.UPLOAD_FILE:
				conf.put("isBase64", "false");
				conf.put("maxSize", this.jsonConfig.getLong("fileMaxSize"));
				conf.put("allowFiles", this.getArray("fileAllowFiles"));
				conf.put("fieldName",
						this.jsonConfig.getString("fileFieldName"));
				savePath = this.jsonConfig.getString("filePathFormat");
				break;

			case ActionMap.UPLOAD_IMAGE:
				conf.put("isBase64", "false");
				conf.put("maxSize", this.jsonConfig.getLong("imageMaxSize"));
				conf.put("allowFiles", this.getArray("imageAllowFiles"));
				conf.put("fieldName",
						this.jsonConfig.getString("imageFieldName"));
				savePath = this.jsonConfig.getString("imagePathFormat");
				break;

			case ActionMap.UPLOAD_VIDEO:
				conf.put("maxSize", this.jsonConfig.getLong("videoMaxSize"));
				conf.put("allowFiles", this.getArray("videoAllowFiles"));
				conf.put("fieldName",
						this.jsonConfig.getString("videoFieldName"));
				savePath = this.jsonConfig.getString("videoPathFormat");
				break;

			case ActionMap.UPLOAD_SCRAWL:
				conf.put("filename", ConfigManager.SCRAWL_FILE_NAME);
				conf.put("maxSize", this.jsonConfig.getLong("scrawlMaxSize"));
				conf.put("fieldName",
						this.jsonConfig.getString("scrawlFieldName"));
				conf.put("isBase64", "true");
				savePath = this.jsonConfig.getString("scrawlPathFormat");
				break;

			case ActionMap.CATCH_IMAGE:
				conf.put("filename", ConfigManager.REMOTE_FILE_NAME);
				conf.put("filter", this.getArray("catcherLocalDomain"));
				conf.put("maxSize", this.jsonConfig.getLong("catcherMaxSize"));
				conf.put("allowFiles", this.getArray("catcherAllowFiles"));
				conf.put("fieldName",
						this.jsonConfig.getString("catcherFieldName") + "[]");
				savePath = this.jsonConfig.getString("catcherPathFormat");
				break;

			case ActionMap.LIST_IMAGE:
				conf.put("allowFiles", this.getArray("imageManagerAllowFiles"));
				conf.put("dir",
						this.jsonConfig.getString("imageManagerListPath"));
				conf.put("count",
						this.jsonConfig.getInt("imageManagerListSize"));
				break;

			case ActionMap.LIST_FILE:
				conf.put("allowFiles", this.getArray("fileManagerAllowFiles"));
				conf.put("dir",
						this.jsonConfig.getString("fileManagerListPath"));
				conf.put("count", this.jsonConfig.getInt("fileManagerListSize"));
				break;

			}
			
			conf.put("savePath", savePath);
			conf.put("rootPath", this.rootPath);
			conf.put("saveRootPath", this.jsonConfig.getString("saveRootPath"));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conf;

	}

	private void initEnv() throws FileNotFoundException, IOException {

		File file = new File(this.originalPath);

		if (!file.isAbsolute()) {
			file = new File(file.getAbsolutePath());
		}

		this.parentPath = file.getParent();

		String configContent = this.readFile(this.getConfigPath());

		try {
			JSONObject jsonConfig = new JSONObject(configContent);
//			///* 文件访问路径前缀 */
			String urlPrefix = envProperties.getUrlPrefix();
			jsonConfig.put("imageUrlPrefix", urlPrefix);
			jsonConfig.put("scrawlUrlPrefix", urlPrefix);
			jsonConfig.put("catcherUrlPrefix", urlPrefix);
			jsonConfig.put("videoUrlPrefix", urlPrefix);
			jsonConfig.put("fileUrlPrefix", urlPrefix);
			jsonConfig.put("imageManagerUrlPrefix", urlPrefix);
			jsonConfig.put("fileManagerUrlPrefix", urlPrefix);
			
//			上传路径
			jsonConfig.put("imagePathFormat", envProperties.getImagePathFormat());
			jsonConfig.put("videoPathFormat", envProperties.getVideoPathFormat());
			jsonConfig.put("saveRootPath", envProperties.getFileSavePath());
			this.jsonConfig = jsonConfig;
		} catch (Exception e) {
			this.jsonConfig = null;
		}

	}

	private String getConfigPath() {
		return this.parentPath + File.separator + ConfigManager.configFileName;
	}

	private String[] getArray(String key) {

		try {
			JSONArray jsonArray = this.jsonConfig.getJSONArray(key);
			String[] result = new String[jsonArray.length()];

			for (int i = 0, len = jsonArray.length(); i < len; i++) {
				result[i] = jsonArray.getString(i);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	private String readFile(String path) throws IOException {

		StringBuilder builder = new StringBuilder();

		try {

			InputStreamReader reader = new InputStreamReader(
					new FileInputStream(path), "UTF-8");
			BufferedReader bfReader = new BufferedReader(reader);

			String tmpContent = null;

			while ((tmpContent = bfReader.readLine()) != null) {
				builder.append(tmpContent);
			}

			bfReader.close();

		} catch (UnsupportedEncodingException e) {
		}

		return this.filter(builder.toString());

	}

	private String filter(String input) {

		return input.replaceAll("/\\*[\\s\\S]*?\\*/", "");

	}

}
