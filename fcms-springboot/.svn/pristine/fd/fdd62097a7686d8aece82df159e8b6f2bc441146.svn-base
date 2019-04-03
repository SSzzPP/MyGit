/**
 * 系统常量类
 */
(function($, owner) {
	owner.DYNAMIC_URL = "/fcms";
	owner.SERVER_PATH = "$serverPath";
	owner.SETTINGS  = '$settings';
	owner.STATE = "$state";
	owner.VERSION = "$version";
	owner.LOCKER = "$locker";
	owner.LOCKER_STATUS = "$lockerStatus";
	owner.EXAM_INTRO = "$examintro";
	owner.LOGIN_STATUS = "$loginStatus";// 0未登录；1登录
	owner.LANGUAGE= "$language";
	
	//系统默认数据
	var _walletData = {"publicAdd":"","privateAdd":"","walletPwd":"","walletName":""}
	var _walletSetting = {"pubKeyHashVersion":"00","privateKeyVersion":"80","checksumValue":"00000000"}
	owner.getAppVersion = function(){
		var version = localStorage.getItem(owner.VERSION);
		version = version || '';
		return version;
	}
	
	owner.setAppVersion = function(version){
		localStorage.setItem(owner.VERSION,version);
	}
	
	owner.getServerHttpsPath = function(){
		var serverPath = localStorage.getItem(owner.SERVER_PATH);
		serverPath = serverPath || '';
		return 'https://'+ serverPath + owner.DYNAMIC_URL;
	}
	/**
	 * 返回登录界面用的地址
	 */
	owner.getLoginServerPath = function(){
		var serverPath = localStorage.getItem(owner.SERVER_PATH);
		serverPath = serverPath || '';
		return serverPath;
	}
	
	owner.setServerPath = function(serverPathStr){
		localStorage.setItem(owner.SERVER_PATH, serverPathStr);
	}
	
	/**
	 * 获取当前状态
	 **/
	owner.getState = function() {
		var stateText = localStorage.getItem(owner.STATE) || "{}";
		return JSON.parse(stateText);
	};

	/**
	 * 设置当前状态
	 **/
	owner.setState = function(state) {
		state = state || {};
		localStorage.setItem(owner.STATE, JSON.stringify(state));
		//var settings = owner.getSettings();
		//settings.gestures = '';
		//owner.setSettings(settings);
	};
	/**
	 * 获取应用本地配置
	 **/
	owner.setSettings = function(settings) {
		settings = settings || {};
		// console.log("setSettings = " + JSON.stringify(settings));
		localStorage.setItem(owner.SETTINGS, JSON.stringify(settings));
	};
	
	owner.setSettingsExtend = function(newSettings) {
		newSettings = newSettings || {};
		var settings = owner.getSettings();
		mui.extend(settings, newSettings);
		// console.log("setSettingsExtend = " + JSON.stringify(settings));
		localStorage.setItem(owner.SETTINGS, JSON.stringify(settings));
	};

	/**
	 * 设置应用本地配置
	 **/
	owner.getSettings = function() {
		var settingsText = localStorage.getItem(owner.SETTINGS) || "{}";
		// console.log("getSettings = " + settingsText);
		return JSON.parse(settingsText);
	};
	
	/**
	 * 获取应用手势锁
	 **/
	owner.getLocker = function(){
		var locker = localStorage.getItem(owner.LOCKER);
		locker = locker || '';
		return locker;
	};
	
	owner.setLocker = function(locker){
		localStorage.setItem(owner.LOCKER,locker);
	};
	
	/**
	 * 获取应用手势锁状态 0:开；1：关
	 **/
	owner.getLockerStatus = function(){
		var lockerStatus = localStorage.getItem(owner.LOCKER_STATUS);
		lockerStatus = lockerStatus || '';
		return lockerStatus;
	};
	
	owner.setLockerStatus = function(lockerStatus){
		localStorage.setItem(owner.LOCKER_STATUS,lockerStatus);
	};
	
	/**
	 * 获取用户登录状态，默认不登录。0未登录；1登录
	 **/
	owner.getLoginStatus = function(){
		var status = localStorage.getItem(owner.LOGIN_STATUS);
		status = status || '';
		return status;
	};
	
	owner.setLoginStatus = function(status){
		localStorage.setItem(owner.LOGIN_STATUS, status);
	};
	
	owner.toLoginPage = function(loginUrl){
		var pageId = "/h5plus/login/toLogin";
		/*var wv = plus.webview.getWebviewById(pageId);
		if(wv) {
			plus.webview.show(pageId);
		} else {*/
			mui.openWindow({
				url: dynamicURL+'h5plus/login/toLogin', 
				id : pageId,
				show:{
					autoShow:true,//页面loaded事件发生后自动显示，默认为true
					aniShow:"slide-in-bottom",
					duration:'250'
				},
				waiting:{
					autoShow:false//自动显示等待框，默认为true
				}
			});
		//}
	};
	owner.setLockerStatus = function(lockerStatus){
		localStorage.setItem(owner.LOCKER_STATUS,lockerStatus);
	}
	
	owner.saveWalletData = function(walletData){
		localStorage.setItem(owner.WALLET_DATA,JSON.stringify(walletData));
	}
	/**
	 * 导入账户
	 * @param {Object} walletData
	 */
	owner.importWalletData = function(walletData){
		localStorage.setItem(owner.WALLET_DATA,JSON.stringify(walletData));
		//如果本地钱包index为空，则设置初始化值为账户数量
		var walletDataIndex = localStorage.getItem(owner.WALLET_DATA_INDEX);
		if(!walletDataIndex){
			localStorage.setItem(owner.WALLET_DATA_INDEX,walletData.length);
		}
	}

	
	owner.getWalletData = function(){
		var walletData = localStorage.getItem(owner.WALLET_DATA);
		if(!walletData){
			walletData = []
		}else{
			walletData = JSON.parse(walletData);
		}
		return walletData;
	}
	/**
	 * 根据publicKey重命名账户
	 * @param {Object} publicKey
	 * @param {Object} walletName
	 */
	owner.renameWalletData = function(publicKey,walletName){
		var walletData = owner.getWalletData();
		if(walletData && publicKey && walletName){
			$(walletData).each(function(index,obj){
				if(obj.publicAdd == publicKey){
					obj.walletName=walletName;
				}
			})
			owner.saveWalletData(walletData);
		}
	}
	/**
	 * 根据publicKey删除账户数据
	 * @param {Object} publicKey
	 */
	owner.deleteWalletData = function(publicKey){
		var walletData = owner.getWalletData();
		if(walletData && publicKey){
			var walletDataTmp = [];
			$(walletData).each(function(index,obj){
				if(obj.publicAdd == publicKey){
				}else{
					walletDataTmp.push(obj);
				}
			})
			owner.saveWalletData(walletDataTmp);
		}
	}
	/**
	 * 根据index获取wallet数据
	 * @param {Object} index
	 */
	owner.getWalletDataByIndex = function(index){
		var walletData = owner.getWalletData();
		if(walletData && walletData.length>=index){
			return walletData[index];
		}else{
			throw new RangeError('out of range index');
		}
	}
	
	/**
	 * 返回钱包index
	 **/
	owner.getWalletDataIndex = function() {
		var walletDataIndex = localStorage.getItem(owner.WALLET_DATA_INDEX);
		if(!walletDataIndex){
			walletDataIndex=0;
		}
		walletDataIndex++;
		localStorage.setItem(owner.WALLET_DATA_INDEX,walletDataIndex);
		return walletDataIndex;
	}
	owner.getLanguage = function(){
		var lang = localStorage.getItem(owner.LANGUAGE);
		lang = lang || 'zh';
		return lang;
	}
	
	owner.setLanguage = function(lang){
		localStorage.setItem(owner.LANGUAGE,lang);
	}
}(mui,window.constants = {}));
