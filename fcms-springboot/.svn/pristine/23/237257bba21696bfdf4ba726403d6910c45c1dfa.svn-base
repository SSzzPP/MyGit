<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户地图</title>
<script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=j7qM5IwNzuxMxlZbosvGR6iz0rg8w1R3"></script>
<link href="${staticURL}/style_v2/css/iconfont.css" type="text/css" rel="stylesheet" />
<style type="text/css">
html {
	height: 100%
}

body {
	height: 100%;
	margin: 0px;
	padding: 0px
}

#container1 {
	height: 100%
}
.Map_select{
	width: 35px;
    height: 110px;
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
}
/*隐藏百度logo*/
.anchorBL{
	display: none!important;
}
</style>
</head>
<body>
<div class="padd15 easyui-layout" data-options="fit:true">
	<div class="easyui-layout layout-custom-resize" data-options="fit:true">
		<div data-options="region:'north',split:false,collapsible:false" >
			<form class="form-horizontal padd15">
	       		 <table style="border-collapse: separate; border-spacing: 5px; width: 80%; align: center; border: 0; cellpadding: 0;"cellspacing="0" >
	                <tr>
						<td>范围:</td>
	                 	<td>
							<select id="radius" style="width: 150px;" >
				            	<option value="1000" >1千米</option>
				            	<option value="3000" >3千米</option>
				            	<option value="5000" >5千米</option>
				            	<option value="7000" >7千米</option>
				            	<option value="15000" >15千米</option>
				            </select>
						</td>
	                    <td>商圈:</td>
	                    <td>
							<select id="businessFormId" style="width: 150px;" >
				            </select>
	                    </td>
	                    <td>分类:</td>
	                 	<td>
							<select id="typeFormId" style="width: 150px;" >
				            </select>
						</td>
						<td>
							<div class="BtnLine" style="border: 0px; margin: 0px; padding: 0px;text-align:left">
								<button type="button" class="layui-btn layui-btn" icon-class="search" onclick="search()">搜索</button>
								<button type="button" class="layui-btn layui-btn" icon-class="refresh" onclick="refresh()">重置</button>
							</div>
						</td>
	                </tr>
	               </table>
	       	</form>
		</div>
		<div data-options="region:'center',split:false,collapsible:false" style="width: 80%;padding:10px 15px 10px 5px;">
		    <div id="container" class="easyui-layout layout" fit="true">
		        <div region="center" border="false">
			    	<div id="container1">
			    	</div>
		        </div>
		    </div>
	  	 </div>
	 </div>
 </div>
	<script type="text/javascript">
		// 创建地图实例  
		var markerArr = [] ;//关键词搜索后找到的marker
		var infoWindows = [] ;//自定义弹出窗口
		var map = new BMap.Map("container1");
		var userPoint;
		getUserPoint();//用户坐标
		var radius = 1000;
		var opts = {type: BMAP_NAVIGATION_CONTROL_LARGE};    
		map.addControl(new BMap.NavigationControl(opts));//控件
		map.enableScrollWheelZoom();//启动鼠标滚轮缩放地图
		map.enableKeyboard();//启动键盘操作地图
		initMapSelect();
		// 创建点坐标   初始化地图，设置中心点坐标和地图级别
		function getMap(flag1,flag2){
			//var userPoint = new BMap.Point(120.345189, 36.084362);
			map.centerAndZoom(userPoint, 14);
			var myKeys = ["健身房", "体育馆","球馆"];
			//--------检索---------
			//keysPoi(myKeys,map);//多关键字检索
			//圆形区域检索
			//var radius = 7000;
			radius = $("#radius").val();
			circlePoi(myKeys,map,userPoint,radius);
			if(flag1)
				getGymnasium();
			if(flag2)
				getEquipment();
		}

		//获取用户坐标
		function getUserPoint() {
			userPoint = null;
			//1.通过浏览器获取
			/* if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(getPositionByWeb, showGetPositionByWebError);
			} else { */
				//获取失败通过百度api获取
				getPositionByBaidu();
			//}
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
			//console.log(new Date().getTime());
			geolocation.getCurrentPosition(function(r){
				if(this.getStatus() == BMAP_STATUS_SUCCESS){
					//console.log(new Date().getTime());
					var mk = new BMap.Marker(r.point);
					map.addOverlay(mk);
					map.panTo(r.point);
					userPoint= new BMap.Point(r.point.lng, r.point.lat);
					getMap(true,false);
					//console.log(new Date().getTime());
				}
				else {
					//console.log('failed'+this.getStatus());
				}        
			});
		}
		//圆形检索
		function circlePoi(keys,map,userPoint,radius){
			var circle = new BMap.Circle(userPoint,radius,{fillColor:"blue", strokeWeight: 1 ,fillOpacity: 0.3, strokeOpacity: 0.3});
		    map.addOverlay(circle);
		    /* var local =  new BMap.LocalSearch(map, {renderOptions: {map: map, autoViewport: false}});  
		    local.searchNearby(keys,userPoint,radius);
			//搜索marker设置完毕的回调https://www.cnblogs.com/forever-star/articles/4717483.html
			local.setMarkersSetCallback(function(pois) {
				for ( var i = 0; i < pois.length; i++) {
					markerArr[i] = pois[i].marker;
				}
				
			}); */
		}
		//改变marker的infowindow
		setTimeout(changeInfoWindow,2000);
		function changeInfoWindow(){
			for ( var i = 0; i < markerArr.length; i++) {
				markerArr[i].addEventListener("click", function(e) {
					var content = e.currentTarget.Cb.content;
					var a ="<a href='${dynamicURL}/map/toMonitor' target='_blank'>实时监控</a> <span style='color:green;text-decoration:underline;'>开启</span> <a href='${dynamicURL}/map/toPanoramicMap?lng="+e.point.lng+"&lat="+e.point.lat+"' target='_blank'>进入全景>></a>";
					content = content + a;
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
			var url = '${dynamicURL}/map/venue/search?lng='+userPoint.lng+'&lat='+userPoint.lat+'&radius='+radius;
			if($("#businessFormId").val() != "") {
				url += '&search_EQ_businessArea='+$("#businessFormId").val();
			}
			if($("#typeFormId").val() != "") {
				url += '&search_EQ_typeId='+$("#typeFormId").val();
			}
			jQuery.ajax({
				url:url,
				dataType:'json',
				type:'post',
				data:{},
				success:function(result){
					if(result.length){
						//加载已知场馆
						for(var  i=0;i<result.length;i++){
							(function(){
								var gymnasium = result[i];
								var gympoint = new BMap.Point(gymnasium.lng, gymnasium.lat);  
								var icon = new BMap.Icon("${staticURL}/style_v2/images/venue1.png", new BMap.Size(23, 23), {
									// 指定定位位置。   
							        // 当标注显示在地图上时，其所指向的地理位置距离图标左上    
							        // 角各偏移10像素和25像素。
								    anchor: new BMap.Size(10, 20),
								}); 
							    var gymmarker = new BMap.Marker(gympoint,{icon: icon});
							    var content='<div style="font:12px arial,sans-serif;margin-top:10px">';
							    var filePath = '';
							    if(gymnasium.mainImageUuid != "" && gymnasium.mainImageUuid != null){
							    	filePath = "${dynamicURL}/map/showImage?uuid="+gymnasium.mainImageUuid;
							    	//alert('filePath'+filePath);
							    	content += '<div><img src="'+filePath+'" alt="" style="float:center;zoom:1;overflow:hidden;width:98%;height:100px;margin-left:3px;"/></div>';
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
											'</div>';
							    var infoWindow = new BMap.InfoWindow(content, {  
							        offset: new BMap.Size(0, -15),
							        title:gymnasium.name,
							        width:330
							    });
							    gymmarker.addEventListener("click", function(e) {
							    	gymmarker.openInfoWindow(infoWindow, gympoint);
								});
								map.addOverlay(gymmarker); 
							})()
						}
					}
				},
				error:function(){}
			});
		}
		//加载已知设施
		function getEquipment(){
			var url = '${dynamicURL}/map/equipment/search?lng='+userPoint.lng+'&lat='+userPoint.lat+'&radius='+radius;
			if($("#typeFormId").val() != "") {
				url += '&search_EQ_typeId='+$("#typeFormId").val();
			}
			jQuery.ajax({
				url:url,
				dataType:'json',
				type:'post',
				data:{},
				success:function(result){
					if(result.length){
						//加载已知场馆
						for(var  i=0;i<result.length;i++){
							(function(){
								var gymnasium = result[i];
								var gympoint = new BMap.Point(gymnasium.lng, gymnasium.lat);  
								var icon = new BMap.Icon("${staticURL}/style_v2/images/equipment1.png", new BMap.Size(24, 24), {
									// 指定定位位置。   
							        // 当标注显示在地图上时，其所指向的地理位置距离图标左上    
							        // 角各偏移10像素和25像素。
								    anchor: new BMap.Size(10, 20),
								}); 
							    var gymmarker = new BMap.Marker(gympoint,{icon: icon});
							    var content='<div style="font:12px arial,sans-serif;margin-top:10px">';
							    var filePath = '';
							    if(gymnasium.mainImageUuid != "" && gymnasium.mainImageUuid != null){
							    	filePath = dynamicURL +"/map/showImage?uuid="+gymnasium.mainImageUuid;
							    	//alert('filePath'+filePath);
							    	content += '<div><a onclick="showPubEquipInfo('+gymnasium.id+')"><img id="img_'+gymnasium.id+'" src="'+filePath+'" alt="" style="float:center;zoom:1;overflow:hidden;width:98%;height:100px;margin-left:3px;"/></a></div>';
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
											'</div>';
							    var infoWindow = new BMap.InfoWindow(content, {  
							        offset: new BMap.Size(0, -15),
							        title:gymnasium.name,
							        width:330
							    });
							    gymmarker.addEventListener("click", function(e) {
							    	gymmarker.openInfoWindow(infoWindow, gympoint);
								});
								map.addOverlay(gymmarker); 
							})()
						}
					}
				},
				error:function(){}
			});
		}
		$(function() {  
			$.ajax({
				type : "POST",
				url : '${dynamicURL}/admin/system/dict/combobox?type=ADMINISTRATE_AREA',
				dataType : "JSON",
				success : function(msg){
					$("#businessFormId").prepend("<option value=''>全部</option>");//添加第一个option值
					for (var i = 0; i < msg.length; i++) {
						$("#businessFormId").append("<option  value='"+msg[i].id+"'>"+msg[i].name+"</option>");
					}
				},error:function(){
					alertLayer("获取数据失败","error");
				}
			});
			$.ajax({
				type : "POST",
				url : '${dynamicURL}/admin/system/dict/combobox?type=SPORT_TYPE',
				dataType : "JSON",
				success : function(msg){
					$("#typeFormId").prepend("<option value=''>全部</option>");//添加第一个option值
					for (var i = 0; i < msg.length; i++) {
						$("#typeFormId").append("<option  value='"+msg[i].id+"'>"+msg[i].name+"</option>");
					}
				},error:function(){
					alertLayer("获取数据失败","error");
				}
			});
		});
		function search() {
			map.clearOverlays();
			var mk = new BMap.Marker(userPoint);
			map.addOverlay(mk);
			var flag1 = $('.user-select.con1').hasClass('select');
			var flag2 = $('.user-select.con2').hasClass('select');
			getMap(flag1,flag2);
		}
		function refresh() {
			$("#radius option:first").prop("selected", 'selected');
			$("#businessFormId option:first").prop("selected", 'selected');
			$("#typeFormId option:first").prop("selected", 'selected');
			search();
        }
		function detail(id){
			alert("detail/id:"+id);
		}
		function initMapSelect(){
			var MapSelectStr='<div class="Map_select">'+
					'<div class="user-select con1 select" onclick="selectIcon(this)"><span class="mui-icon iconfont icon-changguan2"></span></div>'+
					'<div class="user-select con2" onclick="selectIcon(this)"><span class="mui-icon iconfont icon-gongyuan"></span></div>'+
					'<div class="user-select con3" onclick="parent.layui_events.refresh();"><span class="mui-icon iconfont icon-shuaxin"></span></div>'+
				'</div>';
			$("#container1").append(MapSelectStr);
			
		}
		function selectIcon(that){
			$(that).toggleClass('select');
			search();
		}
		function showPubEquipInfo(id){
			layui.admin.openT("详情" , '${dynamicURL}/admin/venue/equipment/type/toPubEquipTabs?id='+id);
		}
	</script>
</body>
</body>
</html>