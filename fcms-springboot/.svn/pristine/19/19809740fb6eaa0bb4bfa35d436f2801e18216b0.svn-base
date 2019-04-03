<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<link href="${staticURL}/css/mui.indexedlist.css" rel="stylesheet" />
<script src="${staticURL}/js/mui.indexedlist.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>s
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title></title>
<style>
	html,
	body {
		height: 100%;
		margin: 0px;
		padding: 0px;
		overflow: hidden;
		-webkit-touch-callout: none;
		-webkit-user-select: none;
	}
	footer {
		position: fixed;
		width: 100%;
		height: 50px;
		min-height: 50px;
		border-top: solid 1px #bbb;
		left: 0px;
		bottom: 0px;
		overflow: hidden;
		padding: 0px 50px;
		background-color: #fafafa;
	}
	.footer-left {
		position: absolute;
		width: 50px;
		height: 50px;
		left: 0px;
		bottom: 0px;
		text-align: center;
		vertical-align: middle;
		line-height: 100%;
		padding: 12px 4px;
	}
	.footer-right {
		position: absolute;
		width: 50px;
		height: 50px;
		right: 0px;
		bottom: 0px;
		text-align: center;
		vertical-align: middle;
		line-height: 100%;
		padding: 12px 5px;
		display: inline-block;
	}
	.footer-center {
		height: 100%;
		padding: 5px 0px;
	}
	.footer-center [class*=input] {
		width: 100%;
		height: 100%;
		border-radius: 5px;
	}
	.footer-center .input-text {
		background: #fff;
		border: solid 1px #ddd;
		padding: 10px !important;
		font-size: 16px !important;
		line-height: 18px !important;
		font-family: verdana !important;
		overflow: hidden;
	}
	.footer-center .input-sound {
		background-color: #eee;
	}
	.mui-content {
		height: 100%;
		padding: 44px 0px 50px 0px;
		overflow: auto;
		background-color: #eaeaea;
	}
	#msg-list {
		height: 100%;
		overflow: auto;
		-webkit-overflow-scrolling: touch;
	}
	.msg-item {
		padding: 8px;
		clear: both;
	}
	.msg-item .mui-item-clear {
		clear: both;
	}
	.msg-item .msg-user {
		width: 38px;
		height: 38px;
		border: solid 1px #d3d3d3;
		display: inline-block;
		background: #fff;
		border-radius: 3px;
		vertical-align: top;
		text-align: center;
		float: left;
		padding: 3px;
		color: #ddd;
	}
	
	.msg-item .msg-user-img{
		width: 38px;
		height: 38px;
		display: inline-block;
		border-radius: 3px;
		vertical-align: top;
		text-align: center;
		float: left;
		color: #ddd;
	}
	
	.msg-item .msg-content {
		display: inline-block;
		border-radius: 5px;
		border: solid 1px #d3d3d3;
		background-color: #FFFFFF;
		color: #333;
		padding: 8px;
		vertical-align: top;
		font-size: 15px;
		position: relative;
		margin: 0px 8px;
		max-width: 75%;
		min-width: 35px;
		float: left;
	}
	.msg-item .msg-content .msg-content-inner {
		overflow-x: hidden;
	}
	.msg-item .msg-content .msg-content-arrow {
		position: absolute;
		border: solid 1px #d3d3d3;
		border-right: none;
		border-top: none;
		background-color: #FFFFFF;
		width: 10px;
		height: 10px;
		left: -5px;
		top: 12px;
		-webkit-transform: rotateZ(45deg);
		transform: rotateZ(45deg);
	}
	.msg-item-self .msg-user,
	.msg-item-self .msg-content {
		float: right;
	}
	.msg-item-self .msg-content .msg-content-arrow {
		left: auto;
		right: -5px;
		-webkit-transform: rotateZ(225deg);
		transform: rotateZ(225deg);
	}
	.msg-item-self .msg-content,
	.msg-item-self .msg-content .msg-content-arrow {
		background-color: #4CD964;
		color: #fff;
		border-color: #2AC845;
	}
	footer .mui-icon {
		color: #000;
	}
	footer .mui-icon:active {
		color: #007AFF !important;
	}
	footer .mui-icon-paperplane:before {
		content: "发送";
	}
	footer .mui-icon-paperplane {
		/*-webkit-transform: rotateZ(45deg);
		transform: rotateZ(45deg);*/
		
		font-size: 16px;
		word-break: keep-all;
		line-height: 100%;
		padding-top: 6px;
		/*color: rgba(0, 135, 250, 1);*/
		color: #1799C5;
	}
	#msg-sound {
		-webkit-user-select: none !important;
		user-select: none !important;
	}
	.rprogress {
		position: absolute;
		left: 50%;
		top: 50%;
		width: 140px;
		height: 140px;
		margin-left: -70px;
		margin-top: -70px;
		background-image: url(../images/arecord.png);
		background-repeat: no-repeat;
		background-position: center center;
		background-size: 30px 30px;
		background-color: rgba(0, 0, 0, 0.7);
		border-radius: 5px;
		display: none;
		-webkit-transition: .15s;
	}
	.rschedule {
		background-color: rgba(0, 0, 0, 0);
		border: 5px solid rgba(0, 183, 229, 0.9);
		opacity: .9;
		border-left: 5px solid rgba(0, 0, 0, 0);
		border-right: 5px solid rgba(0, 0, 0, 0);
		border-radius: 50px;
		box-shadow: 0 0 15px #2187e7;
		width: 46px;
		height: 46px;
		position: absolute;
		left: 50%;
		top: 50%;
		margin-left: -23px;
		margin-top: -23px;
		-webkit-animation: spin 1s infinite linear;
		animation: spin 1s infinite linear;
	}
	.r-sigh{
		display: none;
		border-radius: 50px;
		box-shadow: 0 0 15px #2187e7;
		width: 46px;
		height: 46px;
		position: absolute;
		left: 50%;
		top: 50%;
		margin-left: -23px;
		margin-top: -23px;
		text-align: center;
		line-height: 46px;
		font-size: 40px;
		font-weight: bold;
		color: #2187e7;
	}
	.rprogress-sigh{
		background-image: none !important;
	}
	.rprogress-sigh .rschedule{
		display: none !important;
	}
	.rprogress-sigh .r-sigh{
		display: block !important;
	}
	.rsalert {
		font-size: 12px;
		color: #bbb;
		text-align: center;
		position: absolute;
		border-radius: 5px;
		width: 130px;
		margin: 5px 5px;
		padding: 5px;
		left: 0px;
		bottom: 0px;
	}
	@-webkit-keyframes spin {
		0% {
			-webkit-transform: rotate(0deg);
		}
		100% {
			-webkit-transform: rotate(360deg);
		}
	}
	@keyframes spin {
		0% {
			transform: rotate(0deg);
		}
		100% {
			transform: rotate(360deg);
		}
	}
	#h {
		background: #fff;
		border: solid 1px #ddd;
		padding: 10px !important;
		font-size: 16px !important;
		font-family: verdana !important;
		line-height: 18px !important;
		overflow: visible;
		position: absolute;
		left: -1000px;
		right: 0px;
		word-break: break-all;
		word-wrap: break-word;
	}
	.cancel {
		background-color: darkred;
	}
	.status-ok > p{/*符合*/
		/*color:green;*/
	}
	.status-error > p{/*不符合*/
		/*color: red;*/
	}
	.status-not > p{/*不适用*/
		/*color: red;*/
	}
	.result-checked{
		display: block;
	}
	.result-unchecked{
		display: none;
	}
	.nav-div{
		float: left;width: 33%;padding: 10px 5px;text-align: center;margin-top: 5px;color: #1799C5;font-size: 16px;
	}
	.navCountHighligh{
		 font-weight: 800;font-size: 18px;
	}
	.m-position{
		font-size: 10px;top: -8px;right:-4px;position: absolute;padding: 4px 8px;
		/*color:#fff;background-color:#007aff;*/				
	}
</style>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">填写检查单</h1>
		</header>
		
		<!--底部统计信息-->
		<nav id='navCount' class="mui-bar mui-bar-tab" style='background: white;'>
			<div id='showAllData' class='nav-div navCountHighligh'>
				总计：<span style="" id="totalStandardCount">0</span>
			</div>
			<div id="showErrorData" class='nav-div'>
				<span id="showErrorDataSpan">不符合：</span><span style="color: orangered" id="errorStandardCount">0</span>/<span style="color: #1799C5" id="finishStandardCount">0</span>						
			</div>
			<div id="showUncheckedData" class='nav-div'>
				<span id="showUncheckedDataSpan">未检查：</span><span style="color: orangered;" id="unfinishStandardCount">0</span>			
			</div>
		</nav>
		
		<!--记录remarks 处理换行问题时用到-->
		<pre id='h'></pre>
		<div class="mui-content">
			<div id='msg-list'>
				<!--任务说明-->
				<div id='instruction' style="padding:10px;background-color: white;word-wrap:break-word;margin-bottom: 10px;display: none;">
				</div>
				<!--列表-->
				<ul id="checkList" class="mui-table-view">
				</ul>
				
				<!--处理意见-->
				<div style=" width: 98%;margin:5px auto; padding:10px 10px 0px 5px;background-color: white;">
					<!--<div class="mui-h4">
						被检查人签字
					</div>-->
					<div style=" width: 100%;margin: 0px auto;">
					   <textarea style='border: 1px black solid;' id="billremark" rows="5" placeholder="请填写处理意见..." readonly="readonly"></textarea>	
					</div>
				</div>
				
				<!--签名-->
				<div style=" width: 98%;margin:10px auto;height:300px;padding:10px;background-color: white;">
					<div class="mui-h4">
						被检查人签字
					</div>
					
					<!--签名图片-->
					<div id="signed" style="width: 100%;margin: 10px auto;">
					    <img id='userSignature' width="100%" height="200px" style="border: 1px solid black;"/>
					</div>
					
				</div>
			</div>
		</div>
	<script>
	mui.init({ 
		gestureConfig:{  
			longtap: true //默认为false  
		} 
	}); 
       
	var billUuid = "${billUuid}";
	var origin = 0;// 来源：0：业务界面；1：任务中心
	template.config('escape', false);
	
   mui.ready(function() { 
		loadData();
   })
	
	// 关闭自身窗口
	function closeme(){
		//通知关闭上一个页面
		var createChecklist = plus.webview.getWebviewById("createChecklist.html");
		if(createChecklist){
			mui.fire(createChecklist, "closeSelf", {});
		}

		var ws=plus.webview.currentWebview();
		plus.webview.close(ws);
	}
	// 获取列表数据
	function loadData(){
		//var wait = plus.nativeUI.showWaiting('正在加载...');
		var params = {billUuid:billUuid};
		topUtil.web_query('/mobile/checklistbill/getBill',params,
			function (data){
				//wait.close();
				if (typeof data == "string") {
	                data = JSON.parse(data);
	            }
				var str = '';
				mui.each(data.obj,function (index,item) {
					str += '<li class="mui-table-view-cell mui-collapse">'+
						'<a class="mui-navigate-right" href="#">'+ item.name + '</a>'+
						'<div class="mui-collapse-content" style="padding: 0px 0px 0px 0px;">'+
						'<div class="mui-card" style="box-shadow: 0 3px 3px rgba(0,0,0,.3);margin-left: 20px;">';
					for(var n in item.children){ 
						var standard=item.children[n];
						str += '<div class="mui-card-content">'+
									'<div class="mui-card-content-inner" style="margin-left: 5px;">';
							if(standard.status=='0' ) { 
								str += '<div id="standardId_' + standard.id + '" class="mui-card-content-inner standard checked status-ok" style="padding:0px;padding-bottom:10px">'+
											'【检查标准】'+ standard.name +
										'</div>'+
										'<div id="standardId_result_' + standard.id + '" class="mui-card-content-inner result-checked" style="padding:0px;padding-bottom:10px">'+
											'检查结果：' + standard.remark +
										'</div>';
							} else if(standard.status=='1' ) {
								str += '<div id="standardId_' + standard.id +'" class="mui-card-content-inner standard checked status-error" style="padding:0px;padding-bottom:10px">'+
											'【检查标准】' + standard.name +
										'</div>'+
										'<div id="standardId_result_' + standard.id + '" class="mui-card-content-inner result-checked" style="padding:0px;padding-bottom:10px">'+
											'检查结果：' + standard.remark + 
										'</div>';
							} else if(standard.status=='2' ) {
								str += '<div id="standardId_' + standard.id +'" class="mui-card-content-inner standard" style="padding:0px;padding-bottom:10px">'+
											'【检查标准】' + standard.name +
										'</div>'+
										'<div id="standardId_result_' + standard.id + '" class="mui-card-content-inner result-unchecked" style="padding:0px;padding-bottom:10px">'+
											'检查结果：' + standard.remark +
										'</div>';
							} else if(standard.status=='3' ) { 
								str += '<div id="standardId_' + standard.id +'" class="mui-card-content-inner standard checked status-not" style="padding:0px;padding-bottom:10px">'+
											'【检查标准】' + standard.name +
										'</div>'+
										'<div id="standardId_result_' + standard.id +'" class="mui-card-content-inner result-checked" style="padding:0px;padding-bottom:10px">'+
											'检查结果：' + standard.remark +
										'</div>';
							} 
						str += '<hr style="margin-top:50px;margin-bottom:10px;">'+
							'</div>'+
						'</div>';
					}
					str += '</div>'+
						'</div>'+
					'</li>';
					});
				document.getElementById("checkList").innerHTML = str;
				changeCountData();
				
				var remark = $('#billremark').val(data.billEntity.remark);
				if(data.billEntity.instruction){
					$('#instruction').show();
					$('#instruction').html("任务说明："+data.billEntity.instruction);
				}
				var serverPath = dynamicURL + "/mobile/checklistbill/getBillSignature?billUuid="+billUuid;
				$("#userSignature").attr("src",serverPath);
				
				
			}
		);
		
	}
	// 修改统计数据 
	function changeCountData(){
		var totalStandardCount = $('#checkList .standard').length;
		var finishStandardCount = $('#checkList .checked').length;
		var errorStandardCount = $('#checkList .status-error').length;
		document.getElementById("totalStandardCount").innerHTML = totalStandardCount;
		document.getElementById("finishStandardCount").innerHTML = finishStandardCount;
		document.getElementById("unfinishStandardCount").innerHTML = totalStandardCount - finishStandardCount;
		document.getElementById("errorStandardCount").innerHTML = errorStandardCount;
	}
	
	//退回
	/* mui.back = function(event) {
		closeme();
		return false;
	}; */
	</script>
</body>
</html>