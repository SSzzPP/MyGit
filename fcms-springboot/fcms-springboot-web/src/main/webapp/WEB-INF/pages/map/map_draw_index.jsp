<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ taglib prefix="security" uri="/tld/security.tld" %> --%>
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
<!-- 其它 -->
<script type="text/javascript" src="${staticURL }/jquery-easyui-1.4.3/jquery.min.js"></script>
<script src="https://malsup.github.com/jquery.form.js"></script>
</head>
<div class="padd15 easyui-layout" data-options="fit:true">
	<div class="easyui-layout layout-custom-resize" data-options="fit:true">
		<div data-options="region:'north',split:false,collapsible:false">
			<div class="card-button">
				<div class="layui-btn-container">
					<button id="add" onclick="add()" class="layui-btn layui-btn">增加</button>
					<button id="del" onclick="del()" class="layui-btn layui-btn">删除</button>
				</div>
			</div>
		</div>
		<div data-options="region:'west',split:false,collapsible:false" style="width: 40%;height:100%;padding:10px 5px 10px 15px;">
	        <div style="width: 100%; padding: 10px 15px;"
				 class="easyui-layout layout" fit="true">
				<table id="mapDrawDatagrid"></table>
			</div>
		</div>
		<div data-options="region:'center',split:false,collapsible:false" style="width: 80%;padding:10px 15px 10px 5px;">
		    <div id="container" class="easyui-layout layout" fit="true">
				<div id="allmap" style="overflow: hidden; zoom: 1; position: relative;">
					<div id="map" style="height: 100%; -webkit-transition: all 0.5s ease-in-out; transition: all 0.5s ease-in-out;"></div>
				</div>
			</div>
	  	 </div>
	</div>
</div>
<script type="text/javascript">
//分页
var mapDrawDatagrid;
var depCom;
var company;
var $parent=$(parent);
$(function() {
    /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
    mapDrawDatagrid = $('#mapDrawDatagrid').datagrid({
    	url: '${dynamicURL}/admin/map/area/list?sort=gmtCreate&order=desc',
        queryForm: "#queryHeader form",//列筛选时附带加上搜索表单的条件
        fit:true,
        pagination : true,
		rownumbers : true,
		singleSelect : true,
		lines:true,
		idField : 'id',
        columns: [
            [
                {field: 'id', checkbox: true,width:'5%'},
                {field: 'areaName', title: '区域名称',width:'32%', sortable: true,align:'left'},
                {field: 'venueUserName', title: '负责人姓名',width:'32%', sortable: true,align:'left'},
                {field: 'tel', title: '电话',width:'32%', sortable: true,align:'left'}
            ]
        ],
        onSelect:function(rowIndex, rowData){
        	getArea();
        },
        onDblClickRow: function(index) {
            edit();
        }

    });
    $("form[for] button.queryBtn").on("click.datagrid-query",
    function() {
        top._search($(this).parents("form[for]"));
    });
    $("form[for] button.clearBtn").on("click.datagrid-query",
    function() {
        top._clearSearch($(this).parents("form"));
    });
});
/*添加*/
function add() {
	layui.admin.openT("绘制区域","${dynamicURL}/admin/map/area/add");
}

/*删除*/
function del() {
    var row = mapDrawDatagrid.datagrid("getSelected");
    if (row) {
        $.submit({
            url: "${dynamicURL}/admin/map/area/deleteInfo",
            data:{
                "ids": row.id
            },
            butObj : null,
            success: function(res) {
                if (res.success) {
                	layer.alert('删除成功！', {icon: 1});
                    $('#mapDrawDatagrid').datagrid("reload");
                } else {
                	layer.alert(res.msg, {icon: 0});
                }
            }
          	});
    } else {
    	layer.alert('请选择要删除的记录！', {icon: 0});
    }
}
</script>
<script>
	//让jQuery放弃$变量的控制,与百度的有冲突
    $.noConflict();    
</script>
<script type="text/javascript">
	var overlays = null;//覆盖物
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
			ply.disableMassClear();
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
	initStyleAndArea();
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
	//画当前地区的多边形和路线
	function getArea() {
		map.clearOverlays();
		var row = mapDrawDatagrid.datagrid("getSelected");
		overlays = new Array(2);
		newAreaPoints = new Array(2);
		var map_ = map;
		//加载区域
		//将每块先前绘制的区域显示在地图上
		var points = row.points.split("_");
		var boundaryArr=[];//多边形顶点数组
		for(var i =0;i<points.length;i++){
			var p = points[i].split(",");
			var bp=new BMap.Point(p[0], p[1]);
			boundaryArr.push(bp);
		}
		var ply = new BMap.Polygon(boundaryArr,polygonStyleOptions); //建立多边形覆盖物
		map.addOverlay(ply); //添加覆盖物 
		//将每块先前绘制的线显示在地图上
		if(row.linePoints){
			var linePoints = row.linePoints.split("_");
			var boundaryArr1=[];//多边形顶点数组
			for(var i =0;i<linePoints.length;i++){
				var p = linePoints[i].split(",");
				var bp=new BMap.Point(p[0], p[1]);
				boundaryArr1.push(bp);
			}
			var ply1 = new BMap.Polyline(boundaryArr1,polylineStyleOptions); //建立多边形覆盖物
			map.addOverlay(ply1); //添加覆盖物 
		}
	}
</script>
