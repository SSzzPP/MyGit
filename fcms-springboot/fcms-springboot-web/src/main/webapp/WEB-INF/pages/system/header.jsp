<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="/tld/security.tld" %>

<link rel="stylesheet" href="${staticURL}/style_v2/css/sms-index2-2.css?v=16"/>

<style>

	.headtop{
        height:50px;
        line-height:50px;
        font-size:20px;
        font-weight:bold;
        color:#666;
        letter-spacing:2px;
        text-align:center;
        border-top-left-radius:10px;
        border-top-right-radius:10px;
        margin-bottom:20px;
/*         background: -webkit-gradient(linear,center top,center bottom,from(#fafafa), to(#ebebeb)); */
    }
    .clearfix {
		display:inline-block;
		display:block;
	}
	
	.webim_fold,.webim_fold .fold_bg,.webim_fold .fold_cont {
	    border:1px #d9d9d9 solid;
		margin:0;
		padding:0;
		width:270px;
		height:40px;
	}
	.webim_fold {
		position:absolute;
		box-shadow:-3px -2px 8px -1px rgba(0,0,0,0.2);
		cursor:pointer;
	}
	.webim_fold .fold_bg {
		background:#f0f1f4;
		filter:alpha(opacity=95);
		opacity:0.95;
		border-radius:2px 0px 0px 2px;
	}
	.webim_fold .fold_cont {
		position:absolute;
		top:0;
		left:0;
	}
	.webim_fold .webim_fold .fold_font {
		line-height:40px;
		color:#333;
	}
	.webim_fold .W_new_count {
		max-width:35px;
		min-width:0;
		height:17px;
		padding:0 8px;
		margin:12px 12px 0;
		line-height:18px;
	}
	.webim_fold_v2,.webim_fold_v2 .fold_bg,.webim_fold_v2 .fold_cont {
		width:288px;
		height:40px;
	}
	.webim_fold_v2 .wchat_btn {
		width:38px;
		height:34px;
		line-height:34px;
		background:#1798C5;
		border-radius:2px;
		margin:2px;
		text-align:center;
		cursor:pointer;
	}
	.webim_fold_v2 .wchat_icon {
		display:inline-block;
		width:22px;
		height:22px;
		margin-top:8px;
		background:url("${staticURL}/img/webchat_icon.png?id=016182606102")  0 -30px no-repeat;
	}
	.webim_fold_v2 .wchat_btn:hover {
		background:#4EB4D7;
	}
	.fold_bg,.webim_fold .fold_cont {
		width:270px;
		height:40px;
	}
	.webim_fold {
		position:absolute;
		box-shadow:-3px -2px 8px -1px rgba(0,0,0,0.2);
		cursor:pointer;
	}
	.webim_fold .fold_bg {
		background:#f0f1f4;
		filter:alpha(opacity=95);
		opacity:0.95;
	}
	.webim_fold .fold_cont {
		position:absolute;
		top:0;
		left:0;
	}
	.webim_fold .fold_icon {
		width:18px;
		height:16px;
		margin:11px 16px 0 20px;
		background:url("${staticURL}/img/webim_icon_bule.png?id=1423554605595")  0 -20px no-repeat;
	}
	.webim_fold .fold_font {
		line-height:40px;
		color:#333;
	}
	.webim_fold .W_new_count {
		max-width:35px;
		min-width:0;
		height:17px;
		padding:0 8px;
		margin:12px 12px 0;
		line-height:18px;
	}
	.webim_fold_v2,.webim_fold_v2 .fold_bg,.webim_fold_v2 .fold_cont {
		width:288px;
		height:40px;
	}
	.webim_fold_v2 .wchat_icon {
		display:inline-block;
		width:22px;
		height:22px;
		margin-top:8px;
		background:url("${staticURL}/img/webchat_icon.png")  0 -30px no-repeat;
	}
	.W_fl {
		float:left;
		_display:inline
	}
	.fold_bg{
		opacity:1!important;
	}
	.fold_cont {
		width:288px;
		height:40px;
	}
	.fold_cont {
		position:absolute;
		top:0;
		left:0;
	}
	.fold_icon {
		background-position:0 0;
		_ background-position:0 -1px;
	}
	.fold_font {
		line-height:40px;
		color:#333;
		font:12px/1.3 'Arial','Microsoft YaHei';
	}
	.fold_font {
		color:#fff;
	}
	.W_f14 {
		color:#fff;
	}
	.W_f14 {
		font-size:14px
	}
	.wchat_btn {
		display:inline-block;
		width:30px;
		height:30px;
		line-height:30px;
		text-align:center;
		cursor:pointer;
		background:rgb(255,129,64);
		border-radius:2px;
		margin-right:10px;
		vertical-align:top;
	}
	.W_fr {
		max-width:70%;
		text-align:right;
	}
	.W_fr {
		float:right;
		_display:inline
	}
	.W_fr .W_btn_a,.WB_tab_b .opt_bar .W_fr .W_btn_b {
		margin-right:0;
	}
	.W_fr {
		height:26px;
		line-height:26px;
	}
	.W_fr .btn_link {
		padding-left:5px;
	}
	.wchat_icon {
		display:inline-block;
		width:22px;
		height:22px;
		margin-top:6px;
		background:url("${staticURL}/img/webchat_icon.png")  0px -30px no-repeat;
	}
	#right-message-content .task-list .task-title{
		margin-bottom:0;
		list-style:none;
		line-height: 30px;
		height:30px;
		font:0.8em/1.3 'Arial','Microsoft YaHei';
		width: 215px;
		text-overflow:ellipsis;  
		white-space: nowrap;
		overflow: hidden;
		float: left;
	}
	#right-message-content .task-new{
		width: 40px;
		float:right;
	}
	#right-message-content .task-title:hover{
		color:#0a8;
	}
	#listTabMenu .tab-nav li a{
		border: solid 1px #1798c5;
		border-top-color: #1798c5;
	    border-top-style: solid;
	    border-top-width: 1px;
	    border-right-color: #1798c5;
	    border-right-style: solid;
	    border-right-width: 1px;
	    border-bottom-color: initial;
	    border-bottom-style: initial;
	    border-bottom-width: 0px;
	    border-left-color: #1798c5;
	    border-left-style: solid;
	    border-left-width: 1px;
	    border-image-source: initial;
	    border-image-slice: initial;
	    border-image-width: initial;
	    border-image-outset: initial;
	    border-image-repeat: initial;
	}
	
	.xs4 a:HOVER {
		color: black;
	}
</style>
<div id="right-message" class="webim_fold webim_fold_v2 clearfix" style="z-index:999999999;bottom:0px;right:0;position:fixed; visibility: visible;" node-type="chatMiniRoot" action-type="chatmini" action-data="from=chatmini" data-target="chatRoot">
	<div id="right-message-title">
		<div class="fold_bg"></div>
		<p class="fold_cont clearfix">
			<span class="fold_icon W_fl"></span>
			<em class="fold_font W_fl W_f14">你有<span id="total">0</span>条待办任务</em>
			<span class="wchat_btn W_fr">
				<em class="wchat_icon"></em>
			</span>
		</p>
	</div>
	<div id="right-message-header">
		<div class="fold_bg" style="background-color: white;opacity:1;border-left:1px #d9d9d9 solid;">
			<span class="fold_icon W_fl"></span>
			<p style="padding:0 10px;font:14px/1.3 'Arial','Microsoft YaHei';font-weight: bold;line-height: 38px;">
				<a href="javascript:void(0)">待办任务</a>
			</p>
		</div>
	</div>
	<div id="right-message-content" style="width:288px;height: 200px;background: #F2F2F5;position: ;border-left:1px #d9d9d9 solid;border-bottom:1px #d9d9d9 solid;border-right:1px #d9d9d9 solid;">
		<div style="height: 85%;padding:10px 0 0 10px;overflow-y:scroll;">
			<div class="task-list">
				
			</div>
		</div>
		<div id="right-message-more" style="position: relative;height: 15%;font:1em/1.3 'Arial','Microsoft YaHei';font-weight: bold;line-height: 30px;text-align: center;border-top:1px #d9d9d9 solid;">
			<a href="${dynamicURL}/front/main/task">查看更多任务</a>
		</div>
	</div>
</div>

<div class="header-bgc" style="width: 100%;">
	<div class="container">
		<div class="line" style="padding:40px 50px 40px 30px;">
			<div class="xs4">
				<a href="/sms/front/noLogin/toMain">
					<img class="logo" src="${staticURL}/style_v2/images/main/front-main-logo.png">
					<span class="headline"><span style="font-weight: bold;color: red;">SMS</span>安全管理系统</span>
				</a>
			</div>
			<div class="text-right" style="line-height: 49px;padding-top:5px;float: right;">
				<ul class="nav nav-inline nav-navicon padding-small-top">
					<li>
						<a href="#" class="card-col button border-blue">
							App下载
							<div class="mobile-card">
								<%-- <img class="arrtop" src="${staticURL}/style_v2/images/main/arrtop.png" alt=""/> --%>
								<div class="ios-card">
									<img src="${staticURL}/style_v2/images/app/iosCode.png" alt=""/>
									<span>iphone手机官方app下载</span>
								</div>
								<div class="android-card">
									<img src="${staticURL}/style_v2/images/app/androidCode.png" alt=""/>
									<span>android手机官方app下载</span>
								</div>
							</div>
						</a>
					</li>
					
					<c:if test="${ empty _user_id }">
						<li>
							<a href="#" id='rightLoginBtn' class="button bg-blue" onclick="openLogin();return false;" data-toggle="modal" target='_self' data-target="#modal">
								登录
							</a>
						</li> 
						<li>
							<a href="${dynamicURL}/register" class="button border-blue">注册</a>
						</li>
					</c:if>
					<c:if test="${not empty _user_id }">
						<li title="点击查看个人中心">
							<a href="${dynamicURL}/front/user/setting/toSettingIndex" target="_blank" class="button bg-blue">你好，${_user_nick_name}</a>
<!-- 							<span id="totalTop" class="badge bg-red" style="position: absolute;top:-10px;right: -10px;">0</span> -->
						</li>
					</c:if>
					<c:if test="${not empty _user_resources && not empty _user_id}">
						<li>
							<a href="${dynamicURL}/admin/main" class="button border-blue">后台管理</a>
						</li>
					</c:if>
					<c:if test="${not empty _user_id }">
						<li>
							<a href="#" onclick="LogOut();" class="button border-blue">退出</a>
						</li>
					</c:if>
					
				</ul>
			</div>
			<%-- <div class="xs4 text-right padding-right" style="line-height: 49px;padding-top:5px">
				<a class="card-col" href="">
					<img class="mobile" src="${staticURL}/style_v2/images/main/icon_3_hover.png"/>
					<div class="mobile-card">
						<img class="arrtop" src="${staticURL}/style_v2/images/main/arrtop.png" alt=""/>
						<div class="ios-card">
							<img src="${staticURL}/style_v2/images/app/iosCode.png" alt=""/>
							<span>iphone手机官方app下载</span>
						</div>
						<div class="android-card">
							<img src="${staticURL}/style_v2/images/app/androidCode.png" alt=""/>
							<span>android手机官方app下载</span>
						</div>
					</div>
				</a>
				<c:if test="${ empty _user_id }">
					<a href="#" class="setcolor" id='rightLoginBtn' onclick="openLogin();return false;" data-toggle="modal" target='_self' data-target="#modal">
						<span class="text-little text-gray">|&nbsp;</span>
						<span>登录</span>
					</a> 
					<span class="text-little text-gray">|</span>
					<a href="${dynamicURL}/register" class="setcolor">注册</a>
				</c:if>
				<c:if test="${not empty _user_id }">
					<a href="#" class="setcolor">
						<span class="text-little text-gray">|&nbsp;</span>
						<span>${_user_nick_name}</span>
					</a> 
					<span class="text-little text-gray">|</span>
					<a href="${dynamicURL}/front/user/setting/toSettingIndex" target="_blank" class="setcolor">个人中心</a>
				</c:if>
				<c:if test="${not empty _user_resources && not empty _user_id}">
					<span class="text-little text-gray">|</span>
					<a href="${dynamicURL}/admin/main" class="setcolor">后台管理</a> 
				</c:if>
				<c:if test="${not empty _user_id }">
					<span class="text-little text-gray">|</span>
					<a href="#" class="setcolor" onclick="LogOut();">退出</a>
				</c:if>
			</div> --%>
		</div>
	</div>
</div>
<div class="nav-bgc" style="width: 100%;">
	<div class="container">
		<div class="navbar">
			<ul id="menu" class="menu_main">
			</ul>
		</div>
	</div>
</div>

<!-- 登陆弹窗 -->
<div class="modal" id="login-modal" style="width:400px" onkeydown="keyLogin();">
	<h1>登录</h1>
	<div class="headtop">SMS安全管理平台</div>
	<div id='errorMsg' style="color:red;text-align: center;margin-bottom:10px;font-size:15px;"></div>
	<form class="login-form clearfix" method="post" autocomplete="off">
		<input id="username" type="text" placeholder="身份证号/证件号" autocomplete="off">
		<input id="password" type="password" placeholder="密码" autocomplete="new-password">
		<input id="pictureCord" type="text" placeholder="验证码" autocomplete="off" style="width: 190px;margin-bottom: -9px;">
		<img alt="" id="imgObj" onclick="changeImg();" 
			src="${dynamicURL}/login/sendPictureCode" title="点击图片刷新验证码" />
		<input id="loginBtn" type="button"  class="button-blue login" value="登录" style="margin-top:30px;height: 40px;"">
		<div class="clearfix"></div>
		<a class="forgot" href="${dynamicURL}/forget">忘记密码？</a>
	</form>
</div>

<script type="text/javascript">

var currPageLastRequest;
var taskInter;
var rightMsgPop = true;
$(function () {
	
// 	alert('${dynamicURL}');
	
	if('${_user_id}' == ''){
		$('#right-message').hide();
	}
	/* 登录弹窗 */
	if('${errorCode}' == 10000){
		$("#login-modal").modal({show:!0});
 	}else{
 		$("#login-modal").modal('hide');
 	}
	/* 登录提交 */
	$('#loginBtn').click(function(){
		$.ajax({
	    	type: "POST",
	    	data:{
	    		"username":$('#username').val(),
	    		"password":md5($('#password').val()).toUpperCase(),
	    		"pictureCord":$("#pictureCord").val()
	    	},
	    	dataType: "json",
	    	url: "${dynamicURL}/login/loginUser",
	    	success: function (data) {
				if(data.success){
					levelHeader = checkPassWordHeader();
					if(levelHeader < 2){
						layer.alert("密码过于简单，升级密码！",{closeBtn:0,icon:2},function(){
							window.location.href = "${dynamicURL}/forget/toUpgradePage";
						});
			    	}else{
			    		if(data.accessFlag){
							window.location.href = '${dynamicURL}${prePath}';
						}else{
							window.location.href = '${dynamicURL}/front/main';
						}
			    	}
				}else{
					$('#errorMsg').show();
					$('#errorMsg').html(data.errorMsg);
					changeImg();

// 					if(data.pwdFlag){// 密码过于简单，升级密码
// 						layer.alert(data.errorMsg,{closeBtn:0,icon:2},function(){
// 							window.location.href = "${dynamicURL}/forget/toUpgradePage";
// 						});
// 					}
				}
			}
		});
	});
	
	window.onfocus = function () {
		if(!currPageLastRequest || (Date.parse(new Date()) - currPageLastRequest) >= 5000){
			loadTasks(1);
			currPageLastRequest = Date.parse(new Date());
		}
    }
	
	$("#right-message-title .fold_cont.clearfix").click(function(){
		rightMsgPop = true;
		$("#right-message-title").hide();
		$("#right-message").animate({ 
			bottom:"200"
		  }, 1000 );
	});
	
	$("#right-message-header").click(function(){
		rightMsgPop = false;
		$("#right-message").animate({ 
			bottom:"0"
		  }, 1000 ,function(){
			  $("#right-message-title").show();
		});
	});

	if(window.location.pathname.indexOf("/front/main")>0){
	 	$.cookie("oneMenuId",null,{ path:'/sms' }); 
	 	$.cookie('twoMenuId',null,{ path:'/sms' }); 
	}
	
	$.ajax({
		type: "POST",
		url: "${dynamicURL}/front/noLogin/menu/one",
		async: false,
		dataType:"json",
		success: function (data) {
			var strHtml = "";
			var str = "";//一级菜单div集合
			var oneMenuId=$.cookie("oneMenuId");
			var twoMenuId=$.cookie("twoMenuId");
			$.each(data, function (i, item) {
				if(item.url != ""){
					str += "<li  class=\"first-menu\" data-num="+i+" onclick=\"setMenuToCookie("+item.id+",0,'"+item.url+"')\">";
					str += "	<a href=\"#\" onmouseover=\"openMenu(" + item.id + ")\">";
// 					str += "		<img src=\"${staticURL}/style_v2/images/main/"+item.description+"\"/>";
					str += "		<span>"+item.name+"</span>";
					str += "	</a>";
					str += "	<ul class=\"sub-menu\" id=\"sub_menu_"+item.id+"\">";
					str += "	</ul>";
					str += "</li>";
// 							str += "<li style='cursor:pointer' class='active' onclick=\"openMenu("+item.id+")\" onmouseout='' onclick=setMenuToCookie("+item.id+",0,'"+item.url+"');><img src='${staticURL}/style_v2/images/"+item.description+"'/><a href='#' id=\"first_"+i+"\" >"+item.name+"</a></li>";
				} else {
					str += "<li class=\"first-menu\" data-num="+i+">";
					str += "	<a href=\"javascript:void(0)\" onmouseover=\"openMenu(" + item.id + ")\">";
// 					str += "		<img src=\"${staticURL}/style_v2/images/main/safe-policy-white.png\"/>";
					str += "		<span>"+item.name+"</span>";
					str += "	</a>";
					str += "	<ul class=\"sub-menu\" id=\"sub_menu_"+item.id+"\">";
					str += "	</ul>";
					str += "</li>";
// 							str += "<li onmouseover=\"openMenu(" + item.id + ")\" class='active' ><img src='${staticURL}/style_v2/images/"+item.description+"'/><a  href='#' id=\"first_"+i+"\" >"+item.name+"</a></li>";
				}
			});
			$("#menu").html(str);//一级菜单加载
			if(twoMenuId>0){
				openMenu(oneMenuId);
			}
		}
	});
	
	//loadTasks();
});

//验证密码强度
var levelHeader = 0;// 01弱2中3强
//校验密码强度
function checkPassWordHeader(){
	var value = $('#password').val();
	// 0： 表示第一个级别 1：表示第二个级别 2：表示第三个级别
	// 3： 表示第四个级别 4：表示第五个级别
	var modes = 0;
	if(value.length < 8){//最初级别
		return modes;
	}
	if(/\d/.test(value)){//如果用户输入的密码 包含了数字
		modes++;
	}
	if(/[a-zA-Z]/.test(value)){//如果用户输入的密码 包含了小写的a到z
		modes++;
	}
//		if(/[A-Z]/.test(value)){//如果用户输入的密码 包含了大写的A到Z
//			modes++;
//		}
	if(/\W/.test(value)){//如果是非数字 字母 ---W下划线
		modes++;
	}
	switch(modes){
		case 1 :
			return 1;
			break;
		case 2 :
			return 2;
			break;
		case 3 :
			return 3;
			break;
		case 4 :
			return 4;
			break;
	}
}

var taskInter = window.setInterval(function(){
	//loadTasks();
},10000);

function loadTasks(canRequest){
// 	alert($.cookie('JSESSIONID'));
	if('${_user_id}' == ''){
		return;
	}
	var lastRequest = $.cookie('last_request');
	// (Date.parse(new Date()) - lastRequest) >= 10000 || 
// 	if(!lastRequest || canRequest){
		$.ajax({
			url:"${dynamicURL}/front/main/taskList?start=0&length=5",
			type:"POST",
			dataType:"JSON",
			success:function(response){
				$.cookie('last_request', Date.parse(new Date()), { expires: 7 });
				$.recordsTotal = $.recordsTotal || 0;
				var more=$("#message-more");
				//$("#top-message .task-count").html(0);
				if(response.data && response.data.length){
					var rightBuf=[];
					$.each(response.data,function(i,d){
						rightBuf.push("<div><div class='task-title' onclick='toDetail(\""+d.processInstanceKey+"\",\""+d.processInstanceId+"\",\""+d.taskId+"\")'>"+d.title+"</div><div class='task-new'><img src='${staticURL}/img/new.png'/></div></div>");
					});
					/* 右下角  */
					$("#right-message-content div.task-list").html(rightBuf.join(""));
				}
// 				$("#total").html((response.recordsTotal || 0));
				var count = response.recordsTotal > 99?"99+":response.recordsTotal;
				$("#total").html(count);
// 				$("#totalTop").html(count);
// 				$("#total2").html((response.recordsTotal || 0));
				$.recordsTotal=(response.recordsTotal || 0);
				
// 				if(response.recordsTotal > 0 &&　rightMsgPop){
// 					$("#right-message-title").hide();
// 					$("#right-message").animate({ 
// 						bottom:"200"
// 					  }, 1000 );
// 				}
			},
			complete:function(XMLHttpRequest, textStatus){
			   if(textStatus=='error'){
				   loadTasks();
				   window.clearInterval(taskInter);
			   }
			}
		});
// 	}
}

// 鼠标移动到一级菜单显示二级菜单
function openMenu(id) {
	var twoMenuId=$.cookie("twoMenuId");
	//ajax加载二级菜单
	$.post('${dynamicURL}/front/noLogin/menu/two',{parentId:id},function(data, status){
		var second = "";
		$.each(data, function (i, item) {
			if(item && item.url){
				second += "	<li>";
				second += "		<a id=\"second_"+i+"\" href=\"${dynamicURL}/"+item.url+"\" onclick=\"setMenuToCookie("+id+","+item.id+",'"+item.url+"')\">"+item.name+"</a>";
				second += "	</li>";
// 					second +="<li class='active'><a  href='${dynamicURL}/"+item.url+"\' id=\"second_"+i+"\" onclick='setMenuToCookie("+id+","+item.id+");'>"+item.name+"</a></li>";
			}else{
				if(item){
					second += "	<li>";
					second += "		<a id=\"second_"+i+"\" href=\"#\">"+item.name+"</a>";
					second += "	</li>";
				}
			}
		});
	    $("#sub_menu_"+id).html(second);//二级菜单加载
	},'json');
}

// 缓存二级菜单 && 页面跳转
function setMenuToCookie(oneMenuId,twoMenuId,url){
 	$.cookie("oneMenuId",null,{ path:'/sms' }); 
    $.cookie('twoMenuId',null,{ path:'/sms' }); 
    var date = new Date();
    date.setTime(date.getTime()+5*60*1000);
    if(oneMenuId && oneMenuId!=0){
    	$.cookie('oneMenuId', oneMenuId,{ expires:date,path:'/sms' });
    }
    if(twoMenuId && twoMenuId!=0){
    	$.cookie('twoMenuId', twoMenuId,{ expires:date,path:'/sms' });
    }
   
    // 页面跳转
    window.location.href = "${dynamicURL}/" + url;
}
function openLogin(){
	$("#login-modal").modal({show:!0});
	$("#imgObj").attr('src',"${dynamicURL}/login/sendPictureCode");
}

// 刷新验证码
function changeImg(){
    var imgSrc = $("#imgObj");
    var src = imgSrc.attr("src");
    
    imgSrc.attr("src",chgUrl(src));
}    
//时间戳    
//为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳    
function chgUrl(url){
    var timestamp = (new Date()).valueOf();
    urlurl = url.substring(0,35);
    if((url.indexOf("&")>=0)){
        urlurl = url + "×tamp=" + timestamp;
    }else{
        urlurl = url + "?timestamp=" + timestamp;
    }
    return urlurl;    
}

// 键盘回车确认
function keyLogin(){
	if (event.keyCode==13) {
		//回车键的键值为13 
		document.getElementById("loginBtn").click(); //调用登录按钮的登录事件
	}
}

function toDetail(processInstanceKey,processInstanceId,taskId){
	window.open("${dynamicURL}/front/main/taskDetail?processInstanceKey="+processInstanceKey+"&processInstanceId="+processInstanceId+"&taskId="+taskId);
}
//菜单高亮事件 
function menuHighlight(){
    $("#menu li").hover(function(){
        $("#menu li").removeClass("active");
        $(this).addClass("active");
//         $("#menu-box ul").css("display","none");
        $("#menu-box ul").eq($(this).index()).css("display","block");
    },function(){
    })
}

function LogOut() {
	layer.confirm('确实退出登录吗?', {
		  btn: ['是','否'] //按钮
		}, function(){
		  $.ajax({
                type: "POST", //提交数据的类型 分为POST和GET
                async: false,
                url: "${dynamicURL}/login/logout",  //提交url 注意url必须小写
                data: {},
                success: function (data) {
                 	$.cookie("oneMenuId",null,{ path:'/sms' }); 
                    $.cookie('twoMenuId',null,{ path:'/sms' }); 
                    window.location.href = '${dynamicURL}/front/noLogin/toMain';
                }
            });
		}, function(){}
	);
}

//-->
// 三级菜单
function searchThreeMenu(){
	$.ajax({
		url : "${dynamicURL}/front/main/searchThreeMenu",
		data : {
			menuTwoId : menuTwoId,
			menuThreeId : menuThreeId
		},
		dataType : "json",
		success : function(response) {
			var threeMenu = '';
			$.each(response.thirdMenuEntities, function(index,item){
				if(item.menuActive == 1){
					threeMenu += '	<li><a href="${dynamicURL}/'+item.url+'" class="active">'+item.name+'</a></li>';
				}else{
					threeMenu += '	<li><a href="${dynamicURL}/'+item.url+'">'+item.name+'</a></li>';
				}
			});
			$('.tab-nav').html(threeMenu);
		}
	});
}
var delayTime = 100;
//查询三级菜单 - 菜单后面带红字
function searchThreeMenuWithRedNum(){
	$.ajax({
		url : "${dynamicURL}/front/main/searchThreeMenu",
		data : {
			menuTwoId : menuTwoId,
			menuThreeId : menuThreeId
		},
		dataType : "json",
		success : function(response) {
			var threeMenu = '';
			$.each(response.thirdMenuEntities, function(index,item){
				if(item.menuActive == 1){
					threeMenu += '	<li><a href="${dynamicURL}/'+item.url+'" class="active">'+item.name+'<span class="badge bg-main" id="'+item.name+'"></span></a></li>';
				}else{
					threeMenu += '	<li><a href="${dynamicURL}/'+item.url+'">'+item.name+'<span class="badge bg-dot" id="'+item.name+'"></span></a></li>';
				}
			});
			$('.tab-nav').html(threeMenu);
		}
	});
}
</script>