<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<jsp:include page="dynamic_channel_index.jsp" flush="true">
		<jsp:param name="laws" value="mui-active"/>
	</jsp:include>
		<meta charset="utf-8">
		<title>Hello MUI</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
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
		var moduleId = 502;
		mui.init();
		(function($) {
			$.ready(function() {
			    pullRefresh = $("#pullRefresh").pullToRefresh({
					down: {
						callback: function() {
							pageNum = 1;
							loadInformation(pageRows,pageNum,moduleId);
							pullRefresh.endPullDownToRefresh();
						}
					},
					up: {
						callback: function() {
							var cells = document.querySelector('.mui-table-view').querySelectorAll('.mui-table-view-cell');
							pageNum = Math.ceil(cells.length / pageRows + 1);
							loadInformation(pageRows,pageNum,moduleId);
						}
					}
				});
			    
			});
		})(mui);
		mui.ready(function() {
	   	 	var cells = document.querySelector('.mui-table-view').querySelectorAll('.mui-table-view-cell');
			pageNum = Math.ceil(cells.length / pageRows + 1);
			loadInformation(pageRows,pageNum,moduleId);
		})
		function loadInformation(pageRows,pageNum,moduleId) {
			if(pageNum == 1){
				$("#informationList").empty();
			}
			var params = {
				rows:pageRows,
				page:pageNum,
				search_EQ_status:1,
				search_EQ_moduleId:moduleId
			};
        	topUtil.web_query("/mobile/information/info/list",params,
				function (data) {
					if (typeof data == "string") {
		               data = JSON.parse(data);
		            }
					var str = "";
					if(data.total != 0) {
						mui.each(data.rows,function (index,item) {
							var date = new Date(item.gmtCreate);
							var str2 = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
							str += '<li class="mui-table-view-cell" uuid="'+item.uuid+'">';
							str += '	<img class="mui-pull-left" src="'+dynamicURL+'/mobile/information/info/showImage?uuid='+item.uuid+'">';
							str += '	<div class="siteInfo">';						
							str += '		<div class="siteName">'+item.title+'</div>';
							str += '		<div class="con"><span>'+str2+'</span></div>';
							str += '	</div>';
							str += '</li>';
						});
					}
					$('#informationList').append(str);
					pullRefresh.endPullUpToRefresh(++pageNum> Math.ceil(data.total/pageRows));
				});
		}
		/**
		 * 轮播图跳转详情页面
		 */
		mui("#informationList").on('tap','li',function(){
			var uuid = $(this).attr('uuid');
			mui.openWindow({
				url: '${dynamicURL}/mobile/information/info/toDetail?uuid='+uuid, 
		    	id : 'banner_detail.html',
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