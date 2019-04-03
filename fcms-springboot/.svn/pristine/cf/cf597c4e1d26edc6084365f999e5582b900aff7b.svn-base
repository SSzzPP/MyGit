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
			html,
			body {
				height: auto;
			}
			.bt {
				border-bottom: 1px solid #e6e6e6;
				padding-bottom: 5px;
			}
			.infoData {
				padding: 0;
			}
		</style>
</head>
<body>
		<header class="mui-bar mui-bar-nav transparent">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">已报名列表</h1>
		</header>
		<div class="mui-content">
			<div class="mui-active">
			<div class="infoData" id="activity-list">
				<%-- <script id='msg-template' type="text/template">
				<% for(var i in message){ var item = message[i]; %>
					<div class="news bt">
						<div class="news-header" id="<%=(item.uuid)%>">
							<img src="<%=(serverPath)%>/mobile/venue/user/userHeadImg?uuid=<%=(item.uuid)%>" alt="">
							<span class="imgrcol">
								<span class="username"><%=(item.userName)%></span>
							</span>
						</div>
					</div>
				<%}%>
				</script> --%>
			</div>
			</div>
		</div>
		
		<script>
			var mainId = '${mainId}';
			mui.ready(function() {
				userList (mainId);
			});
			
			function userList (mainId) {
				topUtil.web_query('/mobile/activity/user/search',{search_EQ_mainId:mainId},function (data) {
					if (typeof data == "string") {
		                data = JSON.parse(data);
		            }
					if (data) {
						var str = '';
						mui.each(data,function (index,item) {
							str += '<div class="news bt"><div class="news-header" id="'+item.uuid+'">';
							str += '<img src="'+item.userPhoto+'" alt="">';
							str += '<span class="imgrcol"><span class="username">'+item.userName+'</span></span></div></div>';
						});
						//document.getElementById("activity-list").innerHTML = template('msg-template', {"message": data,"serverPath":serverPath});
					}
					$('#activity-list').html(str);
				});
			}
			$(document).on('tap','.news-header',function () {
				var uuid = $(this).attr("id");
				mui.openWindow({ 
				    url: dynamicURL+'mobile/activity/main/toUserDetail?uuid='+uuid, 
				    id : 'user_detail.html',
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
			
		</script>
</body>
</html>