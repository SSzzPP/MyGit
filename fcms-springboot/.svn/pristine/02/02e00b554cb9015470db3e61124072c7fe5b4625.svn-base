<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>教练详情</title>
	<style>
			.persionCol {
				height: 180px;
				background-color: #584f60;
				position: relative;
				padding-top: 30px;
			}
			
			.imgCol {
				margin: 0px auto 20px;
			}
			
			.persionInfo {
				color: #fff;
				text-align: center;
			}
			
			.setIcon {
				position: absolute;
				top: 15px;
				right: 20px;
				color: #fff;
			}
			
			.dataCol {
				background-color: #fff;
				display: flex;
			}
			
			.dataTab {
				flex: 1;
				height: 100px;
				text-align: center;
				padding: 17px 0;
			}
			
			.dataTab span:first-child {
				font-size: 24px;
				color: #52ACE5;
			}
			
			.dataTab span:last-child {
				display: block;
				font-size: 12px;
				line-height: 30px;
			}
			
			.mui-media-object {
				height: 40px;
				margin-right: 10px;
			}
			
			.mui-media-body {
				line-height: 40px;
			}
			
			.mui-table-view-cell a {
				padding-left: 20px;
			}
			
			.mui-small {
				line-height: 1.2;
				font-size: 12px;
			}
			
			.infoData {
				padding: 0 10px;
			}
			
			.bt {
				border-bottom: 1px solid #e6e6e6;
				padding-bottom: 5px;
			}
			
			.allComment {
				width: 100%;
				padding: 10px 0;
				text-align: center;
				color: #000;
				display: block;
				font-size: 14px;
			}
			.coachExp{
				padding:10px 20px;
			}
		</style>
</head>
<body>
		<header class="mui-bar mui-bar-nav">
			<div class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left " onclick="back(),plus.nativeUI.closeWaiting();"></div>
			<h1 class="mui-title"></h1>
			<a class="mui-icon mui-icon-chat mui-pull-right" id="toChat"></a>
		</header>
		<div class="mui-content">
			<div class="persionCol">
				<div class="imgCol">
					<img class="headImg" src="${staticURL}/images/front/user1.png" alt="" />
				</div>
				<div class="persionInfo">
					<span></span>
				</div>
			</div>
			<div class="mui-menu setmar">
				<div class="mui-menu-header">
					<span class="font-big">课程</span>
				</div>
				<div class="mui-row">
					<div class="mui-col-xs-12" id="feescale">
					</div>
				</div>
			</div>
			<div class="mui-menu setmar">
				<div class="mui-menu-header">
					<span class="font-big">证书</span>
				</div>
				<div class="mui-row" style="margin-top:8px">
			    	<div class=" mui-col-xs-12" id="cerificate">
			    		
			        </div>
			    </div>
	       	</div>
	       	<div class="mui-menu setmar">
				<div class="mui-menu-header">
					<span class="font-big">个人经历</span>
				</div>
				<div class="mui-row">
					<div class="mui-col-xs-12">
						<div class="coachExp">
							<p></p>
						</div>
					</div>
				</div>
			</div>
	       	<div class="mui-menu setmar ">
	       		<div class="mui-menu-header ">
	       			<span class="font-big">评价</span>
	       		</div>
	       		<div class="mui-row" style="margin-top:8px">
					<div class="mui-col-xs-12">
						<div class="infoData">
						</div>
					</div>
				</div>
			</div>
			
		</div>
		<script>
			var coachUuid = '${coachUuid}';
			var userId = '${userId}';
			var coachName = "";
			//var serverPath = window.constants.getServerPath();
			
			mui.init();
			mui.ready(function(){
				/*教练信息*/
				coachInfo(coachUuid);
				/*加载课程*/
				courseList(userId);
				/*证书信息*/
				cerificateList(userId);
				/*评价*/
				vealuate (userId);
				courseNum (userId);
			});
			/*教练信息*/
			function  coachInfo(coachUuid) {
				topUtil.web_query('/mobile/venue/user/userInfo', {uuid:coachUuid}, function (data) {
					if (typeof data == "string") {
		               data = JSON.parse(data);
		           	}
					if (data.success) {
						coachName = data.obj.name;
						$('.mui-title').html(data.obj.name);
						$('.persionInfo span').html(data.obj.mobile);
						$('.coachExp p').html(data.obj.experience);
						$('.headImg').attr('src',data.obj.imgUrl);
					}
				});
			}
			/*课程信息*/
			function courseList (userId) {
				topUtil.web_query('/mobile/venue/course/search', {search_EQ_userId:userId}, function (data) {
					if (typeof data == "string") {
		               data = JSON.parse(data);
		           }
					if (data) {
						var str = '';
						mui.each(data, function (index,item) {
							str += '<li class="mui-table-view-cell"><a style="line-height: 30px;">'+item.name;
							str += '<p style="font-size: 14px;color:#1d9df4;">'+item.feeScale+'</p>';
							//str += '<button type="button" class="mui-btn mui-small mui-btn-primary" onclick="order('+item.id+')">预定课程</button></a></li>';
						});
						$('#feescale').append(str);
					}
				});
			}
			/*证书信息*/
			function cerificateList (userId) {
				topUtil.web_query('/mobile/venue/cerificate/search', {search_EQ_userId:userId}, function (data) {
					if (typeof data == "string") {
		               data = JSON.parse(data);
		            }
					if (data) {
						var str = '';
						mui.each(data, function (index,item) {
							str += '<li class="mui-table-view-cell mui-media "><a href="javascript:void; ">';
							str += '<img class="mui-media-object mui-pull-left " src="'+staticURL+'images/front/certificate.png ">';
							str += '<div class="mui-media-body mui-ellipsis ">'+item.name+'</div></a></li>';
						});
						$('#cerificate').append(str);
					}
					
				});
			}
			/*评价列表*/
			function vealuate (userId) {
				var params = {};
				params.search_EQ_userId = userId;
				params.page = 1;
				params.rows = 3;
				params.order = 'desc';
				topUtil.web_query('/mobile/vealuate/user/list', params, function (data) {
					if (typeof data == "string") {
		               data = JSON.parse(data);
		            }
					if (data.rows) {
						var str = '';
						mui.each(data.rows,function(index,item) {
							str += '<div class="news bt"><div class="news-header"><img src="'+dynamicURL+'mobile/venue/user/userHeadImg?uuid='+item.uuid+'" alt="">';
							var star = item.starLevel*10;
							str += '<span class="imgrcol" style="margin-top:10px"><span class="username">'+item.userName+'</span><span class="mid-rank-stars mid-str'+star+'"></span></span></div>';
							str += '<div class="news-body"><div class="newsText">'+item.content+'</div></div>';
							str += '<div class="news-footer"><span>'+item.timeWrapper+'</span></div></div>';
						});
						if (data.total > 3) {
							var num = data.total;
							str += '<a class="allComment" onclick="allVealuate(userId)">查看全部评论<span>('+num+')</span></a>';
						}
						$(".infoData").append(str);
					}
				});
			}
			function order(courseId){
				if (constants.getLoginStatus() == 0) {
					mui.toast('请返回在市北登录后使用该功能！');
					//constants.toLoginPage();
				} else if (constants.getLoginStatus() == 1) {
					mui.openWindow({
					    url: dynamicURL+'mobile/order/toCoachOrder?coachId='+userId+'&courseId='+courseId, 
					    id : 'mobile/order/toCoachOrder',
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
			}
			/*课程数量*/
			function courseNum (userId) {
				topUtil.web_query('/mobile/venue/course/countCourse', {userId:userId}, function (data) {
					if (typeof data == "string") {
		               data = JSON.parse(data);
		          	}
					$('#courseNum').append(data);
				});
			}
			document.getElementById('toChat').addEventListener('tap',function () {
				if (constants.getLoginStatus() == 0) {
					mui.toast('请返回在市北登录后使用该功能！');
					//constants.toLoginPage();
				} else if (constants.getLoginStatus() == 1) {
					mui.openWindow({
						url: '${dynamicURL}/mobile/chatmessage/toChat?userId='+userId + '&userName=' + coachName, 
				    	id : 'im-chat.html',
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
			
			function allVealuate(coachId){
				mui.openWindow({
				    url: dynamicURL+'mobile/vealuate/user/toAllCoachVealuate?coachId='+coachId, 
				    id : 'mobile/venue/vealuate/toAllCoachVealuate',
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
		</script>
</body>
</html>