<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Hello MUI</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<style>
			html,
			body {
				background-color: #efeff4;
			}
		</style>
	</head>

	<body>
		<nav class="mui-bar mui-bar-tab">
			<a id="defaultTab" class="mui-tab-item <%=request.getParameter("home")%>" href="${dynamicURL}/admin/main/toHome">
				<span class="mui-icon mui-icon-home"></span>
				<span class="mui-tab-label">首页</span>
			</a>
			<a id='messageHtml' class="mui-tab-item <%=request.getParameter("message")%>" href="${dynamicURL}/admin/main/toMessage">
				<span class="mui-icon mui-icon-chat"></span>
				<span class="mui-tab-label">消息</span>
			</a>
			<a id='cardHtml' class="mui-tab-item <%=request.getParameter("activity")%>" href="${dynamicURL}/admin/main/toActivity">
				<span class="mui-icon mui-icon-pengyouquan"></span>
				<span class="mui-tab-label">社区</span>
			</a>
			<a class="mui-tab-item <%=request.getParameter("userMap")%>" href="${dynamicURL}/admin/main/toUserMap">
				<span class="mui-icon mui-icon-map"></span>
				<span class="mui-tab-label">场馆</span>
			</a>
			<a class="mui-tab-item <%=request.getParameter("my")%>" href="${dynamicURL}/admin/main/toMy">
				<span class="mui-icon mui-icon-contact"></span>
				<span class="mui-tab-label">我的</span>
			</a>
		</nav>
		
		<script type="text/javascript" charset="utf-8">
		var pages=['${dynamicURL}/admin/main/toHome','${dynamicURL}/admin/main/toMessage','${dynamicURL}/admin/main/toCard','${dynamicURL}/admin/main/toUserMap','${dynamicURL}/admin/main/toMy'];
		var defPage = pages[0];//默认首页
		var temphtml=""; 
		mui.ready(function() {
		 //选项卡点击事件
			mui('.mui-bar-tab').on('tap', 'a', function(e) {
				var targetTab = this.getAttribute('href');
		       mui.openWindow({
		        	url:targetTab,
		        	id:targetTab
		        });
		     });
		});
		</script>
	</body>

</html>