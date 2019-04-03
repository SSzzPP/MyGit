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
		body{
			height:100vh;
		}
		.mui-content,#slider{
			height:100%;
		}
		.mui-slider-group{
			height:calc(100% - 40px);
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
			border-radius:5px;
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
		.meta-info .activityNum ,
		.meta-info .dynamicNum{
			flex: 1;
		}
		.meta-info .peopleNum span,
		.meta-info .activityNum  span,
		.meta-info .dynamicNum span{
			font-size:16px;
			margin-right:5px;
			color:#8f8f94;
		}
		.meta-info .time {
			float: right;
		}
		
		.mui-table-view:after{
			height:1px!important;
		}
		.mui-table-view-cell:last-child:after, .mui-table-view-cell:last-child:before{
			height:1px;
		}
		.mui-table-view-cell:after{
			height:1px;
		}
		.mui-content>.mui-table-view:first-child {
			margin-top: 1px;
		}
		.color-brave{
			color:#8f8f94;
		}
	</style>

</head>
<body>
<body>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">赛事信息</h1>
		</header>
		<div class="mui-content" id="news">
			<div id="slider" class="mui-slider">
				<div id="sliderSegmentedControl" class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
					<a class="mui-control-item" href="#item1mobile" id="item1">赛事类型</a>
					<a class="mui-control-item" href="#item2mobile" id="item2">关注赛事</a>
				</div>
				<div id="sliderProgressBar" class="mui-slider-progress-bar mui-col-xs-6"></div>
				<div class="mui-slider-group">
					<div id="item1mobile" class="mui-slider-item mui-control-content mui-active">
						<div id="scroll1" class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<ul class="mui-table-view" id='msg-list'>
									<!--<li class="mui-table-view-cell mui-media" onclick="open_detail()">
										<a href="javascript:;">
											<img class="mui-media-object mui-pull-left" src="../../images/front/example5.jpg">
											<div class="mui-media-body">
												<div>徒步登山</div>
												<div class="mui-ellipsis-2 color-brave">永远积极饱满向上</div>
											</div>
											<div class="meta-info">
												<div class="peopleNum"><span class="icon iconfont icon-zhanghu"></span>2</div>
												<div class="activityNum"><span class="icon iconfont icon-huodong11"></span>3</div>
												<div class="dynamicNum"><span class="icon iconfont icon-jihua"></span>4</div>
											</div>
										</a>
									</li>
									<li class="mui-table-view-cell mui-media" onclick="open_detail()">
										<a href="javascript:;">
											<img class="mui-media-object mui-pull-left" src="../../images/front/example5.jpg">
											<div class="mui-media-body">
												<div>徒步登山</div>
												<div class="mui-ellipsis-2 color-brave">永远积极饱满向上</div>
											</div>
											<div class="meta-info">
												<div class="peopleNum"><span class="icon iconfont icon-zhanghu"></span>2</div>
												<div class="activityNum"><span class="icon iconfont icon-huodong11"></span>3</div>
												<div class="dynamicNum"><span class="icon iconfont icon-jihua"></span>4</div>
											</div>
										</a>
									</li>-->
								</ul>
								<%-- <script id='msg-template' type="text/template">
									<% for(var i in message){ var item = message[i]; %>
										<li class="mui-table-view-cell mui-media" onclick="open_detail(<%=(item.id)%>,'<%=(item.name)%>')">
											<a href="javascript:;">
												<img class="mui-media-object mui-pull-left" src="<%=(serverPath)%>/mobile/activity/item/itemHeadImg?itemId=<%=(item.id)%>">
												<div class="mui-media-body">
													<div><%=(item.name)%></div>
													<div class="mui-ellipsis-2 color-brave"><%=(item.remarks)%></div>
												</div>
												<div class="meta-info">
													<div class="peopleNum"><span class="icon iconfont icon-zhanghu"></span><%=(item.peopleNum)%></div>
													<div class="activityNum"><span class="icon iconfont icon-huodong11"></span><%=(item.mainNum)%></div>
													<!-- 动态  <div class="dynamicNum"><span class="icon iconfont icon-jihua"></span>4</div>-->
												</div>
											</a>
										</li>
									<% } %>
								</script> --%>
							</div>
						</div>
					</div>
					<div id="item2mobile" class="mui-slider-item mui-control-content">
						<div id="scroll2" class="mui-scroll-wrapper">
							<div class="mui-scroll">
								
								<ul class="mui-table-view" id="like-list">
									<!--<li class="mui-table-view-cell mui-media">
										<a href="javascript:;">
											<img class="mui-media-object mui-pull-left" src="../../images/front/example5.jpg">
											<div class="mui-media-body">
												<div>徒步登山</div>
												<div class="mui-ellipsis-2 color-brave">永远积极饱满向上</div>
											</div>
											<div class="meta-info">
												<div class="peopleNum"><span class="icon iconfont icon-zhanghu"></span>2</div>
												<div class="activityNum"><span class="icon iconfont icon-huodong11"></span>3</div>
												
											</div>
										</a>
									</li>-->
									<script id="user-like" type="text/template">
										<%-- <% for(var i in activity){ var item = activity[i]; %>
											<li class="mui-table-view-cell mui-media" onclick="open_detail(<%=(item.id)%>,'<%=(item.name)%>')">
												<a href="javascript:;">
													<img class="mui-media-object mui-pull-left" src="<%=(serverPath)%>/mobile/activity/item/itemHeadImg?itemId=<%=(item.id)%>">
													<div class="mui-media-body">
														<div><%=(item.name)%></div>
														<div class="mui-ellipsis-2 color-brave"><%=(item.remarks)%></div>
													</div>
													<div class="meta-info">
														<div class="peopleNum"><span class="icon iconfont icon-zhanghu"></span><%=(item.peopleNum)%></div>
														<div class="activityNum"><span class="icon iconfont icon-huodong11"></span><%=(item.mainNum)%></div>
													</div>
												</a>
											</li>
										<% } %> --%>
								</script>
								</ul>
								
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		
		<script>
		var type = '${type}';
		var url = "" ;
		var likeUrl = "";
		mui.ready(function () {
				/* $("#item1").html("赛事类型");
				$("#item2").html("关注赛事");
				$(".mui-title").html("赛事信息"); */
				url = "/mobile/activity/item/searchEvent";
				likeUrl = "/mobile/item/user/userLikeEvent";
				
				itemList(url);
				//userLike(likeUrl);
		});
		
		$(document).on('tap', '#item2', function () {
			if (constants.getLoginStatus() == 0) {
				mui.toast('请返回在市北登录后使用该功能！');
			} else {
				userLike(likeUrl);
			}
		});
			
			(function($) {
				var item2 = document.getElementById('item2mobile');
				document.getElementById('slider').addEventListener('slide', function(e) {
					/* if(e.detail.slideNumber === 1) {
						userLike(likeUrl);
					}else if(e.detail.slideNumber === 0){
						itemList(url);
					} */
				});
			})(mui);
			
			function itemList(url) {
				topUtil.web_query(url, {}, function (data) {
					if (typeof data == "string") {
		                data = JSON.parse(data);
		            }
					var str = "";
					if (data) {
						mui.each(data, function (index, item) {
							str += "<li class='mui-table-view-cell mui-media' onclick=\"open_detail("+item.id+",'"+item.name+"')\"><a href='javascript:;'>";
							str += "<img class='mui-media-object mui-pull-left' src='${dynamicURL}/mobile/activity/item/itemHeadImg?itemId="+item.id+"'>";
							str += "<div class='mui-media-body'><div>"+item.name+"</div><div class='mui-ellipsis-2 color-brave'>"+item.remarks+"</div></div>";
							str += "<div class='meta-info'><div class='peopleNum'><span class='icon iconfont icon-zhanghu'></span>"+item.peopleNum+"</div>";
							str += "<div class='activityNum'><span class='icon iconfont icon-huodong11'></span>"+item.mainNum+"</div></div></a></li>";
						});
					}
					$('#msg-list').append(str);
					//document.getElementById("msg-list").innerHTML = template('msg-template', {"message": data,"serverPath":serverPath});
				});
			}
			
			function userLike(url) {
				topUtil.web_query(url, {}, function (data) {
					if (typeof data == "string") {
		                data = JSON.parse(data);
		            }
					var str = '';
					if (data) {
						mui.each(data, function (index,item) {
							str += "<li class='mui-table-view-cell mui-media' onclick=\"open_detail("+item.id+",'"+item.name+"')\"><a href='javascript:;'>";
							str += "<img class='mui-media-object mui-pull-left' src='${dynamicURL}/mobile/activity/item/itemHeadImg?itemId="+item.id+"'>";
							str += "<div class='mui-media-body'><div>"+item.name+"</div><div class='mui-ellipsis-2 color-brave'>"+item.remarks+"</div></div>";
							str += "<div class='meta-info'><div class='peopleNum'><span class='icon iconfont icon-zhanghu'></span>"+item.peopleNum+"</div>";
							str += "<div class='activityNum'><span class='icon iconfont icon-huodong11'></span>"+item.mainNum+"</div></div></a></li>";
						});
						//document.getElementById("like-list").innerHTML = template('user-like', {"activity": data,"serverPath":serverPath});
					}
					$('#like-list').append(str);
					
				});
			}
			
			function open_detail(itemId,itemName) {
				mui.openWindow({ 
				    url: dynamicURL+'mobile/activity/main/toDetail?itemId='+itemId+'&itemName='+itemName+'&type='+type, 
				    id : 'mobile/activity/main/toDetail',
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