<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=j7qM5IwNzuxMxlZbosvGR6iz0rg8w1R3"></script>
<jsp:include page="tab_bottom.jsp" flush="true">
<jsp:param name="userMap" value="mui-active"/>
</jsp:include>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>附近场馆</title>
<style type="text/css">
		html {
			height: 100%
		}
		
		body {
			height: 100%;
			margin: 0px;
			padding: 0px
		}
		.mui-pull-top-tips {
			position: absolute;
			top: -20px;
			left: 50%;
			margin-left: -25px;
			width: 40px;
			height: 40px;
			border-radius: 100%;
			z-index: 1;
		}
		.mui-bar~.mui-pull-top-tips {
			top: 24px;
		}
		.mui-pull-top-wrapper {
			width: 42px;
			height: 42px;
			display: block;
			text-align: center;
			background-color: #efeff4;
			border: 1px solid #ddd;
			border-radius: 25px;
			background-clip: padding-box;
			box-shadow: 0 4px 10px #bbb;
			overflow: hidden;
		}
		.mui-pull-top-tips.mui-transitioning {
			-webkit-transition-duration: 200ms;
			transition-duration: 200ms;
		}
		.mui-pull-top-tips .mui-pull-loading {
			/*-webkit-backface-visibility: hidden;
			-webkit-transition-duration: 400ms;
			transition-duration: 400ms;*/
			
			margin: 0;
		}
		.mui-pull-top-wrapper .mui-icon,
		.mui-pull-top-wrapper .mui-spinner {
			margin-top: 7px;
		}
		.mui-pull-top-wrapper .mui-icon.mui-reverse {
			/*-webkit-transform: rotate(180deg) translateZ(0);*/
		}
		.mui-pull-bottom-tips {
			text-align: center;
			background-color: #efeff4;
			font-size: 15px;
			line-height: 40px;
			color: #777;
		}
		.mui-pull-top-canvas {
			overflow: hidden;
			background-color: #fafafa;
			border-radius: 40px;
			box-shadow: 0 4px 10px #bbb;
			width: 40px;
			height: 40px;
			margin: 0 auto;
		}
		.mui-pull-top-canvas canvas {
			width: 40px;
		}
		.mui-slider-indicator.mui-segmented-control {
			background-color: #efeff4;
		}
		
		
		.selectList{
			height:44px;
			/*display: flex;*/
			background-color:#fff;
			position: relative;
			padding: 0 10px;
			border-bottom:1px solid #e6e6e6;
			display: none;
			z-index: 6666;
		}
		.selectList.showbox{
			display: flex;
		}
		.selectTab{
			line-height:44px;
			flex: 1;
			text-align: center;
			color:#43474d;
			max-width:33.33%;
		}
		.selectTab a{
			display: block;
			color:#43474d;
			font-size:14px;
			overflow: hidden;
		    white-space: nowrap;
		    text-overflow: ellipsis;
		}
		.selectTab a span.mui-icon{
			font-size:14px;
			color:#43474d;
		}
		.subSelect{
			position:absolute;
			top:44px;
			left:0;
			display: none;
			height:300px;
			overflow: auto;
			width:100%;
			z-index: 6666;
			background-color: #fff;
		}
		.subSelect div.selected{
			color:#008000;
		}
		.subSelect div.venBtn.selected{
			color:#43474d!important;
			border-color:#008000;
		}
		.venBtn{
			float: left;
			height:30px;
			line-height: 30px;
			width:calc(33.333333% - 8px);
			margin:5px 4px;
			border:1px solid #ddd;
			border-radius:5px;
			transition: all 0.3s;
			font-size:15px;
			color:#43474d;			
		}
		.list li{
			display:flex;
			padding:10px;
			border-bottom:1px solid #e6e6e6;
		}
		.list li img{
			width:94px;
			height:94px;
			border-radius:5px;
			margin:5px;
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
			font-size:15px;
			color:#43474d;
			border-bottom: 1px solid #ebebeb;
		}
		.mui-backdrop{
			top:100px;
		}
		#container {
			height: calc(100vh - 88px);
		}
		.goHere{
			float: right;
		}
		.goHereIcon{
			float: right;
			width:50px;
			height:50px;
			line-height:50px;
			border-radius:50%; 
			right:30px;
			bottom:60px;
			z-index: 999;
			color:#fff;
			font-size:10px;
			text-align:center;
			background:-webkit-gradient(linear, 0 0, 0 bottom, from(#1cc4ff), to(#3fa3ff)); 
			box-shadow: 0px 0px 4px #3fa3ff;
		}
		.selinput{
			right: 40px;
		    left: 10px;
		    display: inline-block;
		    width: auto;
		    height:30px;
		    border-radius:5px;
		    line-height: 30px;
		    margin:7px 0;
		    background-color:#f1f2f5;
		    position:absolute;
		    padding-left:10px;
		}
		.selinput span{
			font-size:14px;
			color:#aaa;
		}
		.selinput .mui-icon-search{
			font-size:18px;
			padding:6px;
		}
		.Map_select{
			width: 35px;
		    height: 106px;
		    bottom: 10px;
		    left: 10px;
		    top: auto;
		    right: auto;
		    position: absolute;
		    z-index: 1100;
		    text-size-adjust: none;
		    border-radius: 3px;
		    background: rgba(255,255,255,.8);
		    -webkit-box-shadow: 1px 1px 2px rgba(0,0,0,.4);
		    box-shadow: 1px 1px 2px rgba(0,0,0,.4);
		}
		.user-select{
			position: initial;
		    background: initial;
		    border-radius: initial;
		    box-shadow: initial;
		    width: 35px;
		    height: 35px;
		    left: 0;
    		overflow: hidden;
    		text-align: center;
    		line-height: 35px;
    		
    		border: 1px solid rgba(255,255,255,0.5);
		}
		.Map_select .con1{
			
		}
		.Map_select .con2{
			border-top: 1px solid rgb(236, 236, 236);
    		top: 44px;
		}
		.Map_select .con3{
			border-top: 1px solid rgb(236, 236, 236);
    		top: 88px;
		}
		.Map_select .con1.select,.Map_select .con2.select{
			/*border-color:#1799c5;*/
		}
		.Map_select .con1.select span,.Map_select .con2.select span{
			color:#1799c5;
		}
		.Map_select span{
			font-weight:600;
			color:#676d73;
			line-height: unset;
		}
		/*隐藏百度logo*/
		.anchorBL{
			display: none!important;
		}
	</style>
</head>
<body>
	<header class="mui-bar mui-bar-nav" style="background-color:#fff;box-shadow:0 1px 0px #f5f5f5;">
		<div id="search" class="selinput">
			<span class="mui-icon mui-icon-search"></span>
			<span>请输入场馆名</span>	
		</div>
		<a class="mui-tab-item mui-pull-right" href="#selectList">
			<span class="mui-icon mui-icon-bars"></span>
		</a>
	</header>
	<div class="mui-content">
		<div id="selectList" class="selectList">
			<div class="selectTab">
				<a href="javascript:void(0)" data-item="1">
					<span>范围</span>
					<span class="mui-icon mui-icon-arrowdown"></span>
				</a>
				<div data-category='范围' class="subSelect">
					<div class="padd" data-value="1000">1千米</div>
					<div class="padd" data-value="3000">3千米</div>
					<div class="padd" data-value="5000">5千米</div>
					<div class="padd" data-value="7000">7千米</div>
					<div class="padd" data-value="15000">15千米</div>
				</div>
			</div>
			<div class="selectTab">
				<a href="javascript:void(0)" data-item="2">
					<span>商圈</span>
					<span class="mui-icon mui-icon-arrowdown"></span>
				</a>
				<div id="businessArea" data-category='商圈' class="subSelect">
				</div>
			</div>
			<div class="selectTab">
				<a href="javascript:void(0)" data-item="3">
					<span>分类</span>
					<span class="mui-icon mui-icon-arrowdown"></span>
				</a>
				<div id="venueType" data-category='分类' class="subSelect">
				</div>
			</div>
		</div>
		<div id="slider" class="mui-slider mui-fullscreen" style="top:44px;">
			<div class="mui-scroll" id="pullRefresh">
				<!-- 主界面具体展示内容 -->
				<div id="container"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		/*mui.init();
		mui('.mui-scroll-wrapper').scroll();*/
		// 创建地图实例  
		var markerArr = [] ;//关键词搜索后找到的marker
		var infoWindows = [] ;//自定义弹出窗口
		var map = new BMap.Map("container");
		var userPoint;
		var opts = {type: BMAP_NAVIGATION_CONTROL_LARGE}; 
		map.addControl(new BMap.NavigationControl(opts));//控件
		map.enableScrollWheelZoom();//启动鼠标滚轮缩放地图
		map.enableKeyboard();//启动键盘操作地图
		var radius = 1000;
		var business = null;
		var typeId = null;
		var circle;
		mui.init();
		mui.ready(function() {
			getUserPoint();//用户坐标
			/*// 创建点坐标   初始化地图，设置中心点坐标和地图级别
			setTimeout(function(){
				//userPoint = new BMap.Point(120.345189, 36.084362);
				map.centerAndZoom(userPoint, 14);
				var myKeys = ["健身房", "体育馆","球馆"];
				//--------检索---------
				//keysPoi(myKeys,map);//多关键字检索
				//圆形区域检索
				radius = 3000;
				circlePoi(myKeys,map,userPoint,radius);
				getGymnasium();
			},500);*/
			$(".mui-tab-item").on('tap',function(){
				$($(this).attr("href")).toggleClass('showbox');
				mask.close();
			})
			var str='<div class="Map_select">'+
						'<div class="user-select con1 select"><span class="mui-icon iconfont icon-changguan2"></span></div>'+
						'<div class="user-select con2"><span class="mui-icon iconfont icon-gongyuan"></span></div>'+
						'<div class="user-select con3"><span class="mui-icon mui-icon-refreshempty"></span></div>'+
					'</div>';
			$("#container").append(str);
			$('.user-select').on('tap',function(){
				$(this).toggleClass('select');
				reloadPoint();
			})
			/*场馆*/
			/*$('.user-select').on('tap','.icon-changguan2',function(){
				alert("场馆");
			})*/
			/*户外运动*/
			/*$('.user-select').on('tap','.icon-gongyuan',function(){
				alert("户外运动");
			})*/
			/*刷新*/
			$('.user-select').on('tap','.mui-icon-refreshempty',function(){
				window.location.reload();
			});
			//加载类别
	   	 	loadCategory();
		});
		function getMap(flag1,flag2){
			// userPoint = new BMap.Point(120.394305, 36.152541);
			map.centerAndZoom(userPoint, 14);
			var myKeys = ["健身房", "体育馆","球馆"];
			//--------检索---------
			//keysPoi(myKeys,map);//多关键字检索
			//圆形区域检索
			//radius = 7000;
			circlePoi(myKeys,map,userPoint,radius);
			if(flag1)
				getGymnasium();
			if(flag2)
				getEquipment();
			/*window.setTimeout(function(){
				toDetail();
			}, 10000);*/
		}
		//获取用户坐标
		function getUserPoint() {
			userPoint = null;
			//1.通过浏览器获取
			if (navigator.geolocation) {
				/*navigator.geolocation.getCurrentPosition(getPositionByWeb, showGetPositionByWebError);
			} else {*/
				//获取失败通过百度api获取
				getPositionByBaidu();
			}
		}
		//通过浏览器获取用户坐标
		function getPositionByWeb(position) {
			userPoint = new BMap.Point(position.coords.longitude, position.coords.latitude);
			getMap(true,false);
		}
		//通过浏览器获取用户坐标发生错误
		function showGetPositionByWebError(error) {
			getPositionByBaidu();//发生错误通过百度api获取用户坐标
			/* switch (error.code) {
			case error.PERMISSION_DENIED:
				alert("User denied the request for Geolocation.")
				break;
			case error.POSITION_UNAVAILABLE:
				alert("Location information is unavailable.")
				break;
			case error.TIMEOUT:
				alert("The request to get user location timed out.")
				break;
			case error.UNKNOWN_ERROR:
				alert("An unknown error occurred.")
				break;
			} */
		}
		//通过百度api获取用户坐标
		function getPositionByBaidu(){
			var geolocation = new BMap.Geolocation();
			var a=null;
			geolocation.getCurrentPosition(function(r){
				if(this.getStatus() == BMAP_STATUS_SUCCESS){
					var mk = new BMap.Marker(r.point);
					map.addOverlay(mk);
					map.panTo(r.point);
					userPoint= new BMap.Point(r.point.lng, r.point.lat);
					getMap(true,false);
				}
				else {
					//console.log('failed'+this.getStatus());
				}        
			});
		}
		//圆形检索
		function circlePoi(keys,map,userPoint,radius){
			circle = new BMap.Circle(userPoint,radius,{fillColor:"blue", strokeWeight: 1 ,fillOpacity: 0.3, strokeOpacity: 0.3});
		    map.addOverlay(circle);
		    /*var local =  new BMap.LocalSearch(map, {renderOptions: {map: map, autoViewport: false}});  
		    local.searchNearby(keys,userPoint,radius);
			//搜索marker设置完毕的回调https://www.cnblogs.com/forever-star/articles/4717483.html
			local.setMarkersSetCallback(function(pois) {
				for ( var i = 0; i < pois.length; i++) {
					markerArr[i] = pois[i].marker;
				}
				
			});*/
		}
		//改变marker的infowindow
		setTimeout(changeInfoWindow,2000);
		function changeInfoWindow(){
			for ( var i = 0; i < markerArr.length; i++) {
				markerArr[i].addEventListener("click", function(e) {
					var content = e.currentTarget.Cb.content;
				    var infoWindow = new BMap.InfoWindow(content, {  
				        offset: new BMap.Size(0, -15),
				        title:e.currentTarget.z.title
				    });
					map.openInfoWindow(infoWindow, new BMap.Point(e.point.lng,e.point.lat));
				});
			}
		}
		//多关键字检索
		function keysPoi(keys, map) {
			var local = new BMap.LocalSearch(map, {
				renderOptions : {
					map : map,
					panel : "r-result",
					autoViewport : false
				},
				pageCapacity : 50
			});
			local.searchInBounds(keys, map.getBounds());
		}
		//加载已知场馆
		function getGymnasium(){
			var params = {lng: userPoint.lng, lat: userPoint.lat,radius: radius};
			if(business) {
				params.search_EQ_businessArea = business;
			}
			if(typeId) {
				params.search_EQ_typeId = typeId;
			}
			topUtil.web_query("/mobile/map/venue/search",params,function(data){
				if (typeof data == "string") {
	                data = JSON.parse(data);
				}
				if(data.length){
					//加载已知场馆
					mui.each(data,function(index, item){
						var gymnasium = item;
						var gympoint = new BMap.Point(gymnasium.lng, gymnasium.lat);  
						var icon = new BMap.Icon(staticURL+"images/front/venue1.png", new BMap.Size(23, 23), {
							// 指定定位位置。   
					        // 当标注显示在地图上时，其所指向的地理位置距离图标左上    
					        // 角各偏移10像素和25像素。
						    anchor: new BMap.Size(10, 20),
						}); 
					    var gymmarker = new BMap.Marker(gympoint,{icon: icon});
						var content='<div onclick="toDetail('+gymnasium.id+')" style="font:12px arial,sans-serif;margin-top:10px">';
					    var filePath = '';
					    if(gymnasium.mainImageUuid != "" && gymnasium.mainImageUuid != null){
					    	filePath = dynamicURL +"/mobile/image/showImage?uuid="+gymnasium.mainImageUuid;
					    	//alert('filePath'+filePath);
					    	content += '<div><img id="img_'+gymnasium.id+'" src="'+filePath+'" alt="" style="float:center;zoom:1;overflow:hidden;width:98%;height:100px;margin-left:3px;"/></div>';
					    }
						content += '<table cellspacing="0" style="overflow:hidden;table-layout:fixed;width:100%;font:12px arial,sans-serif" >'+
									'<tr>'+
									'<td style="vertical-align:top;width:38px;white-space:nowrap;word-break:keep-all">地址：&nbsp;</td>'+
									'<td style="line-height:16px">'+(gymnasium.location == null ? '暂未设置' : gymnasium.location)+'&nbsp;</td>'+
									'</tr>'+
									'<tr>'+
									'<td style="vertical-align:top;">电话：</td>'+
									'<td>'+(gymnasium.tel == null ? '暂未设置' : gymnasium.tel)+'</td>'+
									'</tr>'+
									'</table>'+
									'<div class="goHere">'+
									/*'<span>到这儿去</span>'+*/
									'<div class="goHereIcon" id="goHere_'+gymnasium.id+'" onclick="goHere('+gymnasium.lng+','+gymnasium.lat+')" >'+
									'<span style="font-size:40px;line-height:50px;" class="mui-icon mui-icon-paperplane"></span>'+
									'</div>'+
									'</div>'+
									'</div>';
					    var infoWindow = new BMap.InfoWindow(content, {  
					        offset: new BMap.Size(0, -15),
					        title:gymnasium.name,
					        width:600
					    });
					    gymmarker.addEventListener("click", function(e) {
						    gymmarker.openInfoWindow(infoWindow, gympoint);
					    	//图片加载完毕重绘infowindow
//					    	if(gymnasium.mainImageUuid != "" && gymnasium.mainImageUuid != null){
//								document.getElementById('img_'+gymnasium.id).onload = function (){
//									infoWindow.redraw();   //防止在网速较慢，图片未加载时，生成的信息框高度比图片的总高度小，导致图片部分被隐藏
//							}
//						}
						});
						map.addOverlay(gymmarker);
						/*document.getElementById('goHere_'+gymnasium.id).addEventListener('click',function () {
							mui.alert(gympoint);
						});*/
					});
				}
			});
		}
		//加载已知设施（公共）
		function getEquipment(){
			var params = {lng: userPoint.lng, lat: userPoint.lat,radius: radius};
			if(typeId) {
				params.search_EQ_typeId = typeId;
			}
			topUtil.web_query("/mobile/map/equipment/search",params,function(data){
				if (typeof data == "string") {
	                data = JSON.parse(data);
				}
				if(data.length){
					//加载已知场馆
					mui.each(data,function(index, item){
						var gymnasium = item;
						var gympoint = new BMap.Point(gymnasium.lng, gymnasium.lat);  
						var icon = new BMap.Icon(staticURL+"images/front/equipment1.png", new BMap.Size(24, 24), {
							// 指定定位位置。   
					        // 当标注显示在地图上时，其所指向的地理位置距离图标左上    
					        // 角各偏移10像素和25像素。
						    anchor: new BMap.Size(10, 20),
						}); 
					    var gymmarker = new BMap.Marker(gympoint,{icon: icon});
						var content='<div onclick="toEquipmentDetail('+gymnasium.id+')" style="font:12px arial,sans-serif;margin-top:10px">';
						var filePath = '';
					    if(gymnasium.mainImageUuid != "" && gymnasium.mainImageUuid != null){
					    	filePath = dynamicURL +"/mobile/image/showImage?uuid="+gymnasium.mainImageUuid;
					    	//alert('filePath'+filePath);
					    	content += '<div><img id="img_'+gymnasium.id+'" src="'+filePath+'" alt="" style="float:center;zoom:1;overflow:hidden;width:98%;height:100px;margin-left:3px;"/></div>';
					    }
						content += '<table cellspacing="0" style="overflow:hidden;table-layout:fixed;width:100%;font:12px arial,sans-serif" >'+
									'<tr>'+
									'<td style="vertical-align:top;width:38px;white-space:nowrap;word-break:keep-all">地址：&nbsp;</td>'+
									'<td style="line-height:16px">'+(gymnasium.location == null ? '暂未设置' : gymnasium.location)+'&nbsp;</td>'+
									'</tr>'+
									'<tr>'+
									'<td style="vertical-align:top;">电话：</td>'+
									'<td>'+(gymnasium.tel == null ? '暂未设置' : gymnasium.tel)+'</td>'+
									'</tr>'+
									'</table>'+
									'<div class="goHere">'+
									/*'<span>到这儿去</span>'+*/
									'<div class="goHereIcon" id="goHere_'+gymnasium.id+'" onclick="goHere('+gymnasium.lng+','+gymnasium.lat+')" >'+
									'<span style="font-size:40px;line-height:50px;" class="mui-icon mui-icon-paperplane"></span>'+
									'</div>'+
									'</div>'+
									'</div>';
					    var infoWindow = new BMap.InfoWindow(content, {  
					        offset: new BMap.Size(0, -15),
					        title:gymnasium.name,
					        width:600
					    });
					    gymmarker.addEventListener("click", function(e) {
					    	gymmarker.openInfoWindow(infoWindow, gympoint);
						    //图片加载完毕重绘infowindow
//						    if(gymnasium.mainImageUuid != "" && gymnasium.mainImageUuid != null){
//								document.getElementById('img_'+gymnasium.id).onload = function (){
//									infoWindow.redraw();   //防止在网速较慢，图片未加载时，生成的信息框高度比图片的总高度小，导致图片部分被隐藏
//								}
//							}
						});
						map.addOverlay(gymmarker);
						/*document.getElementById('goHere_'+gymnasium.id).addEventListener('click',function () {
							mui.alert(gympoint);
						});*/
					});
				}
			});
		}
		//到这儿去
		function goHere(lng,lat){
			var gympoint = new BMap.Point(lng, lat);
			var driving = new BMap.DrivingRoute(map, {renderOptions:{map: map, autoViewport: true}});
			map.clearOverlays();
			driving.search(userPoint, gympoint);
			window.event? window.event.cancelBubble = true : e.stopPropagation();
		}
		//加载类别
		function loadCategory(){
			//商圈
        	topUtil.web_query("/mobile/system/dict/findByType",{type:"BUSINESS_AREA"},
				function (data) {
					if (typeof data == "string") {
		               data = JSON.parse(data);
		            }
					var businessStr = '<div class="padd" data-value="">不限</div>';
					mui.each(data,function (index,item) {
						businessStr += '<div class="padd" data-value="'+item.id+'">'+item.name+'</div>'
					});
					$('#businessArea').append(businessStr);	
				});
        	//分类
        	topUtil.web_query("/mobile/system/dict/findByType",{type:"SPORT_TYPE"},
				function (data) {
					if (typeof data == "string") {
		               data = JSON.parse(data);
		            }
					var venueTypeStr = '<div class="venBtn" data-value="">不限</div>';
					mui.each(data,function (index,item) {
						venueTypeStr += '<div class="venBtn" data-value="'+item.id+'">'+item.name+'</div>'
					});
					$('#venueType').append(venueTypeStr);
					bindEvent();
				});
		}
		/*点击筛选*/
		function bindEvent() {
			$(".subSelect div").on('tap',function(){
				var categoryItem = $(this).parent(".subSelect").attr("data-category");
				$(this).parent(".subSelect").prev("a").children("span:first-child").text($(this).text());
				var category = $(this).attr("data-value");
				$(this).addClass("selected").siblings().removeClass("selected");
				switch (categoryItem){ 
					case '范围':radius=category;
					break; 
					case '商圈':business=category;
					break; 
					case '分类':typeId=category;
					break; 
				}
				$(this).parent(".subSelect").prev("a").children("span:last-child").attr('class','mui-icon mui-icon-arrowdown');
				closeMask();
				mask.close();
				/*pullRefresh.refresh(true);*/
				reloadPoint();
				//getGymnasium(business,typeId);
			})
		}
		function reloadPoint(){
			map.clearOverlays();
			var mk = new BMap.Marker(userPoint);
			map.addOverlay(mk);
			var flag1 = $('.user-select.con1').hasClass('select');
			var flag2 = $('.user-select.con2').hasClass('select');
			getMap(flag1,flag2);
		}
		/*显示  隐藏筛选条件*/
		var selectItm=null;
		var mask = mui.createMask(closeMask);
		function closeMask() {
			$(".subSelect").hide();
			selectItm=null;
			$(".selectTab a").children("span:last-child").attr('class','mui-icon mui-icon-arrowdown');
		};
		/*点击筛选大类别*/
		$(".selectTab a").click(function(e) {
			var item=e.currentTarget.dataset.item;
			$(this).children("span:last-child").attr('class','mui-icon mui-icon-arrowup');
			if(item==selectItm) {
				selectItm=null;
				mask.close();
				$(".subSelect").hide();
				$(this).children("span:last-child").attr('class','mui-icon mui-icon-arrowdown');
			} else {
				selectItm=item;
				mask.show();
				$(".subSelect").hide();
				$(this).next(".subSelect").show();
				$(".selectTab a").children("span:last-child").attr('class','mui-icon mui-icon-arrowdown');
				$(this).children("span:last-child").attr('class','mui-icon mui-icon-arrowup');
			}
		});
		function toDetail(venueId) {
			//alert(mui(".toDetail").length);
			mui.openWindow({
				url: dynamicURL+'mobile/venue/view/toVenueDetail?venueId='+venueId, 
			    id : 'mobile/venue/view',
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
		function toEquipmentDetail (pubEquipId) {
			mui.openWindow({
			    url: dynamicURL+'mobile/venue/equipment/toPubEquipDetail?pubEquipId='+pubEquipId, 
			    id : 'pub_equip_detail.html',
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
		document.getElementById('search').addEventListener('tap',function () {
			mui.openWindow({
				url: '${dynamicURL}/mobile/venue/view/toVenueInfo', 
			    id : 'venue_search.html',
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