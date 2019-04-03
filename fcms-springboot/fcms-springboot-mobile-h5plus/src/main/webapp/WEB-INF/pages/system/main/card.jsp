<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="tab_bottom.jsp" flush="true">
<jsp:param name="card" value="mui-active"/>
</jsp:include>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>社区</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<style>
		
		.mt8{
			margin-top:10px;
		}
		.mui-plus-pullrefresh .mui-scroll-wrapper, .mui-plus-pullrefresh .mui-slider-group{
			position: relative;
		}
		.mui-table-view:before,.mui-table-view:after{
			height:0px!important;    	
		}
		.passenger{
			
		}
		.passenger img{
			width:40px;
			height:40px;
			border-radius:50%;
			vertical-align: middle;
			margin-right:-15px;
		}
		.passenger span{
			margin-left:10px;
		}
		.mui-segmented-control.mui-segmented-control-inverted .mui-control-item.mui-active {
			color: #1799c5;
			border-bottom: 2px solid #1799c5!important;
		}
		.mui-control-content{
			padding:0px 0;
		}
		.news{
			background-color: #fff;
		}
		.news-header{
			padding:10px 15px 5px;
		}
		.news-header img{
			/* width:60px;
			height:60px; */
			/*border-radius:50%;*/
			display:inline-block;
		}
		.news-body{
			padding:5px 0px;
		}
		.news-body .newsText img{
			width:20px;
			height:20px;
			vertical-align: middle;
		}
		.news-body-img{
			overflow: hidden;
			padding:2px;
		}
		.news-body-img img.setimg1{
			height:150px;
			margin:2px;
		}
		.news-body-img .setimg2{
			margin:2px;
			width:calc(33.33333% - 4px);
			height:100px;
			float: left;
			overflow: hidden;
		}
		.news-footer{
			font-size:10px;
			color:#aeb7b8;
			overflow: hidden;
			padding:5px 0px 10px;
		}
		.praise,.comment{
			margin-right:10px;
		}
		.setft{
			font-size:16px;
		}
		.punlish{
			position: fixed;
			width:50px;
			height:50px;
			line-height:50px;
			border-radius:50%; 
			right:30px;
			bottom:60px;
			z-index: 999;
			color:#fff;
			font-size:10px;
			text-align:center;
			background:-webkit-gradient(linear, 0 0, 0 bottom, from(#1cc4ff), to(#3fa3ff)); 
			box-shadow: 0px 0px 4px #3fa3ff;
		}
		.realctive{
			float: right;
			/* line-height: 60px; */
			color:#1799c5;
		}
		.linkbtn{
			display: block;
		}
		.set{
			color:#000;
		}
		.iocn-xin-color{
			color:red;
		}
		.mui-table-view-cell:after{
			height:0px;
		}
		.footer-span-color{
			color:#1799c5;
			position: absolute;
			top:16px;
			right:18px;
		}
		.mui-scroll-wrapper{
			position:inherit;
		}
		.addzan{
			color:#f00;
			font-size:20px;
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
		.iconfont{
			font-size:18px;
		}
		/*预览图片*/
		.mui-preview-image.mui-fullscreen {
			position: fixed;
			z-index: 1000;
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
		a{
			color:#000;
		}
		.share{
			background-color: #fff!important;
		}
		.share .close{
			line-height: 50px;
			display: block;
			font-size:14px;
			text-align: center;
			border-top:1px solid #ebebeb;
		}
		.shareBox{
			height:100px;
			overflow: hidden;
		}
		.shareType{
			width: 33.333%;
		    height: 100px;
		    text-align: center;
		    float: left;
		    padding: 17px 0;
		}
		.shareType img {
		    width: 36px;
		    height: 36px;
		}
		.shareType span:last-child {
		    display: block;
		    font-size: 12px;
		    line-height: 30px;
		    color: #757575;
		}
		.mui-card-header>img:first-child{
			border-radius:50%;
		}
		.mui-card-header.mui-card-media .mui-media-body{
			color:#000;
			font-weight:normal;
		}
		</style>
</head>
<body>
<header class="mui-bar mui-bar-nav">
	<h1 class="mui-title">社区</h1>
</header>
<div id="pullrefresh" class="mui-content mui-scroll-wrapper" style="height:100%;">
			<div class="mui-scroll">
				<!--数据列表-->
				<ul class="mui-table-view mui-table-view-chevron" style="background-color:#efeff4;padding-bottom:10px;"></ul>
				<div id="notDiv" class="mui-text-center" style="padding-top:30px;display: none;">
	        		<p>还没有内容</p><p>快来发布第一条吧！</p>
	        	</div>
			</div>
		</div>
		<!-- 点击跳转到新发航友圈 -->
		<div class="punlish" id="publish" >
			<span style="font-size:40px;line-height:50px;" class="mui-icon mui-icon-plusempty"></span>
		</div>
		<div id="share" class="mui-popover share mui-popover-action mui-popover-bottom">
			<div class="shareBox">
				<div class="shareType">
					<img src="${staticURL}/images/front/qq.png" alt="" />
					<span>qq</span>
				</div>
				<div class="shareType">
					<img src="${staticURL}/images/front/wx.png" alt="" />
					<span>微信</span>
				</div>
				<div class="shareType">
					<img src="${staticURL}/images/front/friends.png" alt="" />
					<span>朋友圈</span>
				</div>
			</div>
			<a href="#share" class="close">取消分享</a>
		</div>
		
		<script>
			var pageRows = 3;
			var pageNum = 0;
			var divWidth = 0;
			var divHight = 0;
			mui.init({
				pullRefresh: {
					container: '#pullrefresh',
					down : {
						//auto : true,
						callback : pulldownRefresh
					},
					up: {
						auto:true,//自动上拉一次
						contentrefresh: '正在加载...',
						callback: pullupRefresh
					}
				}
			});
			mui.ready(function() {
				//浏览图片
				mui.previewImage();
				//mui('#pullrefresh').pullRefresh().pullupLoading();
			});
			//上拉加载
			function pullupRefresh(){
				//去重
				var cells = document.querySelector('.mui-table-view-chevron').querySelectorAll('.mui-table-view-cell');
				pageNum = Math.ceil(cells.length / pageRows + 1);
				loadData(pageRows,pageNum);
			}
			//下拉刷新
			function pulldownRefresh(){
				//plus.webview.currentWebview().reload();
				mui('#pullrefresh').pullRefresh().endPulldownToRefresh();
			}
			function loadData(pageRows,pageNum){
				var param = {rows:pageRows,page:pageNum,order:'desc',sort:'time',search_EQ_deleteFlag:0};
				topUtil.web_query("/mobile/message/list",param,function(data){
					if (typeof data == "string") {
		                data = JSON.parse(data);
					}
					for (var index = 0;index < data.rows.length;index++) {
						var item = data.rows[index];
						var str = '';
						str = noImg(item);
						$('.mui-table-view-chevron').append(str);
					}
					mui.each(data.rows,function(index, item){
						//var str = '';
						var param1 = {search_EQ_messageId : item.id};
						topUtil.web_query("/mobile/message/image/search",param1,function(data){
							if (typeof data == "string") {
				                data = JSON.parse(data);
							}
							var img = '';
							//str = noImg(item);
							//$('.mui-table-view-chevron').append(str);
							if(data.length==1){
								$('#news-img-'+item.id).css({"width":"100%","height":"150px"});
								divWidth = $('#news-img-'+item.id).width();
								divHeight = $('#news-img-'+item.id).height();
								img = Img(data,item,divWidth,divHeight);//'<img id="img-'+item.id+'" src="'+dynamicURL+'message/imgShow?url='+data.imgUrl+'" alt="" onload="AutoSize(this,divWidth,divHeight)" data-preview-src="" data-preview-group="'+item.id+'" />';
								$('#news-img-'+item.id).append(img);
							}else if(data.length>1){
								Imgs(data,item);
							}
							if(item.isMain){
								var detele = '<span class="footer-span-color" id="li-'+item.id+'">删除</span>';
								$('#mui-card-header-'+item.id+'').after(detele);
							}
							if(item.zanNumber==0){
								$('#setft-'+item.id).hide();
							}
							if(item.commentNumber==0){
								$('#xinxi-'+item.id).hide();
							}
							if (constants.getLoginStatus() == 1) {								
								zanNumber(item.id);
							}
							getUserPhoto(item);
						});	
					});
					mui('#pullrefresh').pullRefresh().endPullupToRefresh(++pageNum> Math.ceil(data.total/pageRows));
				});
			}
			function getUserPhoto(item){
				topUtil.web_query("/mobile/venue/user/userHeadImg",{uuid:item.userPhoto},function(data){
					if(data){
						$('#userPhoto-'+item.id).attr("src",dynamicURL + '/mobile/venue/user/userHeadImg?uuid='+item.userPhoto)
					}
				});
			}
			//生成li（无图片）
			function noImg(item){
				var str = '<li id="li-'+item.id+'" class="mui-table-view-cell" style="padding:0;">'
					+'<div class="mui-card"><a class="linkbtn" id="message-'+item.id+'"><div class="mui-card-header mui-card-media" id="mui-card-header-'+item.id+'">'
					//用户头像和名称
					+'<img id="userPhoto-'+item.id+'" src="${staticURL}/images/front/user1.png"/><div class="mui-media-body">'+item.userName+''
					+'<p>'+item.timeWrapper+'</p></div></div>'
					+'<div class="mui-card-content" ><div class="news-body-img" id="news-img-'+item.id+'"></div></div>'
					+'<div class="mui-card-content" ><div class="mui-card-content-inner">'
					//发表内容
					+'<p style="color: #333;">'+item.content+'</p></div></div></a>'
					+'<div class="mui-card-footer"><a class="mui-card-link praise" id="praise-'+item.id+'"><span class="icon iconfont icon-dianzan"></span>'
					//点赞跟评论分享
					+'&nbsp;<span class="setft" id="setft-'+item.id+'">'+item.zanNumber+'</span></a>'
					+'<a class="mui-card-link"><span class="icon iconfont icon-pinglun1 linkbtn" id="comment-'+item.id+'"></span>&nbsp;<span class="setft" id="xinxi-'+item.id+'">'+item.commentNumber+'</span></a>'
					+'<a class="mui-card-link" href="#share"><span class="mui-icon mui-icon-paperplane"></span></a></div></div>';
				/*var str = '<li id="li-'+item.id+'" class="mui-table-view-cell" style="padding: 0; margin-top:10px;background-color:#fff"><div class="news mt8"><a class="set" id="message-'+item.id+'"><div class="news-header">'
					//用户头像和名称
					+'<div><img src="../../images/front/user1.png" alt="" style="width:60px;height:60px" /><span style="display:inline-block;margin-left:10px"><span style="font-size:16px;">'+item.userName+'</span>'
					+'<span style="margin-top:6px;display: block;font-size:10px;color:#aeb7b8;" class="timeWrapper">'+item.timeWrapper+'</span></span>'
					//
					+'<span class="realctive" id="realctive-'+item.id+'"><span style="font-size:14px;" class="mui-icon iconfont icon-listfeiji"></span>'
					+'</span></div>'
					//发表内容（图片文字）
					+'<div class="news-body"><div class="news-body-img" id="news-img-'+item.id+'"></div><div class="newsText" style="word-wrap:break-word">'+item.content+'</div></div></a>'
					//间隔时间
					+'<div class="news-footer" id="footer-'+item.id+'"><span style="float: right;height:21px;">'
					//点赞跟评论
					+'<span class="praise" id="praise-'+item.id+'"><span class="icon iconfont icon-dianzan"></span>&nbsp;<span class="setft" id="setft-'+item.id+'">'+item.zanNumber+'</span></span>'
					+'<span class="comment"><span class="icon iconfont icon-pinglun1" id="comment-'+item.id+'"></span>&nbsp;<span class="setft" id="xinxi-'+item.id+'">'+item.commentNumber+'</span></span>'
					+'</div></div></div></li>';*/
					return str;
			}
			//一张图片
			function Img(result,ite,divWidth,divHeight){
				var filePath = dynamicURL + "/mobile/message/image/showImage?uuid="+ result[0].uuid;
				var img = '';
				if(result[0].uuid!=""&&result[0].uuid!=null){
					img ='<img class="setimg1" id="img-'+ite.id+'" src="'+filePath+'" alt="" onload="AutoSize(this,divWidth,divHeight)" data-preview-src="" data-preview-group="'+ite.id+'" />';
				}
				return img;
			}
			//多张图片
			function Imgs(result,ite){
				var img = '';
				$.each(result,function(index, item){
					if(item.uuid!=""&&item.uuid!=null){
						var filePath = dynamicURL + "/mobile/message/image/showImage?uuid=" + item.uuid;
						img = img +'<img class="setimg2" src="'+filePath+'" alt="" data-preview-src="" data-preview-group="'+ite.id+'" />';
					}
				});
				$('#news-img-'+ite.id).append(img);
			}
			//缩放图片
			function AutoSize(Img, maxWidth, maxHeight) {
	            var image = new Image();
	            //原图片原始地址（用于获取原图片的真实宽高，当<img>标签指定了宽、高时不受影响
	            image.src = Img.src;    
	            // 当图片比图片框小时不做任何改变   
	            //console.log(image.width)
	            if (image.width < maxWidth&& image.height < maxHeight){  
	                Img.width = image.width;
	                Img.height = image.height;
	            }else {
	                if ((maxWidth / maxHeight)  <= (image.width / image.height)){ //原图片宽高比例 大于 图片框宽高比例  
	                    Img.width = maxWidth;   //以框的宽度为标准  
	                    Img.height = maxWidth* (image.height / image.width);  
	                }else {   //原图片宽高比例 小于 图片框宽高比例  
	                    Img.width = maxHeight  * (image.width / image.height);  
	                    Img.height = maxHeight  ;   //以框的高度为标准  
	                }
	            }
	        }
			//查询是否赞过
			function zanNumber(messageId) {
				//用户是否赞过
				var param = {messageId:messageId};
				topUtil.web_query("/mobile/message/user/comment/userZan",param,function(data){
					if (typeof data == "string") {
		                data = JSON.parse(data);
					}
					if(data.success){
						$('#praise-'+messageId+' span:first').attr("class","icon iconfont icon-like-b addzan pulse infinite");
					}
				});
			}
			//点赞效果
			$(document).on('tap','.praise',function(){
				if (constants.getLoginStatus() == 0) {
					constants.toLoginPage();
				} else if (constants.getLoginStatus() == 1) {
					var messageId=this.id.split('-')[1];
					var num = parseInt($('#setft-'+messageId).text());
					var param = {messageId:messageId};
					if($('#praise-'+messageId+' span:first').hasClass("addzan")){
						num--;
						if(num>0){
					    	$('#setft-'+messageId).show();
					    }else if(num==0){
					    	$('#setft-'+messageId).hide();
					    }
						$('#praise-'+messageId+' span:first').attr("class","icon iconfont icon-dianzan animated infinite pulse");
						setTimeout(function(){
							$('#praise-'+messageId+' span:first').removeClass("pulse");
						}, 1000);
						 topUtil.web_query("mobile/message/deleteZan",param,function(){
							
						});
					}else{
						num++;
						if(num>0){
					    	$('#setft-'+messageId).show();
					    }
						$('#praise-'+messageId+' span:first').attr("class","icon iconfont icon-like-b addzan pulse animated infinite");
						setTimeout(function(){
							$('#praise-'+messageId+' span:first').removeClass("pulse");
						}, 1000);
						 topUtil.web_query("mobile/message/saveZan",param,function(){
							
						});
					}
					$('#setft-'+messageId).text(num);
				}
			});
			//跳转到详情页
			$(document).on('tap','.linkbtn',function(){
				var messageId=this.id.split('-')[1];
				mui.openWindow({ 
					url: '${dynamicURL}/mobile/message/toCardDetail?messageId='+messageId, 
					id : 'cardDetail.html',
					show:{
						autoShow:true,//页面loaded事件发生后自动显示，默认为true
						aniShow:"slide-in-right",
						duration:'250'
					},
					waiting:{
						autoShow:false,//自动显示等待框，默认为true
					}
				});
			});
			document.getElementById('publish').addEventListener('tap',function () {
				mui.openWindow({ 
					url: '${dynamicURL}/mobile/message/toCardAdd', 
					id : 'cardAdd.html',
					show:{
						autoShow:true,//页面loaded事件发生后自动显示，默认为true
						aniShow:"slide-in-right",
						duration:'250'
					},
					waiting:{
						autoShow:false,//自动显示等待框，默认为true
					}
				});
				
				/* if (constants.getLoginStatus() == 0) {
					mui.openWindow({
							id:  '../../login.html',
						    url: '../../login.html', 
						    show:{
						      autoShow:true,// 加载完毕显示页面
						      aniShow:"slide-in-right"
						    },
						     waiting:{
						      autoShow:true,//自动显示等待框，默认为true
						      title:'页面跳转中...'//等待对话框上显示的提示内容
					      	}
						});
				} else if (constants.getLoginStatus() == 1) {
					mui.openWindow({ 
						url: 'cardAdd.html', 
						id : 'cardAdd.html',
						show:{
							autoShow:true,//页面loaded事件发生后自动显示，默认为true
							aniShow:"slide-in-right",
							duration:'250'
						},
						waiting:{
							autoShow:false,//自动显示等待框，默认为true
						}
					});
				} */
			        
			});
			//点击删除所发动态
			$(document).on('tap','.footer-span-color',function(e){
				e.stopPropagation();
				var messageId=this.id.split('-')[1];
				mui.confirm('确定要删除这条旅客圈吗？','',function(e) {
					if(e.index == 1){
						var param = {messageId:messageId};
						topUtil.web_query("/mobile/message/deteleMessage",param,function(data){
							if (typeof data == "string") {
				                data = JSON.parse(data);
							}
							if(data.success){
								$('#li-'+messageId).remove();
							}
						});
					}
				});
			});
			
			window.addEventListener("reload", function(e) {
				//plus.webview.currentWebview().reload();
			});
		</script>
</body>
</html>