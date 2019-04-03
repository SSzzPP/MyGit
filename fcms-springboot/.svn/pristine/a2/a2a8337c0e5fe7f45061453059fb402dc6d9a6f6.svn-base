<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="tab_bottom.jsp" flush="true">
<jsp:param name="message" value="mui-active"/>
</jsp:include>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>聊天</title>

<style>
	.title {
		margin: 20px 15px 10px;
		color: #6d6d72;
		font-size: 15px;
	}
	.mui-content>.mui-table-view:first-child{
		margin:0;
	}
	
	.mui-table-view .mui-media-object{
		border-radius : 5px;
		max-width : 58px;
		height : 58px;
		width:58px;
	}
	.setTime{
		position:absolute;
		right:15px;
		top:18px;
		color:#8f8f94;
		font-size:14px;
	}
	.mui-media-body{
		padding:10px 0 3px;
	}
	.mui-media-body p{
		line-height: 24px;
	}

</style>
</head>
<body>
<header class="mui-bar mui-bar-nav">
			<h1 class="mui-title">消息</h1>
		</header>
		<div id='mesasgeDiv' class="mui-content">
			<ul id='msg-list' class="mui-table-view">

			</ul>
		</div>
		
<script type="text/javascript">
		mui.ready(function(){
			//加载聊天列表
			if(constants.getLoginStatus() == 0){
				constants.toLoginPage();
				//mui.toast('请返回在市北登录后使用该功能！');
				return;
			} else {
				loadMessageList();
			}
		});
		mui("#mesasgeDiv").on('tap','li',function() {
			var userId = $(this).attr('userId');
			var userName = $(this).attr('userName');
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
		
		window.addEventListener("reload", function(e) {
			//plus.webview.currentWebview().reload();
		});
		
		/* window.addEventListener("noLogin", function(e) {
			document.getElementById("msg-list").innerHTML = template('msg-template', {"message": {}});
		}); */
		
		function loadMessageList(){
			var params = {};
			topUtil.web_query('/mobile/chatmessage/searchMessageList',params,
				function (data){
					if (typeof data == "string") {
						data = JSON.parse(data);
					}
					
					$.each(data,function(index,item){
						console.log(item);
						var str = '';
						str += '<li class="mui-table-view-cell mui-media" userId="' + item.recvUserId + '" userName="' + item.recvUserName + '">'; 
						str += '	<a href="javascript:;">';
						str += '		<img class="mui-media-object mui-pull-left" src="'+item.headImage+ '">';
						str += '		<div class="mui-media-body">';
						str += 				item.recvUserName;
						str += '			<p class="mui-ellipsis">' + item.content + '</p>';
						str += '			<span class="setTime">' + item.sendTimeWrapper + '</span>';
						str += '		</div>';
						str += '	</a>';
						str += '</li>';
						$("#msg-list").append(str);
					})
					//document.getElementById("msg-list").innerHTML = template('msg-template', {"message": data,"serverPath":serverPath});
				}
			);
		}
	</script>
	</script>

</body>
</html>