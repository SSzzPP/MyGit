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
	</style>
</head>
<body>
<header class="mui-bar mui-bar-nav transparent">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color:#fff;"></a>
			<h1 class="mui-title"></h1>
		</header>
		<div class="mui-content" id="news">
			<div class="topImg">
				<img src="${staticURL}/images/front/example5.jpg" alt="" />
				<div class="activityName">徒步登山</div>
				<div class="btnrow">
					<div class="numCol"><span class="icon iconfont icon-zhanghu" style="font-size:18px;"></span>&nbsp;<span id="peopleNum">0</span>人关注</div>
					<button type="button" class="mui-btn mui-btn-outlined color-white">未关注</button>
				</div>
			</div>
			<div class="setmar bg-white padding">
				公告：<span>禁止发布非法信息</span>
			</div>
			<div id="slider" class="mui-slider">
			
				<div class="mui-slider-group mui-static setmar bg-white padding">
					<div id="item1mobile" class="mui-slider-item mui-control-content mui-active" style="height:auto">
						<div class="infoData" id="activity-list">
						
						</div>
					</div>
					
				</div>
			</div>
		</div>
		<div class="pobom">
			<div id="item1mobileBtn" class="btnRow mui-active">
				<div class="btnm bg1" id="places">发布赛事</div>
				<div class="btnm bg2">我的发布</div>
				<div class="btnm bg3">我的报名</div>
			</div>
		</div>
		
		
		<script>
			var itemId;
			var itemName;
			var follow;//0未关注 1关注
			var pageRows = 4;
			var pageNum = 0;
			var pullRefresh = null;
			var type;
			var userType = constants.getSettings().type;
			
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
				});
			})(mui);
			
			mui.ready(function() {
				itemId =  '${itemId}';
				itemName = '${itemName}';
				type = '${type}';
				$(".activityName").html(itemName);
				/* if (type == 1) {
					$("#places").html("发布赛事");
				}else {
					$("#places").html("发布邀请");
				} */
				//关注人数和是否关注
				peopleNumAndfollow(itemId);
				//加载发布的活动
				var cells = document.querySelector('#activity-list').querySelectorAll('.news');
				pageNum = Math.ceil(cells.length / pageRows + 1);
				mainList(itemId,pageRows,pageNum);
				$(".topImg img").attr("src",dynamicURL+'/mobile/activity/item/itemHeadImg?itemId='+itemId);
			});
			
			mui('.mui-slider').slider().setStopped(true);
			/*底部button切换*/
			/* mui("#sliderSegmentedControl").on('tap','.mui-control-item',function(){
				var href=$(this).attr("href");
				$(href+"Btn").addClass("mui-active").siblings(".btnRow").removeClass("mui-active");
			}); */
			
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
							str += '<div class="news bt"><div class="news-header"><img src="'+dynamicURL+'mobile/venue/user/userHeadImg?uuid='+item.uuid+'" alt=""><span class="imgrcol">';
							str += '<span class="username">'+item.userName+'</span></span></div><div class="news-body" data-value="'+item.id+'"><div class="newsText"><div class="name">'+item.title+'</div>';
							str += '<div class="rowText"><span>要求成员：</span><span>'+item.member+'（'+item.peopleNum+'人）</span></div>';
							str += '<div class="rowText"><span>费用类型：</span><span>'+item.costType+'</span></div>';
							str += '<div class="rowText"><span>集合地点：</span><span>'+item.location+'</span></div>';
							str += '<div class="rowText"><span>联系方式：</span><span>'+item.tel+'</span></div>';
							if (type == 1) {
								str += '<div class="rowText"><span>比赛时间：</span><span>'+item.activityTime+'</span></div>';
							} else {
								str += '<div class="rowText"><span>活动时间：</span><span>'+item.activityTime+'</span></div>';
							}
							str += '<div class="rowText"><span>报名截止时间：</span><span>'+item.stopTime+'</span></div>';
							str += '<div class="rowText"><span>邀请说明：</span><span>'+item.instructions+'</span></div></div></div>';
							str += '<div class="news-footer"><span>'+item.timeWrapper+'</span>';
							
							if (item.isMain) {
								str += '<span class="addNum"  id="'+item.id+'" data-value="'+item.itemId+'">撤销邀请</span>';
							} else {
								if (item.signNum) {
									if (arr) {
										mui.each(arr,function (ind,ite) {
											if (ite == item.id) {
												flag = true;
											}
										});
									}
									
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
						//document.getElementById("activity-list").innerHTML = template('msg-template', {"message": data.rows,"serverPath":serverPath,"strFollow":arr});
					}
					pullRefresh.endPullUpToRefresh(++pageNum> Math.ceil(data.total/pageRows));
					//pullRefresh.refresh(true);
				});
			}
			
			document.getElementById('places').addEventListener('tap',function () {
				if (follow == 0) {
					mui.toast("请先关注");
				} else if (follow == 1) {
					if (userType == 3) {
						mui.openWindow({
						    url: dynamicURL+'mobile/activity/main/toRelease?itemId='+itemId+'&itemName='+itemName+'&type='+type, 
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
					} else {
						mui.toast("您无权限！");
					}
						
				}
			},false);
			//打开已发布的邀请的详情页
			$(document).on('tap', '.news-body',function() {
				var mainId = $(this).attr("data-value");
				mui.openWindow({
					    url: dynamicURL+'mobile/activity/main/toUserSportCircle?mainId='+mainId+'&follow='+follow+'&type='+type, 
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
			
			window.addEventListener("reload", function(e) {
				plus.webview.currentWebview().reload();
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
			    var list = plus.webview.getWebviewById('sport_circle_detail.html');  
			    //触发列表界面的自定义事件（fncOne）,从而进行数据刷新  
			    mui.fire(list,'reload');
			    //返回true，继续页面关闭逻辑  
			    return true;  
			} */
			
			$(document).on('tap', '.color-white',function() {
				if (constants.getLoginStatus() == 0) {
					mui.toast('请返回在市北登录后使用该功能！');
					//constants.toLoginPage("login.html");
				} else {
					//var peopleNum = $('#peopleNum').html();
					if (follow == 0) {
						//peopleNum++;
						follow = 1;
						$('.color-white').html("已关注");
						topUtil.web_query('/mobile/item/user/saveItemUser', {itemId:itemId}, function (data) {
							if (typeof data == "string") {
				                data = JSON.parse(data);
				            }
							mui.toast("已关注");
							//$('#peopleNum').html(peopleNum);
							//aftersave();
						});
					} else if (follow == 1) {
						//peopleNum--;
						follow = 0;
						$('.color-white').html("未关注");
						topUtil.web_query('/mobile/item/user/deleteItemUser', {itemId:itemId}, function (data) {
							if (typeof data == "string") {
				                data = JSON.parse(data);
				            }
							mui.toast("取消关注");
							peopleNumAndfollow(itemId);
							//$('#peopleNum').html(peopleNum);
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
								$("#activity-list").empty();
								var cells = document.querySelector('#activity-list').querySelectorAll('.news');
								pageNum = Math.ceil(cells.length / pageRows + 1);
								mainList(itemId,pageRows,pageNum);
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
					    url: dynamicURL+'mobile/activity/main/toUserRelease?itemId='+itemId+'&bg=2&follow='+follow+'&type='+type, 
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
					 url: dynamicURL+'mobile/activity/main/toUserRelease?itemId='+itemId+'&bg=3&follow='+follow+'&type='+type, 
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

		</script>
</body>
</html>