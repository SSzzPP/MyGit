<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--App自定义的css-->
<link rel="stylesheet" type="text/css" href="${staticURL}/css/app.css"/>
<!--sign-->
<link rel="stylesheet" href="${staticURL}/css/signature-pad.css">
<script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=j7qM5IwNzuxMxlZbosvGR6iz0rg8w1R3"></script>
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
	.mui-input-row label {
		width: 31%;
		font-size:16px;
	}
	.mui-input-row label~select{
		width: 69%;
		font-size:16px;
		text-align: right;
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
				<!-- 地图 -->
				<div style=" width: 98%;height:40%;margin:5px auto; padding:10px 10px 0px 5px;">
					<div id="container" style="height:100%;"></div>
				</div>
				<!-- 选择区域 -->
				<div class="mui-input-row" style=" width: 98%;margin:5px auto; padding:10px 10px 0px 5px;background-color: white;">
					<label>区域</label>
					<select id='userArea'>
					</select>
				</div>
				<!--处理意见-->
				<div style=" width: 98%;margin:5px auto; padding:10px 10px 0px 5px;background-color: white;">
					<!--<div class="mui-h4">
						被检查人签字
					</div>-->
					<div style=" width: 100%;margin: 0px auto;">
					   <textarea style='border: 1px black solid;' id="billremark" rows="5" placeholder="请填写处理意见..."></textarea>	
					</div>
				</div>
				
				<!--签名-->
				<div style=" width: 98%;margin:10px auto;height:300px;padding:10px;background-color: white;">
					<div class="mui-h4">
						被检查人签字
					</div>
					
					<!--签字-->
					<div id="sign" style=" width: 100%;height: 200px;margin: 10px auto;">
					    <canvas style="width: 100%;height: 100%;"></canvas>
					    <div style="float: right;margin-top:5px ;">
					    	<button type="button" class="mui-btn mui-btn-primary button clear" data-action="clear">清除</button>
					        <button id="draftBtn" type="button" class="mui-btn mui-btn-primary button clear" data-action="clear">草稿</button>
					        <button id="saveBtn" type="button" class="mui-btn mui-btn-primary button clear">保存提交</button>
					    </div>
					</div>
					
					<!--签名图片-->
					<div id="signed" style="display:none;width: 100%;margin: 10px auto;">
					    <img id='userSignature' width="100%" style="border: 1px solid black;"/>
					    <div style="float: right;">
					    	<button id="rewrite" type="button" class="mui-btn mui-btn-primary button clear">重新签名</button>
					    	<button id="draftBtn2" type="button" class="mui-btn mui-btn-primary button clear" data-action="clear">草稿</button>
					        <button id="saveBtn2" type="button" class="mui-btn mui-btn-primary button clear">保存提交</button>
					    </div>
					</div>
					
				</div>
			</div>
		</div>
		
		<!--文本输入框-->
		<footer id="footerMain" style='display:none;'>
			<!-- <div class="footer-left">
				<span class="mui-icon mui-icon-mic"></span>
				<i id='msg-rcognize' class="mui-icon mui-icon-mic-filled" style="font-size: 24px;color: #1799C5;"></i>
			</div> -->
			<div class="footer-center">
				<textarea id='msg-text' type="text" class='input-text' placeholder="请输入备注信息..."></textarea>
				<!--<button id='msg-sound' type="button" class='input-sound' style="display: none;">按住说话</button>-->
			</div>
			<label for="" class="footer-right">
				<!--<i id='msg-type' class="mui-icon mui-icon-mic"></i>-->
				<i id='msg-type' class="mui-icon mui-icon-mic mui-icon-paperplane"></i>
			</label>
		</footer>
	<script src="${staticURL}/js/sign/signature_pad.js"></script>
	<script src="${staticURL}/js/sign/app.js"></script>
	<script>
	mui.init({ 
		 gestureConfig:{  
		   longtap: true //默认为false  
		 } 
	}); 
	var billUuid = "${billUuid}";
	//var origin = 0;// 来源：0：业务界面；1：任务中心
	var focus = false;
	var boxMsgText = document.getElementById("msg-text");//输入框
	var msgRcognize = document.getElementById("msg-rcognize");// 语音输入
	var btnMsgType = document.querySelector('#msg-type');// 输入框右边 - 类型
	var footerRight = document.querySelector('.footer-right');// 输入框右边整体 
	var footerLeft = document.querySelector('.footer-left');// 输入框左边整体 
	var footer = document.querySelector('footer');
	var msgList = document.querySelector('#msg-list');//
	var h = document.querySelector('#h');//
	var content = document.querySelector('.mui-content');// 整个页面
	template.config('escape', false);
	
	 mui.ready(function() { 
		loadData();
     })
   
   // 创建地图实例  
	var map = new BMap.Map("container");
	var point = new BMap.Point(120.376729, 36.119803);//市北区中心点
	map.centerAndZoom(point,16);
  
  	//加载地图填充区域样式
	var polygonStyleOptions = {
		strokeColor : "#000", //边线颜色  
		fillColor : "#f3f0e9", //填充颜色。当参数为空时，圆形将没有填充效果。  
		strokeWeight : 3, //边线的宽度，以像素为单位。 
		strokeOpacity : 0.8, //边线透明度，取值范围0 - 1。  
		fillOpacity : 0.5, //填充的透明度，取值范围0 - 1。  
		strokeStyle : "solid" //边线的样式，solid或dashed。 
	};
   //加载地图巡查路线样式
	var polylineStyleOptions = {
		strokeColor : "red", //边线颜色  
		fillColor : "red", //填充颜色。当参数为空时，圆形将没有填充效果。  
		strokeWeight : 3, //边线的宽度，以像素为单位。 
		strokeOpacity : 0.8, //边线透明度，取值范围0 - 1。  
		fillOpacity : 0.6, //填充的透明度，取值范围0 - 1。  
		strokeStyle : "solid" //边线的样式，solid或dashed。 
	};
	var mk = '';
	var sortNumber = 0;
	getGps();
	setInterval(function() { 
		getGps();
	}, 10000);
  //加载负责区域
  topUtil.web_query('/mobile/map/area/searchAreas',{},
		function (data){
			if (typeof data == "string") {
              data = JSON.parse(data);
           }
			for (var i = 0; i < data.length; i++) {
				$("#userArea").append("<option  value='"+data[i].id+"'>"+data[i].areaName+"</option>");
			}
			if(data.length > 0)
				getLine(data[0].id);
			$("select#userArea").change(function(){
				getLine($(this).val());
			});
		}
	);
	
	document.getElementById('rewrite').addEventListener('tap', function() {
		$("#sign").show();
		$("#signed").hide();
		resizeCanvas(); 
	});
	
	// 保存签名草稿
	document.getElementById('draftBtn').addEventListener('tap', _.debounce(function() {
	    saveDraftData();
	},waitTime,true));
	
	// 保存签名草稿
	document.getElementById('draftBtn2').addEventListener('tap', function() {
	    saveDraftData();
	});
	
	// 保存签名
	document.getElementById('saveBtn').addEventListener('tap', _.debounce(function() {
		saveData();
	},waitTime,true));
	
	// 保存签名2
	document.getElementById('saveBtn2').addEventListener('tap', function() {
		saveData2();
	});
	
	function saveDataAjax(params,flag){
		params.areaId = $("#userArea").val();
		if(flag==0){
			$("#draftBtn").html('保存中···');
			$("#draftBtn").attr("disabled",true);
		}else if(flag==1){
			$("#saveBtn").html('保存中···');
			$("#saveBtn").attr("disabled",true);
		}
		topUtil.web_query('/mobile/checklistbill/saveSignature',params,
				 function (data){
					//plus.nativeUI.closeWaiting();
					if (typeof data == "string") {
		               data = JSON.parse(data);
		            }
					if(data.success){
						mui.alert("保存成功！",function () {
							mui.back();
							/* if(flag==0){// 草稿
								plus.webview.currentWebview().reload();
							}else{
								closeme();	
							} */
						});
						if(flag==0){
							$("#draftBtn").html('草稿');
							$("#draftBtn").attr("disabled",false);
						}else if(flag==1){
							$("#saveBtn").html('保存提交');
							$("#saveBtn").attr("disabled",false);
						}
					}else{
						mui.toast('保存失败！');
						if(flag==0){
							$("#draftBtn").html('草稿');
							$("#draftBtn").attr("disabled",false);
						}else if(flag==1){
							$("#saveBtn").html('保存提交');
							$("#saveBtn").attr("disabled",false);
						}
					}
				}
			)
	}
	
	function saveData2(){
		var totalStandardCount = $('#checkList .standard').length;
		var okStandardCount = $('#checkList .status-ok').length;
		var restCount = $('#unfinishStandardCount').html();
		if(restCount > 0){
			mui.toast("还有"+restCount+"条未检查完！");
			return;
		}
      var remark = $('#billremark').val();
      if(remark == ''){// 都符合：无，不符合或者不适用：将相关情况通过《隐患整改通知单》下发
      		if(okStandardCount == totalStandardCount){
      			remark = '无';
      		}else{
      			remark = '将相关情况通过《隐患整改通知单》下发';
      		}
      }
      var params = {billUuid:billUuid,remark:remark,status:1};
	   saveDataAjax(params,1);
	}
	
	function saveData(){
		var totalStandardCount = $('#checkList .standard').length;
		var okStandardCount = $('#checkList .status-ok').length;
		var restCount = $('#unfinishStandardCount').html();
		if(restCount > 0){
			mui.toast("还有"+restCount+"条未检查完！");
			return;
		}
		if (signaturePad.isEmpty()) {
	        mui.toast('请签名！');
	        return;
	    } else {
	       var remark = $('#billremark').val();
	       if(remark == ''){// 都符合：无，不符合或者不适用：将相关情况通过《隐患整改通知单》下发
	       		if(okStandardCount == totalStandardCount){
	       			remark = '无';
	       		}else{
	       			remark = '将相关情况通过《隐患整改通知单》下发';
	       		}
	       }
	       var tempImg = document.createElement("img");
	       var base64Str;
	       tempImg.onload = function() {
		       	var width = tempImg.width,height = tempImg.height;
				var scale = width / height;
				width1 = 300;
				height1 = parseInt(width1 / scale);

				var canvas = document.createElement("canvas");
				canvas.width = width1; 
				canvas.height = height1;
				var ctx = canvas.getContext('2d');
				
				ctx.fillStyle = "#fff"; // 填充背景色
		        ctx.fillRect(0, 0, canvas.width, canvas.height);
		        
				ctx.drawImage(tempImg,0,0,width1,height1);
			    base64Str = canvas.toDataURL("image/jpeg",0.8);
			    //plus.nativeUI.showWaiting("保存中....");
		    	
			    var params = {base64Str:base64Str,billUuid:billUuid,remark:remark,status:1};
				saveDataAjax(params,1);
	       };
	  	   tempImg.src = signaturePad.toDataURL(); 
	    };
	}
	
	function saveDraftData(){
		var remark = $('#billremark').val();
		var params = {billUuid:billUuid,remark:remark,status:0};
       if(!signaturePad.isEmpty()){
       	var base64Str;
       	var tempImg = document.createElement("img");
	        tempImg.onload = function() {
		       	var width = tempImg.width,height = tempImg.height;
				var scale = width / height;
				width1 = 300;
				height1 = parseInt(width1 / scale);

				var canvas = document.createElement("canvas");
				canvas.width = width1; 
				canvas.height = height1;
				var ctx = canvas.getContext('2d');
				
				ctx.fillStyle = "#fff"; // 填充背景色
		        ctx.fillRect(0, 0, canvas.width, canvas.height);
		        
				ctx.drawImage(tempImg,0,0,width1,height1);
			    base64Str = canvas.toDataURL("image/jpeg",0.8);
				//plus.nativeUI.showWaiting("保存中....");
			   
				if(!signaturePad.isEmpty()){// 没签名不保存签名
					params.base64Str = base64Str;
				}
				saveDataAjax(params,0);
	       };
	  	   tempImg.src = signaturePad.toDataURL();
       }else{
       	saveDataAjax(params,0);
       }
	}
	
	// 关闭自身窗口
	function closeme(){
		//通知关闭上一个页面
		var createChecklist = plus.webview.getWebviewById("createChecklist.html");
		if(createChecklist){
			mui.fire(createChecklist, "closeSelf", {});
		}
//			// 列表页面 重新加载 
//			var serurityAssuranceList = plus.webview.getWebviewById("serurityAssuranceList.html");
//			if(serurityAssuranceList){
//				mui.fire(serurityAssuranceList, "reload", {});
//			}
//			
//			var newsPage = plus.webview.getWebviewById("news.html");
//      	if(newsPage){
//      		mui.fire(newsPage, "reload", {});
//      	}
//			if(origin == 0){
//				
//			}else{
//				var taskList = plus.webview.getWebviewById("taskList.html");
//				mui.fire(taskList, "reload", {});
//			}
		
		var ws=plus.webview.currentWebview();
		plus.webview.close(ws);
	}
	var files = [];
	var imageIndex = 0;
	// 跳转到上传图片界面
   function toUpload(standardId,obj){
   	var imageIndex = 1;
   	
		//上传图片
		var serverPath = window.constants.getServerPath();
			
   	var btnArray = [{
			title: "拍照"
		}, {
			title: "从相册选择"
		}, {
			title: "已上传凭证"
		}];
		plus.nativeUI.actionSheet({
			title: "选择凭证",
			cancel: "取消",
			buttons: btnArray
		}, function(e) {
			var index = e.index;
			switch (index) {
				case 0:
					break;
				case 1:
//						takePhoto();// 拍照
					var cmr = plus.camera.getCamera();
					cmr.captureImage(function(path) {
						var filePath = 	"file://" + plus.io.convertLocalFileSystemURL(path);
						compressImage(filePath,function(){
							selectAndSend(serverPath+"/mobile/checklistbillfile/saveAndUpload",
							{images: files,billUuid:billUuid,standardId:standardId+""},obj);
						});
					}, function(err) {});
					break;
			 	case 2:
					plus.gallery.pick(function(e) {
						for(var i in e.files){
					    	compressImage(e.files[i],function(imageIndex){
					    		if(imageIndex == e.files.length){
					    			selectAndSend(serverPath+"/mobile/checklistbillfile/saveAndUpload",
					    			{images: files,billUuid:billUuid,standardId:standardId+""},obj);
					    		}
					    	});
				    	}
					}, function(err) {}, {filter:"image",multiple:true,maximum:3,system:false,onmaxed:function(){
						plus.nativeUI.alert('最多只能选择3张图片');
				    }});
				    break;
			    case 3:
					mui.openWindow({
					    url: 'uploadImage.html', 
					    show:{
					      autoShow:true,// 加载完毕显示页面
					      aniShow:"slide-in-right"
					    },
					     waiting:{
					      autoShow:true,//自动显示等待框，默认为true
					      title:'页面跳转中...'//等待对话框上显示的提示内容
				      	},
				      	extras:  { 
				      		billUuid:billUuid,
				      		standardId:standardId
					    }
			  		});	
					break;
			}
			//uploadImages.clearForm();
		});
//	    	
   }
   
  	function compressImage(path,successCB){
		var name = path.substr(path.lastIndexOf('/') + 1);
		plus.zip.compressImage({
			src: path,
			dst: '_doc/' + name,
			overwrite: true,
			quality: 50,
			width:'1024px'
		}, function(zip) {
			files.push({name:"images"+imageIndex,path:zip.target});
			imageIndex++;
			console.log("compressImage-files"+files[0].path);
			successCB(imageIndex);
		}, function(zipe) {
			mui.toast('压缩失败！')
		});
	}
  	
  	function selectAndSend(urlStr,content,obj) {
		var uploader = plus.uploader.createUpload(urlStr, {
				method: 'POST'
			}, function(upload, status) {
				plus.nativeUI.closeWaiting();
				files = [];
				imageIndex=0;
				if(status==200){
					var data = JSON.parse(upload.responseText);
					//上传成功，重置表单
					if (data.success) {
						mui.alert("上传成功","凭证上传","确定",function () {});
						
						// 上传成功，手动添加数字
						var addNum = content.images.length;
						if($(obj).children('.mui-badge').length > 0){// 已经存在角标
							var badgeNum = $(obj).children('.mui-badge').html();
							$(obj).children('.mui-badge').html(parseInt(badgeNum)+addNum);
						}else{// 第一次上传
							var badge = "<span class='mui-badge mui-badge-primary m-position' style='background-color: #1799C5;font-size: 10px;'>"+addNum+"</span>";
							$(badge).appendTo(obj);
						}
//							window.location.reload();
					}else{
						mui.alert(data.errorMsg+"上传失败","凭证上传","确定",function () {});
					}
				}else{
					mui.alert("上传失败","凭证上传","确定",function () {});
				}
				
			});
		//添加上传数据
		mui.each(content, function(index, element) {
			console.log(index);
			if (index !== 'images') {
				console.log("addData:"+index+","+element);
				uploader.addData(index, element)
			}
		});
		console.log("selectAndSend-files"+files.toString());
		mui.each(content.images, function(index, element) {
			var f = content.images[index];
			console.log("addFile:"+JSON.stringify(f));
			uploader.addFile(f.path, {key: f.name});
		});
		uploader.setRequestHeader("sessionId", constants.getSettings().sessionId);
		//开始上传任务
		uploader.start();
		plus.nativeUI.showWaiting();
	};
   
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
								/* if(standard.pictureCount != 0 ) {
									str += '<button style="float: right;margin-right: 0px;background-color: #DDDDDD;" onclick="toUpload(' + standard.id + ',this)">上传凭证<span class="mui-badge mui-badge-primary m-position">' + standard.pictureCount +'</span></button>';
								}else{ 
									str += '<button style="float: right;margin-right: 0px;background-color: #DDDDDD;" onclick="toUpload(' + standard.id + ',this)">上传凭证</button>';
								} */
								str += '<button style="float: right;margin-right: 5px;background-color: #DDDDDD;" onclick="popRemark(3,' + standard.id + ',this)">不适用</button>';
								if(standard.notFitCount!=0 ) { 
									str += '<button id="' + standard.id + '" class="standardId_' + standard.id +' longtap" style="float: right;margin-right: 5px;background-color: #DDDDDD;" onclick="popRemark(1,' + standard.id + ',this)">不符合<span class="mui-badge mui-badge-primary m-position">' + standard.notFitCount + '</span></button>';
								}else{
									str += '<button class="standardId_' + standard.id +'" style="float: right;margin-right: 5px;background-color: #DDDDDD;" onclick="popRemark(1,' + standard.id + ',this)">不符合</button>';
								}
								str += '<button style="float: right;margin-right: 5px;background-color: #DDDDDD;" onclick="popRemark(0,' + standard.id + ',this)">符合</button>';
							} else if(standard.status=='1' ) {
								str += '<div id="standardId_' + standard.id +'" class="mui-card-content-inner standard checked status-error" style="padding:0px;padding-bottom:10px">'+
											'【检查标准】' + standard.name +
										'</div>'+
										'<div id="standardId_result_' + standard.id + '" class="mui-card-content-inner result-checked" style="padding:0px;padding-bottom:10px">'+
											'检查结果：' + standard.remark + 
										'</div>';
								/* if(standard.pictureCount!=0 ) { 
									str += '<button class="mui-btn mui-btn-primary" style="float: right;margin-right: 0px;" onclick="toUpload(' + standard.id + ',this)">上传凭证<span class="mui-badge mui-badge-primary m-position">' + standard.pictureCount + '</span></button>';
								}else{
									str += '<button class="mui-btn mui-btn-primary" style="float: right;margin-right: 0px;" onclick="toUpload(' + standard.id + ',this)">上传凭证</button>';
								} */
								str += '<button style="float: right;margin-right: 5px;background-color: #DDDDDD;" onclick="popRemark(3,' + standard.id +',this)">不适用</button>';
								if(standard.notFitCount!=0 ) {
									str += '<button id="' + standard.id + '" class="standardId_' + standard.id + ' longtap" style="float: right;margin-right: 5px;background-color: red;color: white;" onclick="popRemark(1,' + standard.id +',this)">不符合<span class="mui-badge mui-badge-primary m-position">' + standard.notFitCount + '</span></button>';
								}else{
									str += '<button class="standardId_' + standard.id +'" style="float: right;margin-right: 5px;background-color: red;color: white;" onclick="popRemark(1,' + standard.id +',this)">不符合</button>';
								} 
								str += '<button style="float: right;margin-right: 5px;background-color: #DDDDDD;" onclick="popRemark(0,' + standard.id +',this)">符合</button>';
							} else if(standard.status=='2' ) {
								str += '<div id="standardId_' + standard.id +'" class="mui-card-content-inner standard" style="padding:0px;padding-bottom:10px">'+
											'【检查标准】' + standard.name +
										'</div>'+
										'<div id="standardId_result_' + standard.id + '" class="mui-card-content-inner result-unchecked" style="padding:0px;padding-bottom:10px">'+
											'检查结果：' + standard.remark +
										'</div>';
								/* if(standard.pictureCount!=0 ) {
									str += '<button class="mui-btn mui-btn-primary" style="float: right;margin-right: 0px;" onclick="toUpload(' + standard.id + ',this)">上传凭证<span class="mui-badge mui-badge-primary m-position" style="background-color: #1799C5;font-size: 10px;">' + standard.pictureCount + '</span></button>';
								}else{
									str += '<button class="mui-btn mui-btn-primary" style="float: right;margin-right: 0px;" onclick="toUpload(' + standard.id +',' + standard.id + ',this)">上传凭证</button>';
								}  */
								str += '<button style="float: right;margin-right: 5px;" onclick="popRemark(3,' + standard.id +',this)">不适用</button>';
								if(standard.notFitCount!=0 ) {
									str += '<button id="' + standard.id + '" class="standardId_' + standard.id +' longtap" style="float: right;margin-right: 5px;" onclick="popRemark(1,' + standard.id + '+,this)">不符合<span class="mui-badge mui-badge-primary m-position">' + standard.notFitCount + '</span></button>';
								}else{
									str += '<button class="standardId_' + standard.id + '" style="float: right;margin-right: 5px;" onclick="popRemark(1,' + standard.id +',this)">不符合</button>';
								}
								str += '<button style="float: right;margin-right: 5px;" onclick="popRemark(0,' + standard.id +',this)">符合</button>';
							} else if(standard.status=='3' ) { 
								str += '<div id="standardId_' + standard.id +'" class="mui-card-content-inner standard checked status-not" style="padding:0px;padding-bottom:10px">'+
											'【检查标准】' + standard.name +
										'</div>'+
										'<div id="standardId_result_' + standard.id +'" class="mui-card-content-inner result-checked" style="padding:0px;padding-bottom:10px">'+
											'检查结果：' + standard.remark +
										'</div>';
								/* if(standard.pictureCount!=0 ) {
									str += '<button style="float: right;margin-right: 0px;background-color: #DDDDDD;" onclick="toUpload(' + standard.id + ',this)">上传凭证<span class="mui-badge mui-badge-primary m-position">' + standard.pictureCount + '</span></button>';
								}else{
									str += '<button style="float: right;margin-right: 0px;background-color: #DDDDDD;" onclick="toUpload(' + standard.id + ',this)">上传凭证</button>';
								} */
								str += '<button style="float: right;margin-right: 5px;background-color: #DDDDDD;" onclick="popRemark(3,' + standard.id +',this)">不适用</button>';
								if(standard.notFitCount!=0 ) {
									str += '<button id="' + standard.id + '" class="standardId_' + standard.id + ' longtap" style="float: right;margin-right: 5px;background-color: #DDDDDD;" onclick="popRemark(1,' + standard.id +',this)">不符合<span class="mui-badge mui-badge-primary m-position">' + standard.notFitCount + '</span></button>';
								}else{
									str += '<button class="standardId_' + standard.id +'" style="float: right;margin-right: 5px;background-color: #DDDDDD;" onclick="popRemark(1,' + standard.id + ',this)">不符合</button>';
								} 
								str += '<button style="float: right;margin-right: 5px;background-color: #DDDDDD;" onclick="popRemark(0,' + standard.id + ',this)">符合</button>';
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
				if(data.billEntity.signatureImage != null && data.billEntity.signatureImage != ""){
					$('#sign').hide();
					$('#signed').show();
					$("#userSignature").attr("src",dynamicURL + '/mobile/checklistbill/showImage?uuid=' + data.billEntity.uuid);
				}else{
					$('#signed').hide();
					$('#sign').show();
				}
			});
	}
	
	// 弹出填写 remarks
	var public_status,public_standardId,public_btnEle;
	function popRemark(status,standardId,btnEle){
//			var params = {'status':status,'standardId':standardId,'btnEle':btnEle};
		public_status = status;
		public_standardId = standardId;
		public_btnEle = btnEle;
		if(status == 0){// 安保直接提交
			saveResult('符合。');
		}else{
			boxMsgText.value = '';
			$("#navCount").hide();
			$("#footerMain").show();
			boxMsgText.focus();
			focus = true;
		}
	}
	
	// 点击保存 // 修改状态	'0符合,1不符合,2未检查,3不适用'
	footerRight.addEventListener('tap',function (event) {
		var remark = '';
		if(public_status == 1){
			remark = boxMsgText.value == ''?'不符合。':'不符合。'+boxMsgText.value;
//				remark = boxMsgText.value;
		}else if(public_status == 3){
			remark = boxMsgText.value == ''?'不适用。':'不适用。'+boxMsgText.value;
		}
		saveResult(remark);
	})
	
	function saveResult(remark){
		//var wait = plus.nativeUI.showWaiting('保存中...');
		var params = {'billUuid':billUuid,'status':public_status,'standardId':public_standardId,'remark':remark};
		topUtil.web_query('/mobile/checklistBillDetail/changeStandardStatus',params,
			function (data){
				//wait.close();
				//plus.nativeUI.closeWaiting();
				if (typeof data == "string") {
	                data = JSON.parse(data);
	            }
				if (data.success) {
					closeKeyboard();
	                mui.toast('处理成功！');
	                changeStyleAndCount(params);
	                content.style.paddingBottom = footer.style.height = '51px';
	            } else {
	                mui.toast('处理失败！');
	            }
			}
		);
	}
	
	// 修改样式和底部数据统计
	function changeStyleAndCount(params){
		// 修改样式
		changeStyle(params);
		// 修改统计数据 
		changeCountData();
	}
	// 修改样式
	function changeStyle(params){
		var standard = document.getElementById("standardId_" + public_standardId);
		var result = document.getElementById("standardId_result_"+public_standardId);
		var status = params.status;
		var remark = params.remark;
		// 按钮变色
		if(status != 1){
			$(standard).nextAll('button').css('background-color','#DDDDDD');
			$(standard).nextAll('button').css('color','#1799C5');// #1799C5
			$(standard).nextAll('button').removeClass('mui-btn mui-btn-primary');
		}else{// 不符合
			$(standard).nextAll('button').css('background-color','#DDDDDD');
			$(standard).nextAll('button').css('color','#1799C5');
			$(standard).nextAll('button').removeClass('mui-btn mui-btn-primary');
			// 不符合按钮
			$(".standardId_" + public_standardId).css('background-color','red');
			$(".standardId_" + public_standardId).css('color','white');
		}
		// 添加检查标识
		if(standard.className.indexOf('checked') == -1){
			standard.className = standard.className + " checked";
		}
		//不是未检查
		if(status!=2){
			//正常
			$(standard).removeClass('status-ok');
			$(standard).removeClass('status-error');
			$(standard).removeClass('status-not');
			if(status==0){
			 	$(standard).addClass('status-ok');
			}else if(status==1){
				$(standard).addClass('status-error');
			}else if(status==3){
				$(standard).addClass('status-not');
			}
		}
		$(result).removeClass('result-unchecked');
		$(result).addClass('result-checked');
		$(result).html("检查结果："+remark+"") ;
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
	
	//点击页面空白处，关闭键盘
	msgList.addEventListener('tap',function (event) {
		if(focus){
			closeKeyboard();
		}
	})
	
	// 收起键盘
	function closeKeyboard(){
		boxMsgText.blur();
		$("#footerMain").hide();
		$("#navCount").show();
		focus = false;
	}
	
	// 监听input输入:换行显示问题
	boxMsgText.addEventListener('input', function(event) {
		changeRemarkPadding();
	});

	function changeRemarkPadding(){
		var footerPadding = footer.offsetHeight - boxMsgText.offsetHeight;
		h.style.width = boxMsgText.offsetWidth + 'px';
		h.innerText = boxMsgText.value.replace(new RegExp('\n', 'gm'), '\n-') || '-';

		footer.style.height = (h.offsetHeight + footerPadding) + 'px';

		content.style.paddingBottom = footer.style.height;
	}
	
	//退回
	/* mui.back = function(event) {
		mui.confirm('检查单还没完成,确定离开？','',function(e) {
			if(e.index==1){
				if(origin == 0){
					closeme();
//						//通知关闭上一个页面
//						var createChecklist = plus.webview.getWebviewById("createChecklist.html");
//						mui.fire(createChecklist, "closeSelf", {});
				}
				
				var ws=plus.webview.currentWebview();
				plus.webview.close(ws);
			}
		});
		return false;
	}; */
	
	// 已检查按钮点击
	var toggleFlag = true;
	document.getElementById('showErrorData').addEventListener('tap',function () {
//			if(toggleFlag){
//				toggleFlag = false;
			$("#showErrorDataSpan").text("不符合：");
			$(".standard").parent().hide();
//				$(".standard").parent().parent().hide();
//				$(".standard").parent().parent().parent().hide();
//				$(".standard").parent().parent().parent().prev('div').hide();
//				$(".standard").parent().parent().parent().parent().parent().hide();
			
			$(".status-error").parent().show();
//				$(".status-error").parent().parent().show();
//				$(".status-error").parent().parent().parent().show();
//				$(".status-error").parent().parent().parent().prev('div').show();
//				$(".status-error").parent().parent().parent().parent().parent().show();
//				console.log($(".status-error").parent().parent().parent().parent().prev('a').html());
//			}else{
//				toggleFlag = true;
//				$("#showErrorDataSpan").text("已检查：");
//				$(".standard").parent().show();
//				$(".standard").parent().parent().show();
//				$(".standard").parent().parent().parent().show();
//				$(".standard").parent().parent().parent().prev('div').show();
//				$(".standard").parent().parent().parent().parent().parent().show();
//			}
		
		$('#showUncheckedData').removeClass('navCountHighligh');
		$('#showAllData').removeClass('navCountHighligh');
		$(this).addClass('navCountHighligh');
	})
	
	// 未检查按钮点击
	var toggleFlag2 = true;
	document.getElementById('showUncheckedData').addEventListener('tap',function () {
		toggleFlag2 = false;
//				$("#showUncheckedDataSpan").text("：");
		$(".standard").parent().hide();
//			$(".standard").parent().parent().hide();
//			$(".standard").parent().parent().parent().hide();
//			$(".standard").parent().parent().parent().prev('div').hide();
//			$(".standard").parent().parent().parent().parent().parent().hide();
		
		$(".result-unchecked").parent().show();
//			$(".result-unchecked").parent().parent().show();
//			$(".result-unchecked").parent().parent().parent().show();
//			$(".result-unchecked").parent().parent().parent().prev('div').show();
//			$(".result-unchecked").parent().parent().parent().parent().parent().show();
//				console.log($(".status-error").parent().parent().parent().parent().prev('a').html());

		$(this).addClass('navCountHighligh');
		$('#showAllData').removeClass('navCountHighligh');
		$('#showErrorData').removeClass('navCountHighligh');
	})
	
	// 全部按钮点击
	document.getElementById('showAllData').addEventListener('tap',function () {
		toggleFlag2 = true;
//				$("#showUncheckedDataSpan").text("已检查：");
		$(".standard").parent().show();
//			$(".standard").parent().parent().show();
//			$(".standard").parent().parent().parent().show();
//			$(".standard").parent().parent().parent().prev('div').show();
//			$(".standard").parent().parent().parent().parent().parent().show();
		
		$(this).addClass('navCountHighligh');
		$('#showUncheckedData').removeClass('navCountHighligh');
		$('#showErrorData').removeClass('navCountHighligh');
	})
	
	// 语音输入
/* 	footerLeft.addEventListener('tap',function (event) {
		if(plus.os.name=='Android'&&navigator.userAgent.indexOf('StreamApp')>0){
			plus.nativeUI.toast('当前环境暂不支持语音识别插件');
			return;
		}
		var options = {};
		options.engine = 'iFly';
//				outSet( "开始语音识别：" );
		boxMsgText.blur();
		plus.speech.startRecognize( options, function ( s ) {
//					outLine( s );
			boxMsgText.value = boxMsgText.value + s;
			
			changeRemarkPadding();
		}, function ( e ) {
			plus.nativeUI.toast("语音识别失败："+e.message );
//					outSet("语音识别失败："+e.message );
		} );
	}); */
	//加载区域和路线
	function getLine(areaId){
		var params = {id: areaId};
		topUtil.web_query("/mobile/map/area/detail",params,function(data){
			if (typeof data == "string") {
               data = JSON.parse(data);
			}
			if(data.success){
				//将先前绘制的区域显示在地图上
				var points = data.obj.points.split("_");
				var boundaryArr=[];//多边形顶点数组
				for(var i =0;i<points.length;i++){
					var p = points[i].split(",");
					var bp=new BMap.Point(p[0], p[1]);
					boundaryArr.push(bp);
				}
				var ply = new BMap.Polygon(boundaryArr,polygonStyleOptions); //建立多边形覆盖物
				map.addOverlay(ply); //添加覆盖物 
				map.setViewport(ply.getPath()); //调整视野
				//将先前绘制的线显示在地图上
				if(data.obj.linePoints){
					var linePoints = data.obj.linePoints.split("_");
					var boundaryArr1=[];//线路点数组
					for(var i =0;i<linePoints.length;i++){
						var p = linePoints[i].split(",");
						var bp=new BMap.Point(p[0], p[1]);
						boundaryArr1.push(bp);
					}
					var ply1 = new BMap.Polyline(boundaryArr1,polylineStyleOptions); //建立多边形覆盖物
					map.addOverlay(ply1); //添加覆盖物 
				}
			}else{
				mui.toas("获取区域信息失败！", {icon: 0});
			}
		});
		map.clearOverlays();
		getGps();
	}
   function getGps(){
   	var geolocation = new BMap.Geolocation();
	    geolocation.getCurrentPosition(function(r){
	    	//console.log(r.point)
	        if(this.getStatus() == BMAP_STATUS_SUCCESS){
	        	map.removeOverlay(mk);
	            mk = new BMap.Marker(r.point);
	            map.addOverlay(mk);//标出所在地
	            map.panTo(r.point);//地图中心移动
	            //console.log('您的位置：'+r.point.lng+','+r.point.lat);
	            var point = new BMap.Point(r.point.lng,r.point.lat);//用所定位的经纬度查找所在地省市街道等信息
	           //boundaryArr.push(new BMap.Point(120.376729, 36.119803));
	            //boundaryArr.push(point);
	            //var ply1 = new BMap.Polyline(boundaryArr,polylineStyleOptions); //建立多边形覆盖物
				//map.addOverlay(ply1); //添加覆盖物
				//ply1.disableMassClear();
				sortNumber++;
				var params={'billUuid':billUuid,'lng':r.point.lng,'lat':r.point.lat,'sortNumber':sortNumber};
				uploadGps(params);
	        }else {
	            alert('failed'+this.getStatus());
	        }        
	    },{enableHighAccuracy: true, maximumAge: 0})
   }
   function uploadGps(params){
   	topUtil.web_query('/mobile/checklistbillgps/saveInfo',params,
			function (data){
				//console.log(data);
	            if (typeof data == "string") {
	                data = JSON.parse(data);
	            }
	            if (data.success) {
	            } else {
	                mui.toast('上传gps失败');
	            }
			}
		);
   }
	</script>
</body>
</html>