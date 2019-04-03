<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>Insert title here</title>
<style>
		html,
		body {
			height: auto;
		}
		
		.transparent {
			background-color: transparent;
			box-shadow: none;
		}
		
		.infoData {
			padding: 0 10px;
			background-color:#fff;
		}
		
		.transparent a {
			color: #fff;
		}
		
		.topImg {
			position: relative;
			height: 200px;
		}
		
		.topImg img {
			height: 100%;
			width: 100%;
		}
		
		.topImg .activityName,
		.topImg .btnrow {
			position: absolute;
			top: 60px;
			left: 50%;
			transform: translateX(-50%);
			color: #fff;
		}
		
		.topImg .btnrow {
			display: flex;
			top: 100px;
			align-items: center;
		}
		
		.numCol {
			margin-right: 10px;
		}
		
		.mui-bar-nav~.mui-content {
			padding-top: 0;
			padding-bottom:44px;
		}
		
		.mui-control-content {
			background-color: white;
		}
		
		.mui-control-content .mui-loading {
			margin-top: 50px;
		}
		
		.mui-media {
			font-size: 14px;
		}
		
		.mui-table-view .mui-media-object {
			max-width: initial;
			width: 90px!important;
			height: 70px;
			border-radius: 5px;
		}
		
		.meta-info {
			position: absolute;
			left: 115px;
			right: 15px;
			bottom: 8px;
			color: #8f8f94;
			display: flex;
			align-items: center;
		}
		
		.meta-info .peopleNum,
		.meta-info .activityNum,
		.meta-info .dynamicNum {
			flex: 1;
		}
		
		.meta-info .peopleNum span,
		.meta-info .activityNum span,
		.meta-info .dynamicNum span {
			font-size: 16px;
			margin-right: 5px;
			color: #8f8f94;
		}
		
		.meta-info .time {
			float: right;
		}
		
		.mui-table-view:before,
		.mui-table-view:after {
			height: 0;
		}
		
		.mui-table-view-cell:last-child:after,
		.mui-table-view-cell:last-child:before {
			height: 1px;
		}
		
		.mui-content>.mui-table-view:first-child {
			margin-top: 1px;
		}
		
		.color-brave {
			color: #8f8f94;
		}
		
		.color-white {
			color: #fff;
		}
		
		.peopNum {
			width: 100%;
			height: 60px;
			overflow-x: auto;
			display: flex;
		}
		
		.peopNum img {
			width: 40px;
			height: 40px;
			border-radius: 50%;
			margin-right: 5px;
		}
		
		.mui-static .mui-scroll-wrapper {
			position: static;
			top: auto;
			bottom: auto;
			left: auto;
		}
		.bt {
			border-bottom: 1px solid #e6e6e6;
			padding-bottom: 5px;
		}
		.newsText{
			padding:10px;
		}
		.newsText .name{
			font-weight:700;
			font-size:16px;
		}
		.rowText{
			line-height: 30px;
		}
		.rowText span:last-child{
			color:#a2a2a2;
		}
		.news-footer{
			display: flex;
			align-items: center;
		}
		.addNum{
			float: right;
			color:#fff;
			background-color:#00a2ea ;
			padding:2px 10px;
			border-radius:5px;
		}
		.pobom{
			position:fixed;
			bottom:0;
			left:0;
			height:44px;
			width:100vw;
			z-index: 66;
		}
		.btnRow{
			
			display: none;
		}
		.btnRow .btnm{
			flex:1;
			height:44px;
			line-height: 44px;
			color:#fff;
			text-align: center;
		}
		.btnRow.mui-active{
			display: flex;
		}
		.btnRow .btnm.bg1{
			background-color: #f28300;
		}
		.btnRow .btnm.bg2{
			background-color: #00abaf;
		}
		.btnRow .btnm.bg3{
			background-color: #e9b901;
		}
		.mui-pull-bottom-tips{
			background-color: #FFFFFF;
		}
		.setft{
			font-size:16px;
		}
		.iconfont{
			font-size:18px;
		}
		
		.praise,.comment{
			margin-right:10px;
			border:0;
		}
		.linkbtn{
			display: block;
		}
		.addzan{
			color:#f00 !important;
			font-size:20px;
		}
		.mui-card-footer:before, .mui-card-header:after{
			height:0;
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
		.footer-span-color{
			color:#1799c5;
			position: absolute;
			font-size:14px;
			right:18px;
		}
		.mui-slider .mui-slider-group .mui-slider-item img{
			width:auto;
		}
	</style>
</head>
<body>
<header class="mui-bar mui-bar-nav transparent">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color:#fff;"></a>
			<h1 class="mui-title"></h1>
		</header>
		<div class="mui-content" id="news">
			<div class="topImg">
				<img src="../../images/front/example5.jpg" alt="" />
				<div class="activityName">徒步登山</div>
				<div class="btnrow">
					<div class="numCol"><span class="icon iconfont icon-zhanghu" style="font-size:18px;"></span>&nbsp;<span id="peopleNum">0</span>人关注</div>
					<button type="button" class="mui-btn mui-btn-outlined color-white">未关注</button>
				</div>
			</div>
			<div class="setmar bg-white padding">
				公告：<span>禁止发布非法信息</span>
			</div>
			<!--<div class="peopNum setmar bg-white padding">
				<img src="../../images/front/user.png" alt="" />
				<img src="../../images/front/user1.png" alt="" />
				<img src="../../images/front/user.png" alt="" />
				<img src="../../images/front/user1.png" alt="" />
				<img src="../../images/front/user.png" alt="" />
				<img src="../../images/front/user1.png" alt="" />
				<img src="../../images/front/user.png" alt="" />
				<img src="../../images/front/user1.png" alt="" />
				<img src="../../images/front/user.png" alt="" />
				<img src="../../images/front/user1.png" alt="" />
			</div>-->
			<div id="slider" class="mui-slider">
				<div id="sliderSegmentedControl" class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
					<a class="mui-control-item mui-active" href="#item1mobile">邀请</a>
					<a class="mui-control-item" href="#item2mobile">动态</a>
				</div>
				<div class="mui-slider-group bg-white">
					<div id="item1mobile" class="mui-slider-item mui-control-content mui-active" style="height:auto">
						<div class="infoData" id="activity-list">
							
						</div>
					</div>
					<div id="item2mobile" class="mui-slider-item mui-control-content">
						<div class="infoData" id="message-list">
							
							<div id="notDiv" class="mui-text-center" style="padding-top:30px;display: none;">
				        		<p>还没有内容</p><p>快来发布第一条吧！</p>
				        	</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="pobom">
			<div id="item1mobileBtn" class="btnRow mui-active">
				<div class="btnm bg1" id="places">发布邀请</div>
				<div class="btnm bg2">我的发布</div>
				<div class="btnm bg3">我的报名</div>
			</div>
			<div id="item2mobileBtn" class="btnRow">
				<div class="btnm bg1" id="message">发布动态</div>
				<div class="btnm bg2" id="myMessage">我的动态</div>
			</div>
		</div>
		
		<script>
			var itemId = '${itemId}';
			var itemName = '${itemName}';
			var follow;//0未关注 1关注
			var pageRows = 4;
			var pageNum = 0;
			var pullRefresh = null;
			var pullRefresh2 = null;
			var page = 0;

			mui.init();
			(function($) {
				$.ready(function() {
				    pullRefresh = $("#item1mobile").pullToRefresh({
						up: {
							callback: function() {
								var cells = document.querySelector('#activity-list').querySelectorAll('.news');
								pageNum = Math.ceil(cells.length / pageRows + 1);
								mainList(itemId,pageRows,pageNum);
							}
						}
					});
				    pullRefresh2 = $("#item2mobile").pullToRefresh({
				    	up: {
				    		callback: function () {
				    			var cells = document.querySelector('#message-list').querySelectorAll('.news');
								pageNum = Math.ceil(cells.length / pageRows + 1);
								loadData(itemId,pageRows,pageNum);
				    		}
				    	}
				    });
				});
				
			})(mui);
			//禁用mui slide滑动
			mui('.mui-slider').slider().setStopped(true);
			mui.ready(function() {
				$(".activityName").html(itemName);
				//关注人数和是否关注
				peopleNumAndfollow(itemId)
				//加载发布的活动
				var cells = document.querySelector('#activity-list').querySelectorAll('.news');
				pageNum = Math.ceil(cells.length / pageRows + 1);
				mainList(itemId,pageRows,pageNum);
				var cells = document.querySelector('#message-list').querySelectorAll('.news');
				pageNum = Math.ceil(cells.length / pageRows + 1);
				loadData(itemId,pageRows,pageNum);
				$(".topImg img").attr("src",dynamicURL+'/mobile/activity/item/itemHeadImg?itemId='+itemId);
			});
			
			//mui('.mui-slider').slider().setStopped(true);
			/*底部button切换*/
			mui("#sliderSegmentedControl").on('tap','.mui-control-item',function(){
				var href=$(this).attr("href");
				$(href+"Btn").addClass("mui-active").siblings(".btnRow").removeClass("mui-active");
				var strName = $(this).html();
				if (strName == '邀请') {
					page = 0;
				}else if (strName == '动态') {
					page = 1;
				}
			});
			
			function mainList (itemId,pageRows,pageNum) {
				var params = {
					rows:pageRows,
					page:pageNum,
					sort:'gmtCreate',
					order:'desc',
					search_EQ_itemId:itemId
				};
				topUtil.web_query('/mobile/activity/main/list', params, function(data) {
					if (typeof data == "string") {
		                data = JSON.parse(data);
		           }
					if (data.rows) {
						var flag = false;
						var arr = null;
						if (data.follow) {
							arr = data.follow;
						}
						
						var str = '';
						mui.each(data.rows,function (index,item) {
							if (arr) {
								mui.each(arr,function (ind,ite) {
									if (ite == item.id) {
										flag = true;
									}
								});	
							}
							str += '<div class="news bt"><div class="news-header"><img src="'+item.userPhoto+'" alt=""><span class="imgrcol">';
							str += '<span class="username">'+item.userName+'</span></span></div><div class="news-body" id="activity-detail" data-value="'+item.id+'"><div class="newsText"><div class="name">'+item.title+'</div>';
							str += '<div class="rowText"><span>要求成员：</span><span>'+item.member+'（'+item.peopleNum+'人）</span></div>';
							str += '<div class="rowText"><span>费用类型：</span><span>'+item.costType+'</span></div>';
							str += '<div class="rowText"><span>集合地点：</span><span>'+item.location+'</span></div>';
							str += '<div class="rowText"><span>联系方式：</span><span>'+item.tel+'</span></div>';
//							if (type == 1) {
//								str += '<div class="rowText"><span>比赛时间：</span><span>'+item.activityTime+'</span></div>';
//							} else {
							str += '<div class="rowText"><span>活动时间：</span><span>'+item.activityTime+'</span></div>';
//							}
							str += '<div class="rowText"><span>报名截止时间：</span><span>'+item.stopTime+'</span></div>';
							str += '<div class="rowText"><span>邀请说明：</span><span>'+item.instructions+'</span></div></div></div>';
							str += '<div class="news-footer"><span>'+item.timeWrapper+'</span>';
							
							if (item.isMain) {
								str += '<span class="addNum"  id="'+item.id+'" data-value="'+item.itemId+'">撤销邀请</span>';
							} else {
								if (item.signNum) {
									if (flag) {
										str += '<span class="addNum"  id="'+item.id+'" data-value="'+item.itemId+'">撤销报名</span>';
									} else {
										str += '<span class="addNum" id="'+item.id+'" data-value="'+item.itemId+'">报名</span>';
									}
									
								} else {
									str += '<span class="addNum"  disabled="disabled">报名</span>';
								}
							}
							str += '</div></div>';
						});
						$("#activity-list").append(str);
					}
					pullRefresh.endPullUpToRefresh(++pageNum> Math.ceil(data.total/pageRows));
					//pullRefresh.refresh(true);
				});
			}
			
			document.getElementById('places').addEventListener('tap',function () {
				if (follow == 0) {
					mui.toast("请先关注");
				} else if (follow == 1) {
					mui.openWindow({
					    url: dynamicURL+'mobile/activity/main/toRelease?itemId='+itemId+'&itemName='+itemName+'&type=0', 
					    id : 'mobile/activity/main/toRelease',
					    show:{
					      autoShow:true,//页面loaded事件发生后自动显示，默认为true
					      aniShow:"slide-in-right",
					      duration:'250'
					    },
					     waiting:{
					      autoShow:false,//自动显示等待框，默认为true
				      	}
			  		});	
				}
			},false);
			
			//打开已发布的邀请的详情页
			$(document).on('tap', '.news-body',function() {
				var mainId = $(this).attr("data-value");
				mui.openWindow({
					    url: dynamicURL+'mobile/activity/main/toUserSportCircle?mainId='+mainId+'&follow='+follow+'&type=0', 
					    id : 'mobile/activity/main/toUserSportCircle',
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
			
			//查询是否关注和关注的人数
			function peopleNumAndfollow(itemId) {
				topUtil.web_query('/mobile/item/user/peopleNumAndFollow', {itemId:itemId}, function(data) {
					if (typeof data == "string") {
		                data = JSON.parse(data);
		            }
					$('#peopleNum').html(data.peopleNum);
					follow = data.follow;
					if (follow == 1) {
						$('.color-white').html("已关注");
					} else {
						follow = 0;
					}
				});
			}
			
			/* function aftersave(){
			    //获得列表界面的webview  
			    var list = plus.webview.getWebviewById('activity_circle_detail.html');  
			    //触发列表界面的自定义事件（fncOne）,从而进行数据刷新  
			    mui.fire(list,'reload');
			    //返回true，继续页面关闭逻辑  
			    return true;  
			} */
			
			$(document).on('tap', '.color-white',function() {
				if (constants.getLoginStatus() == 0) {
					mui.toast('请先登录');
					//constants.toLoginPage("login.html");
					mui.toast('请返回在市北登录后使用该功能！');
				} else {
					var peopleNum = $('#peopleNum').html();
					if (follow == 0) {
						peopleNum++;
						follow = 1;
						$('.color-white').html("已关注");
						topUtil.web_query('/mobile/item/user/saveItemUser', {itemId:itemId}, function (data) {
							if (typeof data == "string") {
				                data = JSON.parse(data);
				            }
							mui.toast("已关注");
							$('#peopleNum').html(peopleNum);
							//aftersave();
						});
					} else if (follow == 1) {
						peopleNum--;
						follow = 0;
						$('.color-white').html("未关注");
						topUtil.web_query('/mobile/item/user/deleteItemUser', {itemId:itemId}, function (data) {
							if (typeof data == "string") {
				                data = JSON.parse(data);
				            }
							mui.toast("取消关注");
							$('#peopleNum').html(peopleNum);
							//aftersave();
						});
					}
					
				}
			});
			//报名
			$(document).on('tap','.addNum',function () {
				if (follow == 0) {
					mui.toast('请先关注');
				} else if (follow == 1) {
					var itemId = $(this).attr("data-value");
					var mainId = $(this).attr("id");
					var params = {
							itemId:itemId,
							mainId:mainId
						};
					var sign = $(this).html();
					if (sign == '报名') {
						var params = {
							itemId:itemId,
							mainId:mainId
						};
						topUtil.web_query('/mobile/activity/user/addMainUser',params, function (data) {
							if (typeof data == "string") {
				                data = JSON.parse(data);
				            }
							if (data.success) {
								$('#'+mainId).html('撤销报名');
								mui.toast(data.msg);
								
							} else {
								mui.toast(data.msg);
							}
						});
					} else if (sign == '撤销报名') {
						topUtil.web_query('/mobile/activity/user/deleteMainUser',params, function (data) {
							if (typeof data == "string") {
				                data = JSON.parse(data);
				            }
							if (data.success) {
								$('#'+mainId).html('报名');
								mui.toast(data.msg);
							} else {
								mui.toast(data.msg);
							}
						});
					} else if (sign == "撤销邀请") {
						topUtil.web_query('/mobile/activity/main/deleteActivityMain',params, function (data) {
							if (typeof data == "string") {
				                data = JSON.parse(data);
				            }
							if (data.success) {
								aftersave();
							} else {
								mui.toast(data.msg);
							}
						});
					}
				}
			});
			//我的发布
			$(document).on('tap','.bg2',function () {
				if (follow == 0) {
					mui.toast("请先关注");
				} else if (follow == 1) {
				mui.openWindow({
					    url: dynamicURL+'mobile/activity/main/toUserRelease?itemId='+itemId+'&bg=2&follow='+follow+'&type=0', 
					    id : 'mobile/activity/main/toUserRelease',
					    show:{
					      autoShow:true,//页面loaded事件发生后自动显示，默认为true
					      aniShow:"slide-in-right",
					      duration:'250'
					    },
					     waiting:{
					      autoShow:false,//自动显示等待框，默认为true
				     	}
			  		});
			  	}
			});
			//我的报名
			$(document).on('tap','.bg3',function () {
				if (follow == 0) {
					mui.toast("请先关注");
				} else if (follow == 1) {
				mui.openWindow({
					 url: dynamicURL+'mobile/activity/main/toUserRelease?itemId='+itemId+'&bg=3&follow='+follow+'&type=0', 
					    id : 'mobile/activity/main/toUserRelease',
					    show:{
					      autoShow:true,//页面loaded事件发生后自动显示，默认为true
					      aniShow:"slide-in-right",
					      duration:'250'
					    },
					     waiting:{
					      autoShow:false,//自动显示等待框，默认为true
				     	}
			  		});
			  	}
			});
			//发表动态
			$(document).on('tap','#message',function () {
				if (follow == 0) {
					mui.toast("请先关注");
				} else if (follow == 1) {
					mui.openWindow({ 
						url: '${dynamicURL}/mobile/message/toCardAdd?itemId='+itemId+'&itemName='+itemName, 
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
			  	}
			});
			
			//我发布的动态
			$(document).on('tap','#myMessage',function () {
				if (follow == 0) {
					mui.toast("请先关注");
				} else if (follow == 1) {
					mui.openWindow({
					    url: dynamicURL+'mobile/message/toMyCard?itemId='+itemId, 
						id : 'my_card.html',
					    show:{
					      autoShow:true,//页面loaded事件发生后自动显示，默认为true
					      aniShow:"slide-in-right",
					      duration:'250'
					    },
					     waiting:{
					      autoShow:false,//自动显示等待框，默认为true
				     	}
			  		});
			  	}
			});
			
			function loadData(itemId,pageRows,pageNum){
				var param = {rows:pageRows,page:pageNum,order:'desc',sort:'time',search_EQ_deleteFlag:0,search_EQ_type:itemId};
				topUtil.web_query("/mobile/message/list",param,function(data){
					if (typeof data == "string") {
		                data = JSON.parse(data);
					}
					for (var index = 0;index < data.rows.length;index++) {
						var item = data.rows[index];
						var str = '';
						str = noImg(item);
						$('#message-list').append(str);
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
								$('#news-header-'+item.id+'').after(detele);
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
							//getUserPhoto(item);
						});	
					});
					pullRefresh2.endPullUpToRefresh(++pageNum> Math.ceil(data.total/pageRows));
				});
			}
			
			function getUserPhoto(item){
				topUtil.web_query("/mobile/venue/user/userHeadImg",{uuid:item.userPhoto},function(data){
					if(data){
						$('#userPhoto-'+item.id).attr("src",dynamicURL+'mobile/venue/user/userHeadImg?uuid='+item.userPhoto)
					}
				});
			}
			//生成li（无图片）
			function noImg(item){
				var str = '<div id="li-'+item.id+'" class="news bt"><div class="news-header" id="news-header-'+item.id+'">';
				str += '<img id="userPhoto-'+item.id+'" src="'+item.imgUrl+'" alt=""><span class="imgrcol">';
				str += '<span class="username">'+item.userName+'</span></span></div><div class="news-body linkbtn" id="message-'+item.id+'">';
				str += '<div class="newsText">'+item.content+'</div><div class="news-body-img" id="news-img-'+item.id+'">';
				str += '</div></div><div class="news-footer"><span>'+item.timeWrapper+'</span>';
				str += '<div class="mui-card-footer"><a class="mui-card-link praise" id="praise-'+item.id+'"><span class="icon iconfont icon-dianzan"></span>';
				str += '&nbsp;<span class="setft" id="setft-'+item.id+'">'+item.zanNumber+'</span></a>';
				str += '<a class="mui-card-link"><span class="icon iconfont icon-pinglun1 linkbtn" id="comment-'+item.id+'"></span>&nbsp;<span class="setft" id="xinxi-'+item.id+'">'+item.commentNumber+'</span></a></div></div>';
				
				/*var str = '<li id="li-'+item.id+'" class="mui-table-view-cell" style="padding:0;">'
					+'<div class="mui-card"><a class="linkbtn" id="message-'+item.id+'"><div class="news-header" id="mui-card-header-'+item.id+'">'
					//用户头像和名称
					+'<img id="userPhoto-'+item.id+'" src="../../images/front/user1.png"/><div class="mui-media-body">'+item.userName+''
					+'<p>'+item.timeWrapper+'</p></div></div>'
					+'<div class="mui-card-content" ><div class="news-body-img" id="news-img-'+item.id+'"></div></div>'
					+'<div class="mui-card-content" ><div class="mui-card-content-inner">'
					//发表内容
					+'<p style="color: #333;">'+item.content+'</p></div></div></a>'
					+'<div class="mui-card-footer"><a class="mui-card-link praise" id="praise-'+item.id+'"><span class="icon iconfont icon-dianzan"></span>'
					//点赞跟评论分享
					+'&nbsp;<span class="setft" id="setft-'+item.id+'">'+item.zanNumber+'</span></a>'
					+'<a class="mui-card-link"><span class="icon iconfont icon-pinglun1 linkbtn" id="comment-'+item.id+'"></span>&nbsp;<span class="setft" id="xinxi-'+item.id+'">'+item.commentNumber+'</span></a>'
					+'<a class="mui-card-link" href="#share"><span class="mui-icon mui-icon-paperplane"></span></a></div></div>';*/
					return str;
			}
			
			//一张图片
			function Img(result,ite,divWidth,divHeight){
				var filePath = dynamicURL+"/mobile/message/image/showImage?uuid="+ result[0].uuid;
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
						var filePath = dynamicURL+"/mobile/message/image/showImage?uuid=" + item.uuid;
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
	                if (maxWidth/ maxHeight  <= image.width / image.height){ //原图片宽高比例 大于 图片框宽高比例  
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
					//constants.toLoginPage();
					mui.toast('请返回在市北登录后使用该功能！');
				}else if (constants.getLoginStatus() == 1) {
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
						topUtil.web_query("/mobile/message/deleteZan",param,function(data){
							if (typeof data == "string") {
				                data = JSON.parse(data);
							}
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
						topUtil.web_query("/mobile/message/saveZan",param,function(data){
							if (typeof data == "string") {
				                data = JSON.parse(data);
							}
						});
					}
					$('#setft-'+messageId).text(num);
				}
			});
			//跳转到详情页
			$(document).on('tap','.linkbtn',function(){
				var messageId=this.id.split('-')[1];
				mui.openWindow({ 
					url: dynamicURL+'mobile/message/toCardDetail?messageId='+messageId, 
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
			
			//点击删除所发动态
			$(document).on('tap','.footer-span-color',function(){
				var messageId=this.id.split('-')[1];
				var r=confirm("确定要删除这条动态吗？");
				if(r){
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
		</script>
</body>
</html>