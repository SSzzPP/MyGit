<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="feedback">
	<head>
		<script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=j7qM5IwNzuxMxlZbosvGR6iz0rg8w1R3"></script>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>新增环境图</title>
		<link rel="stylesheet" type="text/css" href="${staticURL}/css/feedback.css" />
	</head>
	<style>
		html {
			height: 100%
		}
		
		body {
			height: 100%;
			margin: 0px;
			padding: 0px
		}
		.mui-content{
			background-color: #fff;
			min-height: calc(100vh-164px);
		}
		.mui-input-row {
			height:60px;
			padding:10px 0;
		}
		.mui-input-row:after{
			position: absolute;
		    right: 0;
		    bottom: 0;
		    left: 15px;
		    height: 1px;
		    content: '';
		    -webkit-transform: scaleY(.5);
		    transform: scaleY(.5);
		    background-color: #c8c7cc;
		}
		.mui-input-row label {
			width: 31%;
			font-size:16px;
		}
		.mui-input-row label~input,
		.mui-input-row label~select{
			width: 69%;
			font-size:16px;
			text-align: right;
		}
		#container {
			height: 50%;
		}
		/*隐藏百度logo*/
		.anchorBL{
			display: none!important;
		}
	</style>

	<body>
		<header class="mui-bar mui-bar-nav" style="background-color:#fff;box-shadow:0 1px 0px #f5f5f5;">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">设置定位</h1>
		</header>
		<div class="mui-content">
			<!-- 定位信息 -->
			<form action="javascript:void(0)">
				<div class="mui-input-row">
					<label>经度</label>
					<input id='lng' type="text" class="" placeholder="请输入经度" maxlength="18">
				</div>
				<div class="mui-input-row">
					<label>纬度</label>
					<input id='lat' type="text" class="" placeholder="请输入纬度" maxlength="18">
				</div>
				<div class="mui-content-padded">
					<button id='location' class="mui-btn mui-btn-block mui-btn-self">获取数据库位置</button>
					<button id='refresh' class="mui-btn mui-btn-block mui-btn-self">刷新</button>
					<button id='submit' class="mui-btn mui-btn-block mui-btn-self">保存</button>
				</div>
			</form>
			<!-- 地图 -->
			<div id="container"></div>
		</div>
	<script type="text/javascript">
		// 创建地图实例  
		var map = new BMap.Map("container");
		var point = new BMap.Point(120.376729, 36.119803);//市北区中心点
		map.centerAndZoom(point,16);
		getLocation();
		getGps();
		function getLocation(){
			if("${entity.lng != null}" && "${entity.lat != null}"){
				var point1 = new BMap.Point("${entity.lng}","${entity.lat}");
				var ply = new BMap.Marker(point1);
				map.addOverlay(ply); //添加覆盖物
				map.panTo(point1);//地图中心移动
				ply.disableMassClear();
				$("#lng").val("${entity.lng}");
				$("#lat").val("${entity.lat}");
			}else{
				alert("当前健身路径没有位置信息！");
			}
		}
		function getGps(){
			var geolocation = new BMap.Geolocation();
			geolocation.getCurrentPosition(function(r){
			//console.log(r.point)
			if(this.getStatus() == BMAP_STATUS_SUCCESS){
				map.clearOverlays();
				mk = new BMap.Marker(r.point);
				map.addOverlay(mk);//标出所在地
				map.panTo(r.point);//地图中心移动
				console.log('您的位置：'+r.point.lng+','+r.point.lat);
				//var point = new BMap.Point(r.point.lng,r.point.lat);//用所定位的经纬度查找所在地省市街道等信息
				//var params={'billUuid':billUuid,'lng':r.point.lng,'lat':r.point.lat};
				//uploadGps(params);
				$("#lng").val(r.point.lng);
				$("#lat").val(r.point.lat);
			}else {
				alert('failed'+this.getStatus());
			}        
			},{enableHighAccuracy: true, maximumAge: 0})
		}
		map.addEventListener("click",function(e){
			map.clearOverlays();
			mk = new BMap.Marker(e.point);
			map.addOverlay(mk);//标出所在地
			map.panTo(e.point);//地图中心移动
			console.log('您的位置：'+e.point.lng+','+e.point.lat);
			$("#lng").val(e.point.lng);
			$("#lat").val(e.point.lat);
			
		});
		document.getElementById('location').addEventListener('tap',function () {
			getLocation();
		},false);
		document.getElementById('refresh').addEventListener('tap',function () {
		   getGps();
		},false);
	   document.getElementById('submit').addEventListener('tap',function () {
			//保存位置
	        var param = {};
	        param.lng = $("#lng").val();
	        param.lat = $("#lat").val();
	        param.id = "${entity.id}";
	        
	        topUtil.web_query("/mobile/venue/equipment/savePoint",param,function(data){
	        	if (typeof data == "string") {
	                data = JSON.parse(data);
	            }
	        	if(data.success){
	        		mui.alert("保存成功！",function () {
						mui.back();
					});
	        	}else{
	        		mui.toast('保存失败！');
	        	}
			});
		},false);
	</script>
</body>
</html>