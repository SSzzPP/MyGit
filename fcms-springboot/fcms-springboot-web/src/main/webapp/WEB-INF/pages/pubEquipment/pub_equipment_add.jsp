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
</style>
<!-- <div id="container" class="easyui-layout layout" fit="true" > -->
<div style="width:100%;height: 100%;" class="layer-cnt">
	<div style="margin-left: 50px;padding-top: 20px;" >
		<form class="addForm" id="addForm"  method="post" action="${dynamicURL}/admin/venue/equipment/type/saveVenue" enctype ="multipart/form-data">
			<input type="hidden" name="id" value="${entity.id }" />
			<div title="场馆基本信息" style="padding: 5px;">
				<table class="table_edit" style="text-align: center;">
					<tr>
						<td class="text_tr" >设施名称：</td>
						<td><input class="form-control" type="text" name="name" value="${entity.name }" id="venueName"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr style="margin-bottom: 10px;">
						<td class="text_tr" >分类：</td>
						<td>
							<input id="typeFormId" name="typeId" style="width: 270px; height: 26px;">  
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >数量：</td>
						<td><input class="form-control" type="number" name="num" value="${entity.num }" 
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr style="margin-bottom: 10px;">
						<td class="text_tr" >运营模式：</td>
						<td>
							<input id="modeFormId" name="modeId" style="width: 270px; height: 26px;">  
						</td>
						<td></td>
					</tr>
					
					<tr style="margin-bottom: 10px;">
						<td class="text_tr" >是否公共：</td>
						<td>
							<input id="publicFlag" name="publicFlag" style="width: 270px; height: 26px;" class="easyui-combobox" data-options="required:false,
																			valueField: 'label',
																			textField: 'value',
																			data: [{
																					label: '0',
																					value: '是'
																				}],
																			onLoadSuccess:function(data){
																				if('${entity.publicFlag }' != '' ){
																					$('#publicFlag').combobox('select', '${entity.publicFlag }');
																				}else{
																		            if (data.length > 0) {
																		                $('#publicFlag').combobox('select', data[0].label);
																		            }
																				}
																			}">  
						</td>
						<td></td>
					</tr>
					<tr style="margin-bottom: 10px;">
						<td class="text_tr" >所在街道：</td>
						<td>
							<input id="streetFormId" name="streetId" style="width: 270px; height: 26px;">
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >地址：</td>
						<td>
						<input class="form-control" type="text" name="location" value="${entity.location }" id="location" style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >经度：</td>
						<td><input class="form-control" type="text" name="lng" value="${entity.lng }" id="lng" style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >纬度：</td>
						<td><input class="form-control" type="text" name="lat" value="${entity.lat }" id="lat" style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					
					<tr>
						<td class="text_tr" >项目描述：</td>
						<td>					        
							<textarea class="form-control" type="text" name="description" style="width: 270px; height: 52px;">${entity.description}</textarea>
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
				</table>
			</div>
		</form>
	</div>
</div>
<script>
$(function() {  
	$('#typeFormId').combobox({
		valueField : 'id',
		textField : 'name',
		url : '${dynamicURL}/admin/system/dict/combobox?type=FACILITIES_TYPE',
		onLoadSuccess:function(data){
			if("${entity.typeId }"){
				$("#typeFormId").combobox('select', "${entity.typeId }");
			}else{
				var data = $('#typeFormId').combobox('getData');
	            if (data.length > 0) {
	                $("#typeFormId").combobox('select', data[0].id);
	            }
			}
		}
	});
	$('#modeFormId').combobox({
		valueField : 'id',
		textField : 'name',
		url : '${dynamicURL}/admin/system/dict/combobox?type=OPERATION_MODE',
		onLoadSuccess:function(data){
			if("${entity.modeId }"){
				$("#modeFormId").combobox('select', "${entity.modeId }");
			}else{
				var data = $('#modeFormId').combobox('getData');
	            if (data.length > 0) {
	                $("#modeFormId").combobox('select', data[0].id);
	            }
			}
		}
	});
	$('#streetFormId').combobox({
		valueField : 'id',
		textField : 'name',
		url : '${dynamicURL}/admin/system/dict/combobox?type=STREET_NAME',
		onLoadSuccess:function(data){
			if("${entity.streetId }"){
				$("#streetFormId").combobox('select', "${entity.streetId }");
			}else{
				var data = $('#streetFormId').combobox('getData');
	            if (data.length > 0) {
	                $("#streetFormId").combobox('select', data[0].id);
	            }
			}
		}
	});
	$('#venueFormId').combobox({
		valueField : 'id',
		textField : 'name',
		url : '${dynamicURL}/admin/venue/info/search',
		onLoadSuccess:function(data){
			if("${entity.venueId }"){
				$("#venueFormId").combobox('select', "${entity.venueId }");
			}else{
				var data = $('#venueFormId').combobox('getData');
	            if (data.length > 0) {
	                $("#venueFormId").combobox('select', data[0].id);
	            }
			}
		}
	});
	 $('#chooseImage').on('change',function(){
	    	var filePath = $(this).val(),         //获取到input的value，里面是文件的路径
	    	    fileFormat = filePath.substring(filePath.lastIndexOf(".")).toLowerCase();
	    	// 检查是否是图片
	    	if( !fileFormat.match(/.png|.jpg|.jpeg/) ) {
	    		error_prompt_alert('上传错误,文件格式必须为：png/jpg/jpeg');
	        	return;  
	        }
	        //$('#chooseImage').attr('value',filePath);
	        //$('#loding').show();
	 });

});
</script>