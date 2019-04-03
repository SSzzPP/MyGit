<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Hello MUI</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<style>
			html,
			body {
				background-color: #efeff4;
			}
			a.mui-icon-left-nav{
				color:#000;
			}
		</style>
	</head>

	<body>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-icon mui-icon-left-nav mui-pull-left" href='${dynamicURL}/admin/main/toMy'></a>
			<h1 id="title" class="mui-title">健身频道</h1>
		</header>
		<div id="slider" class="mui-slider" style="top:44px;">
			<div id="sliderSegmentedControl" class="mui-scroll-wrapper mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
				<div id="itemTab" class="mui-scroll">
					<%-- <a class="mui-control-item  <%=request.getParameter("sport_match")%>" data-wid="${dynamicURL}/mobile/news/subscribe/toSportMatch">体育赛事</a>
					<a class="mui-control-item  <%=request.getParameter("laws")%>" data-wid="${dynamicURL}/mobile/news/subscribe/toLaws">法律法规</a>
					<a class="mui-control-item  <%=request.getParameter("circle_news")%>" data-wid="${dynamicURL}/mobile/news/subscribe/toCircleNews">健身圈消息</a>
					<a class="mui-control-item  <%=request.getParameter("match_news")%>" data-wid="${dynamicURL}/mobile/news/subscribe/toMatchNews">赛事信息</a>
					<a class="mui-control-item  <%=request.getParameter("online_study")%>" data-wid="${dynamicURL}/mobile/news/subscribe/toOnlineStudy">在线学习</a>
					<a class="mui-control-item  <%=request.getParameter("recommend_venue")%>" data-wid="${dynamicURL}/mobile/news/subscribe/toRecommendVenue">推荐场馆</a>
					<a class="mui-control-item  <%=request.getParameter("famous_coach")%>" data-wid="${dynamicURL}/mobile/news/subscribe/toFamousCoach">著名教练</a> --%>
				</div>
			</div>
		</div>
		
		<script type="text/javascript" charset="utf-8">
		var translate = '${translate}';
		mui.ready(function() {
			loadChannel();
		 	//选项卡点击事件
			var molileWidth = $(window).outerWidth();
		 	var translateWidth = 0;
		 	var itemWidth = 0;
		 	//选项卡点击事件
			 mui('.mui-scroll').on('tap', '.mui-control-item', function(e) {
				 if($(this).next('a')[0]){
					 itemWidth = $(this).next('a').outerWidth() + $(this).next('a')[0].offsetLeft; 
				 }else{
					 itemWidth = $(this).outerWidth() + $(this)[0].offsetLeft; 
				 }
				 if(itemWidth >= molileWidth){
					 translateWidth = itemWidth - molileWidth;
				 }
			    var targetTab = this.getAttribute('data-wid');
		        mui.openWindow({
		        	url:targetTab+'?translate='+translateWidth,
		        	id:targetTab
		        });
		     });
			
		});
		/*加载顶部健身频道*/
		function loadChannel() {
			/* var data = [{
				id: 501,
				name: '',
				type:'sport_match',
				url:'${dynamicURL}/mobile/news/subscribe/toSportMatch'
			},
			{
				id: 502,
				name: '',
				type:'laws',
				url:'${dynamicURL}/mobile/news/subscribe/toLaws'
			},
			{
				id: 2,
				name: '',
				type:'circle_news',
				url:'${dynamicURL}/mobile/news/subscribe/toCircleNews'
			},
			{
				id: 3,
				name: '',
				type:'match_news',
				url:'${dynamicURL}/mobile/news/subscribe/toMatchNews'
			},
			{
				id:4,
				name: '在线学习',
				type:'online_study',
				url:'${dynamicURL}/mobile/news/subscribe/toOnlineStudy'
			},
			{
				id: 5,
				name: '推荐场馆',
				type:'recommend_venue',
				url:'${dynamicURL}/mobile/news/subscribe/toRecommendVenue'
			},
			{
				id: 6,
				name: '著名教练',
				type:'famous_coach',
				url:'${dynamicURL}/mobile/news/subscribe/toFamousCoach'
			},
		]; */
			topUtil.web_query("/mobile/news/subscribe/dynamicTabDetail",{},function(result){
				if (typeof result == "string"&&result !='') {
						result = JSON.parse(result);
		           }
				var str = '';
				if(result.success){
					var userTabs = result.obj.types.split(",");
					if(isInArray('0',userTabs)){
						str +='<a class="mui-control-item <%=request.getParameter("sport_match")%>" data-wid="${dynamicURL}/mobile/news/subscribe/toSportMatch">体育赛事</a>';
					}
					if(isInArray('1',userTabs)){
						str +='<a class="mui-control-item <%=request.getParameter("laws")%>" data-wid="${dynamicURL}/mobile/news/subscribe/toLaws">法律法规</a>';
					}
					if(isInArray('2',userTabs)){
						str +='<a class="mui-control-item <%=request.getParameter("circle_news")%>" data-wid="${dynamicURL}/mobile/news/subscribe/toCircleNews">健身圈消息</a>';
					}
					if(isInArray('3',userTabs)){
						str +='<a class="mui-control-item <%=request.getParameter("match_news")%>" data-wid="${dynamicURL}/mobile/news/subscribe/toMatchNews">赛事信息</a>';
					}
					
					/* if(isInArray('3',userTabs)){
						data[3].name="赛事信息";
					}
					if(isInArray('2',userTabs)){
						data[2].name="健身圈消息";
					}
					if(isInArray('1',userTabs)){
						data[1].name="法律法规";
					}
					if(isInArray('0',userTabs)){
						data[0].name="体育赛事";
					} */
					
				}
				str +='<a class="mui-control-item <%=request.getParameter("online_study")%>" data-wid="${dynamicURL}/mobile/news/subscribe/toOnlineStudy">在线学习</a>';
				str +='<a class="mui-control-item <%=request.getParameter("recommend_venue")%>" data-wid="${dynamicURL}/mobile/news/subscribe/toRecommendVenue">推荐场馆</a>';
				str +='<a class="mui-control-item <%=request.getParameter("famous_coach")%>" data-wid="${dynamicURL}/mobile/news/subscribe/toFamousCoach">著名教练</a>';
				$("#itemTab").append(str);
 
				   
				document.getElementById('itemTab').style.transform="translate3d(-"+translate+"px, 0px, 0px) translateZ(0px)";
			});
		}
		
		function isInArray(e,arr){
			var index = $.inArray(e,arr);
			//存在返回下标  不存在返回-1
			var inArray = false;
			if (index != -1)
				inArray=true;
			return inArray;
		}
		</script>
	</body>

</html>