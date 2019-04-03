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
			.persionCol {
				height: 180px;
				background-color: #584f60;
				position: relative;
				padding-top: 30px;
			}
			
			.imgCol {
				margin: 0px auto 20px;
			}
			
			.persionInfo {
				color: #fff;
				text-align: center;
			}
			.mui-input-row {
				height:60px;
				padding:10px 0;
			}
			.mui-input-row:after{
				position: absolute;
			    right: 0;
			    bottom: 0;
			    left: 15px;
			    height: 1px;
			    content: '';
			    -webkit-transform: scaleY(.5);
			    transform: scaleY(.5);
			    background-color: #c8c7cc;
			}
			.mui-input-row label {
				width: 31%;
				font-size:16px;
			}
			.mui-input-row label~input,
			.mui-input-row label~select{
				width: 69%;
				font-size:16px;
				text-align: right;
			}
			.mui-input-row label~select{
				direction: rtl;
				padding-right:15px;
			}
			.displayNone{
				display: none;
			}
			input{
				white-space:normal;
				color: #999;
			}
		</style>
</head>
<body>
<header class="mui-bar mui-bar-nav">
			<div class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left " onclick="back(),plus.nativeUI.closeWaiting();"></div>
			<h1 class="mui-title"></h1>
			<a class="mui-icon mui-icon-chat mui-pull-right" id="toMessage"></a>
		</header>
		<div class="mui-content">
			<div class="persionCol">
				<div class="imgCol">
					<img class="headImg" src="${staticURL}/images/front/user1.png" alt="" />
				</div>
				<div class="persionInfo">
					<span></span>
				</div>
				
			</div>
			<div id="activity-list">
			<div class="mui-input-row">
					<label>昵称</label>
					<input id='realName' type="text" maxlength="18">
				</div>
				<div class="mui-input-row">
					<label>性别</label>
					<input id='sex' type="text" maxlength="18">
				</div>
				<div class="mui-input-row">
					<label>手机号码</label>
					<input id='mobile' type="text" maxlength="18">
				</div>
				
				<div class="mui-input-row">
					<label>邮箱</label>
					<input id='email' type="email">
				</div>
				
				<div class="mui-input-row">
					<label>个性签名</label>
					<input id='experience' type="text">
				</div>
			<%-- <script id='msg-template' type="text/template">
				<% var item = message; %>
				<div class="mui-input-row">
					<label>昵称</label>
					<input id='realName' type="text" maxlength="18" value="<%=(item.name)%>">
				</div>
				<div class="mui-input-row">
					<label>性别</label>
					<input id='mobile' type="text" maxlength="18" value="<%if(item.sex == 0) {%>男<%}else {%>女<%}%>">
				</div>
				<div class="mui-input-row">
					<label>手机号码</label>
					<input id='mobile' type="text" maxlength="18" value="<%=(item.mobile)%>">
				</div>
				
				<div class="mui-input-row">
					<label>邮箱</label>
					<input id='email' type="email" value="<%=(item.email)%>">
				</div>
				
				<div class="mui-input-row">
					<label>个性签名</label>
					<input id='experience' type="text" value="<%=(item.experience)%>">
				</div>
			</script> --%>
			</div>
		</div>
		
		<script>
			var uuid = '${uuid}';
			mui.ready(function() {
				userInfo (uuid)
				
			});
			$("#toMessage").click(function(){
				var userId = $(this).attr('data-userId');
				var userName = $(this).attr('data-userName');
				mui.openWindow({
					url: '${dynamicURL}/mobile/chatmessage/toChat?userId='+userId + '&userName=' + userName, 
			    	id : 'im-chat.html',
					show:{
						autoShow:true,//页面loaded事件发生后自动显示，默认为true
						aniShow:"slide-in-right",
						duration:'250'
					},
					waiting:{
						autoShow:false,//自动显示等待框，默认为true
					}
				});
			});
			function userInfo (uuid) {
				topUtil.web_query('/mobile/venue/user/userInfo',{uuid:uuid},function (data) {
					if (typeof data == "string") {
		                data = JSON.parse(data);
		            }
					if (data.success) {
						$('.mui-title').append(data.obj.name);
						$('.headImg').attr('src',data.obj.imgUrl);
						$('#realName').attr('value',ifNull(data.obj.name));
						var sex = '';
						if (data.obj.sex == 0) {
							sex = '男';
						} else if (data.obj.sex == 1) {
							sex ='女';
						}
						if(constants.getSettings().uuid==uuid){
							$("#toMessage").attr('class','diaplayNone');
						}
						$('#sex').attr('value',ifNull(sex));
						$('#mobile').attr('value',ifNull(data.obj.mobile));
						$('#email').attr('value',ifNull(data.obj.email));
						$('#experience').attr('value',ifNull(data.obj.experience));
						$("input").attr('readOnly','true');
						$("#toMessage").attr('data-userId',data.obj.id);
						$("#toMessage").attr('data-userName',data.obj.name);
						
						//document.getElementById("activity-list").innerHTML = template('msg-template', {"message": data.obj});
					}
				});
			}
			function ifNull(object){
				if(object!=null){
					return object;
				}else{
					return '暂无';
				}	
			}
		</script>
</body>
</html>