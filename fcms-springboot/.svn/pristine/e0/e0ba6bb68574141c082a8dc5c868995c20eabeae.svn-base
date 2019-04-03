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
		.mui-content{
			min-height: 100vh;
			background-color:#fff;
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
		.infoData {
			padding: 0;
		}
		.mui-control-content {
			background-color: white;
		}
		
		.mui-control-content .mui-loading {
			margin-top: 50px;
		}
		.addNum{
			float: right;
			color:#fff;
			background-color:#00a2ea ;
			padding:2px 10px;
			border-radius:5px;
		}
		</style>
</head>
<body>
		<header class="mui-bar mui-bar-nav transparent">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title"></h1>
		</header>
		<div class="mui-content" id="news">
			<div class="infoData" id="activity-list">
							
				<%-- <script id='msg-template' type="text/template">
				<% for(var i in message){ var item = message[i]; %>
					<div class="news bt">
					<div class="news-header">
						<img src="<%=(serverPath)%>/mobile/venue/user/userHeadImg?uuid=<%=(item.uuid)%>" alt="">
						<span class="imgrcol">
							<span class="username"><%=(item.userName)%></span>
						</span>
					</div>
					<div class="news-body" data-value="<%=(item.id)%>">
						<div class="newsText">
							<div class="name"><%=(item.title)%></div>
							<div class="rowText">
								<span>要求成员：</span>
								<span><%=(item.member)%>（<%=(item.peopleNum)%>人）</span>
							</div>
							<div class="rowText">
								<span>费用类型：</span>
								<span><%=(item.costType)%></span>
							</div>
							<div class="rowText">
								<span>集合地点：</span>
								<span><%=(item.location)%></span>
							</div>
							<div class="rowText">
								<span>联系方式：</span>
								<span><%=(item.tel)%></span>
							</div>
							<div class="rowText">
								<%if(type == 1){%>
									<span>比赛时间：</span>
								<%}else{%>
									<span>活动时间：</span>
								<%}%>
								
								<span><%=(item.activityTime)%></span>
							</div>
							<div class="rowText">
								<span>报名截止时间：</span>
								<span><%=(item.stopTime)%></span>
							</div>
						</div>
					</div>
					<div class="news-footer">
						<span><%=(item.timeWrapper)%></span>
						<span class="addNum" id="<%=(item.id)%>" data-value="<%=(item.itemId)%>">已报名列表</span>
					</div>
				</div>
			<% } %>
			</script> --%>
			</div>
		</div>
		
		<script>
			
			var itemId;
			var bg;
			var type;
			mui.ready(function() {
				itemId = '${itemId}';
				bg = '${bg}';
				type = '${type}';
				if (bg == 2){
					$('.mui-title').append("我的发布");
					userRelease (itemId);
				} else if (bg == 3) {
					$('.mui-title').append("我的报名");
					mySign (itemId);
				}
			});
			function userRelease (itemId) {
				topUtil.web_query('/mobile/activity/main/releaseList', {itemId:itemId}, function (data) {
					if (typeof data == "string") {
		                data = JSON.parse(data);
		            }
					if (data.success) {
						var str = strNews(data.obj);
						$('#activity-list').html(str);
						//document.getElementById("activity-list").innerHTML = template('msg-template', {"message": data.obj,"serverPath":serverPath,"type":type});
					}
				});
			}
			
			function mySign (itemId) {
				topUtil.web_query('/mobile/activity/main/userSign', {itemId:itemId}, function (data) {
					if (typeof data == "string") {
		                data = JSON.parse(data);
		            }
					if (data.success) {
						var str = strNews(data.obj);
						$('#activity-list').html(str);
						//document.getElementById("activity-list").innerHTML = template('msg-template', {"message": data.obj,"serverPath":serverPath,"type":type});
					}
				});
			}	

			function strNews(data) {
				var str = '';
				mui.each(data, function(index,item) {
					str += '<div class="news bt"><div class="news-header"><img src="'+item.userPhoto+'" alt="">';
					str += '<span class="imgrcol"><span class="username">'+item.userName+'</span></span></div>';
					str += '<div class="news-body" data-value="'+item.id+'"><div class="newsText"><div class="name">'+item.title+'</div>';
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
					str += '<span class="addNum" id="'+item.id+'" data-value="'+item.itemId+'">已报名列表</span></div></div>';
				});
				return str;
			}
			
			
			$(document).on('tap','.addNum',function () {
				var mainId = $(this).attr('id');
				mui.openWindow({
					    url: dynamicURL+'mobile/activity/main/toUserSign?mainId='+mainId, 
					    id : 'mobile/activity/main/toUserSign',
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
			
			$(document).on('tap', '.news-body',function() {
				var mainId = $(this).attr("data-value");
				mui.openWindow({
					    url: dynamicURL+'mobile/activity/main/toUserSportCircle?mainId='+mainId+'&follow=1&type='+type, 
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
			
		</script>
</body>
</html>