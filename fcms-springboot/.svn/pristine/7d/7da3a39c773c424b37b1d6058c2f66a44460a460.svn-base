(function($, owner) {

	/**
	 * 获取mac地址(android)
	 */
	owner.macInfo = function() { 
	    var mac = ""; 
	    if (plus.os.name == "Android") { 
	        //WifiManager 
	        var Context = plus.android.importClass("android.content.Context"); 
	        var WifiManager = plus.android.importClass("android.net.wifi.WifiManager"); 
	        var wifiManager = plus.android.runtimeMainActivity().getSystemService(Context.WIFI_SERVICE); 
	        var WifiInfo = plus.android.importClass("android.net.wifi.WifiInfo"); 
	        var wifiInfo = wifiManager.getConnectionInfo(); 
	        mac = wifiInfo.getMacAddress(); 
	    } 
	    return mac; 
	} 
	/**
	 * @requires jQuery 将form表单元素的值序列化成对象
	 * @returns object
	 */
	owner.serializeObject = function(form) {
		var o = {};
		jQuery.each(form.serializeArray(), function(index) {
			if (o[this['name']]) {
				o[this['name']] = o[this['name']] + "," + this['value'];
			} else {
				o[this['name']] = this['value'];
			}
		});
		return o;
	};
	/**
	 * var params = {per:10, pageno:coms_current_pageno};
		topUtil.web_query('get_com_list', params, onSuccess, onError, 3);
		
	 * @param {Object} func_url
	 * @param {Object} params
	 * @param {Object} onSuccess
	 * @param {Object} onError
	 * @param {Object} retry
	 */
	owner.web_query = function(func_url, params, onSuccess, onError, retry){
		// var serverPath = window.constants.getServerPath();
	    var onSuccess = arguments[2]?arguments[2]:function(){};
	    var onError = arguments[3]?arguments[3]:function(){};
	    var retry = arguments[4]?arguments[4]:0;
	    var version = constants.getAppVersion();
	   // var flag = false;
	   /* var sessionId = constants.getSettings().sessionId ;//|| 'no_login';
	    if (constants.getLoginStatus() == 0) {
	    	sessionId = 'no_login';
	    }*/
	    if(version && params){
	    	params.version = version;
	    	params._request_date_=new Date().getTime();
	    }
	    // console.log("path:"+serverPath + func_url);
	    console.log("params:"+JSON.stringify(params));
	    mui.ajax(dynamicURL + func_url, {
	        data:params,
	        //xhrFields: {withCredentials: true},
	        //crossDomain: true,
            type:'post',//HTTP请求类型
            timeout:10000,//超时时间设置为10秒；
	        success:function(data){
	        	console.log(data);
	        	//登录超时
	        	if(!topUtil.checkLoginStatus(data) && constants.getLoginStatus() == 1){
	        		constants.setLoginStatus(0);
	        		owner.showLoginView();
	        		return;
	        	}else{
	        		onSuccess(data);
	        	}
	        },
	        error:function(xhr,type,errorThrown){
	        	//异常处理；
	        	console.log('错误详情---'+JSON.stringify(xhr ));
	        	console.log('状态码---'+xhr.readyState);
				console.log('状态码---'+xhr.status);
				console.log('type---'+type);
				console.log(errorThrown);
				//异常重试 
	            retry--; 
	            if(retry > 0) return topUtil.web_query(func_url, params, onSuccess, onError, retry);
	            owner.onError('FAILED_NETWORK');
	        },headers: { 
				"Access-Control-Allow-Headers":"X-Requested-With", 
				"apikey":"2a4469adb23039b30b55b5970e34f5ac"
			}
	    })
	};
	owner.onError = function(errcode){
		// 关闭等待框
	    // plus.nativeUI.closeWaiting();
	    switch(errcode){
	    case 'FAILED_NETWORK':
	        mui.toast('网络不佳');
	        break;
	    case "{'statusCode':301}":
	    	mui.toast('需要登录');
	        //wv_login.show();
	        break;
	    default:
	        console.log(errcode);
	    }
	};
	//ajax登录超时多次忽略
	var showLoginViewPress = 0;
	owner.showLoginView = function(data) {
		showLoginViewPress ++;
		if (showLoginViewPress > 1) {
			return;
		} else {
			mui.confirm('会话超时！', '提示', '', function(){
				/*var myPage = plus.webview.getWebviewById("my.html");
				mui.fire(myPage, "updateLoginStatus", {});
				plus.webview.show("login.html");*/
				//constants.toLoginPage();
				
			});
			
//			// 关闭除登录页面外所有页面
//			var wvs = plus.webview.all();
//			var fristWv = plus.webview.getLaunchWebview();
//			for (var i = 0; i < wvs.length; i++) {
//				if (wvs[i].getURL() == fristWv.getURL()) {
//					mui.alert('会话超时，请重新登录！');
//					continue;
//				}
//				// 判断跳转页面，如果有锁，跳到锁的页面
//				if(i == wvs.length - 1){
//					mui.fire(fristWv, "toLoginLockerPage");
//				}
//				wvs[i].close("none");
//			}
//			plus.nativeUI.closeWaiting();
		}
		setTimeout(function() {
			showLoginViewPress = 0;
		}, 5000);
	};
	/**
	 * false - session超时，true - 登录成功
	 * @param {Object} data
	 */
	owner.checkLoginStatus = function(data){
		if(data == "{'statusCode':301}"){
			return false;
		}
		return true;
	};
	
//	owner.autoLogin = function(data){
//		var settings = constants.getSettings();
//		var serverPath = constants.getServerPath();
//		var wait = plus.nativeUI.showWaiting('登录中...');
//		
//		var params = {
//			username: settings.account,
//			password: settings.password,
//			plusOsName: plus.os.name,
//			plusOsVersion: plus.os.version,
//			plusOsVendor: plus.os.vendor,
//			deviceUuid: plus.device.uuid
//		};
//		// mui.alert("top-mobile-util.js autoLogin");
//		topUtil.web_query('/login/loginMobile',params,
//			function (data){
//				if (typeof data == "string") {
//	                data = JSON.parse(data);
//	            }
//				//服务器返回响应，根据响应结果，分析是否登录成功；
//				if (data.success) {
//					mui.openWindow({
//					    url: 'pages/main/main.html', 
//					    id : 'main.html',
//					    show:{
//					      autoShow:true,// 加载完毕显示页面
//					      aniShow:"slide-in-right",
//					      duration:'250'
//					    },
//					     waiting:{
//					      autoShow:false,//自动显示等待框，默认为true
//					      title:'正在加载...'//等待对话框上显示的提示内容
//				        },
//				         extras:{
//				        	origin:1 	
//				        }
//			  		});
//				} else {
//					mui.toast(data.msg);
//				}
//			}
//		)
//	};
	
	owner.IsPicture = function(data){
		 //判断是否是图片 - strFilter必须是小写列举
        var strFilter=".jpeg|.gif|.jpg|.png|.bmp|.pic|"
        if(data.indexOf(".")>-1)
        {
            var p = data.lastIndexOf(".");
            //alert(p);
            //alert(this.length);
            var strPostfix=data.substring(p,data.length) + '|';        
            strPostfix = strPostfix.toLowerCase();
            //alert(strPostfix);
            if(strFilter.indexOf(strPostfix)>-1)
            {
                //alert("True");
                return true;
            }
        }        
        //alert('False');
        return false;       
	};

}(mui,window.topUtil = {}));

