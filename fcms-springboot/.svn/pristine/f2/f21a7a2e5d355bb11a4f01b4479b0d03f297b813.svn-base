<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--普通用户 我的预约列表  -->
	<head>
		<meta charset="utf-8">
		<title>Hello MUI</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<style>
			html,
			body {
				background-color: #efeff4;
			}
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
			
			
			.selectList{
				height:44px;
				display: flex;
				background-color:#fff;
				position: relative;
				padding: 0 10px;
				border-bottom:1px solid #e6e6e6;
			}
			.selectTab{
				line-height:44px;
				flex: 1;
				text-align: center;
				color:#43474d;
				max-width:33.33%;
			}
			.selectTab a{
				display: block;
				color:#333;
				font-size:15px;
				overflow: hidden;
			    white-space: nowrap;
			    text-overflow: ellipsis;
			}
			.selectTab a span.mui-icon{
				font-size:20px;
				color:#666;
			}
			.subSelect{
				position:absolute;
				top:44px;
				left:0;
				display: none;
				height:300px;
				overflow: auto;
				width:100%;
				z-index: 6666;
				background-color: #fff;
			}
			.subSelect div.selected{
				color:#008000;
			}
			.subSelect div.venBtn.selected{
				color:#43474d!important;
				border-color:#008000;
			}
			.venBtn{
				float: left;
				height:30px;
				line-height: 30px;
				width:calc(25% - 8px);
				margin:5px 4px;
				border:1px solid #ddd;
				border-radius:5px;
				transition: all 0.3s;
			}
			.list li{
				display:flex;
				padding:10px;
				border-bottom:1px solid #e6e6e6;
			}
			.list li img{
				width:94px;
				height:94px;
				border-radius:5px;
				margin:5px;
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
			.con span{
				color:#a2a2a2;
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
		<!--<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">选项卡切换+下拉刷新（div模式）</h1>
		</header>-->
		<header class="mui-bar mui-bar-nav">
			<div class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left " onclick="back(),plus.nativeUI.closeWaiting();"></div>
			<h1 id="title" class="mui-title">我的预约</h1>
		</header>
		<div class="mui-content">
			<div id="slider" class="mui-slider mui-fullscreen" >
				<div class="mui-scroll" id="pullRefresh">
					<ul id="orderList" class="mui-table-view list">
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
								pullRefresh.refresh(true);
								loadOrder(pageRows,pageNum);
								pullRefresh.endPullDownToRefresh();
							}
						},
						up: {
							callback: function() {
								var cells = document.querySelector('.mui-table-view').querySelectorAll('.mui-table-view-cell');
								pageNum = Math.ceil(cells.length / pageRows + 1);
								pullRefresh.refresh(true);
								loadOrder(pageRows,pageNum);
								// pullRefresh.endPullUpToRefresh();
							}
						}
					});
				});
			})(mui);
			
			mui.ready(function() {
		   	 	//加载类别
		   	 	//loadCategory();
		   	 	var cells = document.querySelector('.mui-table-view').querySelectorAll('.mui-table-view-cell');
				pageNum = Math.ceil(cells.length / pageRows + 1);
				pullRefresh.refresh(true);
		   	 	loadOrder(pageRows,pageNum);
			})
			/*加载预约列表*/
			function loadOrder(pageRows,pageNum) {
				if (pageNum == 1) {
					$("#orderList").empty();
				}
				var params = {
					rows:pageRows,
					page:pageNum
				};
	        	topUtil.web_query("/mobile/order/myOrderList",params,
					function (data) {
						if (typeof data == "string") {
			               data = JSON.parse(data);
			            }
						var str = "";
						//var serverPath = window.constants.getServerPath();
						userType = data.userType;
						if(data.total != 0) {
							mui.each(data.rows,function (index,item) {
								var status = '';
								if(item.status == 0 ){
									status = '未接单';
								}else{
									status = '已接单';
								}
								if(item.editStatus != null && item.editStatus == 0){
									status = '改签处理中';
								}else if(item.editStatus != null && item.editStatus == 1){
									status = '已改签';
								}
								if(item.cancleStatus != null && item.cancleStatus == 0){
									status = '退订处理中';
								}else if(item.cancleStatus != null && item.cancleStatus == 1){
									status = '已退订';
								}
								if(item.vealuateStatus == 1){
									status = '已评价';
								}
								if(item.type==1){
									str += '<li class="mui-table-view-cell" id="'+item.uuid+'" orderType="'+item.type+'">';
									str += '	<div class="siteInfo">';						
									str += '		<div class="con">场馆：<span>'+item.venueName+'</span></div>';
									str += '		<div class="con">设施：<span>'+item.equipmentName+'</span></div>';
									str += '		<div class="con">时间：<span>'+item.orderTime+'</span></div>';
									str += '		<div class="con">状态：<span>'+status+'</span></div>';
									str += '	</div>';
									str += '</li>';
								}else{
									str += '<li class="mui-table-view-cell" id="'+item.uuid+'" orderType="'+item.type+'">';
									str += '	<div class="siteInfo">';						
									str += '		<div class="con">教练：<span>'+item.coachName+'</span></div>';
									str += '		<div class="con">课程：<span>'+item.courseName+'</span></div>';
									str += '		<div class="con">时间：<span>'+item.orderTime+'</span></div>';
									str += '		<div class="con">状态：<span>'+status+'</span></div>';
									str += '	</div>';
									str += '</li>';
								}
								
							});
						}
						$('#orderList').append(str);
						toDetail();
						pullRefresh.endPullUpToRefresh(pageNum> Math.ceil(data.total/pageRows));
					});
			}
			function toDetail () {
				$("#orderList li").on('tap',function() {
					var uuid = $(this).attr("id");
					var orderType=$(this).attr("orderType");//传参数 预约类型  用于详情页面识别
					mui.openWindow({
					    url: dynamicURL+'mobile/order/toCommonOrderDetail?uuid='+uuid+"&orderType="+orderType, 
					    id : 'mobile/order/toCommonOrderDetail',
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