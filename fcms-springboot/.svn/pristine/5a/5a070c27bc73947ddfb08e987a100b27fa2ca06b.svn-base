<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		<form class="addForm" id="addForm" action="${dynamicURL}/admin/venue/info/saveVenue"  method="post" enctype ="multipart/form-data">
			<input type="hidden" name="id" value="${venueInfoEntity.id }" />
			<div title="场馆基本信息" style="padding: 5px;">
				<table class="table_edit" style="text-align: center;">
					<tr>
						<td class="text_tr" >场馆名称：</td>
						<td><input class="form-control" type="text" name="name" value="${venueInfoEntity.name }"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >别名：</td>
						<td><input class="form-control" type="text" name="otherName" value="${venueInfoEntity.otherName }"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr style="margin-bottom: 10px;">
						<td class="text_tr" >所在行政区：</td>
						<td>
							<input id="administrativeAreaFormId" name="administrativeArea" style="width: 270px; height: 26px;">
						</td>
						<td></td>
					</tr>
					<tr style="margin-bottom: 10px;">
						<td class="text_tr" >所在商区：</td>
						<td>
							<input id="businessAreaFormId" name="businessArea" style="width: 270px; height: 26px;">  
						</td>
						<td></td>
					</tr>
					<tr style="margin-bottom: 10px;">
						<td class="text_tr" >分类：</td>
						<td>
							<input id="typeFormIds" name="typeIds" style="width: 270px; height: 26px;">  
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >营业时间：</td>
						<td><input class="form-control" type="text" name="businessHours" value="${venueInfoEntity.businessHours }"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >描述：</td>
						<td><input class="form-control" type="text" name="description" value="${venueInfoEntity.description }"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >地址：</td>
						<td><input class="form-control" type="text" name="location" value="${venueInfoEntity.location }"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >电话：</td>
						<td><input class="form-control" type="text" name="tel" value="${venueInfoEntity.tel }"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >星级：</td>
						<td><input class="form-control" type="text" name="star" value="${venueInfoEntity.star }"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >经度：</td>
						<td><input class="form-control" type="text" name="lng" value="${venueInfoEntity.lng }" id="lng"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >纬度：</td>
						<td><input class="form-control" type="text" name="lat" value="${venueInfoEntity.lat }" id="lat"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
						<td class="text_tr" ><button id="search" class="layui-btn" onclick="return false;">搜索</button></td>
						<td><input class="form-control" type="text" id="searchName"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" colspan=3 align="center">
						<div id="container"></div>
						</td>
					</tr>
					<tr>
						<td class="text_tr" >人均：</td>
						<td>
							<input class="form-control" type="text" name=perCapita value="${venueInfoEntity.perCapita }"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >所属单位：</td>
						<td><input class="form-control" type="text" name="unit" value="${venueInfoEntity.unit }"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >认证状态：</td>
						<td>
							<input id="certificationStatusFormId" name="certificationStatus" style="width: 270px; height: 26px;">  
						</td>
						<td></td>
					</tr>
					<tr>
					    <td class="text_tr">交通方式：&nbsp;&nbsp;</td>
					    <td>
					        <textarea class="form-control" type="text" name="transportationMode" style="width: 270px; height: 52px;">${entity.transportationMode}</textarea>
					  </td>
					   <td></td>
					</tr>
					<tr>
						<td class="text_tr" >器械租赁：</td>
						<td><input class="form-control" type="text" name="equipmentLease" value="${venueInfoEntity.equipmentLease }"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >器械维护：</td>
						<td><input class="form-control" type="text" name="equipmentMaintenance" value="${venueInfoEntity.equipmentMaintenance }"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >洗浴设施：</td>
						<td><input class="form-control" type="text" name="scouringBath" value="${venueInfoEntity.scouringBath }"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >场馆卖品：</td>
						<td><input class="form-control" type="text" name="saleArticle" value="${venueInfoEntity.saleArticle }"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >发票：</td>
						<td><input class="form-control" type="text" name="invoice" value="${venueInfoEntity.invoice }"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >其他服务：</td>
						<td><input class="form-control" type="text" name="otherServices" value="${venueInfoEntity.otherServices }"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >首页图：</td>
						<td>
							<input type="file" name="PageImg" id="uploadPageImg" style="width: 270px; height: 26px;">  
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >环境图：</td>
						<td>
							<input type="file" name="EnvironmentImg" id="uploadEnvironmentImg" style="width: 270px; height: 26px;" multiple="multiple">  
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >营业执照图：</td>
						<td>
							<input type="file" name="LicenseImg" id="uploadLicenseImg" style="width: 270px; height: 26px;">  
						</td>
						<td></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=j7qM5IwNzuxMxlZbosvGR6iz0rg8w1R3"></script>
<script>
    var venueInfoId="${venueInfoEntity.id}";
    var businessAreaId="${venueInfoEntity.businessArea}";
    var administrativeAreaId="${venueInfoEntity.administrativeArea}";
    var certificationStatusId="${venueInfoEntity.certificationStatus}";
    var venueTypeIds = "${venueTypeIds}";
    var venueTypes=venueTypeIds.split(',');
	$(function() {  
		$('#businessAreaFormId').combobox({
			valueField : 'id',
			textField : 'name',
			url : '${dynamicURL}/admin/system/dict/combobox?type=BUSINESS_AREA',
			onLoadSuccess:function(data){
				if(businessAreaId){
					$("#businessAreaFormId").combobox('select', businessAreaId);
				}else{
					var data = $('#businessAreaFormId').combobox('getData');
		            if (data.length > 0) {
		                $("#businessAreaFormId").combobox('select', data[0].id);
		            }
				}
			}
		});
		$('#administrativeAreaFormId').combobox({
			valueField : 'id',
			textField : 'name',
			url : '${dynamicURL}/admin/system/dict/combobox?type=ADMINISTRATE_AREA',
			onLoadSuccess:function(data){
				if(administrativeAreaId){
					$("#administrativeAreaFormId").combobox('select', administrativeAreaId);
				}else{
					var data = $('#administrativeAreaFormId').combobox('getData');
		            if (data.length > 0) {
		                $("#administrativeAreaFormId").combobox('select', data[0].id);
		            }
				}
			}
		});
		$('#typeFormIds').combobox({
			valueField : 'id',
			textField : 'name',
			multiple:true, 
			url : '${dynamicURL}/admin/system/dict/combobox?type=SPORT_TYPE',
			onLoadSuccess:function(data){
				if(venueInfoId){
					if(venueTypeIds != ""){
						$("#typeFormIds").combobox('setValues',venueTypes);
					}
				}
			}
		});
		$('#certificationStatusFormId').combobox({
			valueField : 'id',
			textField : 'name',
			url : '${dynamicURL}/admin/system/dict/combobox?type=CERTIFICATION_STATUS',
			onLoadSuccess:function(data){
				if(certificationStatusId){
					$("#certificationStatusFormId").combobox('select', certificationStatusId);
				}else{
					var data = $('#certificationStatusFormId').combobox('getData');
		            if (data.length > 0) {
		                $("#certificationStatusFormId").combobox('select', data[0].id);
		            }
				}
			}
		});
	});
	
	
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
	//local.search("青岛体育街");
	/* function search(){
		
	} */
	 document.getElementById("search").addEventListener("click",function(e){
		 local.search($("#searchName").val());
	}); 
</script>