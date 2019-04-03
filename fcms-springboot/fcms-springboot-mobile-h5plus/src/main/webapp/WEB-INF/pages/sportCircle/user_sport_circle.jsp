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
			.newsText {
				padding: 10px;
			}
			
			.newsText .name {
				font-weight: 700;
				font-size: 16px;
			}
			
			.rowText {
				line-height: 30px;
			}
			
			.rowText span:last-child {
				color: #a2a2a2;
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
			
			.addNum {
				float: right;
				color: #fff;
				background-color: #00a2ea;
				padding: 2px 10px;
				border-radius: 5px;
			}
		</style>
</head>
<body>
		<header class="mui-bar mui-bar-nav transparent">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">邀请详情</h1>
		</header>

		<div class="mui-content">
			<div class="infoData" id="activity-list">

				<%-- <script id='msg-template' type="text/template">
					<%  var item = message; %>
					<div class="news bt" data-value="<%=(item.id)%>">
						<div class="news-header">
							<img src="<%=(serverPath)%>/mobile/venue/user/userHeadImg?uuid=<%=(item.uuid)%>" alt="">
							<span class="imgrcol">
										<span class="username"><%=(item.userName)%></span>
							</span>
						</div>
						<div class="news-body">
							<div class="newsText">
								<div class="name">
									<%=(item.title)%>
								</div>
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
								<div class="rowText">
									<span>邀请说明：</span>
									<span><%=(item.instructions)%></span>
								</div>
							</div>
						</div>
						<div class="news-footer">
							<span><%=(item.timeWrapper)%></span>
								<%if(item.isMain){%>
								<span class="addNum" id="<%=(item.id)%>" data-value="<%=(item.itemId)%>">撤销邀请</span>
								<%} else {%>
								<%if (item.signNum) { var flag = false; for(var j in arr){if(item.id==arr[j]){flag=true;}}if(flag){%>
								<span class="addNum" id="<%=(item.id)%>" data-value="<%=(item.itemId)%>">报名</span>
								<%}else{%>
								<span class="addNum" id="<%=(item.id)%>" data-value="<%=(item.itemId)%>">撤销报名</span>
								<%}%>
								<%} else {%>
								<span class="addNum" disabled="disabled">报名</span>
								<%}%>
							<%}%>
						</div>
					</div>
				</script> --%>
			</div>
			<div class="infoData" id="activity-userList">
				<%-- <script type="text/template" id="activity-headList">
					<% for(var i in list){ var item = list[i]; %>
					<div class="news bt">
						<div class="news-header">
							<img src="<%=(serverPath)%>/mobile/venue/user/userHeadImg?uuid=<%=(item.uuid)%>" alt="">
							<span class="imgrcol">
									<span class="username"><%=(item.userName)%></span>
							</span>
							<span><%=(item.gmtCreate)%></span>
						</div>
					</div>
					<%}%> --%>
				</script>
			</div>
		</div>
		<script>
			var mainId = '${mainId}';
			var follow = '${follow}';
			var type = '${type}';
			mui.ready(function() {
				detail(mainId);
				userList(mainId)
			});

			function detail(mainId) {
				topUtil.web_query('/mobile/activity/main/detail', {
					id: mainId
				}, function(data) {
					if(typeof data == "string") {
						data = JSON.parse(data);
					}
					if(data.success) {
						var str = '';
						var arr = data.follow.split(",");
						var item = data.obj;
						str += '<div class="news bt"><div class="news-header"><img src="'+item.userPhoto+'" alt=""><span class="imgrcol">';
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
								var flag = false;
								mui.each(arr,function (ind,ite) {
									if (ite == item.id) {
										flag = true;
									}
								});
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
						$('#activity-list').html(str);
					}
				});
			}

			function userList(mainId) {
				topUtil.web_query('/mobile/activity/user/search', {
					search_EQ_mainId: mainId
				}, function(data) {
					if(typeof data == "string") {
						data = JSON.parse(data);
					}
					if(data) {
						var str = '';
						mui.each(data, function (index,item) {
							str += '<div class="news bt"><div class="news-header" id="'+item.uuid+'"><img src="'+item.userPhoto+'" alt="">';
							str += '<span class="imgrcol"><span class="username">'+item.userName+'</span></span><span>'+item.gmtCreate+'</span></div></div>';
						});
						/* document.getElementById("activity-userList").innerHTML = template('activity-headList', {
							"list": data,
							"serverPath": serverPath
						}); */
						$('#activity-userList').append(str);
					}
				});
			}
			$(document).on('tap','.news-header',function () {
				var uuid = $(this).attr("id");
				mui.openWindow({ 
				    url: dynamicURL+'mobile/activity/main/toUserDetail?uuid='+uuid, 
				    id : 'user_detail.html',
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
			$(document).on('tap', '.addNum', function() {
				if(follow == 0) {
					mui.toast('请先关注');
				} else if(follow == 1) {
					var itemId = $(this).attr("data-value");
					var mainId = $(this).attr("id");
					var params = {
						itemId: itemId,
						mainId: mainId
					};
					var sign = $(this).html();
					if(sign == '报名') {
						var params = {
							itemId: itemId,
							mainId: mainId
						};
						topUtil.web_query('/mobile/activity/user/addMainUser', params, function(data) {
							if(typeof data == "string") {
								data = JSON.parse(data);
							}
							if(data.success) {
								$('#' + mainId).html('撤销报名');
								mui.toast(data.msg);

							} else {
								mui.toast(data.msg);
							}
						});
					} else if(sign == '撤销报名') {
						topUtil.web_query('/mobile/activity/user/deleteMainUser', params, function(data) {
							if(typeof data == "string") {
								data = JSON.parse(data);
							}
							if(data.success) {
								$('#' + mainId).html('报名');
								mui.toast(data.msg);
							} else {
								mui.toast(data.msg);
							}
						});
					} else if(sign == "撤销邀请") {
						topUtil.web_query('/mobile/activity/main/deleteActivityMain', params, function(data) {
							if(typeof data == "string") {
								data = JSON.parse(data);
							}
							if(data.success) {
								aftersave();
							} else {
								mui.toast(data.msg);
							}
						});
					}
				}
			});
		</script>
</body>
</html>