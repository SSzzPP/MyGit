<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${staticURL}/plugins/popup/css/modal.css?v=2"/>
<style>
	.mobile-card{
		display: none;
		width:370px;
		height:160px;
		position: absolute;
		top:32px;
		left:-138px;
		z-index: 6666;
		background-color: #fff;
		border: 1px solid #ebebeb;
	}
	.card-col:hover .mobile-card{
		display: block;
	}
	.ios-card,.android-card{
		padding:15px 0;
		width:184px;
		height:130px;
		float: left;
		text-align: center;
	}
	.ios-card img,.android-card img{
		width:100px;
		height:100px;
		display: inline-block;
	}
	.ios-card span,.android-card span{
		line-height:30px;
		font-size:14px;
		color:#000;
		display: block;
	}
	.arrtop{
		position: absolute;
		top:-8px;
		left:180px;
		z-index: 9999;
	}
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
    .button-blue.login{
		height: 42px;
		line-height: 42px;
		margin-top: 20px;
		font-size: 18px;
		font-weight: 700;
    }
	span.fr.pr20{
	    float: right;
	}
	.table_edit tr{
 		height: 40px;
 	}
 	.table_edit tr td{
 		padding-left:15px;
 	}
</style>
<div class="line-big">
	<div style="padding-right: 10px;padding-left: 10px;">
		<span class="fl">欢迎访问本站!!</span>
	    <span class="fl ml10"><font class="fl">今天是：</font><span id="time" class="fl ml5"></span>
	     &nbsp; &nbsp; &nbsp; &nbsp;今日访问量：${_today_count}
	     &nbsp; &nbsp; &nbsp; &nbsp;总访问量：${_all_count}
	     &nbsp; &nbsp; &nbsp; &nbsp;总ipv量：${_allipv_count}
	    </span>
	    <span class="fr pr20"><a onclick="SetHome(window.location)" href="javascript:void(0)">设为首页</a> | <a onclick="AddFavorite(window.location,document.title)" href="javascript:void(0)">加入收藏</a></span>
    </div>
    <div class="xs8">
        <div class="logo-col">
            <img src="${staticURL}/images/logo_new.png" alt=""/>
            <span>市北区全民共享健身平台</span>
        </div>
    </div>
    <div class="text-right" style="line-height: 49px;padding-top:55px;padding-right: 20px;float: right;">
		<ul class="nav nav-inline nav-navicon padding-small-top">
			<%-- <li>
				<a href="#" class="card-col button border-blue">
					App下载
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
			</li> --%>
			
			<c:if test="${ empty _user_id }">
				<li>
					<a href="#" id='rightLoginBtn' class="button bg-blue" onclick="openLogin();return false;" data-toggle="modal" target='_self' data-target="#modal">
						登录
					</a>
				</li> 
				<li>
					<a href="${dynamicURL}/register" class="button border-blue" onclick="openRegister();return false;" data-toggle="modal" target='_self' data-target="#modal">注册</a>
				</li>
			</c:if>
			<c:if test="${not empty _user_id }">
				<li title="点击查看个人中心">
					<a <%-- href="${dynamicURL}/front/user/setting/toSettingIndex" --%> target="_blank" class="button bg-blue">你好，${_user_nick_name}</a>
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
</div>

<div class="navbar bg-myself bg-inverse">
    <div class="navbar-body nav-navicon">
        <ul id="menu" class="nav nav-inline nav-menu nav-big">
            <li><a href="javascript:void(0)" onclick="window.location.href='${dynamicURL}/front'">首页</a></li>
            <li><a href="javascript:void(0)" onclick="window.location.href='${dynamicURL}/front/venue'">场馆预约</a></li>
            <li><a href="javascript:void(0)" onclick="window.location.href='${dynamicURL}/front/information?moduleName=events'">赛事资讯</a></li>
            <li><a href="javascript:void(0)" onclick="window.location.href='${dynamicURL}/front/coach'">教练预约</a></li>
            <li><a href="javascript:void(0)" onclick="window.location.href='${dynamicURL}/front/information?type=1'">健身资讯</a></li>
            <li><a href="javascript:void(0)" onclick="checkLogin('front/userPoint')">健身积分</a></li>
            <li><a href="javascript:void(0)" onclick="checkLogin('front/sportCircle')">结伴运动</a></li>
            <li><a href="javascript:void(0)" onclick="window.location.href='${dynamicURL}/front/venueEquipment'">场地管理</a></li>
            <li><a href="javascript:void(0)" onclick="window.location.href='${dynamicURL}/front/coach'">教练管理</a></li>
            <%-- <li><a href="javascript:void(0)" onclick="window.location.href='${dynamicURL}/front/pubEquipment'">健身路径</a></li>
            <li><a href="javascript:void(0)" onclick="window.location.href='${dynamicURL}/front/userMap'">电子地图</a></li> --%>
        </ul>
    </div>
</div>

<!-- 登陆弹窗 -->
<div class="modal" id="login-modal" style="width:400px" onkeydown="keyLogin();">
	<h1>登录</h1>
	<div class="headtop">市北区全民共享健身平台</div>
	<div id='errorMsg' style="color:red;text-align: center;margin-bottom:10px;font-size:15px;"></div>
	<form class="login-form clearfix" method="post" autocomplete="off" style="text-align:center;">
		<input id="username" type="text" placeholder="登录名" autocomplete="off">
		<input id="password" type="password" placeholder="密码" autocomplete="new-password">
		<input id="pictureCord" type="text" placeholder="验证码" autocomplete="off" style="width: 190px;margin-bottom: -9px;">
		<img alt="" id="imgObj" onclick="changeImg();" style="height:35px;vertical-align:middle;width:98px;"
			src="${dynamicURL}/front/login/sendPictureCode" title="点击图片刷新验证码" />
		<input id="loginBtn" type="button"  class="button-blue login" value="登录" style="margin:30px auto 0;height: 40px;width:292px;float:none;">
		<div class="clearfix"></div>
		<a class="forgot" onclick="openRegister();return false;" style="margin-right:12px;color:#0a8;margin-top:5px;"><span style="color:#282828;">没有账号，</span>立即注册</a>
	</form>
</div>
<script src="${staticURL}/plugins/popup/js/modal.js"></script>
<script type="text/javascript" src="${staticURL }/js/jquery.jclock.js"></script>
<script>
	$(function () {
		layui.use('layer', function(){
		  var layer = layui.layer;
		});
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
		    		"password":$('#password').val(),
		    		"pictureCord":$("#pictureCord").val()
		    	},
		    	dataType: "json",
		    	url: "${dynamicURL}/front/login/venueLoginWithCheckcode",
		    	success: function (data) {
					if(data.success){
				 		if(data.sessionId) {
				 			layui.data('frontLoginUser', {
				 				  key: 'sessionId'
				 				  ,value: data.sessionId
				 			});
						}
						window.location.href = '${dynamicURL}/front';
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
		
		/* 注册提交表单*/
		$('#registerBtn').click(function(){
			var frm = $('#registerForm');
			
		});
		
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
	
	
	function openLogin(){
		$("#login-modal").modal({show:!0});
		$("#imgObj").attr('src',"${dynamicURL}/front/login/sendPictureCode");
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
	
	function LogOut() {
		layui.use(['layer'], function(){
	    	layer = layui.layer;
	    	layer.confirm('确定要退出登录吗?', {
				  btn: ['是','否'] //按钮
				}, function(){
				  $.ajax({
		                type: "POST", //提交数据的类型 分为POST和GET
		                async: false,
		                url: "${dynamicURL}/front/login/venueLogout",  //提交url 注意url必须小写
		                data: {},
		                success: function (data) {
		                    window.location.href = '${dynamicURL}/front';
		                }
		            });
				}, function(){}
			);
		});
	}
	
	//加入收藏
	function AddFavorite(sURL, sTitle) {
		sURL = encodeURI(sURL); 
		try{
			window.external.addFavorite(sURL, sTitle);
		}catch(e) {  
			try{   
				window.sidebar.addPanel(sTitle, sURL, "");
			}catch (e) {
				alert("加入收藏失败，请使用Ctrl+D进行添加,或手动在浏览器里进行设置.");
			}
		}
	}
	//设为首页
	function SetHome(url){
		if (document.all) {
			document.body.style.behavior='url(#default#homepage)';
			document.body.setHomePage(url);
		}else{
			alert("您好,您的浏览器不支持自动设置页面为首页功能,请您手动在浏览器里设置该页面为首页!");
		}
	}


	$('#time').jclock({withDate:true, withWeek:true});
	
	function checkLogin(url){
		var userId="${_user_id}";//得到session查看是否登录
		if(userId!=null&&userId!=""){
			window.location.href='${dynamicURL}/'+url;
		}else{
			openLogin();
		}
	}
	function openRegister(){
		//$("#register-modal").modal({show:!0});
		//$("#imgObj").attr('src',"${dynamicURL}/front/login/sendPictureCode");
		parent._layer({
	        url: '${dynamicURL}/front/venue/user/toRegister',
	        title: "用户注册",
	        width:'50%',
	        height:'80%',
	        btn: ['保存', '取消']
	    },
	    {
	        yes: function(index, layero) {
	        	var bObj = layero.find("a.layui-layer-btn0");
	            var frm = parent.$("#layui-layer-iframe" + parent.ixs["用户注册"]).contents().find("form.addForm");
	            $.submit({
		            url: "${dynamicURL}/front/venue/user/saveRegister",
		            formTg : frm,
		            butObj : null,
		            success : function(res){
		            	if(res.success){
		            		$("#register-modal").modal('hide');
		            		layer.alert(res.msg, {icon: 1});
		            	}else{
		            		layer.alert(res.msg, {icon: 0});
		            	}
		            },
		            error : function(){
		            	layer.alert('出错啦！', {icon: 0});
		            }
	           	});
	        },
	        btn2: function(index, layero) {
	        	parent.layer.close(parent.parent.ixs["用户注册"]);
	        }
	    });
	}
</script>