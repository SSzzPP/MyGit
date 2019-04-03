/**
 * 演示程序当前的 “注册/登录” 等操作，是基于 “本地存储” 完成的
 * 当您要参考这个演示程序进行相关 app 的开发时，
 * 请注意将相关方法调整成 “基于服务端Service” 的实现。
 **/
(function($, owner) {
	
	/**
	 * 在市北登录
	 */
	
	owner.zsbLogin = function(callback) {
		callback = callback || $.noop;
		var cookiesObject = {};
		cookiesObject.success = jaaulde.utils.cookies.get('success');
		if (cookiesObject.success) {
			constants.setLoginStatus(1);
			cookiesObject.sessionId = jaaulde.utils.cookies.get('sessionId');
			cookiesObject.uuid = jaaulde.utils.cookies.get('uuid');
			cookiesObject.type = jaaulde.utils.cookies.get('type');
			cookiesObject.loginUser = jaaulde.utils.cookies.get('nickName');
			cookiesObject.userPhoto = jaaulde.utils.cookies.get('userPhoto');
			var settings = constants.getSettings();
			settings.sessionId = cookiesObject.sessionId;
			settings.uuid = cookiesObject.uuid;
			settings.loginUser = cookiesObject.loginUser;
			settings.type = cookiesObject.type;
			settings.userPhoto = cookiesObject.userPhoto;
			constants.setSettingsExtend(settings);
		} else {
			constants.setLoginStatus(0);
			cookiesObject.msg = jaaulde.utils.cookies.get('msg');
			return callback(cookiesObject.msg);
		}
	};
	
/*	owner.zsbLogin = function(callback) {
		callback = callback || $.noop;
		var cookiesObject = {};
		cookiesObject.success = jaaulde.utils.cookies.get('success');
		if (cookiesObject.success) {
			constants.setLoginStatus(1);
			cookiesObject.sessionId = jaaulde.utils.cookies.get('sessionId');
			cookiesObject.uuid = jaaulde.utils.cookies.get('uuid');
			cookiesObject.type = jaaulde.utils.cookies.get('type');
			cookiesObject.loginUser = jaaulde.utils.cookies.get('nickName');
			var settings = constants.getSettings();
			settings.sessionId = cookiesObject.sessionId;
			settings.uuid = cookiesObject.uuid;
			settings.loginUser = cookiesObject.loginUser;
			settings.type = cookiesObject.type;
			constants.setSettingsExtend(settings);
		} else {
			constants.setLoginStatus(0);
			cookiesObject.msg = jaaulde.utils.cookies.get('msg');
			return callback(cookiesObject.msg);
		}
	};*/
	
	
	/**
	 * 用户登录
	 **/
	owner.login = function(loginInfo, callback) {
		callback = callback || $.noop;
		loginInfo = loginInfo || {};
		// loginInfo.serverPath = loginInfo.serverPath || '';
		loginInfo.account = loginInfo.account || '';
		loginInfo.password = loginInfo.password || '';
		
		var settings = constants.getSettings();
		var oldAccount = settings.account;
		/*if (loginInfo.serverPath.length < 10) {
			return callback('服务器最短为 10 个字符');
		}else{
			constants.setServerPath(loginInfo.serverPath);
		}*/
		if (loginInfo.account.length < 2) {
			return callback('账号最短为 2 个字符');
		}else{
			settings.account  = loginInfo.account;
		}
		if (loginInfo.password.length < 2) {
			return callback('密码最短为 2 个字符');
		}else{
			settings.password = loginInfo.password;
		}
		constants.setSettingsExtend(settings);
		
		/**
		 * var params = {per:10, pageno:coms_current_pageno};
		topUtil.web_query('get_com_list', params, onSuccess, onError, 3);
		
		 */
		/**
		 *  str += "名称：" + plus.os.name + "\n";
		    str += "版本：" + plus.os.version + "\n";
		    str += "语言：" + plus.os.language + "\n";
		    str += "厂商：" + plus.os.vendor + "\n";
		 */
		//var vInfo = plus.push.getClientInfo();
		//var,clientId:vInfo.clientid
		var osName = "android";
		if(mui.os.ios){
			osName = "ios";
		}
		var params = {username:loginInfo.account,password:loginInfo.password,
						plusOsName:osName,plusOsVersion:mui.os.version,plusOsVendor:null,
						deviceUuid:null};
		topUtil.web_query('/h5plus/login/loginMobile',params,
			function (data){
				if (typeof data == "string") {
	                data = JSON.parse(data);
	           }
				//服务器返回响应，根据响应结果，分析是否登录成功；
				if (data.success) {
					var settings = constants.getSettings();
					settings.sessionId = data.sessionId;
					settings.uuid = data.obj.uuid;
					settings.loginUser = data.obj.name;
					settings.type = data.obj.type;
					constants.setSettingsExtend(settings);
//					if(oldAccount != loginInfo.account){
//						// 如果更换用户，手势锁状态打开，清空手势锁
//						console.log(oldAccount +'=========='+loginInfo.account);
//						constants.setLocker('');
//						constants.setLockerStatus(0);
//					}
					return owner.createState(loginInfo.account, callback);
				} else {
					return callback(data.msg);
				}
			}
		)
	};

	owner.createState = function(name, callback) {
		var state = constants.getState();
		state.account = name;
		state.token = "token123456789";
		constants.setState(state);
		return callback();
	};

	/**
	 * 新用户注册
	 **/
	owner.reg = function(regInfo, callback) {
		callback = callback || $.noop;
		regInfo = regInfo || {};
		regInfo.account = regInfo.account || '';
		regInfo.password = regInfo.password || '';
		if (regInfo.account.length < 5) {
			return callback('用户名最短需要 5 个字符');
		}
		if (regInfo.password.length < 6) {
			return callback('密码最短需要 6 个字符');
		}
		if (!checkEmail(regInfo.email)) {
			return callback('邮箱地址不合法');
		}
		var users = JSON.parse(localStorage.getItem('$users') || '[]');
		users.push(regInfo);
		localStorage.setItem('$users', JSON.stringify(users));
		return callback();
	};


	var checkEmail = function(email) {
		email = email || '';
		return (email.length > 3 && email.indexOf('@') > -1);
	};

	/**
	 * 找回密码
	 **/
	owner.forgetPassword = function(email, callback) {
		callback = callback || $.noop;
		if (!checkEmail(email)) {
			return callback('邮箱地址不合法');
		}
		return callback(null, '新的随机密码已经发送到您的邮箱，请查收邮件。');
	};


		/**
		 * 获取本地是否安装客户端
		 **/
	owner.isInstalled = function(id) {
		if (id === 'qihoo' && mui.os.plus) {
			return true;
		}
		if (mui.os.android) {
			var main = plus.android.runtimeMainActivity();
			var packageManager = main.getPackageManager();
			var PackageManager = plus.android.importClass(packageManager)
			var packageName = {
				"qq": "com.tencent.mobileqq",
				"weixin": "com.tencent.mm",
				"sinaweibo": "com.sina.weibo"
			}
			try {
				return packageManager.getPackageInfo(packageName[id], PackageManager.GET_ACTIVITIES);
			} catch (e) {}
		} else {
			switch (id) {
				case "qq":
					var TencentOAuth = plus.ios.import("TencentOAuth");
					return TencentOAuth.iphoneQQInstalled();
				case "weixin":
					var WXApi = plus.ios.import("WXApi");
					return WXApi.isWXAppInstalled()
				case "sinaweibo":
					var SinaAPI = plus.ios.import("WeiboSDK");
					return SinaAPI.isWeiboAppInstalled()
				default:
					break;
			}
		}
	}
}(mui, window.app = {}));