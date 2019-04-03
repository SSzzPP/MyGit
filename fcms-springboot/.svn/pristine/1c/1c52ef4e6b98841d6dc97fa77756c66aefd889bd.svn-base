<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>问卷统计</title>
</head>
<body>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<a id="searchBtn" class="mui-icon mui-icon-search mui-pull-right"></a>
			<h1 class="mui-title">问卷统计</h1>
		</header>
		<div class="mui-content"></div>

	<script type="text/javascript">
		//启用双击监听
		mui.ready(function() {
			document.getElementById('searchBtn').addEventListener('tap',function () {
			        mui.openWindow({
					    url: dynamicURL+'mobile/survey/userTotal/toSearchSurveyPaperTotal', 
					    id : 'mobile/survey/userTotal/toSearchSurveyPaperTotal',
					    show:{
					      autoShow:true,//页面loaded事件发生后自动显示，默认为true
					      aniShow:"slide-in-right",
					      duration:'250'
					    },
					     waiting:{
					      autoShow:false,//自动显示等待框，默认为true
				      }
		  		});
			},false);
		})
		mui.init({
			gestureConfig: {
				doubletap: true
			},
			subpages: [{
				url: dynamicURL+'mobile/survey/userTotal/toSurveyPaperTotalListSub',
				id: 'mobile/survey/userTotal',
				styles: {
					top: '45px',
					bottom: '0px',
				}
			}]
		});

		var contentWebview = null;
		document.querySelector('header').addEventListener('doubletap', function() {
			if(contentWebview == null) {
				contentWebview = plus.webview.currentWebview().children()[0];
			}
			contentWebview.evalJS("mui('#pullrefresh').pullRefresh().scrollTo(0,0,100)");
		});

	</script>
</body>
</html>