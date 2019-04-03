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
		.mui-bar~.mui-content .mui-fullscreen {
			top: 88px;
			height: auto;
		}
		.mui-pull-top-tips {
			position: absolute;
			top: -20px;
			left: 50%;
			margin-left: -25px;
			width: 40px;
			height: 40px;
			border-radius: 100%;
			z-index: 1;
		}
		.mui-bar~.mui-pull-top-tips {
			top: 24px;
		}
		.mui-pull-top-wrapper {
			width: 42px;
			height: 42px;
			display: block;
			text-align: center;
			background-color: #efeff4;
			border: 1px solid #ddd;
			border-radius: 25px;
			background-clip: padding-box;
			box-shadow: 0 4px 10px #bbb;
			overflow: hidden;
		}
		.mui-pull-top-tips.mui-transitioning {
			-webkit-transition-duration: 200ms;
			transition-duration: 200ms;
		}
		.mui-pull-top-tips .mui-pull-loading {
			/*-webkit-backface-visibility: hidden;
			-webkit-transition-duration: 400ms;
			transition-duration: 400ms;*/
			
			margin: 0;
		}
		.mui-pull-top-wrapper .mui-icon,
		.mui-pull-top-wrapper .mui-spinner {
			margin-top: 7px;
		}
		.mui-pull-top-wrapper .mui-icon.mui-reverse {
			/*-webkit-transform: rotate(180deg) translateZ(0);*/
		}
		.mui-pull-bottom-tips {
			text-align: center;
			background-color: #efeff4;
			font-size: 15px;
			line-height: 40px;
			color: #777;
		}
		.mui-pull-top-canvas {
			overflow: hidden;
			background-color: #fafafa;
			border-radius: 40px;
			box-shadow: 0 4px 10px #bbb;
			width: 40px;
			height: 40px;
			margin: 0 auto;
		}
		.mui-pull-top-canvas canvas {
			width: 40px;
		}
		.mui-slider-indicator.mui-segmented-control {
			background-color: #efeff4;
		}
		
		
		.list li{
			display:flex;
			padding:10px;
			border-bottom:1px solid #e6e6e6;
		}
		.list li img{
			width: 90px;
		    height: 70px;
		    border-radius: 5px;
		    margin: 5px;
		}
		.siteInfo{
			flex:1;
			padding:5px;
		}
		.siteName{
			color:#43474d;
			font-size:16px;
		}
		.con{
			line-height:25px;
			font-size:14px;
			overflow: hidden;
			text-overflow:ellipsis;
       		white-space: nowrap;
		}
		.padd{
			padding:4px 15px;
			border-bottom: 1px solid #ebebeb;
		}
		.mui-backdrop{
			top:100px;
		}
	</style>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<div class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left " onclick="back(),plus.nativeUI.closeWaiting();"></div>
		<h1 id="title" class="mui-title">播放视频</h1>
	</header>
	<div class="mui-content">
		<div class="bad-video">
				<video id='video' webkit-playsinline><!--http://sms.jdia.com.cn:9000/sms/smsFiles/EDUCATION/20170427/1489568002951.mp4-->
					<p>设备不支持</p>
				</video>
			</div>
	</div>
	<script>
		mui.bvd();
		mui.ready(function(){
				var videoSrc = '${videoSrc}';
				console.log(videoSrc);
				$('#video').html("<source id='videoSource' src='${dynamicURL}/"+videoSrc+"' type='video/mp4'></source>");
		});
		
	</script>
</body>
</html>