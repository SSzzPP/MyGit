<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>Hello MUI</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<style>
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
				padding:10px;
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
			
			/*图片预览*/
			.mui-preview-image.mui-fullscreen {
				position: fixed;
				z-index: 20;
				background-color: #000;
			}
			.mui-preview-header,
			.mui-preview-footer {
				position: absolute;
				width: 100%;
				left: 0;
				z-index: 10;
			}
			.mui-preview-header {
				height: 44px;
				top: 0;
			}
			.mui-preview-footer {
				height: 50px;
				bottom: 0px;
			}
			.mui-preview-header .mui-preview-indicator {
				display: block;
				line-height: 25px;
				color: #fff;
				text-align: center;
				margin: 15px auto 4;
				width: 70px;
				background-color: rgba(0, 0, 0, 0.4);
				border-radius: 12px;
				font-size: 16px;
			}
			.mui-preview-image {
				display: none;
				-webkit-animation-duration: 0.5s;
				animation-duration: 0.5s;
				-webkit-animation-fill-mode: both;
				animation-fill-mode: both;
			}
			.mui-preview-image.mui-preview-in {
				-webkit-animation-name: fadeIn;
				animation-name: fadeIn;
			}
			.mui-preview-image.mui-preview-out {
				background: none;
				-webkit-animation-name: fadeOut;
				animation-name: fadeOut;
			}
			.mui-preview-image.mui-preview-out .mui-preview-header,
			.mui-preview-image.mui-preview-out .mui-preview-footer {
				display: none;
			}
			.mui-zoom-scroller {
				position: absolute;
				display: -webkit-box;
				display: -webkit-flex;
				display: flex;
				-webkit-box-align: center;
				-webkit-align-items: center;
				align-items: center;
				-webkit-box-pack: center;
				-webkit-justify-content: center;
				justify-content: center;
				left: 0;
				right: 0;
				bottom: 0;
				top: 0;
				width: 100%;
				height: 100%;
				margin: 0;
				-webkit-backface-visibility: hidden;
			}
			.mui-zoom {
				-webkit-transform-style: preserve-3d;
				transform-style: preserve-3d;
			}
			.mui-slider .mui-slider-group .mui-slider-item img {
				width: auto;
				height: auto;
				max-width: 100%;
				max-height: 100%;
			}
			.mui-android-4-1 .mui-slider .mui-slider-group .mui-slider-item img {
				width: 100%;
			}
			.mui-android-4-1 .mui-slider.mui-preview-image .mui-slider-group .mui-slider-item {
				display: inline-table;
			}
			.mui-android-4-1 .mui-slider.mui-preview-image .mui-zoom-scroller img {
				display: table-cell;
				vertical-align: middle;
			}
			.mui-preview-loading {
				position: absolute;
				width: 100%;
				height: 100%;
				top: 0;
				left: 0;
				display: none;
			}
			.mui-preview-loading.mui-active {
				display: block;
			}
			.mui-preview-loading .mui-spinner-white {
				position: absolute;
				top: 50%;
				left: 50%;
				margin-left: -25px;
				margin-top: -25px;
				height: 50px;
				width: 50px;
			}
			.mui-preview-image img.mui-transitioning {
				-webkit-transition: -webkit-transform 0.5s ease, opacity 0.5s ease;
				transition: transform 0.5s ease, opacity 0.5s ease;
			}
			@-webkit-keyframes fadeIn {
				0% {
					opacity: 0;
				}
				100% {
					opacity: 1;
				}
			}
			@keyframes fadeIn {
				0% {
					opacity: 0;
				}
				100% {
					opacity: 1;
				}
			}
			@-webkit-keyframes fadeOut {
				0% {
					opacity: 1;
				}
				100% {
					opacity: 0;
				}
			}
			@keyframes fadeOut {
				0% {
					opacity: 1;
				}
				100% {
					opacity: 0;
				}
			}
			.title{
				margin: 20px 15px 7px;
				color: #6d6d72;
				font-size: 15px;
			}
	</style>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<div class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left " onclick="back()"></div>
		<h1 id="title" class="mui-title">详情</h1>
	</header>
	<div class="mui-content" style="background-color: white;">
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
		
		//mui.previewImage();
		var uuid = '';
		mui.ready(function(){
			var uuid = '${uuid}';
			loadData(uuid);
			
		});
		
		function loadData(uuid){
			topUtil.web_query('/mobile/information/info/getBannerDetail',{uuid:uuid},
				function (data){ 
			        if(data.success){
			        	if(data.obj){
			        		var obj = data.obj;
			        		document.getElementById("articleContent").innerHTML = obj.content;
			        		document.getElementById("articleTitle").innerHTML = obj.title;
			        		document.getElementById("artitleTime").innerHTML = obj.author + '&nbsp;发表于&nbsp;' + obj.gmtCreate;
			        		$("#articleContent").show();
			        		$("#articleTitle").show();
			        		$("#artitleTime").show();
			        		
			        		// img处理
			        		mui.each($('#articleContent img'),function (index,item) {
			        			$(item).attr('src',dynamicURL  + "/mobile/information/info/showContentImage?fileName=" + $(item).attr('src')) ;
			        			// 处理预览 
			        			$(item).attr('data-preview-src','') ;// 预览标志
			        			$(item).attr('data-preview-group','1') ;// 同一组
			        			$(item).attr('style','width:100%;height:auto;')
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