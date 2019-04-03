<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>鼠标绘制工具</title>
<style type="text/css">
body,html {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0;
}

#allmap {
	/* margin-right: 300px; */
	height: 100%;
	overflow: hidden;
}
</style>
<script type="text/javascript"
	src="https://api.map.baidu.com/api?v=2.0&ak=3sCbOcosKfB6d3f47GtHYNjXVYdojnzc"></script>
<!--加载鼠标绘制工具-->
<script type="text/javascript"
	src="https://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>
<link rel="stylesheet"
	href="https://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css" />
<!--加载检索信息窗口-->
<script type="text/javascript"
	src="https://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.js"></script>
<link rel="stylesheet"
	href="https://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.css" />

<!-- 其它 -->
<script type="text/javascript" src="${staticURL }/jquery-easyui-1.4.3/jquery.min.js"></script>
<script src="https://malsup.github.com/jquery.form.js"></script>
</head>
<body>
<div class="padd15 easyui-layout" data-options="fit:true">
	<div class="easyui-layout layout-custom-resize" data-options="fit:true">
		<div data-options="region:'west',split:false,collapsible:false" style="width: 70%;padding:10px 15px 10px 5px;">
			<div id="container" class="easyui-layout layout" fit="true">
				<div id="allmap" style="overflow: hidden; zoom: 1; position: relative;">
					<div id="map" style="height: 100%; -webkit-transition: all 0.5s ease-in-out; transition: all 0.5s ease-in-out;"></div>
				</div>
			</div>
		</div>
		<div data-options="region:'center',split:false,collapsible:false">
			<div></div>
			<form class="form-horizontal padd15">
	       		 <div id="titleType">
	       		 <h2>新增</h2>
	       		 </div>
	       		 <table style="border-collapse: separate; border-spacing: 5px; width: 90%; align: center; border: 0; cellpadding: 0;"cellspacing="0" >
	                <tr>
						<td>区域名称:</td>
	                 	<td>
							<input class="input-sm col-md-3 pull-left message-search search-white" type="text" name="areaName" id="areaName" style="width: 150px;">
						</td>
					</tr>
					<!-- <tr>
						<td>样式:</td>
	                 	<td>
							<select id="mapStyleId" name="mapStyleId" style="width: 150px;background-color: blue;color: #fff;" >
				            	<option value="1" style="background-color: blue;color: #fff;">blue</option>
				            	<option value="2" style="background-color: yellow;color: #fff;">yellow</option>
				            	<option value="3" style="background-color: brown;color: #fff;">brown</option>
				            	<option value="4" style="background-color: green;color: #fff;">green</option>
				            </select>
						</td>
					</tr> -->
					<tr>
						<td colspan="2">
							<div class="BtnLine" style="border: 0px; margin: 0px; padding: 0px;text-align:left">
								<button type="button" class="layui-btn layui-btn" onclick="startDrawPolygon()" onfocus="this.blur()">绘制</button>
								<button type="button" class="layui-btn layui-btn" onclick="clearArea(0)">清除</button>
							</div>
						</td>
	                </tr>
	                <tr>
						<td colspan="2"><h3>巡查路线</h3></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="BtnLine" style="border: 0px; margin: 0px; padding: 0px;text-align:left">
								<button type="button" class="layui-btn layui-btn" onclick="startDrawPolyline()" onfocus="this.blur()">绘制</button>
								<button type="button" class="layui-btn layui-btn" onclick="clearArea(1)">清除</button>
							</div>
						</td>
	                </tr>
	                <tr>
						<td colspan="2"><h3>负责人信息</h3></td>
					</tr>
	                <tr>
						<td>姓名:</td>
	                 	<td>
							<select id="userNameFormId" style="width: 150px;" name="userName">
				            </select>
						</td>
					</tr>
	                <tr>
						<td>联系方式:</td>
	                 	<td>
							<input class="input-sm col-md-3 pull-left message-search search-white" type="text" name="tel" id="tel" style="width: 150px;">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="BtnLine" style="border: 0px; margin: 0px; padding: 0px;text-align:left">
								<button type="button" class="layui-btn layui-btn" onclick="saveInfo()" id="submit">保存</button>
								<button type="button" class="layui-btn layui-btn" onclick="">取消</button>
							</div>
						</td>
	                </tr>
	               </table>
	       	</form>
			<!-- <div id="result">
				<dl>
					<dt>选择区域</dt>
					<select name="area">
						<option style="width: 150px;background-color: none;" value="null">未选择</option>
						<option style="width: 150px;background-color: blue;" value="区域一">区域一 </option>
						<option style="width: 150px;background-color: yellow" value="区域二">区域二 </option>
						<option style="width: 150px;background-color: brown" value="区域三">区域三 </option>
						<option style="width: 150px;background-color: green" value="区域四">区域四 </option>
					</select>
					<div style="border:1px solid gray;width:15px;height:15px;display: inline-block;position:relative;left: 10px;top:2px;" id="sample"> </div>
					<button onclick="clearAllArea">清除所有数据</button>
					</dd>
					<dt><button onclick="startDrawPolygon()" onfocus="this.blur()">开始绘制</button>
						<button onclick="clearArea()">清除绘制</button>
					</dt>
					<form action = "" >
					<dt>负责人信息</dt>
					<dd>
						<ul>
							<li>编号:<input type="text" name="userNumber"/><button onclick="getPeopleByNumber()">查询</button></li>
							<li><img style="width:120px;height:140px;"/></li>
							<li>姓名:<input type="text" name="userName"/></li>
							<li>职位:<input type="text" name="position"/></li>
							<li>部门:<input type="text" name="department"/></li>
							<li>联系方式:<input type="text" name="tel"/></li>
							<li><input type="submit" value="提交"/><input type="reset" /></li>
						</ul>
					</dd>
					</form>
				</dl>
		    </div> -->
	  	 </div> 
	 </div>
 </div>
	<script>
		//让jQuery放弃$变量的控制,与百度的有冲突
	    $.noConflict();    
	</script>
	<script type="text/javascript">
		var optionIndex = 0;
		var allMapStyles = null;//所有区域填充样式
		var overlays = null;//覆盖物
		var areas = null;//多个多边形区域坐标点
		var styleOptions = null;//区域填充样式
		var newAreaPoints = null;//新加区域的坐标点
		// 百度地图API功能  
		var map = new BMap.Map('map');
		var poi = new BMap.Point(120.376729, 36.119803);//市北区中心点
		map.centerAndZoom(poi, 13);
		map.enableScrollWheelZoom();
		//-------------描绘市北区轮廓线
		var bdary = new BMap.Boundary();//边界对象
		var name = "青岛市市北区";//区域名称
		
		bdary.get(name, function(rs) { //获取行政区域
			//map.clearOverlays(); //清除地图覆盖物
			var count = rs.boundaries.length; //行政区域有多少个
			for ( var i = 0; i < count; i++) {
				var ply = new BMap.Polygon(rs.boundaries[i], {
					strokeWeight : 3,
					strokeColor : "#ff0000",
					strokeOpacity:1,
					fillColor:"none",
					fillColorOpacity:0
				}); //建立多边形覆盖物
				map.addOverlay(ply); //添加覆盖物
				map.setViewport(ply.getPath()); //调整视野 
			}
		});
		//加载地图填充区域样式
		var polygonStyleOptions = {
			strokeColor : "#000", //边线颜色  
			fillColor : "#f3f0e9", //填充颜色。当参数为空时，圆形将没有填充效果。  
			strokeWeight : 3, //边线的宽度，以像素为单位。 
			strokeOpacity : 0.8, //边线透明度，取值范围0 - 1。  
			fillOpacity : 0.5, //填充的透明度，取值范围0 - 1。  
			strokeStyle : "solid" //边线的样式，solid或dashed。 
		};
		//加载地图巡查路线样式
		var polylineStyleOptions = {
			strokeColor : "red", //边线颜色  
			fillColor : "red", //填充颜色。当参数为空时，圆形将没有填充效果。  
			strokeWeight : 3, //边线的宽度，以像素为单位。 
			strokeOpacity : 0.8, //边线透明度，取值范围0 - 1。  
			fillOpacity : 0.6, //填充的透明度，取值范围0 - 1。  
			strokeStyle : "solid" //边线的样式，solid或dashed。 
		};
		//------------实例化鼠标绘制工具  
		var drawingManager = new BMapLib.DrawingManager(map, {
			isOpen : false, //是否开启绘制模式  
			enableDrawingTool : false, //是否显示工具栏   
			drawingToolOptions : {
				anchor : BMAP_ANCHOR_TOP_RIGHT, //位置  
				offset : new BMap.Size(5, 5), //偏离值  
				scale : 0.8 //工具栏缩放比例    
			},
			 polylineOptions: polylineStyleOptions, //线的样式
		     polygonOptions: polygonStyleOptions, //多边形的样式
		});
		initStyleAndArea();//初始化
		//--------------选择区域下拉列表切换
		jQuery(function(){
		});
		//------------点击绘制自定义多边形
		function startDrawPolygon(){
			clearArea(0);
			optionIndex = 0;
			drawingManager.open();//开启绘制模式
			drawingManager.setDrawingMode(BMAP_DRAWING_POLYGON);//多边形
			
		}
		//------------点击绘制自定义线
		function startDrawPolyline(){
			clearArea(1);
			optionIndex = 1;
			drawingManager.open();//开启绘制模式
			drawingManager.setDrawingMode(BMAP_DRAWING_POLYLINE);//线
			
		}
		
		//绘制结束获取相关信息    
		var overlaycomplete = function(e) {
			//overlays.push(e.overlay);
			//此部分待定
			var ia = e.overlay.ia;
			var points = "";
			for ( var i = 0; i < ia.length; i++) {
				/* var onePoint = {
					lng : ia[i].lng,
					lat : ia[i].lat
				}
				overlay_oneArea.push(onePoint); */
				points += ia[i].lng + "," + ia[i].lat + "_";
			}
			points = points.substring(0, points.length - 1);
			if(0 == optionIndex){
				newAreaPoints[0]=points;
				overlays[0]=overlay;
			}else if(1 == optionIndex){
				newAreaPoints[1]=points;
				overlays[1]=overlay;
			}
		};

		//添加鼠标绘制工具监听事件，用于获取绘制结果  
		drawingManager.addEventListener('overlaycomplete', overlaycomplete);

		//清除数据
		function clearArea(index){
			//1.清除覆盖物
			//2.清除坐标
			map.removeOverlay(overlays[index]);
		}
		
		//初始化多边形样式
		function initStyleAndArea() {
			overlays = new Array(2);
			newAreaPoints = new Array(2);
			var map_ = map;
			//加载已保存的区域
			jQuery.ajax({
				type : "POST",
				url : "${dynamicURL}/admin/map/area/list",
				dataType:"json",
				async:false,
				success : function(result) {
					if(result.total){
						jQuery.each(result.rows,function(index,area){
							//将每块先前绘制的区域显示在地图上
							var points = area.points.split("_");
							var boundaryArr=[];//多边形顶点数组
							for(var i =0;i<points.length;i++){
								var p = points[i].split(",");
								var bp=new BMap.Point(p[0], p[1]);
								boundaryArr.push(bp);
							}
							var ply = new BMap.Polygon(boundaryArr,polygonStyleOptions); //建立多边形覆盖物
							//console.log(ply)
							map.addOverlay(ply); //添加覆盖物 
							//将每块先前绘制的线显示在地图上
							if(area.linePoints){
								var linePoints = area.linePoints.split("_");
								var boundaryArr1=[];//多边形顶点数组
								for(var i =0;i<linePoints.length;i++){
									var p = linePoints[i].split(",");
									var bp=new BMap.Point(p[0], p[1]);
									boundaryArr1.push(bp);
								}
								var ply1 = new BMap.Polyline(boundaryArr1,polylineStyleOptions); //建立多边形覆盖物
								map.addOverlay(ply1); //添加覆盖物 
							}
						});
					}
				},
				error : function() {
				}
			})
		}
	</script>
	
	<!-- 表单部分    模拟负责人的数据 -->
	<script type="text/javascript">
		$(function() {  
			$.ajax({
				type : "POST",
				url : '${dynamicURL}/admin/venue/user/combobox?search_EQ_type=3',
				//url : '${dynamicURL}/admin/venue/user/search',
				dataType : "JSON",
				success : function(msg){
					for (var i = 0; i < msg.length; i++) {
						$("#userNameFormId").append("<option  value='"+msg[i].id+"'>"+msg[i].name+"</option>");
					}
				},error:function(){
					alertLayer("获取数据失败","error");
				}
			});
		});
		function saveInfo(){
			//表单数据  有的根据需要做验证
			var mapStyleId = 1;
			var areaName =$("#areaName").val();
			var userId = $("#userNameFormId").val();
			var tel =$("#tel").val();
			var points = newAreaPoints[0];
			var linePoints = newAreaPoints[1];
			$.ajax({  
				    url:"${dynamicURL}/admin/map/area/saveInfo",  
				    data:{
					    mapStyleId:mapStyleId,
				    	areaName:areaName,
				    	points:points,
				    	userId:userId,
				    	tel:tel,
				    	linePoints:linePoints
					},  
				    success:function(res){
				    	if(res.success){
				    		layer.alert('保存成功！', {icon: 1});
				    		parent.layui_top.tabsBody(parent.layui_top.tabsPage.index-1).find('.layadmin-iframe')[0].contentWindow.location.reload(!0)
				    		parent.layui.admin.closeThisTabs();
				    	}else{
		            		layer.alert(res.msg, {icon: 0});
		            	} 
					}  
			});  
		}
	</script>
</body>
</html>