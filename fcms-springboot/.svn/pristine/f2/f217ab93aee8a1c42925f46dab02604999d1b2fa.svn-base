<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--社区-->
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title></title>
	</head>
	<style>
		.mt8{
	  		margin-top:8px;
	  	}
	  	.setPadd{
	  		padding:15px 12px;
	  	}
	  	input[type='submit'], .mui-btn-my, .mui-btn-my {
		    color: #fff;
		    border: 1px solid #1799c5;
		    background-color: #1799c5;
		}
		.mui-btn-my:enabled:active{
			color: #fff;
		    border: 1px solid #1799c5;
		    background-color: #1799c5;
		}
		.set-btn{
			height:50px;
			width:90%;
			font-size:16px;
		}
		.news{
			background-color: #fff;
		}
		.news-header{
			padding:10px 15px 5px;
			display:block;
		}
		.news-header img{
			width:40px!important;
			height:40px!important;
			border-radius:50%;
			display:inline-block;
			vertical-align: middle;
			margin-right:5px;
		}
		.news-body{
			padding:5px 14px;
		}
		.news-body .newsText img{
			width:20px;
			height:20px;
			vertical-align: middle;
		}
		.news-body .newsText{
			padding:10px;
			color:#000;
			font-size:16px;
		}
		.news-body .news-body-img{
			overflow: hidden;
			margin-bottom:10px;
		}
		.news-body .news-body-img img.setimg1{
			width:auto;
			height:150px;
		}
		.news-body .news-body-img img.setimg2{
			margin:2px;
			width:calc(33.33333% - 4px);
			height:100px;
			float: left;
		}
		.news-header .username{
			display:inline-block;
		}
		.news-footer{
			font-size:10px;
			color:#aeb7b8;
			padding:5px 15px 10px;
		}
		.realctive{
			float: right;
			color:#1799c5;
			margin-top: 9px;
		}
		.bt{
			border-bottom:1px solid #ebebeb;
		}
		.commentText{
			padding:6px 10px;
		}
		.footer-span-color{
			color:#1799c5;
			position: absolute;
			top:16px;
			right:18px;
		}
		.commentarae{
			width:100%;
			position: fixed;
			bottom:0;
			left:0px;
			z-index: 9999;
			background-color: #fff;
			border-top:1px solid #ebebeb;
		}
		.commentarae input{
			background-color:#f4f5f7;
			border:0;
			padding:15px;
			height:30px;
			font-size:14px;
			border-radius:30px;
			margin:0px;
		}
		.commentarae textarea{
			margin:0px;
			padding:2px 10px;
			font-size:14px;
		}
		.inputpadd{
			padding:10px 15px;
		}
		.zan{
			width:100%;
			height:30px;
			padding:5px 10px;
			border-radius:30px;
			background-color:#f4f5f7;
		}
		.zan span{
			font-size:14px;
		}
		.publish{
			height:69px;
			width:80%;
			text-align: center;
			color:#c9c9c9;
		}
		.commentarae1{
			width:100%;
			position: fixed;
			bottom:0;
			left:0px;
			z-index: 9999;
			background-color: #f9f9f9;
		}
		.comh{
			height:50px;
			line-height:50px;
			text-align: center;
		}
		.comh span.icon-dianzan{
			font-size:20px;
		}
		.addarea{
			font-size:18px;
			margin-top:4px;
			text-align: center;
		}
		.addzan{
			color:#f00;
			font-size:20px;
		}
		.commentheader{
			height:44px;
			line-height:44px;
			background-color: #fafafa;
			padding:0 15px;
		}
		.commentheader .setbtn{
			padding:5px 10px;
			border:1px solid #c9c9c9;
			border-radius: 5px;
		}
		@keyframes pulse{
			0% {
			    -webkit-transform: scaleX(1);
			    transform: scaleX(1);
			}
			50% {
			    -webkit-transform: scale3d(1.3,1.3,1.3);
			    transform: scale3d(1.3,1.3,1.3);
			}
			100% {
			    -webkit-transform: scaleX(1);
			    transform: scaleX(1);
			}
		}
		/*预览图片*/
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
			}·
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
		.mui-col-xs-2 {
			position: relative;
			min-height: 1px;
			width: 16.66666667%;
		}
		.posr{
			position:relative;
		}
		.infobox{
			position: absolute;
			left:50px;
			top:0;
			height:40px;
		}
		.mui-slider .mui-segmented-control.mui-segmented-control-inverted~.mui-slider-group .mui-slider-item{
			border-bottom:0px;
		}
	</style>
	<body>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">社区详情</h1>
		</header>
		<div class="mui-content mui-scroll-wrapper bgcwhite" style="padding-bottom:50px">
	      <div class="mui-scroll">
	      
	     		<%-- var str = '<div id="li-'+item.id+'" class="news bt"><div class="news-header" id="news-header-'+item.id+'">';
	      		str += '<img id="userPhoto-'+item.id+'" src="${staticURL}/images/front/user1.png" alt=""><span class="imgrcol">';
				str += '<span class="username">'+item.userName+'</span></span></div><div class="news-body linkbtn" id="message-'+item.id+'">';
				str += '<div class="newsText">'+item.content+'</div><div class="news-body-img" id="news-img-'+item.id+'">';
				str += '</div></div><div class="news-footer"><span>'+item.timeWrapper+'</span>';
				str += '<div class="mui-card-footer"><a class="mui-card-link praise" id="praise-'+item.id+'"><span class="icon iconfont icon-dianzan"></span>';
				str += '&nbsp;<span class="setft" id="setft-'+item.id+'">'+item.zanNumber+'</span></a>';
				str += '<a class="mui-card-link"><span class="icon iconfont icon-pinglun1 linkbtn" id="comment-'+item.id+'"></span>&nbsp;<span class="setft" id="xinxi-'+item.id+'">'+item.commentNumber+'</span></a></div></div>'; --%>
				
	      
	      	<!-- 主界面具体展示内容 -->
	      	<div class="news bt">
        		<div class="news-header">
        		<div class="posr">
        			<img id="headimg" src="${staticURL}/images/front/user1.png" alt="" id="weixintouxiang" style="width:60px;height:60px"/>
        			<div class="infobox">
        				<span id="userName" class="username" style="width:45px"></span>
        				<!-- <span id="time" style="display: block;font-size:12px;color:#aeb7b8;"></span> -->
        			</div>
        		</div>
        		</div>
        		<div class="news-body">
        			<div class="news-body-img">
        			</div>
        			<div class="newsText"><span id="content"></span></div>
        		</div>
        		<div class="news-footer" style="display:none">
        			<span id="time"></span>
        			<span class="footer-span-color" >删除</span>
        		</div>
        	</div>
        	<div class="commentcol mt8">
        		<div class="mui-slider setautoheight">
	       		    <div class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted" style="z-index: 9999;background-color:#fff;">
	       		        <a class="mui-control-item mui-active" href="#item1">全部&nbsp;<span><span id="allNumber"></span></span></a>
	       		        <a class="mui-control-item" href="#item2">评论&nbsp;<span><span id="commentNumber"></span></span></a>
	       		    </div>
	       		    <div class="mui-slider-group">
	       		        <div id="item1" class="mui-slider-item mui-control-content mui-active" style="padding:0px">
	       		           
	       		        </div>
	       		        <div id="item2" class="mui-slider-item mui-control-content" style="padding:0px">
	       		        
				        	
	       		        </div>
	       		       
	       		    </div>
	       		    <!--  <div style="background-color:#fff;" class="setPadd mui-text-center">暂无更多数据</div> -->
	       		</div>
        	</div>
	      </div>
		</div>
		<div id="alertcomment" class="commentarae1 mui-row">
		<div class="mui-col-xs-6 comh">
			<span id="alertcommentbtn">
				<span class="icon iconfont icon-pinglun1" style="vertical-align: middle;"></span>
				<span style="margin-left:4px;">评论</span>
			</span>
		</div>
		<div class="mui-col-xs-6 comh">
			<span id="zan" class="icon iconfont icon-dianzan"></span>
			<span style="margin-left:4px;"><span id="zanNumber"></span></span>
		</div>
	</div>
	<div id="comment" class="commentarae" style="display: none;">
		<div id="commentheader" class="mui-row commentheader" style="display: none;">
			<div class="mui-col-xs-4 mui-text-left"><span id="closebtn">取消</span></div>
			<div class="mui-col-xs-4 mui-text-center"><span>发评论</span></div>
			<div class="mui-col-xs-4 mui-text-right"><span class="setbtn" id="submit2">确定</span></div>
		</div>
		<div class="mui-row">
			<div class="mui-col-xs-10 inputpadd">
				<textarea id="textarea" name="content" rows="3" cols="" placeholder="写评论···" style="font-size:13px; height:calc(100% - 10px)"></textarea>
				<div class="mui-text-right" style="height:10px">
			    	<span style="color:#e16f3b;"><span id="textNum">0</span>/50</span>
			    </div>
			</div>
			<div class="mui-col-xs-2" style="padding:10px;">
				<div id="publish" class="publish">
					<span id="expansion" class="icon iconfont icon-icon-- addarea"></span>
					<span id="submit1" style="font-size:15px;margin-top: 30px;display: block;">发布</span>
				</div>
			</div>
		</div>
	</div>
		<script>
			var divWidth = 0;
			var divHeight = 0;
			var text = '';
			mui.ready(function(){
				mui.previewImage();
			});
			mui.ready(function() {
				var messageId = '${messageId}';//plus.webview.currentWebview().messageId;	
				//var serverPath = window.constants.getServerPath();
				//显示页面信息
				var param = {messageId:messageId};
				topUtil.web_query('/mobile/message/toDetail',param,function (data){
					if (typeof data == "string") {
						data = JSON.parse(data);
					}
					$("#userName").append(data.userName);
					$('#time').append(data.timeWrapper);
					$("#content").append(data.content);
					$("#allNumber").append(data.commentNumber+data.zanNumber);
					$("#commentNumber").append(data.commentNumber);
					$("#zanNumber").append(data.zanNumber);
					$("#headimg").attr("src",data.imgUrl);
					if(data.isMain){
						$('.news-footer').show();
					}
					
					//getUserPhoto('#headimg',data);
				});
				if (constants.getLoginStatus() == 1) {								
					zanNumber(messageId);
				}
				//显示用户发表动态的图片
				var param1 = {search_EQ_messageId : messageId};
				topUtil.web_query("/mobile/message/image/search",param1,function(data){
					if (typeof data == "string") {
		                data = JSON.parse(data);
					}
					if(data.length==0){
						$('.news-body-img').hide();
					}else if(data.length==1){
						$('.news-body-img').css({"width":"100%","height":"150px"});
						divWidth = $('.news-body-img').width();
						divHeight = $('.news-body-img').height();
						var img = Img(data,messageId,divWidth,divHeight);
						$('.news-body-img').append(img);
					}else if(data.length>1){
						Imgs(data);
					}
				});
				//显示赞跟评论
				var param2 = {search_EQ_messageId : messageId,search_EQ_type_1 : 2,search_EQ_type_2 : 3,search_EQ_deleteFlag:0};
				topUtil.web_query("/mobile/message/zanAndComment",param2,function(data){
					if (typeof data == "string") {
		                data = JSON.parse(data);
					}
					$.each(data.rows,function(index, item){
						var str = '';
						if(item.type==2){
						 str = '<div class="news bt"><div class="news-header">'
		        			+'<img class="userPhoto-'+item.id+'" src="'+item.imgUrl+'"/>'
		        			+'<span class="username">'+item.userName+'</span>'
		        			+'<span class="realctive"><span style="color:#8f8f94;">'+item.timeWrapper+'</span></span></div>'
			        		+'<div class="news-body">'
			        		+'<div class="commentText"><span style="font-size:16px;" class="mui-icon iconfont icon-like-b addzan"></span></div>'
			        		+'</div></div>';
						}else if(item.type==3){
							str = '<div class="news bt"><div class="news-header">'
								//评论者的头像和昵称
			        			+'<img class="userPhoto-'+item.id+'"  src="'+item.imgUrl+'" alt=""/>'
			        			+'<span class="username">'+item.userName+'</span>'
			        			//评论时间
			        			+'<span class="realctive"><span style="color:#8f8f94;">'+item.timeWrapper+'</span></span></div>'
			        			+'<div class="news-body">'
			        			+'<div class="commentText" style="word-wrap:break-word">'+item.content+'</div></div></div>';
			        			$('#item2').append(str);
						}
						$('#item1').append(str);
						//getUserPhoto('.userPhoto-'+item.id,item);
					});
				});
				function getUserPhoto(idorClass,item){
					//var serverPath = window.constants.getServerPath();
					topUtil.web_query("/mobile/venue/user/userHeadImg",{uuid:item.userPhoto},function(data){
						if(data){
							$(idorClass).attr("src",dynamicURL+'/mobile/venue/user/userHeadImg?uuid='+item.userPhoto);
						}
					});
				}
				 $('#submit2').attr('disabled','disabled');
				 $('#submit1').attr('disabled','disabled');
				 document.getElementById('submit1').addEventListener('tap',_.debounce( function(event) {
		    		 //$('#submit1').attr('disabled','disabled');
		    		 savecomment(messageId);
		    	},waitTime, true));
				 document.getElementById('submit2').addEventListener('tap', function(event) {
		    		 $('#submit2').attr('disabled','disabled');
		    		 savecomment(messageId);
		    	});
		    	//点赞事件
				$("#zan").click(function(){
					if (constants.getLoginStatus() == 0) {
						mui.toast('请返回在市北登录后使用该功能！');
						//constants.toLoginPage();
					}else if (constants.getLoginStatus() == 1) {
						var num = parseInt($("#zanNumber").text());
						if($(this).hasClass("addzan")){
							num--;
							$(this).attr("class","icon iconfont icon-dianzan animated infinite pulse");
							setTimeout(function(){
								$("#zan").removeClass("pulse");
							}, 1000);
							topUtil.web_query("/mobile/message/deleteZan",param,function(data){
								//location.reload();
							});
						}else{
							num++;
							$(this).attr("class","icon iconfont icon-like-b addzan pulse animated infinite");
							setTimeout(function(){
								$("#zan").removeClass("pulse");
							}, 1000);
							topUtil.web_query("/mobile/message/saveZan",param,function(){
								//location.reload();
							});
						}
						$("#zanNumber").text(num);	
					}
				});
				//点击删除所发动态
				$(document).on('tap','.news-footer .footer-span-color',function(){
					mui.confirm('确定要删除这条旅客圈吗？','',function(e) {
						if(e.index == 1){
							var param = {messageId:messageId};
							topUtil.web_query("/mobile/message/deteleMessage",param,function(data){
								if (typeof data == "string") {
					                data = JSON.parse(data);
								}
								if(data.success){
									//afterdelete();
									//mui.back();
									mui.openWindow({ 
										url: '${dynamicURL}/admin/main/toCard', 
										id : 'cardAdd.html',
										show:{
											autoShow:true,//页面loaded事件发生后自动显示，默认为true
											aniShow:"slide-in-right",
											duration:'250'
										},
										waiting:{
											autoShow:false,//自动显示等待框，默认为true00
										}
									});
								}
							});
						}
					});
				});
			});
			/* function afterdelete(){
			    //获得列表界面的webview  
			    var list = plus.webview.getWebviewById('card.html');  
			    //触发列表界面的自定义事件（fncOne）,从而进行数据刷新  
			    mui.fire(list,'reload');
			    //返回true，继续页面关闭逻辑  
			    return true;  
			} */
			//查询是否赞过
			function zanNumber(messageId){
				//用户是否赞过
				var param = {messageId:messageId};
				topUtil.web_query("/mobile/message/user/comment/userZan",param,function(data){
					/* if (typeof data == "string") {
		                data = JSON.parse(data);
					} */
					if(data.success){
						$('#zan').attr("class","icon iconfont icon-like-b addzan pulse infinite");
					}
				});
			}
			//一张图片
			function Img(result,messageId,divWidth,divHeight){
				//var serverPath = window.constants.getServerPath();
				var filePath = dynamicURL+"/mobile/message/image/showImage?uuid="+ result[0].uuid;
				var img = '';
				if(result[0].uuid!=""&&result[0].uuid!=null){
					img ='<img id="img-'+messageId+'" src="'+filePath+'" alt="" onload="AutoSize(this,divWidth,divHeight)" data-preview-src="" data-preview-group="'+messageId+'" />';
				}
				return img;
			}
			//多张图片
			function Imgs(result,messageId){
				//var serverPath = window.constants.getServerPath();
				var img = '';
				$.each(result,function(index, item){
					if(item.uuid!=""&&item.uuid!=null){
						var filePath = dynamicURL+"/mobile/message/image/showImage?uuid="+item.uuid;
						img = img +'<img class="setimg2" src="'+filePath+'" alt=""  data-preview-src="" data-preview-group="'+messageId+'" />';
					}
				});
				$('.news-body-img').append(img);
			}
			//  0/50
			document.getElementById("textarea").addEventListener('keyup',function(){
				document.getElementById("textNum").innerHTML=this.value.length;
				var $this = $(this);
			    var val = $this.val();
				text = dataUtil.clStr(val);
				if(this.value.length>0){
					 $('#submit1').removeAttr("disabled");
					 $('#submit2').removeAttr("disabled");
					 if(this.value.length>50){
						 $('#submit').attr('disabled','disabled');
						 $this.val(val.substring(0, 50)); 
						 mui.toast('最多可输入50个字符');
					 }
				}else {
					 $('#submit1').attr('disabled','disabled');
					 $('#submit2').attr('disabled','disabled');
				}
			},false)
			//缩放图片
			function AutoSize(Img, maxWidth, maxHeight) {
			    var image = new Image();
			    //原图片原始地址（用于获取原图片的真实宽高，当<img>标签指定了宽、高时不受影响
			    image.src = Img.src;
			    // 当图片比图片框小时不做任何改变   
			    if (image.width < maxWidth&& image.height < maxHeight){
			        Img.width = image.width;
			        Img.height = image.height;
			    }else {
			        if (maxWidth/ maxHeight  <= image.width / image.height){ //原图片宽高比例 大于 图片框宽高比例  
			            Img.width = maxWidth;   //以框的宽度为标准  
			            Img.height = maxWidth* (image.height / image.width);
			        }else {   //原图片宽高比例 小于 图片框宽高比例
			            Img.width = maxHeight  * (image.width / image.height);
			            Img.height = maxHeight  ;   //以框的高度为标准 
			        }
			    }
			}
			mui('.mui-scroll-wrapper').scroll({
				bounce: false, //是否启用回弹
				deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
			});
			$("#alertcommentbtn").click(function(){
				if (constants.getLoginStatus() == 0) {
					mui.toast('请返回在市北登录后使用该功能！');
					//constants.toLoginPage();
				} else if (constants.getLoginStatus() == 1) {
					$("#alertcomment").hide();
					$("#comment").show();
					$("#comment").find("textarea").focus();
					var mask = mui.createMask(closecomment);
					mask.show();
				}
			})
			function closecomment(){
				$("#alertcomment").show();
				$("#comment").hide();
				$(".payTypeDiv").css("display","none");
			}
			$("#expansion").click(function(){
				$("#comment").css("top","0");
				$("#comment").find("div.mui-col-xs-10").removeClass("mui-col-xs-10").addClass("mui-col-xs-12");
				$("#comment").find("div.mui-col-xs-2").hide();
				$("#textarea").css("height","100%").css("border-width","0").focus();
				$("#commentheader").show();
				$(".mui-backdrop").hide();
			});
			$("#closebtn").click(function(){
				$("#comment").css("top","initial");
				$("#comment").find("div.mui-col-xs-12").removeClass("mui-col-xs-12").addClass("mui-col-xs-10");
				$("#comment").find("div.mui-col-xs-2").show();
				$("#textarea").css("height","100%").css("border-width","1");
				$("#commentheader").hide();
				closecomment();
			});
			//发表评论
			function savecomment(messageId){
				if(text.length>50){
					mui.toast('最多可输入50个字符');
				}
				var param3 = {messageId : messageId,comment:text};
				topUtil.web_query("/mobile/message/saveComment",param3,function(data){
					if (typeof data == "string") {
		                data = JSON.parse(data);
					}
					if (data.success) {
						location.reload();
					} else {
						mui.toast(data.msg);
					}
				});
			}
		</script>
	</body>

</html>