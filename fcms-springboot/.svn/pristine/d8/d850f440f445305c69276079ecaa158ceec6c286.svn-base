<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<jsp:include page="dynamic_channel_index.jsp" flush="true">
		<jsp:param name="famous_coach" value="mui-active"/>
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
				width:110px;
				height:94px;
				border-radius:5px;
				margin:5px;
			}
			.siteInfo{
				width:170px;
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
        		max-width: 230px;
			}
			.con span{
				color:#999;
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
					<ul id="informationList" class="mui-table-view list">
					</ul>
					<div class="mui-text-center" style="padding:15px;">
							<a id="refresh" href="javascript:void(0)">
								<span class="mui-icon iconfont icon-shuaxin"></span>
								<span>换一批</span>
							</a>
					</div>
				</div>
			</div>
		</div>

		<script>
			var pageRows = 4;
			var pageNum = 1;
			mui.init();
			mui.ready(function() {
				loadCoach(pageRows,pageNum);
			})		
			$("#refresh").on('tap',function(){
				pageNum+=1;
				loadCoach(pageRows,pageNum);
			})
			function loadCoach(pageRows,pageNum) {
				
				var params = {
					rows:pageRows,
					page:pageNum,
					sort:'id',
					order:'asc',
					search_EQ_typeId:1,
					search_EQ_type:1
				};
	        	topUtil.web_query("/mobile/user/view/list",params,
					function (data) {
						if (typeof data == "string") {
			               data = JSON.parse(data);
			            }
						var str = "";
						if(data.total != 0&&data.rows.length !=0) {
							$("#informationList").empty();
							mui.each(data.rows,function (index,item) {
							str += '<li class="mui-table-view-cell" data-coach="'+item.uuid+'" data-user="'+item.id+'">';
							str += '	<img src="'+item.imgUrl+'"/>';
							str += '	<div class="siteInfo">';						
							str += '		<div class="siteName">'+item.name+'</div>';
							str += '		<div class="con">电话：<span>'+(item.mobile == null ? '暂未设置' : item.mobile)+'</span></div>';
							str += '		<div class="con">性别：<span>'+(item.sex == 0 ? '男' : '女')+'</span></div>';
							str += '	</div>';
							str += '</li>';
							});
							$('#informationList').append(str);
							toDetail();
						}else{
							mui.toast('没有更多数据了',{duration:'short'});
						}
					});
			}
			function toDetail () {
				$("#informationList li").on('tap',function() {
					var coachUuid = $(this).attr('data-coach');
					var userId = $(this).attr('data-user');
					mui.openWindow({
					    url: dynamicURL+'mobile/venue/view/toCoach?userId='+userId+'&coachUuid='+coachUuid,
					    id : 'mobile/venue/view/toCoach',
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