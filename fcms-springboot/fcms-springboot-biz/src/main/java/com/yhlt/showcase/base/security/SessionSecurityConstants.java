package com.yhlt.showcase.base.security;

/**
 * 
 * @author xunxun
 * @date 2015-1-7 上午11:00:12
 */
public class SessionSecurityConstants {
	/**
	 * Session存放的用户登录名
	 */
	public static final String KEY_LOGIN_NAME = "_login_name";
	/**
	 * Session中存放的用户真实姓名
	 */
	public static final String KEY_USER_NICK_NAME = "_user_nick_name";
	/**
	 * Session存放的用户id
	 */
	public static final String KEY_USER_ID = "_user_id";
	/**
	 * 用户授权信息
	 */
	public static final String KEY_AUTHENTICATION = "_user_authentication";
	/**
	 * 是否修改过默认密码，是否密码过期
	 */
	public static final String KEY_PASSWORD_TIP = "_password_tip_flag";
	/**
	 * 上次登录ip
	 */
	public static final String KEY_LAST_LOGIN_IP = "_user_last_login_ip";
	/**
	 * 上次访问url
	 */
	public static final String KEY_LAST_VISIT_URL = "_user_last_visit_url";
	/**
	 * 验证码
	 */
	public static final String KEY_CHECKCODE = "checkCode";
	/**
	 * 客户端语言
	 */
	public static final String KEY_LOCAL_LANGUAGE = "WW_TRANS_I18N_LOCALE";
	/**
	 * 密码
	 */
	public static final String KEY_PASSWORD = "_password";
	/**
	 * 可逆密碼
	 */
	public static final String KEY_REVERSIBLE_PASSWORD = "_reversible_password";
	/**
	 * 单点登录session id
	 */
	public static final String KEY_CAS_SESSIONID = "_cas_session_id";

	/**
	 * 账号状态
	 */
	public static final String KEY_ACCOUNT_TYPE = "_user_account_type";

	/**
	 * 用户
	 */
	public static final String KEY_USER = "_user";

	/**
	 * 用户菜单
	 */
	public static final String KEY_USER_MENU = "_user_menu";
	/**
	 * 用户公司
	 */
	public static final String KEY_USER_COMPANY = "_user_company";
	public static final String KEY_USER_COMPANY_IDS = "_user_company_ids";
	/**
	 * 验证码
	 */
	public static final String KEY_USER_VERIFICATION_CODE = "_user_verification_code";

	/**
	 * 服服务器时间
	 */
	public static final String KEY_SYSTEM_DATETIME = "_system_datetime";

	/**
	 * 用户系统菜单
	 */
	public static final String KEY_USER_RESOURCES = "_user_resources";

	/**
	 * 用户前台系统菜单
	 */
	public static final String KEY_USER_FRONT_RESOURCES = "_user_front_resources";

	/**
	 * 验证码
	 */
	public static final String KEY_MESSAGE_CHECKCODE = "_message_checkCode";

	/**
	 * token
	 */
	public static final String KEY_TOKEN = "token";
	
	//是否可以后台管理 0不可以
	public static final String KEY_OMS_IS_ADMIN="_is_admin";
	/**
	 * 今日访问量
	 */
	public static final String KEY_TODAY_COUNT = "_today_count";
	/**
	 * 今日访问量
	 */
	public static final String KEY_ALL_COUNT = "_all_count";
	/**
	 * 今日访问量
	 */
	public static final String KEY_ALLIPV_COUNT = "_allipv_count";
	
}
