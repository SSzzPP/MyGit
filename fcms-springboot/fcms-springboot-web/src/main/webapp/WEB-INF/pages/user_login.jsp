<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!--为了让 IE 浏览器运行最新的渲染模式，建议将此 meta 标签加入到你页面的 head 中-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 为了让浏览器运行高速模式下，建议将此 meta 标签加入到你页面的 head 中-->
    <meta name="renderer" content="webkit">
    <!--为了确保适当的绘制和触屏缩放，需要在 之中添加viewport元数据标签-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>全民共享健身平台</title>
   	<link rel="shortcut icon" href="${staticURL}/style_v2/images/logoFont.ico">
    <link href="${staticURL}/style_v2/css/pintuer.css" type="text/css" rel="stylesheet" />
    
    <!-- layer -->
    <script src="${staticURL}/layuiadmin/layui/layui.js"></script>
    
    <style>
    html{
    	height:100%;
    }
    .layout{
        background:url(${staticURL }/style_v2/images/bg.png) no-repeat;
        height:100%;
        background-position:center;
        background-size: 100%;
    }
    .logo{
        width:340px;
        height:112px;
        margin:0 auto;
        text-align:center;
        padding-top:50px;
    }
    .img-responsive{
        margin-top:-4px;
        height:80px;
        display: inline-block;
    }
    .login{
        width:400px;
        height:308px;
        margin:20px auto;
        border-radius:10px;
        background-color: #fff;
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
        background: -webkit-gradient(linear,center top,center bottom,from(#fafafa), to(#ebebeb));
    }
    .input-div{
        height:32px;
        width:60%;
        margin:30px auto 0;
        position:relative;
    }
    .forget{
        height:32px;
        width:60%;
        padding:6px 2px;
        margin:0px auto;
    }
    .fl{
        position: relative;
        margin-bottom:2px;
        margin-right:-30px;
    }
    .input{
        width:100%;
        text-indent: 24px;
    }
    .bg-main{
        float:right;
        width:80px;
/*         background-color: #6bac42; */
    }
   .cord{
     width:150px;
     margin:20px auto;
   }
    .cord img{
        height:auto;
        width:100%;
        background-size:cover;
    }
	.placeholder-user,.placeholder-pwd{
		color: #999;
		display:block;
		position: absolute;
		width:150px;
		height:38px;
		line-height:36px;
		font-size:14px;
		right:0;
		top:0;
		text-align:left;
		left:38px;
	}
 	h1{
        color:#fff;
        font-size:30px;
    }
    h2{
        color:#fff;
        font-size:16px;
    }
    .card-box{
    	float:left;
    	margin:0 10px;
    }
    .card-container{
    	text-align: center;
    	width:350px;
    	margin:0 auto;
    }
	@media screen and (max-width: 420px) {
		.login{
			width:330px;
			height:280px;
		}
		.margintop{
			margin-top:-22px!important;
		}
		.cord{
			width:138px;
			margin:10px auto;
		}
		.card-container{
	    	width:340px;
    	}
		.card-box{
	    	margin:0 5px;
    	}
    	.card-box span{
	    	font-size:16px!important;
    	}
}
    </style>
</head>
<body  style="height:100%;">
<!--nav-->
<div class="layout">
    <div class="logo">
    	<%-- <img class="img-responsive" src="${staticURL }/style_v2/images/logo1.png"/> --%>
        <!-- <div class="float-left">
            <h1>青岛机场集团</h1>
            <h2>Qingdao Airport Group</h2>
        </div> -->
    </div>
    <div class="login">
        <div class="headtop">全民共享健身平台</div>
        <div style="text-align: center;margin:10px 0px -20px;height: 20px;">
			<font color="red"></font>
		</div>
		
        <form action="" method="post">
	        <div class="input-div">
	            <img class="fl" src="${staticURL }/style_v2/images/login-user.png"/><input id='username_in' name="username" class="input" required="required" type="text" placeholder="账号"/>
	            <span id="user_palceholder" class="placeholder-user"></span>
	        </div>
	        <div class="input-div">
	            <img class="fl" src="${staticURL }/style_v2/images/login-cord.png"/><input id='password_in' name="password" type="password" required="required" class="input" placeholder="密码"/>
				<span id="pwd_palceholder" class="placeholder-pwd" style=""></span>
	        </div>
	        <div class="forget text-right" style='margin-top:10px;'><a href="${dynamicURL}/forget">忘记密码?</a></div>
	        <div class="forget">
	            <button style='width:45%' class="button bg-main" id="button">登录</button>
	        </div>
	    </form>
        <%-- <div class="forget margintop" style='margin-top:10px;'><a href="${dynamicURL}/register" style="color:#1798c5;">免费注册</a></div> --%>
    </div>
    
    
    <%-- <div class="card-container">
    	<div class="card-box">
    		<img style='height: 150px;width: 150px;' src="${staticURL }/style_v2/images/app/androidCode.png"/>
    		<br><span style='font-size:20px;line-height: 30px;'>安卓App下载</span>
   		</div>
   		
   		<div class="card-box">
    		<img style='height: 150px;width: 150px;' src="${staticURL }/style_v2/images/app/iosCode.png"/>
    		<br><span style='font-size:20px;line-height: 30px;'>苹果App下载</span>
   		</div>    	
    </div> --%>
</div>
</body>
<script type="text/javascript">
	layui.use(['jquery'], function(){
		var $ = layui.jquery;
		
		/***** placeholder效果   *****/
		$("#pwd_palceholder").show();
		$("#pwd_palceholder").click(function(){
		    $(this).hide();
		    $("#password_in").focus();
		});
		$("#password_in").focus(function(){
		    $("#pwd_palceholder").hide();
		}).blur(function(){
		    if($(this).val().length==0){
			    $("#pwd_palceholder").show();
		    }
		});
		
		$("#user_palceholder").show();
		$("#user_palceholder").click(function(){
		    $(this).hide();
		    $("#username_in").focus();
		});
		$("#username_in").focus(function(){
		    $("#user_palceholder").hide();
		}).blur(function(){
		    if($(this).val().length==0){
			    $("#user_palceholder").show();
		    }
		});
	 	 $('#button').click(function(){
			var userName = $("#username_in").val();
			var passWord = $("#password_in").val();
			if(userName!=null&&passWord!=null){
				 $('form').submit(function(event){
					event.preventDefault();
					var form = $(this);
					$.ajax({
						url: '${dynamicURL}/login/userLogin',
						type: form.attr('method'),
						data: form.serialize(),
						dataType: 'json',
						success:function(data) {
							if(data.success) {
						 		if(data.sessionId){
						 			layui.data('loginUser', {
						 				  key: 'sessionId'
						 				  ,value: data.sessionId
						 			});
								}
						 		window.parent.location.href='${dynamicURL}/admin/main';
							}else{
								$('font').empty();
								$('font').append(data.msg);
							}
						}
					});
				});
			}
		});
	}); 
		

// 	function appCodeWindows(){
// 		  layer.open({
// 			  type: 1,
// 			  title: false,
// 			  closeBtn: 0,
// 			  area: '300px',
// 			  skin: 'layui-layer-nobg', //没有背景色
// 			  shadeClose: true,
// 			  content: $("#appCode")
// 			});
// 	}
</script>


</html>