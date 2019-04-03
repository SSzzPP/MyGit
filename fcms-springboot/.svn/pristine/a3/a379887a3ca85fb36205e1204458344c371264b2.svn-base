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
		<h1 id="title" class="mui-title">学习中心</h1>
	</header>
	<div class="mui-content">
		<div id="slider" class="mui-slider mui-fullscreen">
			<div class="mui-scroll" id="pullRefresh">
				<ul id="videoList" class="mui-table-view list">
				</ul>
			</div>
						
		</div>
	</div>
	<script>
		var pageRows = 4;
		var pageNum = 0;
		var pullRefresh = null;
		mui.init();
		(function($) {
			$.ready(function() {
				
			    pullRefresh = $("#pullRefresh").pullToRefresh({
					down: {
						callback: function() {
							pageNum = 1;
							//plus.webview.currentWebview().reload();
							loadVenue(pageRows,pageNum);
							pullRefresh.endPullDownToRefresh();
						}
					},
					up: {
						callback: function() {
							var cells = document.querySelector('.mui-table-view').querySelectorAll('.mui-table-view-cell');
							pageNum = Math.ceil(cells.length / pageRows + 1);
							loadVenue(pageRows,pageNum);
							// pullRefresh.endPullUpToRefresh();
						}
					}
				});
			});
		})(mui);
		
		mui.ready(function() {
	   	 	var cells = document.querySelector('.mui-table-view').querySelectorAll('.mui-table-view-cell');
			pageNum = Math.ceil(cells.length / pageRows + 1);
	   	 	loadVenue(pageRows,pageNum);
		})
		
		/*加载场馆*/
		function loadVenue(pageRows,pageNum) {
			if (pageNum == 1) {
				$("#videoList").empty();
			}
			var params = {
				rows:pageRows,
				page:pageNum,
				order:'desc',
				sort:'id'
			};
        	topUtil.web_query('/mobile/video/main/list',params,
				function (data) {
					if (typeof data == "string") {
		               data = JSON.parse(data);
		            }
					var str = "";
					if(data.total != 0) {
						mui.each(data.rows,function (index,item) {
							var date = new Date(item.gmtCreate);
							str += '<li class="mui-table-view-cell" uuid="'+item.uuid+'">';
							str += '	<img src="${dynamicURL}/mobile/video/main/showVideoImage?uuid='+item.uuid+'"/>';
							str += '	<div class="siteInfo">';						
							str += '		<div class="siteName">'+item.title+'</div>';
							str += '	</div>'; 
							str += '</li>';
						});
					}
					$('#videoList').append(str);
					toDetail();
					pullRefresh.endPullUpToRefresh(++pageNum> Math.ceil(data.total/pageRows));
				});
			}
			
			function toDetail () {
				$("#videoList li").on('tap',function() {
					var uuid = $(this).attr("uuid");
					mui.openWindow({
						url: '${dynamicURL}/mobile/video/main/toVideoDetail?uuid='+uuid, 
		    			id : 'video_detail.html',
					    show:{
					      autoShow:true,//页面loaded事件发生后自动显示，默认为true
					      aniShow:"slide-in-bottom",
					      duration:'250'
					    },
					     waiting:{
					      autoShow:false,//自动显示等待框，默认为true
				      	}
			  		});
				});
			}
			
			
	</script>
</body>
</html>