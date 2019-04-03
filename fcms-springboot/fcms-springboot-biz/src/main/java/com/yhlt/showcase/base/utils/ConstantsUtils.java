package com.yhlt.showcase.base.utils;


/**
 * 常量定义类
 * 
 * @author wj
 * 
 */
public class ConstantsUtils {
	// 用户主题
	// public static final String USER_THEMES = "USER_THEMES";
	// public static final String USER_MODETHEMES = "USER_MODETHEMES";
	// public static final String USER_COMPONENTTHEMES = "USER_COMPONENTTHEMES";

	// 用户portal
	// public static final String USER_PORTAL = "USER_PORTAL";

	// 用户信息-存session用
	// public static final String USER_INFO = "USER_INFO";

	// 用户资源
	// public static final String USER_RESOURCES = "USER_RESOURCES";

	// Redis前缀
	public static final String SESSION_KEY_PREFIX_USER_ENTITY = "session_user_";
	public static final String SESSION_KEY_PREFIX_USER = "session_user_id_";
	public static final String SESSION_KEY_PREFIX_VENUE_ENTITY = "session_venue_";
	public static final String SESSION_KEY_PREFIX_VENUE = "session_venue_id_";
	//前台front
	public static final String SESSION_KEY_PREFIX_FRONT_VENUE_ENTITY = "session_front_venue_";
	public static final String SESSION_KEY_PREFIX_FRONT_VENUE = "session_front_venue_id_";
	
	public static final String SESSION_KEY_PREFIX_OPEN = "session_open_id_";

	public static final String XCX_KEY_PREFIX_USER_ENTITY = "xcx_user_";
	public static final String XCX_KEY_PREFIX_USER = "xcx_user_id_";
	public static final String XCX_KEY_PREFIX_OPEN = "xcx_open_id_";
	public static final String XCX_KEY_PREFIX_SESSIONKEY = "xcx_session_key_";
	/**
	 * 绑定手机号 发送验证码
	 */
	public static final String SESSION_KEY_BINDPHONE_CODE="session_bindphone_code_";

	/**当前用户实体*/
	public final static String USER_LOGINUSER = "loginUser";
	/**
	 * 用于微信回复航班详情
	 */
	public static final String SESSION_KEY_USER_FLIGHT = "user_flight_";
}
