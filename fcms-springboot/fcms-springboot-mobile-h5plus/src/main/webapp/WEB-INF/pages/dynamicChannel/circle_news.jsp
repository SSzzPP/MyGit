<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<jsp:include page="dynamic_channel_index.jsp" flush="true">
		<jsp:param name="circle_news" value="mui-active"/>
	</jsp:include>
		<meta charset="utf-8">
		<title>Hello MUI</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
	</head>

	<body>
		<div class="mui-content">
			<div class="mui-slider mui-fullscreen" style="top:82px;overflow:auto;">
				<div class="mui-scroll" id="pullRefresh">
					<ul id="informationList" class="mui-table-view list"></ul>
				</div>
			</div>
		</div>

		<script>
		var pageRows = 4;
		var pageNum = 0;
		var pullRefresh = null;
		mui.init();
		(function($) {
			$.ready(function() {
			    pullRefresh = $("#pullRefresh").pullToRefresh({
					down: {
						callback: function() {
							pageNum = 1;
							getItems(pageRows,pageNum);
							pullRefresh.endPullDownToRefresh();
						}
					},
					up: {
						callback: function() {
							var cells = document.querySelector('.mui-table-view').querySelectorAll('.mui-table-view-cell');
							pageNum = Math.ceil(cells.length / pageRows + 1);
							getItems(pageRows,pageNum);
						}
					}
				});
			});
		})(mui);
		mui.ready(function() {
	   	 	var cells = document.querySelector('.mui-table-view').querySelectorAll('.mui-table-view-cell');
			pageNum = Math.ceil(cells.length / pageRows + 1);
			getItems(pageRows,pageNum);
			
		})
		//加载用户关注且接收消息推送的健身圈信息
		function getItems(pageRows,pageNum){
			var userItemIds=[];
			var itemParams={
				search_EQ_type:2,
				search_EQ_enabled:0
			};
			topUtil.web_query("/mobile/news/subscribe/newsSubscribeList",itemParams,
				function (data) {
					if (typeof data == "string") {
		               data = JSON.parse(data);
		           }
					mui.each(data.rows,function (index,item) {
						userItemIds.push(item.itemId);
					});
				if(pageNum == 1){
				$("#informationList").empty();
			}
			var itemIds = userItemIds;
			var params = {
				rows:pageRows,
				page:pageNum,
				sort:'gmtCreate',
				order:'desc',	
			};
			if(itemIds.length>0)
				params.search_EQ_itemId_1=itemIds[0];
			if((itemIds.length-1)>0)
				params.search_EQ_itemId_2=itemIds[1];
			if((itemIds.length-2)>0)
				params.search_EQ_itemId_3=itemIds[2];	
        	topUtil.web_query("/mobile/activity/main/list",params,
				function (data) {
					if (typeof data == "string") {
		               data = JSON.parse(data);
		            }
					var str = "";
					
					if(data.total != 0) {
						mui.each(data.rows,function (index,item) {
							str += '<li class="mui-table-view-cell" uuid="'+item.uuid+'">';
							str += '<div class="news bt"><div class="news-header"><img src="'+dynamicURL+'/mobile/venue/user/userHeadImg?uuid='+item.uuid+'" alt=""><span class="imgrcol">';
							str += '<span class="username">'+item.userName+'</span></span><span class="addNum">'+item.itemName+'</span></div><div class="news-body" id="activity-detail" data-value="'+item.id+'"><div class="newsText"><div class="name">'+item.title+'</div>';
							str += '<div class="rowText"><span>要求成员：</span><span>'+item.member+'（'+item.peopleNum+'人）</span></div>';
							str += '<div class="rowText"><span>费用类型：</span><span>'+item.costType+'</span></div>';
							str += '<div class="rowText"><span>集合地点：</span><span>'+item.location+'</span></div>';
							str += '<div class="rowText"><span>联系方式：</span><span>'+item.tel+'</span></div>';
							str += '<div class="rowText"><span>活动时间：</span><span>'+item.activityTime+'</span></div>';
							str += '<div class="rowText"><span>报名截止时间：</span><span>'+item.stopTime+'</span></div>';
							str += '<div class="rowText"><span>邀请说明：</span><span>'+item.instructions+'</span></div></div></div>';
							str += '</li>';
						});
					}
					$('#informationList').append(str);
					pullRefresh.endPullUpToRefresh(++pageNum> Math.ceil(data.total/pageRows));
				});
				});
		}
		//打开已发布的邀请的详情页
		$(document).on('tap', '.news-body',function() {
			var mainId = $(this).attr("data-value");
			mui.openWindow({
				    url: dynamicURL+'/mobile/activity/main/toUserSportCircle?mainId='+mainId+'&follow=1&type=0', 
				    id : '../sportCircle/user_sport_circle.html',
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