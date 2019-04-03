<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>Insert title here</title>
<style>
			.area {
				margin: 20px auto 0px auto;
			}
			
			.mui-input-group {
				margin-top: 10px;
			}
			
			.mui-input-group:first-child {
				margin-top: 20px;
			}
			
			.mui-input-group label {
				width: 0%;
			}
			
			.mui-input-row label~input,
			.mui-input-row label~select,
			.mui-input-row label~textarea {
				width: 100%;
			}
			
			.mui-checkbox input[type=checkbox],
			.mui-radio input[type=radio] {
				top: 6px;
			}
			
			.mui-content-padded {
				margin:0px 0 20px;
				overflow: hidden;
			}
			
			.mui-btn {
				padding: 10px;
			}
			
			.link-area {
				display: block;
				margin-top: 25px;
				text-align: center;
			}
			
			.spliter {
				color: #bbb;
				padding: 0px 8px;
			}
			
			.oauth-area {
				position: absolute;
				bottom: 20px;
				left: 0px;
				text-align: center;
				width: 100%;
				padding: 0px;
				margin: 0px;
			}
			
			p {
				text-indent: 22px;
			}
			span.mui-icon {
				font-size: 14px;
				color: #007aff;
				margin-left: -15px;
				padding-right: 10px;
			}
			.mui-off-canvas-left,.mui-off-canvas-left ul {
				color: #fff;
				background-color: #343434;
			}
			.title {
				margin: 35px 15px 10px;
			}
			.title+.content {
				margin: 10px 15px 35px;
				color: #bbb;
				text-indent: 1em;
				font-size: 14px;
				line-height: 24px;
			}
			input {
				color: #2a2a2a;
			}
			
			input::-webkit-input-placeholder { 
				color:#ccc; 
			} 
			.mui-input-row label{
				font-size: 16px;
			}
			#top{
				margin:0px auto; 
				width: 250px;
				height: 100px;
				display: flex;
			}
			#top img{
				width:auto; 
				height:auto; 
				max-width:100%; 
				max-height:100%;
			}
			#top span{
				line-height:50px;
				margin-left:5px;
				font-weight:bold;
				font-size:20px;
				color:#0099FF;
			}
			.mylogin .mui-input-row{
				display: flex;
				/*border:1px solid #f7f7f7;*/
				box-shadow: 0 1px 0px #e6e6e6;
				margin-bottom:8px;
				background-color:#fff;
			}
			.bg-grave{
				height:100%;
				background-color: #fafafa;
			}
			.bg-white{
				height:100%;
				background-color: #fff;
			}
			#login{
				border:0px; 
				background: -webkit-linear-gradient(#0099FF, #4baef0);
				background: linear-gradient(#0099FF, #4baef0);
				/*background-color:#0099FF;*/
				height: 45px;
				opacity: 0.2;	
			}
			#login:enabled{
				box-shadow: 0 1px 4px #aaa;
			}
			.line{
				width:80%;
				margin:0 auto;
				border-top:1px solid #ddd;
			}
			.line-title{
				width:40%;
				line-height:24px;
				background-color: #fafafa;
				text-align: center;
				margin:-11px auto 0;
				color:#aaa;
			}
			.transparent{
				background-color: transparent;
				border-bottom:0;
			}
			.mui-input-row input{
				border:0;
			}
			.link-area{
				display: inline-block;
				color:#9a9a9a;
			}
			.mui-icon-closelogin:before
			{
			    content: '\e460';
			}
			.mui-icon-closelogin{
				font-size:40px!important;
				color:#2a2a2a;
			}
		</style>
</head>
<body class="bg-white">
		<header class="mui-bar mui-bar-nav transparent" style="box-shadow:none;">
			<h1 class="mui-title"></h1>
			<a id="closeLogin" class="mui-icon mui-icon-closelogin"></a> 
		</header>
		<div class="mui-content bg-white">
			<div id="main" style="margin-top:15%">
				<div id="top">
					<img src="${staticURL}/images/front/logo1.png"/ style="margin:0 auto;">
					<!--<span>全民共享健身平台</span>-->
				</div>
				<div style="height:160px;margin-top:30px;">
					<form id='login-form' class="mui-content-padded mylogin">
						<div class="mui-input-row">
							<!--<label>账号</label>-->
							<input id='account' type="text" class="mui-input-clear mui-input" placeholder="请输入账号" value="" maxlength="18">
						</div>
						<div class="mui-input-row">
							<!--<label>密码</label>-->
							<input id='password' type="password" class="mui-input-clear mui-input" placeholder="请输入密码" value="">
						</div>
					</form>	
				</div>
				<div class="mui-content-padded"><!--48CFA4-->
					<button id='login' disabled="disabled" class="mui-btn mui-btn-block mui-btn-primary">登录</button>
					<div class="mui-text-center">
						<div class="link-area" style="margin-left: 0px ;margin-top:8px">
							<a id='register' style="color: #9a9a9a;">用户注册</a>
						</div>
						<div class="link-area" style="margin:0 5px;">|</div>
						<div class="link-area" style="margin-right: 0px;margin-top:8px">
							<!--<a id='mobile-weixin'>打开微信</a> <span class="spliter">|</span>-->
							<a id='forgetPassword' style="color: #9a9a9a;">忘记密码</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="${staticURL}/js/login.js?v=1.1.4"></script>
		<script>
			
			(function($, doc) {
				$.init({
					statusBarBackground: '#f7f7f7'
				});
				$.ready(function() {
					var settings = constants.getSettings();
					//var serverPathBox = document.getElementById('serverPath');
					var accountBox = document.getElementById('account');
					var passwordBox = document.getElementById('password');
					var autoLoginButton = doc.getElementById("autoLogin");
					if(settings.account && true){// settings.autoLogin
						accountBox.value=settings.account;
						passwordBox.value=settings.password;
						
						// 自动登录
					/* 	var self = plus.webview.currentWebview();
						if(self.directLogin != 0){
							mobileLogin();
						} */
					}
					
				//	plus.screen.lockOrientation("portrait-primary");
					//更新本地版本号信息
				//	plus.runtime.getProperty(plus.runtime.appid,function(inf){
				//        currentVer=inf.version;
				//        window.constants.setAppVersion(currentVer);
				//        jQuery("#versionInfo").html(currentVer);
				//    });
					//检查 "登录状态/锁屏状态" 结束
					var loginButton = doc.getElementById('login');
					loginButton.addEventListener('tap', _.debounce(function(event) {
						mobileLogin();
					},waitTime,true));
					/* $.enterfocus('#login-form input', function() {
						$.trigger(loginButton, 'tap');
					}); */
					if(passwordBox.value.length>0){
						loginButton.disabled=false;
						loginButton.style.opacity=1;
					}
					var clearBtn = doc.getElementsByClassName("mui-icon-clear")[1];
					clearBtn.addEventListener("tap", function(event) {
					    loginButton.style.opacity=0.2;
					    loginButton.disabled=true;
					});
					passwordBox.addEventListener("keyup", function(event) {
					    var length=passwordBox.value.length;
						if(length>0){
							loginButton.style.opacity=1;
							loginButton.disabled=false;
						}else{
							loginButton.style.opacity=0.2;
							loginButton.disabled=true;
						}
					});
					//
					window.addEventListener('resize', function() {
					}, false);
				});
			}(mui, document));
			
			function mobileLogin(){
				$("#login").html("登录中...");
				$("#login").attr("disabled",true);
				var accountBox = document.getElementById('account');
				var passwordBox = document.getElementById('password');
				
				var loginInfo = {
					account: accountBox.value, 
					password: passwordBox.value
				}; 
				
				app.login(loginInfo, function(err) {
					if (err) {
						mui.toast(err);
						$("#login").html("登录");
						$("#login").attr("disabled",false);
						return;
					}
					// 监听登录状态
					constants.setLoginStatus(1);
					
					mui.openWindow({
			        	url:dynamicURL+"admin/main/toHome",
			        	id:"admin/main/toHome"
			        });
					
					
					// 更新我的页面信息
				/* 	var myPage = plus.webview.getWebviewById("my.html");
					mui.fire(myPage, "updateLoginStatus", {}); */
				});
			}
			
			// 返回上一页
			document.getElementById('closeLogin').addEventListener('tap', function() {
				mui.back();
			});
			
			//忘记密码
			document.getElementById('forgetPassword').addEventListener('tap', function() {
				mui.toast("我们正在努力开发中···");
				/* mui.openWindow({
					id:  'voluntaryReportDetail2.html',
				    url: 'pages/forgetPassword/forgetpassword.html', 
				    show:{
				      autoShow:true,// 加载完毕显示页面
				      aniShow:"slide-in-right"
				    },
				     waiting:{
				      autoShow:true,//自动显示等待框，默认为true
				      title:'页面跳转中...'//等待对话框上显示的提示内容
			      	},
			      	extras:  { 
				    }
		  		});	 */
			});
			
			// 注册
			document.getElementById('register').addEventListener('tap', function() {
				mui.openWindow({
					id:  dynamicURL+'toRegister',
				    url: 'toRegister', 
				    show:{
				      autoShow:true,// 加载完毕显示页面
				      aniShow:"slide-in-right"
				    },
				     waiting:{
				      autoShow:false,//自动显示等待框，默认为true
				      title:'页面跳转中...'//等待对话框上显示的提示内容
			      	}
		  		});	
			});
			
		</script>
</body>
</html>