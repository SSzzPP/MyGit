<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 设置经纬度 -->
<style>
 	.table_edit tr{
 		height: 40px;
 	}
 	.table_edit tr td{
 		padding-left:15px;
 	}
 	.active {
	    border: 5px #32BC61 solid;
	    background-color: #fff;
	}
	#container {
		width:400px;
		height: 225px;
	}
</style>
<!-- <div id="container" class="easyui-layout layout" fit="true" > -->
<div style="width:100%;height: 100%;" class="layer-cnt">
	<div style="margin-left: 50px;padding-top: 20px;" >
		<form class="addForm" id="addForm"   method="post" enctype ="multipart/form-data">
			<input type="hidden" name="id" value="${equipmentEntity.id }" />
			<div title="设置经纬度" style="padding: 5px;">
				<table class="table_edit" style="text-align: center;">
					<tr>
						<td class="text_tr" >设施名称：</td>
						<td><input class="form-control" type="text" name="name" value="${equipmentEntity.name }"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >地址：</td>
						<td><input class="form-control" type="text" name="location" value="${equipmentEntity.location }"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >经度：</td>
						<td><input class="form-control" type="text" name="lng" value="${equipmentEntity.lng }" id="lng"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >纬度：</td>
						<td><input class="form-control" type="text" name="lat" value="${equipmentEntity.lat }" id="lat"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
						<td class="text_tr" ><button id="search" class="layui-btn" onclick="return false;">搜索</button></td>
						<td><input class="form-control" type="text" id="searchName"
							style="width: 270px; height: 26px" value="${equipmentEntity.location }"/><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" colspan=3 align="center">
						<div id="container"></div>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=j7qM5IwNzuxMxlZbosvGR6iz0rg8w1R3"></script>
<script>
    var equipmentId="${equipmentEntity.id}";
	
	// 创建地图实例  
	var map = new BMap.Map("container");
	var userPoint;
	var opts = {type: BMAP_NAVIGATION_CONTROL_LARGE};    
	map.addControl(new BMap.NavigationControl(opts));//控件
	map.enableScrollWheelZoom();//启动鼠标滚轮缩放地图
	map.enableKeyboard();//启动键盘操作地图
	map.centerAndZoom("青岛",14);
	map.addEventListener("click",function(e){
		$("#lng").val(e.point.lng);
		$("#lat").val(e.point.lat);
		
	});
	var local = new BMap.LocalSearch(map, {
		renderOptions:{map: map}
	});
	local.search($("#searchName").val());
	//local.search("青岛体育街");
	/* function search(){
		
	} */
	document.getElementById("search").addEventListener("click",function(e){
		 local.search($("#searchName").val());
	});
</script>