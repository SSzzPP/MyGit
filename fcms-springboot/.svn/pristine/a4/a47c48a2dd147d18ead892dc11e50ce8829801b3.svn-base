<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<jsp:include page="dynamic_channel_index.jsp" flush="true">
		<jsp:param name="online_study" value="mui-active"/>
	</jsp:include>
		<meta charset="utf-8">
		<title>Hello MUI</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<style>
			.list li{
			display:flex;
			padding:10px;
			border-bottom:1px solid #e6e6e6;
		}
		.list li img{
			width: 90px;
		    height: 70px;
		    border-radius: 5px;
		    margin: 5px;
		}
		.siteInfo{
			flex:1;
			padding:5px;
		}
		.siteName{
			color:#43474d;
			font-size:16px;
		}
		.con{
			line-height:25px;
			font-size:14px;
			overflow: hidden;
			text-overflow:ellipsis;
       		white-space: nowrap;
		}
		.padd{
			padding:4px 15px;
			border-bottom: 1px solid #ebebeb;
		}
		.mui-backdrop{
			top:100px;
		}
		</style>
	</head>
	
	<body>
		<div class="mui-content">
			<div class="mui-slider mui-fullscreen" style="top:82px;overflow:auto;">
				<div class="mui-scroll" id="pullRefresh">
					<ul id="videoList" class="mui-table-view list"></ul>
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
							loadVenue(pageRows,pageNum);
							pullRefresh.endPullDownToRefresh();
						}
					},
					up: {
						callback: function() {
							var cells = document.querySelector('.mui-table-view').querySelectorAll('.mui-table-view-cell');
							pageNum = Math.ceil(cells.length / pageRows + 1);
							loadVenue(pageRows,pageNum);
							// pullRefresh.endPullUpToRefresh();
						}
					}
				});
			});
		})(mui);
		
		mui.ready(function() {
			
	   	 	var cells = document.querySelector('.mui-table-view').querySelectorAll('.mui-table-view-cell');
			pageNum = Math.ceil(cells.length / pageRows + 1);
	   	 	loadVenue(pageRows,pageNum);
		})
		function loadVenue(pageRows,pageNum) {
			if (pageNum == 1) {
				$("#videoList").empty();
			}
			var params = {
				rows:pageRows,
				page:pageNum
			};
        	topUtil.web_query('/mobile/video/main/list',params,
				function (data) {
					if (typeof data == "string") {
		               data = JSON.parse(data);
		            }
					var str = "";
					
					if(data.total != 0) {
						mui.each(data.rows,function (index,item) {
							var date = new Date(item.gmtCreate);
							str += '<li class="mui-table-view-cell" uuid="'+item.uuid+'">';
							str += '	<img src="'+dynamicURL+'/mobile/video/main/showVideoImage?uuid='+item.uuid+'"/>';
							str += '	<div class="siteInfo">';						
							str += '		<div class="siteName">'+item.title+'</div>';
							str += '	</div>'; 
							str += '</li>';
						});
					}
					$('#videoList').append(str);
					toDetail();
					pullRefresh.endPullUpToRefresh(++pageNum> Math.ceil(data.total/pageRows));
				});
			}
			
			function toDetail () {
				$("#videoList li").on('tap',function() {
					var uuid = $(this).attr('uuid');
					mui.openWindow({
						url: '${dynamicURL}/mobile/video/main/toVideoDetail?uuid='+uuid, 
		    			id : 'video_detail.html',
					    show:{
					      autoShow:true,//页面loaded事件发生后自动显示，默认为true
					      aniShow:"slide-in-bottom",
					      duration:'250'
					    },
					    waiting:{
					      autoShow:false,//自动显示等待框，默认为true
				      	}
			  		});
				});
			}
			
			
		</script>
	</body>

</html>