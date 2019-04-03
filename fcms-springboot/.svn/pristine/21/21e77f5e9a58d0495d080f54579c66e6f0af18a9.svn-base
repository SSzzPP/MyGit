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
				background-color:#f5f5f5;
			}
			.newsText {
				padding: 10px;
				background-color:#f5f5f5;
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
			.headline{
				padding:10px 15px;
				background-color:#fff;
			}
			.headline span{
				color: #43474d;
			    font-size: 15px;
			    font-weight: 600;
			}
			.mt10{
				margin-top:10px;
			}
			.mt5{
				margin-top:5px;
			}
			.disf{
				display:flex;
				padding:8px 0;
				justify-content: space-between;
				align-items:center;
			}
			.setPrice{
				text-align:right;
				color:#ff6632;
			}
		</style>
</head>
<body>
		<header class="mui-bar mui-bar-nav transparent">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">赛事详情</h1>
		</header>

		<div class="mui-content">
			<div class="headline" style='height:41px;'>
				<span>2018年重阳登高健身大会暨全国登山步道系列赛.青岛站</span>
			</div>
			<div class="infoData mt10" id="activity-list">

				
			</div>
			<div class="infoData">
				<div class="news" style='min-height:216px;'>
					<div class="news-header">在线报名</div>
					<div class="news-body">
						<div class="newsText" id="project-list">
							<!-- <div class="disf">
								<div><span>团体竞赛组</span><span style="color:#ff6632;margin-left:3px;">[免费]</span></div>
								<div>
									<div class="setPrice">￥0</div>
									<div>剩余：<span style="margin-left:10px;">0</span></div>
								</div>
							</div>
							<div class="disf">
								<div><span>大众健身组</span><span style="color:#ff6632;margin-left:3px;">[免费]</span></div>
								<div>
									<div class="setPrice">￥0</div>
									<div>剩余：<span style="margin-left:10px;">0</span></div>
								</div>
							</div> -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			var matchId = '${matchId}';
			mui.ready(function() {
				detail(matchId);
				projectList (matchId);
			});

			function detail(matchId) {
				topUtil.web_query('/match/main/detail', {
					id: matchId
				}, function(data) {
					if(typeof data == "string") {
						data = JSON.parse(data);
					}
					if(data.success) {
						var str = '';
						var item = data.obj;
						str += '<div class="news"><div class="news-header">赛事概况';
						str += '</div><div class="news-body" data-value="'+item.id+'"><div class="newsText"><div class="name"></div>';
						str += '<div class="rowText"><span>集合地点：</span><span>'+item.location+'</span></div>';
						str += '<div class="rowText"><span>联系方式：</span><span>'+item.tel+'</span></div>';
						str += '<div class="rowText"><span>比赛时间：</span><span>'+item.startTime+'</span></div>';
						str += '<div class="rowText"><span>截止时间：</span><span>'+item.endTime+'</span></div>';
						str += '<div class="rowText"><span>邀请说明：</span><span>'+item.instructions+'</span></div></div></div>';
						str += '</div>';
						$('.headline span:first').html(item.title);
						$('#activity-list').html(str);
					}
				});
			}

			function projectList (matchId) {
				topUtil.web_query('/match/main/project/search',{search_EQ_mainId:matchId},function(data){
					if(typeof data == "string") {
						data = JSON.parse(data);
					}
					if (data) {
						var str = "";
						mui.each(data,function (index,item) {
							console.log(item)
							str += '<div class="disf" data-value='+item.matchProjectEntity.id+' onclick="projectInfo('+item.matchProjectEntity.id+')">';
							str += '<div><span>'+item.matchProjectEntity.name+'</span></div>';
							str += '</div>';
							str += '</div>';
							/* str += '<div class="news bt" data-value='+item.matchProjectEntity.id+' onclick="projectInfo('+item.matchProjectEntity.id+')"><div class="news-header" style="heigth:7%">';
							str += '<span class="">'+item.matchProjectEntity.name+'</span></div></div>'; */
						})
						$("#project-list").html(str);
					}
				});
			}
			function projectInfo(projectId){
				mui.openWindow({
				    url: dynamicURL+'match/main/project/toProjectDetail?projectId='+projectId+'&matchId='+matchId, 
				    id : 'match/main/toMatchDetail',
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
			 
		</script>
</body>
</html>