<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<style>
			 
			.title{
				margin: 20px 15px 10px;
				color: #6d6d72;
				font-size: 15px;
			}
			.mui-input-group .mui-input-row{
				height: 50px;
				margin-top: 10px;
			}
			
			.mui-input-group:before{
				background-color: white;
			}
			
			.mui-input-row label{
				width: 30%;
			}
			.mui-input-group label~input{
				/*border: solid 1px #E0E0E0;*/
				border-radius: 3px;
				width: 65%;
				padding-left:12px;
				margin-right: 10px;
			}
			.mui-btn {
				font-size: 16px;
				padding: 8px;
				margin: 3px;
			}
			h5.mui-content-padded {
				margin-left: 3px;
				margin-top: 20px !important;
			}
			h5.mui-content-padded:first-child {
				margin-top: 12px !important;
			}
			.ui-alert {
				text-align: center;
				padding: 20px 10px;
				font-size: 16px;
			}
			#register {
			    border: 0px;
			    background: -webkit-linear-gradient(#0099FF, #4baef0);
			    background: linear-gradient(#0099FF, #4baef0);
			    /* background-color: #0099FF; */
			    height: 45px;
			    opacity: 0.2;
			}
		</style>
<title>注册</title>
</head>
<body style="background-color: white;">
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">注册</h1>
		</header>
		 
		<div class="mui-content" style="background-color: #FFFFFF;">
				<!--<div id="top" style="margin:30px auto; width: 250px;height: 50px;">
					<img src="../../images/front/logo1.png" style="width:auto; height:auto; max-width:100%; max-height:100%;"/>
				</div>-->
				<form id='forgetpassword-form' action="#" class="mui-input-group">
					<div id="step1">
						<div class="mui-input-row">
							<!--<label>手机号</label>-->
							<input id='mobileCode' type="text" class="mui-input-clear mui-input" placeholder="输入手机号（中国大陆）"maxlength="18">
						</div>
						<div class="mui-input-row">
							<!--<label>验证码</label>-->
							<input id='msgCode' style="width:60%;float: left;" type="text" class="mui-input" placeholder="输入验证码" maxlength="18">
							<img id="verifyCodeImg" src="" style="margin-right: 10px;float:right;background-size:100px 40px;" width="100px" height="40px"/>
						</div>
						<div class="mui-input-row">
							<!--<label>密码</label>-->
							<input id='passwordCode' type="password" class="mui-input-clear mui-input" placeholder="输入密码（不少于6位）"maxlength="18">
						</div>
				</form>
				<div class="mui-content-padded">
					<button id='register' disabled="disabled" class="mui-btn mui-btn-block mui-btn-primary" onclick="return false">注册</button>
				</div>
		</div>
<script type="text/javascript">
		var interValObj; //timer变量，控制时间
		var count = 60; //间隔函数，1秒执行
		var curCount;//当前剩余秒数
		
		mui.init({
			swipeBack:true //启用右滑关闭功能
		});  
		mui.ready(function(){
		    loadVerifyCode()
		}); 
		var verifyCodeImgId;
		/**
		 * 图片验证码
		 */
		function loadVerifyCode(){
			//var serverPath = window.constants.getServerPath();
			verifyCodeImgId = rndNum(8);
			$("#verifyCodeImg").attr('src',dynamicURL+'h5plus/login/code.png?t='+new Date().getTime()+'&verifyCodeImgId='+verifyCodeImgId); 
		}
		
		/**
		 * 刷新验证码
		 */
		document.getElementById('verifyCodeImg').addEventListener('tap',function () {
			loadVerifyCode();
		},false)
		 
		function rndNum(n) {
		    var rnd = "";
		    for (var i=0;i<n;i++)
		        rnd += Math.floor(Math.random()*10);
		    return rnd;
		}
		var registerBtn = document.getElementById('register');
		var passwordCode = document.getElementById('passwordCode');
		passwordCode.addEventListener("keyup", function(event) {
		    var length=passwordCode.value.length;
			if(length>0){
				registerBtn.style.opacity=1;
				registerBtn.disabled=false;
			}else{
				registerBtn.style.opacity=0.2;
				registerBtn.disabled=true;
			}
		});
		registerBtn.addEventListener('tap',_.debounce(function () {
			$(this).html('注册中···');
			$(this).attr("disabled",true);
			var mobileCode = document.getElementById('mobileCode').value;
			var msgCode = document.getElementById('msgCode').value;
			var passwordCode = document.getElementById('passwordCode').value;
			
			var param = {mobileCode:mobileCode,msgCode:msgCode.toUpperCase(),passwordCode:passwordCode,verifyCodeImgId:verifyCodeImgId};
			if(mobileCode.length != 11) {
				mui.toast("请输入正确手机号");
				$(this).html('注册');
    			$(this).attr("disabled",false);
			} else if (passwordCode.length < 6) {
				mui.toast("请输入至少6位数密码");
				$(this).html('注册');
    			$(this).attr("disabled",false);
			} else {
				topUtil.web_query("mobile/venue/user/saveRegister", param, function(data) {
		        	if (typeof data == "string") {
		                data = JSON.parse(data);
		            }
		        	if(data.success) {
		        		mui.confirm(data.msg, function() {
		        			var settings = constants.getSettings();
		        			settings.account = mobileCode;
		        			settings.password = passwordCode;
		        			constants.setSettingsExtend(settings);
		        			constants.toLoginPage();
		        		});
		        		
		        	}else {
		        		mui.toast(data.msg);
		        		$(this).html('注册');
		    			$(this).attr("disabled",false);
		        	}
				});
			}
		},waitTime,true));

</script>
</body>
</html>