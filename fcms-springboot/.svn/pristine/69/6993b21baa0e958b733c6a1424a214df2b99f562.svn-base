<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 监管信息管理  双击展示场馆详情页面 -->
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
						<td>
							<input class="form-control" type="text" readonly="readonly" name="name" value="${venueInfoEntity.name }" id="venueName" style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >别名：</td>
						<td>
							<input class="form-control" type="text" readonly="readonly" name="otherName" value="${venueInfoEntity.otherName }" id="venueName" style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr style="margin-bottom: 10px;">
						<td class="text_tr" >所在行政区：</td>
						<td>
							<input id="administrativeAreaFormId" readonly="readonly" name="administrativeArea" style="width: 270px; height: 26px;">
						</td>
						<td></td>
					</tr>
					<tr style="margin-bottom: 10px;">
						<td class="text_tr" >所在商区：</td>
						<td>
							<input id="businessAreaFormId" readonly="readonly" name="businessArea" style="width: 270px; height: 26px;">  
						</td>
						<td></td>
					</tr>
					<tr style="margin-bottom: 10px;">
						<td class="text_tr" >分类：</td>
						<td>
							<input id="typeFormIds" readonly="readonly" name="typeIds" style="width: 270px; height: 26px;">  
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >营业时间：</td>
						<td><input class="form-control" type="text" readonly="readonly" name="businessHours" value="${venueInfoEntity.businessHours }" id="venueName"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >描述：</td>
						<td><input class="form-control" type="text" readonly="readonly" name="description" value="${venueInfoEntity.description }" id="venueName"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >地址：</td>
						<td><input class="form-control" type="text" readonly="readonly" name="location" value="${venueInfoEntity.location }" id="venueName"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >电话：</td>
						<td><input class="form-control" type="text" readonly="readonly" name="tel" value="${venueInfoEntity.tel }" id="venueName"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >星级：</td>
						<td><input class="form-control" type="text" readonly="readonly" name="star" value="${venueInfoEntity.star }" id="venueName"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >经度：</td>
						<td><input class="form-control" type="text" readonly="readonly" name="lng" value="${venueInfoEntity.lng }" id="venueName"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >纬度：</td>
						<td><input class="form-control" type="text" readonly="readonly" name="lat" value="${venueInfoEntity.lat }" id="venueName"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >人均：</td>
						<td>
							<input class="form-control" type="text" readonly="readonly" name=perCapita value="${venueInfoEntity.perCapita }" id="venueName"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >所属单位：</td>
						<td><input class="form-control" type="text" readonly="readonly" name="unit" value="${venueInfoEntity.unit }" id="venueName"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >认证状态：</td>
						<td>
							<input id="certificationStatusFormId" readonly="readonly" name="certificationStatus" style="width: 270px; height: 26px;">  
						</td>
						<td></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</div>
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
			url : '${dynamicURL}/admin/system/dict/combobox?type=VENUE_TYPE',
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
	
</script>