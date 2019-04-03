<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>Insert title here</title>
<style type="text/css">
			.content{
			   	padding: 15px;
			    font-family: "宋体";
			    display:none;
			}
			
			.content p{  
				line-height: 30px;
				font-size: 16px;
				color: black;
			}
			
			.no-content{
				text-align: center;
				padding-top: 200px;line-height: 35px;
				text-indent:0em;font-size: 20px;
				display:none;
			} 
			.article-title{
				display:none;
				text-align: center;
				font-size: 20px;
				padding:30px;
				font-weight: bold;
				line-height: 30px;
			}
			.article-time{
				display:none;
				font-size: 13px;
				color: #8C8C8C;
				padding-left: 18px;
				font-family: "宋体";
			}
			img{
				height: 200px;
				width: 300px;
			}
	</style>
</head>
<body style="background-color: white;">
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">公告详情</h1>
		</header>
		<div class="mui-content" style="background-color: white;padding: 15px;">
			<div id="articleTitle" class='article-title'></div>
			<div id='artitleTime' class='article-time'></div>
			<div id="articleContent" class="content"></div>
			
			<div id="articleContentEmpty" class="no-content">
					暂无内容
			</div>
			
		</div>
		<script>
		
		mui.init({
			swipeBack:true //启用右滑关闭功能
		});
		mui.ready(function(){
			var infoId = '${infoId}';
			loadData(infoId);
			
		});
		/*加载详情*/
		function loadData(id){
			//var wait = plus.nativeUI.showWaiting('正在加载...');
			topUtil.web_query('/mobile/information/info/detail',{id:id},
				function (data){ 
					//wait.close(); 
				        if(data.success){
				        	if(data.obj){
				        		var obj = data.obj;
				        		document.getElementById("articleContent").innerHTML = obj.content;
				        		document.getElementById("articleTitle").innerHTML = obj.title;
				        		document.getElementById("artitleTime").innerHTML = obj.author + '&nbsp;发表于&nbsp;' + obj.gmtCreate;
				        		$("#articleContent").show();
				        		$("#articleTitle").show();
				        		$("#artitleTime").show();
				        		mui.each($('#articleContent img'),function (index,item) {
				        			$(item).attr('src', dynamicURL+ "/mobile/information/info/showContentImage?fileName=" + $(item).attr('src')) ;
				        		});
				        	}else{
				        		$("#articleContentEmpty").show();
				        	}
				        }
				}
			);
		}
	</script>
</body>
</html>