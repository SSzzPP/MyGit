<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>聊天窗口</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<link rel="stylesheet" type="text/css" href="${staticURL}/css/feedback.css" />
		<link rel="stylesheet" type="text/css" href="${staticURL}/css/mui.imageviewer.css" />
		<script src="${staticURL}/js/mui.imageViewer.js"></script>
		<script src="${staticURL}/js/mui.previewimage.js"></script>
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
				padding: 50px 0px 40px 0px;
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
				border-radius: 5px;
				vertical-align: top;
				text-align: center;
				float: left;
				padding: 3px;
				color: #ddd;
			}
			
			.msg-item .msg-user-img{
				width: 50px;
				display: inline-block;
				border-radius: 4px;
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
				margin: 7px 8px;
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
			.msg-item-self .msg-user-img,
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
				color: rgba(0, 135, 250, 1);
			}
			#record {
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
			.layui-upload-file {
			    display: none!important;
			    opacity: .01;
			    filter: Alpha(opacity=1);
			}
		</style>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title" id="chatHeader">聊天窗口</h1>
	</header>
	<pre id='h'></pre>
	<div class="mui-content">
		<div id='msg-list'>
		</div>
	</div>
	<footer>
		<div class="footer-left">
			<div class="image-item space" id="uploadImg">
				<div class="image-up"></div>
				<div class="file"></div>
				<i id='msg-image' class="mui-icon mui-icon-camera image-up" style="font-size: 28px;"></i>
			</div>
		</div>
		<div class="footer-center">
			<textarea id='msg-text' type="text" class='input-text'></textarea>
			<button id='record' type="button" class='input-sound' style="display: none;">按住说话</button>
		</div>
		<label for="" class="footer-right">
			<i id='msg-type' class="mui-icon mui-icon-mic"></i>
		</label>
	</footer>
	<div id='sound-alert' class="rprogress">
		<div class="rschedule"></div>
		<div class="r-sigh">!</div>
		<div id="audio_tips" class="rsalert">手指上滑，取消发送</div>
	</div>
	<script type="text/javascript" charset="utf-8">
			(function($, doc) {
				var MIN_SOUND_TIME = 800;
				//是否取消了发送  
				var recordCancelFlag = false;
				$.init({
					gestureConfig: {
						tap: true, //默认为true
						doubletap: true, //默认为false
						longtap: true, //默认为false
						swipe: true, //默认为true
						drag: true, //默认为true
						hold: true, //默认为false，不监听
						release: true //默认为false，不监听
					}
				});
				template.config('escape', false);
				var socket = io("${hostStr}");  //本地windows测试环境
				if(mui.os.ios){
					// 解决在ios上fixed元素focusin时位置出现错误的问题 
					document.addEventListener('DOMContentLoaded',function(){
						var footerDom = document.querySelector('footer');
						
						document.addEventListener('focusin', function() {
							footerDom.style.position = 'absolute';
						});
						document.addEventListener('focusout', function() {
							footerDom.style.position = 'fixed';
						});
					});
				}
				

				$.ready(function() {
					//var self = plus.webview.currentWebview();
					var userId = '${userId}';
					//console.log(userId);
					var userName = '${userName}';
					document.getElementById('chatHeader').innerHTML = "正在与" + userName + "聊天";
					var record = [];
					var lastTime = null;
					var loadChatMessage = function(userId){
						var params = {recvUserId:userId};
						topUtil.web_query('/mobile/chatmessage/searchMessageContent', params,
							function (data) {
							console.log(data)
								/* if (typeof data == "string") {
									data = JSON.parse(data);imageViewer
								} */
								if(data.success){
									record = data.chatMessageEntities;
									mui.each(record, function (index, item) {
										if(item.sendUserId != userId) {
											item.sender = "self";
										}
									})
									bindMsgList();
									if(lastTime == null || lastTime < data.lastTime) {
										lastTime = data.lastTime;
										bindMsgList();
									}
								}
							}
						);
					}
					loadChatMessage(userId);
					// setInterval(function(){loadChatMessage(userId)},10000000);
					var ui = {
						body: doc.querySelector('body'),
						footer: doc.querySelector('footer'),
						footerRight: doc.querySelector('.footer-right'),
						footerLeft: doc.querySelector('.footer-left'),
						btnMsgType: doc.querySelector('#msg-type'),
						boxMsgText: doc.querySelector('#msg-text'),
						boxMsgSound: doc.querySelector('#record'),
						btnMsgImage: doc.querySelector('#msg-image'),
						areaMsgList: doc.querySelector('#msg-list'),
						boxSoundAlert: doc.querySelector('#sound-alert'),
						h: doc.querySelector('#h'),
						content: doc.querySelector('.mui-content'),
						
					};
					ui.h.style.width = ui.boxMsgText.offsetWidth + 'px';
					//alert(ui.boxMsgText.offsetWidth );
					var footerPadding = ui.footer.offsetHeight - ui.boxMsgText.offsetHeight;
					var msgItemTap = function(msgItem, event) {
						var msgType = msgItem.getAttribute('msg-type');
						var msgUuid = msgItem.getAttribute('msg-uuid');
						if (msgType == 'sound') {
//							var audio = document.createElement("audio");
//						    audio.volume = 1;
							
						    var playState = msgItem.querySelector('.play-state');
							playState.innerText = '正在播放...'; 
							var soundParams = {uuid: msgUuid};
							topUtil.web_query('/mobile/chatmessage/soundPlayByUuid', soundParams,
								function (data){
									if (typeof data == "string") {
										data = JSON.parse(data);
									}
									if(data.success) {
										var msg = data.data;
										var audio1 = document.createElement("audio");
										audio1.src = '/fcms/' + msg.content;
										audio1.autoplay = "autoplay";
										audio1.addEventListener('ended', function () {  
											playState.innerText = '点击播放';   
										}, false);
									} else {
										mui.toast("播放失败！");
									}
								}
							); 
							
						}
					};
					var imageViewer = new $.ImageViewer('.msg-content-image', {
						dbl: false
					});
					
					var bindMsgList = function() {
						//绑定数据:
						var str = "";
						$.each(record,function(index,item){
							var selfClass = "";
							var imgUrl = '';
							if(item.sendUserId != userId){
								selfClass = "msg-item-self";
								imgUrl = item.sendUserPhoto;
							} else {
								imgUrl = item.recvUserName;
							}
							str += '<div class="msg-item '+ selfClass +'" msg-type="'+ item.type +'" msg-uuid="'+ item.uuid +'">';
							str += '	<img class="msg-user-img" src="'+imgUrl+'" alt="" />';
							str += '	<div class="msg-content">';
							str += '		<div class="msg-content-inner">';
							if(item.type=='text' ){
								str += 			item.content;
							}else if(item.type=='image'){
								str += '		<img id="contentImage" class="msg-content-image" src="${dynamicURL}/mobile/chatmessage/showImage?uuid='+ item.uuid +'" style="max-width: 100px;" />';
							}else if(item.type=='sound'){
								str += '		<span class="mui-icon mui-icon-mic" style="font-size: 18px;font-weight: bold;"></span>';
								str += '		<span class="play-state" uuid="'+ item.uuid +'">点击播放</span>';
							}
							str += '		</div>';
							str += '		<div class="msg-content-arrow"></div>';
							str += '	</div>';	
							str += '	<div class="mui-item-clear"></div>'; 
							str += '</div>';	
						})
						ui.areaMsgList.innerHTML = str;
						
						var msgItems = ui.areaMsgList.querySelectorAll('.msg-item');
						[].forEach.call(msgItems, function(item, index) {
							item.addEventListener('tap', function(event) {
								msgItemTap(item, event);
							}, false);
						});
						imageViewer.findAllImage();
						setTimeout(function() {
							ui.areaMsgList.scrollTop = ui.areaMsgList.scrollHeight +ui.areaMsgList.offsetHeight;						
						}, 500);
					};
					
					// bindMsgList();
					window.addEventListener('resize', function() {
						ui.areaMsgList.scrollTop = ui.areaMsgList.scrollHeight + ui.areaMsgList.offsetHeight;
					}, false);
					var send = function(msg) {
						console.log("message:"+JSON.stringify(msg));
//						record.push(msg);
//						bindMsgList();
//						toRobot(msg.content);
						var params = {recvUserId: userId, content: msg.content, type: msg.type};
						/*
						 *发送消息时：1、存表2、推送（MessageEventHandler类调用save无法保存，因此分开执行）
						 * */
						if(msg.type=="text"){
							topUtil.web_query('/mobile/chatmessage/sendMessageContent',params,
								function (data){
									if(!data){
										mui.alert("发送失败",function () {});
									}else{
										socket.emit('messageevent',{sessionId: constants.getSettings().sessionId,targetClientId:userId,msgType:msg.type,msgContent:msg.content});
									}
								}
							);
						} else if(msg.type=="image") {
							socket.emit('messageevent',{sessionId: constants.getSettings().sessionId,targetClientId:userId,msgType:msg.type,msgContent:msg.content,uuid:msg.uuid});
						} else if(msg.type=="sound") {
							socket.emit('messageevent',{sessionId: constants.getSettings().sessionId,targetClientId:userId,msgType:msg.type,msgContent:msg.content,uuid:msg.uuid});
						}
					};

					function msgTextFocus() {
						ui.boxMsgText.focus();
						setTimeout(function() {
							ui.boxMsgText.focus();
						}, 150);
					}
						//解决长按“发送”按钮，导致键盘关闭的问题；
					ui.footerRight.addEventListener('touchstart', function(event) {
						if (ui.btnMsgType.classList.contains('mui-icon-paperplane')) {
							msgTextFocus();
							event.preventDefault();
						}
					});
					//解决长按“发送”按钮，导致键盘关闭的问题；
					ui.footerRight.addEventListener('touchmove', function(event) {
						if (ui.btnMsgType.classList.contains('mui-icon-paperplane')) {
							msgTextFocus();
							event.preventDefault();
						}
					});
					ui.footerRight.addEventListener('release', function(event) {
						if (ui.btnMsgType.classList.contains('mui-icon-paperplane')) {
							//showKeyboard();
							ui.boxMsgText.focus();
							setTimeout(function() {
								ui.boxMsgText.focus();
							}, 150);
							//							event.detail.gesture.preventDefault();
							send({
								sender: 'self',
								type: 'text',
								content: ui.boxMsgText.value.replace(new RegExp('\n', 'gm'), '<br/>')
							});
							ui.boxMsgText.value = '';
							$.trigger(ui.boxMsgText, 'input', null);
						} else if (ui.btnMsgType.classList.contains('mui-icon-mic')) {
							ui.btnMsgType.classList.add('mui-icon-compose');
							ui.btnMsgType.classList.remove('mui-icon-mic');
							ui.boxMsgText.style.display = 'none';
							ui.boxMsgSound.style.display = 'block';
							ui.boxMsgText.blur();
							document.body.focus();
						} else if (ui.btnMsgType.classList.contains('mui-icon-compose')) {
							ui.btnMsgType.classList.add('mui-icon-mic');
							ui.btnMsgType.classList.remove('mui-icon-compose');
							ui.boxMsgSound.style.display = 'none';
							ui.boxMsgText.style.display = 'block';
							//--
							//showKeyboard();
							ui.boxMsgText.focus();
							setTimeout(function() {
								ui.boxMsgText.focus();
							}, 150);
						}
					}, false);
					var setSoundAlertVisable=function(show){
						if(show){
							ui.boxSoundAlert.style.display = 'block';
							ui.boxSoundAlert.style.opacity = 1;
						}else{
							ui.boxSoundAlert.style.opacity = 0;
							//fadeOut 完成再真正隐藏
							setTimeout(function(){
								ui.boxSoundAlert.style.display = 'none';
							},200);
						}
					};
					
					var recordCancel = false;
					var recorder = null;
					var audio_tips = document.getElementById("audio_tips");
					var startTimestamp = null;
					var stopTimestamp = null;
					var stopTimer = null;
					ui.boxMsgSound.addEventListener('hold', function(event) {
						recordCancel = false;
						if(stopTimer)clearTimeout(stopTimer);
						audio_tips.innerHTML = "手指上划，取消发送";
						ui.boxSoundAlert.classList.remove('rprogress-sigh');
						setSoundAlertVisable(true);
						//recorder = plus.audio.getRecorder();
						/* if (recorder == null) {
							plus.nativeUI.toast("不能获取录音对象");
							return;
						} */
						startTimestamp = (new Date()).getTime();
						/* recorder.record({
							filename: "_doc/audio/",
            				format:"wav" //iOS平台支持"wav"、"aac"、"amr"格式，默认为"wav"
						}, function(path) {
							if (recordCancel) return;
							var serverPath = window.constants.getServerPath();
							var filePath = 	"file://" + plus.io.convertLocalFileSystemURL(path);
							selectAndSend(serverPath + "/mobile/chatmessage/uploadFile", {sounds: filePath, recvUserId:userId}, function(element) {
								send({
									sender: 'self',
									type: 'sound',
									content: element.content,
									uuid:element.uuid
								});
							});
						}, function(e) {
							plus.nativeUI.toast("录音时出现异常: " + e.message);
						}); */
					}, false);
					ui.body.addEventListener('drag', function(event) {
						//console.log('drag');
						if (Math.abs(event.detail.deltaY) > 50) {
							if (!recordCancel) {
								recordCancel = true;
								if (!audio_tips.classList.contains("cancel")) {
									audio_tips.classList.add("cancel");
								}
								audio_tips.innerHTML = "松开手指，取消发送";
								recordCancelFlag = true;
							}
						} else {
							if (recordCancel) {
								recordCancel = false;
								if (audio_tips.classList.contains("cancel")) {
									audio_tips.classList.remove("cancel");
								}
								audio_tips.innerHTML = "手指上划，取消发送";
							}
						}
					}, false);
					ui.boxMsgSound.addEventListener("touchstart", function(e) {
						//console.log("start....");
						e.preventDefault();
					});
					ui.boxMsgText.addEventListener('input', function(event) {
						ui.btnMsgType.classList[ui.boxMsgText.value == '' ? 'remove' : 'add']('mui-icon-paperplane');
						ui.btnMsgType.setAttribute("for", ui.boxMsgText.value == '' ? '' : 'msg-text');
						ui.h.innerText = ui.boxMsgText.value.replace(new RegExp('\n', 'gm'), '\n-') || '-';
						ui.footer.style.height = (ui.h.offsetHeight + footerPadding) + 'px';
						ui.content.style.paddingBottom = ui.footer.style.height;
					});
					var focus = false;
					ui.boxMsgText.addEventListener('tap', function(event) {
						ui.boxMsgText.focus();
						setTimeout(function() {
							ui.boxMsgText.focus();
						}, 0);
						focus = true;
						setTimeout(function () {
							focus = false;
						},1000);
						event.detail.gesture.preventDefault();
					}, false);
					//点击消息列表，关闭键盘
					ui.areaMsgList.addEventListener('click',function (event) {
						if(!focus){
							ui.boxMsgText.blur();
						}
					})
					socket.on('connect', function () {
		        		socket.emit('userreg',{sessionId: constants.getSettings().sessionId});
			            console.log('socket连接成功');
			        });
			        //....收到消息后推送
			        socket.on('enewbuy', function (data) {
			        	console.log("收到消息---------" + JSON.stringify(data));
			        	var msg = {
			        		sendUserId: data.sourceClientId,
			        		recvUserId: data.targetClientId,
			        		type: data.msgType,
			        		content: data.msgContent,
			        		sender: "",
			        		uuid: data.uuid
			        	};
			        	if(data.sourceClientId != userId) {
			        		msg.sender = "self";
			        	}
			        	record.push(msg);
			        	bindMsgList();
			        });
					/* 
					*
					*录音
					*
					*/
					var onFail = function(e) {
		                console.log('Rejected!', e);
		            };
		            var onSuccess = function(s) {
						var context = new (window.webkitAudioContext || window.AudioContext)();
		                var mediaStreamSource = context.createMediaStreamSource(s);
		                rec = new Recorder(mediaStreamSource);
		            }
		         
		            navigator.getUserMedia  = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
		            var rec;
					var record = document.querySelector('#record');
		         	var stop = document.querySelector('#stop');
					var play = document.querySelector('#play');
					var recordExport = document.querySelector('#play');
					var playTap = document.querySelector('.play-state');
		            function startRecording() {
		                if (navigator.getUserMedia) {
		                    navigator.getUserMedia({audio: true}, onSuccess, onFail);
		                } else {
		                    console.log('navigator.getUserMedia not present');
		                }
		            }
		            startRecording();
		            //--------------------      
		            
					record.addEventListener('hold', function(event) {
						rec.record();
						var dd = ws.send("start");
					}, false);
					record.addEventListener('release', function(event) {
						try{
							//console.log('release');
							if (audio_tips.classList.contains("cancel")) {
								audio_tips.classList.remove("cancel");
								audio_tips.innerHTML = "手指上划，取消发送";
							}
							//
							stopTimestamp = (new Date()).getTime();
							if (stopTimestamp - startTimestamp < MIN_SOUND_TIME) {
								audio_tips.innerHTML = "录音时间太短";
								ui.boxSoundAlert.classList.add('rprogress-sigh');
								recordCancel = true;
								stopTimer=setTimeout(function(){
									setSoundAlertVisable(false);
								},800);
							}else{
								setSoundAlertVisable(false);
								if(!recordCancelFlag){
									/* 正常发送 */
									rec.stop();
									rec.exportWAV(function(blob) {
										console.log(blob);
										var fd = new FormData();
										fd.append("audioData", blob);
										fd.append("recvUserId",userId);
										$.ajax({
											url:'${dynamicURL}/mobile/chatmessage/sendAudio',
											type:'post',
											contentType:false,
											processData:false,
											data:fd,
											success: function(data){
												if(data.success){
													var msg = data.chatEntity;
													socket.emit('messageevent',{sessionId: constants.getSettings().sessionId,targetClientId:userId,msgType:msg.type,msgContent:msg.content,uuid:msg.uuid});
												}
											}
										});
					                    rec.clear();
					                });
								}else{
									/* 取消发送后将recordCancelFlag重置为false */
									recordCancelFlag = false;
								}
							}	
						
						}catch(e){
							//alert(e)
						}
					}, false);
					
		            var ws = socket;
		            ws.onopen = function () {
		                console.log("Openened connection to websocket");
		            };
		            ws.onclose = function (){
		                 console.log("Close connection to websocket");
		            }
		            ws.onmessage = function(e) {
		                audio.src = URL.createObjectURL(e.data);
		            }

			    });
	        	var files = [];
	        	var imageIndex = 0;

	        	function compressImage(path, successCB) {
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
				//发送图片
				mui.init();
				var imgFiles = null;
				var uploadIndex = [];
				layui.config({
					base: '${staticURL}/js/' //静态资源所在路径
				}).use('upload',function(){
					var $ = layui.jquery,
					upload = layui.upload;
					//上传
					var uploadInst = upload.render({
						elem: '#uploadImg',
						url: dynamicURL + '/mobile/chatmessage/saveChatImage',
						headers: {sessionId: constants.getSettings().sessionId},
						data:{
							recvUserId: function(){
							    return '${userId}';
							}
						},
						multiple: true, //是否多文件上传
						auto: true, //是否自动上传
						bindAction: '#submit',
						accept: 'images', //允许上传的文件类型
						number:9,//允许上文件数量
						choose: function(obj) {
							for(var i= 0;i<uploadIndex.length;i++){
								var j = uploadIndex[i];
								delete obj.pushFile()[j];
							}
							uploadIndex = [];
							obj.preview(function(index, file, result){
							      /* console.log(index);
							      console.log(file);  */
							      uploadIndex.push(index);
							});
							imgFiles = obj.pushFile();
						},
						done: function(data,index) {
							if(data.success) {
								//发送成功后socket.io推送
								var entities = data.chatMessageEntities;
								$.each(entities,function(index,msg){
									console.log(msg.type + "---"+ msg.content);
									socket.emit('messageevent',{sessionId: constants.getSettings().sessionId,targetClientId:"${userId}",msgType:msg.type,msgContent:msg.content,uuid:msg.uuid});
								})
							} else {
								layer.alert(data.msg, {
									icon: 0
								});
							}
						},
						error: function(res) {
							mui.alert(res.msg);
						}
					});
				})
			}(mui, document));
			
			
            
		</script>
</body>
</html>