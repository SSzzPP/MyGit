<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="tab_bottom.jsp" flush="true">
<jsp:param name="my" value="mui-active"/>
</jsp:include>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<title>我的</title>
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<style>
		.menu-col{
			background-color: white;
			overflow: hidden;
		}
		.menu{
			width:33.333%;
			height:100px;
			text-align: center;
			float: left;
			padding:17px 0;
			border-right:1px solid #f4f4f4;
			border-bottom:1px solid #f4f4f4;
		}
		.menu img{
			width:36px;
			height:36px;
		}
		.menu span:first-child{
			font-size:24px;
			color: #52ACE5;
		}
		.menu span:last-child{
			display: block;
			font-size:12px;
			line-height:30px;
			color:#757575;
		}
		.persionCol{
			height:180px;
			background-color: #584f60;
			position: relative;
			padding-top:30px;
		}
		.imgCol{
			margin:0px auto 20px;
		}
		.persionInfo{
			color:#fff;
			text-align: center;
		}
		.setIcon{
			position: absolute;
			top:15px;
			right:20px;
			color:#fff;
		}
		.dataCol{
			background-color: #fff;
			display: flex;
		}
		.dataTab{
			flex: 1;
			height:100px;
			text-align: center;
			padding:17px 0;
		}
		.dataTab span:first-child{
			font-size:24px;
			color: #52ACE5;
		}
		.dataTab span:last-child{
			display: block;
			font-size:12px;
			line-height:30px;
		}
		.mui-table-view:before,.mui-table-view:after{
			height:0;
		}
		.mui-table-view-cell:after{
			left:45px;
		}
		.paddself{
			padding-left:55px!important;
		}
		.paddself span{
			color:#2a2a2a;
		}
		.paddself .setIcon{
			right:auto;
			left:15px;
			color:#7695ce;
			font-size:20px;
		}
	</style>
</head>
<body>
		<div class="mui-content">
			<div class="persionCol">
				<div class="imgCol" id="myInfo">
					<img class="headImg" src="${staticURL}/images/front/user1.png" alt="" />
				</div>
				<div class="persionInfo">
					<!--<span>18353***73</span>-->
					<span id="loginName">未登录</span>
				</div>
				<!-- <span class="setIcon icon iconfont icon-pinglun1"></span> -->
			</div>
			<div id='mainMenu' class="menu-col setmar">
				<%-- <div class="menu" id="" url="${dynamicURL}/mobile/survey/paperUser/toSurveyList" status="1">
					<img src="${staticURL}/images/front/mytab1.png" alt="" />
					<span>问卷调查</span>
				</div>
				<div class="menu" id="mobile/survey/userTotal/toServeyUserTotal" url="${dynamicURL}/mobile/survey/userTotal/toServeyUserTotal" status="1">
					<img src="${staticURL}/images/front/mytab2.png" alt="" />
					<span>问卷统计</span>
				</div>
				<div  name="myOrder" class="menu" id="myOrder" status="1">
					<img src="${staticURL}/images/front/mytab3.png" alt="" />
					<span>我的预约</span>
				</div>
				<div class="menu" id="/mobile/activity/item/toSportCript" url="${dynamicURL}/mobile/activity/item/toSportCript?type=0" status="1">
					<img src="${staticURL}/images/front/mytab4.png" alt="" />
					<span>赛事信息</span>
				</div>
				<div class="menu" id="/mobile/checklist/toCreate" url="${dynamicURL}/mobile/checklist/toCreate" status="1">
					<img src="${staticURL}/images/front/mytab5.png" alt="" />
					<span>新增检查单</span>
				</div>
				<div class="menu" id="checklist.html" url="${dynamicURL}/mobile/mobile/checklist/toList" status="1">
					<img src="${staticURL}/images/front/mytab6.png" alt="" />
					<span>检查单列表</span>
				</div> --%>
			</div>
			<!-- <ul class="mui-table-view setmar">
				<li class="mui-table-view-cell"  id="createChecklist">
		            <a class="mui-navigate-right paddself">
		            	<span>新增检查单</span>
		            	<span class="setIcon icon iconfont icon-jihua1"></span>
		            </a>
		        </li>
		        <li class="mui-table-view-cell"  id="checklist">
		            <a class="mui-navigate-right paddself">
		            	<span>检查单列表</span>
		            	<span class="setIcon icon iconfont icon-jihua1"></span>
		            </a>
		        </li>
				<li class="mui-table-view-cell">
		            <a class="mui-navigate-right paddself">
		            	<span>我的预约</span>
		            	<span class="setIcon icon iconfont icon-jihua1"></span>
		            </a>
		        </li>
		        <li class="mui-table-view-cell">
		            <a class="mui-navigate-right paddself">
		            	<span>我的合同</span>
		            	<span class="setIcon icon iconfont icon-baogao"></span>
		            </a>
		        </li>
		        <li class="mui-table-view-cell" id="event">
		            <a class="mui-navigate-right paddself">
		            	<span>赛事信息</span>
		            	<span class="setIcon icon iconfont icon-xiangqing1"></span>
		            </a>
		        </li>
		   	</ul> -->
			<!-- <ul class="mui-table-view" style="margin-top: 25px;" id='loginout'>
				<li class="mui-table-view-cell" style="text-align: center;">
					<a style="color: red;">退出登录</a>
				</li>
			</ul> -->
		</div>
		<script>
			mui.init({
				swipeBack:true
			});
			mui.ready(function(){
		   	 	//根据登录状态判断是否跳转页面
		   	 	showContent();
			})
			/*显示的菜单*/
			/* {
					linkUrl:'',
					imgUrl:'${staticURL}/images/front/mytab3.png',
					menuName:'我的预约',
					type:[0,1,2]
				} */
			var menuList = [
				{
					linkUrl:'${dynamicURL}/mobile/survey/paperUser/toSurveyList',
					imgUrl:'${staticURL}/images/front/mytab1.png',
					menuName:'问卷调查',
					type:[0,1,2,3]
				},{
					linkUrl:'${dynamicURL}/mobile/survey/userTotal/toServeyUserTotal',
					imgUrl:'${staticURL}/images/front/mytab2.png',
					menuName:'问卷统计',
					type:[3]
				},{
					linkUrl:'${dynamicURL}/match/main/toMatchMain',
					imgUrl:'${staticURL}/images/front/mytab4.png',
					menuName:'赛事信息',
					type:[0,1,2,3]
				},{
					linkUrl:'${dynamicURL}/mobile/checklist/toCreate',
					imgUrl:'${staticURL}/images/front/mytab5.png',
					menuName:'新增检查单',
					type:[3]
				},{
					linkUrl:'${dynamicURL}/mobile/checklist/toList',
					imgUrl:'${staticURL}/images/front/mytab6.png',
					menuName:'检查单列表',
					type:[3]
				},{
					linkUrl:'${dynamicURL}/mobile/news/subscribe/toNewsSubscribe',
					imgUrl:'${staticURL}/images/front/mytab7.png',
					menuName:'消息订阅',
					type:[0,1,2,3]
				},{
					linkUrl:'${dynamicURL}/mobile/news/subscribe/toOnlineStudy',
					imgUrl:'${staticURL}/images/front/mytab8.png',
					menuName:'健身频道',
					type:[0,1,2,3]
				},{
					linkUrl:'${dynamicURL}/mobile/order/toHealth',
					imgUrl:'${staticURL}/images/front/mytab9.png',
					menuName:'运动健康',
					type:[0,1,2,3]
				},{
					linkUrl:'${dynamicURL}/mobile/wallet/toWallet',
					imgUrl:'${staticURL}/images/front/mytab5.png',
					menuName:'我的钱包',
					type:[0,1,2,3]
				},{
					linkUrl:'${dynamicURL}/mobile/coach/certificate/toCoachCertificate',
					imgUrl:'${staticURL}/images/front/mytab11.png',
					menuName:'用户认证',
					type:[1,2]
				},{
					linkUrl:'',
					imgUrl:'${staticURL}/images/front/mytab10.png',
					menuName:'开发中',
					type:[2]
				}
			]
			/*
			 * 添加自定义事件，监听登录状态
			 */
			window.addEventListener("updateLoginStatus",function(e){
				mui.ready(function(){
					showContent();
				})
			});

			/**
			 * 根据登录状态判断是否跳转页面
			 */
			function showContent() {
				//var serverPath = window.constants.getServerPath();
				var uuid = constants.getSettings().uuid;
				var loginUser = constants.getSettings().loginUser;
				var userPhoto = constants.getSettings().userPhoto;
				//类型（0：管理；1：教练；2：普通用户）
				var type = constants.getSettings().type;
				
				if (userPhoto) {
					$('.headImg').attr('src', userPhoto);
				} else {
					$('.headImg').attr('src', '${staticURL}/images/front/user1.png');
				}
				if (constants.getLoginStatus() == 1) {
					if (loginUser) {
						$('#loginName').html(loginUser);
					} else {
						$('#loginName').html('未设置');
					}
				}
				//清空菜单
				$("#mainMenu").empty();
				var str='';
				$.each(menuList,function(index,item){
					if(item.type.indexOf(type) > -1){
					 	if(item.menuName == '我的预约'){
							str += '<div name="myOrder" class="menu" id="" status="1">';
							str += '  <img src="'+item.imgUrl+'" alt="" />';
							str += '  <span>'+item.menuName+'</span>';
							str += '</div>';
						}else if(item.menuName == '健身频道'){
							str += '<div name="sportChannel" class="menu" id="" url="'+item.linkUrl+'" status="1">';
							str += '  <img src="'+item.imgUrl+'" alt="" />';
							str += '  <span>'+item.menuName+'</span>';
							str += '</div>';
						}else{ 
							str += '<div class="menu" id="" url="'+item.linkUrl+'" status="1">';
							str += '  <img src="'+item.imgUrl+'" alt="" />';
							str += '  <span>'+item.menuName+'</span>';
							str += '</div>';
						}
					}
				});
				$("#mainMenu").append(str);
			}
			
		/* 	document.getElementById('loginout').addEventListener('click',function () {
				if (constants.getLoginStatus() == 1) {
						mui.confirm('退出登录？','',function(e) {
							if(e.index == 1){
								var params = {};
								topUtil.web_query('h5plus/login/loginOutMobile',params,
									function (data) {
										if (typeof data == "string") {
											data = JSON.parse(data);
										}
										if (data.success) {
											// 更改本地登录状态
											constants.setLoginStatus(0);
											//清空本地的存储
											constants.setSettings({});
											//清空菜单
											$("#mainMenu").empty();
											//关闭登录页
											//plus.webview.getWebviewById("login.html").close("none");
											mui.toast("退出成功"); 
											showContent();
										} 
									}
								);
							}
						});
				} else {
					mui.toast("请先登录");
				}
				
			}); */
			/*我的信息*/
			/* document.getElementById('myInfo').addEventListener('tap',function () {
				if (constants.getLoginStatus() == 0) {
					constants.toLoginPage();
				} else {
					mui.openWindow({
					    url: dynamicURL+'mobile/venue/user/toMyInfo', 
					    id : 'mobile/venue/user/toMyInfo',
					    show:{
					      autoShow:true,//页面loaded事件发生后自动显示，默认为true
					      aniShow:"slide-in-bottom",
					      duration:'250'
					    },
					    waiting:{
					      autoShow:false,//自动显示等待框，默认为true
				      	}
			  		});
				}
			},false); */
			/***
			 * 六大菜单
			 */
			mui("#mainMenu").on('tap','.menu',function(){
				var openStatus = $(this).attr('status');
				var id = $(this).attr('id');
				var url = $(this).attr('url');
				if($(this).attr('name')=="sportChannel"){
					topUtil.web_query("/mobile/news/subscribe/dynamicTabDetail",{},function(result){
						if (typeof result == "string") {
							result = JSON.parse(result);
				           }
						var urlStr='';
						if (result.success){
							var userTabs = result.obj.types.split(",");
							if(isInArray('3',userTabs))
								urlStr ='${dynamicURL}/mobile/news/subscribe/toMatchNews';
							if(isInArray('2',userTabs))
								urlStr ='${dynamicURL}/mobile/news/subscribe/toCircleNews';
							if(isInArray('1',userTabs))
								urlStr ='${dynamicURL}/mobile/news/subscribe/toLaws';
							if(isInArray('0',userTabs))
								urlStr ='${dynamicURL}/mobile/news/subscribe/toSportMatch';
							url=urlStr;
						}
					});
				}
				if ($(this).attr('name')=="myOrder"){
					var type = constants.getSettings().type;
					if(type==2){
						url = dynamicURL+'mobile/order/toCommonMyOrder';
						id = 'mobile/order/toCommonMyOrder';
					}
					if(type == 0){
						//商家
						var url = dynamicURL+'mobile/order/toVenueMyOrder';
						var id = 'mobile/order/toVenueMyOrder';
					}
					if(type==1){
						//教练
						var url = dynamicURL+'mobile/order/toCoachMyOrder';
						var id = 'mobile/order/toCoachMyOrder';
					}
				}
				if(constants.getLoginStatus() == 0){
					//constants.toLoginPage();
					mui.toast('请返回在市北登录后使用该功能！');
					return;
				} else {
					if(url!=''){
						setTimeout(function(){
							mui.openWindow({ 
							    url: url, 
							    id : id,
							    show:{
							      autoShow:true,//页面loaded事件发生后自动显示，默认为true
							      aniShow:"slide-in-bottom",
							      duration:'250'
							    },
							    waiting:{
							      autoShow:false,//自动显示等待框，默认为true
						      	}
					  		});
						},100);
					}
				}
				
			});
			function isInArray(e,arr){
				var index = $.inArray(e,arr);
				//存在返回下标  不存在返回-1
				var inArray = false;
				if (index != -1)
					inArray=true;
				return inArray;
			}
			/*我的预约*/
			/* document.getElementById('myOrder').addEventListener('tap',function () {
				//用户
				var type = constants.getSettings().type;
				var url = '../order/myOrder.html';
				var id = 'myOrder.html';
				if(type == 0){
					//商家
					var url = '../orderVenue/order_venue.html';
					var id = 'order_venue.html';
				}
				mui.openWindow({ 
				    url: url, 
				    id : id,
				    show:{
				      autoShow:true,//页面loaded事件发生后自动显示，默认为true
				      aniShow:"slide-in-bottom",
				      duration:'250'
				    },
				     waiting:{
				      autoShow:false,//自动显示等待框，默认为true
			      	}
		  		});
			},false);
			
			document.getElementById('createChecklist').addEventListener('tap',function () {
				if(constants.getLoginStatus() == 0){
					constants.toLoginPage('../../login.html');
					return;
				} else if(constants.getSettings().type != 3){
					mui.toast('您当前没有权限');
					return;
				} else{
					mui.openWindow({ 
					    url: dynamicURL+'mobile/checklist/toCreate', 
					    id : "check_list_create",
					    show:{
					      autoShow:true,//页面loaded事件发生后自动显示，默认为true
					      aniShow:"slide-in-bottom",
					      duration:'250'
					    },
					     waiting:{
					      autoShow:false,//自动显示等待框，默认为true
				      	}
			  		});
				}
			},false)
			
			document.getElementById('checklist').addEventListener('tap',function () {
				if(constants.getLoginStatus() == 0){
					constants.toLoginPage('../../login.html');
					return;
				} else if(constants.getSettings().type != 3){
					mui.toast('您当前没有权限');
					return;
				} else{
					mui.openWindow({ 
					    url: dynamicURL+'mobile/checklist/toList', 
					    id : "check_list",
					    show:{
					      autoShow:true,//页面loaded事件发生后自动显示，默认为true
					      aniShow:"slide-in-bottom",
					      duration:'250'
					    },
					     waiting:{
					      autoShow:false,//自动显示等待框，默认为true
				      	}
			  		});
				}
			},false)
			document.getElementById('event').addEventListener('tap',function () {
			    mui.openWindow({ 
				    url: dynamicURL+"mobile/activity/item/toSportCript?type=1", 
				    id : "mobile/activity/item/toSportCript",
				    show:{
				      autoShow:true,//页面loaded事件发生后自动显示，默认为true
				      aniShow:"slide-in-bottom",
				      duration:'250'
				    },
				     waiting:{
				      autoShow:false,//自动显示等待框，默认为true
			      }
		  		});
			},false) */
		</script>
</body>
</html>