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
	<div style="margin-left: 50px;padding-top: 20px;">
		<form class="addForm" id="addForm" action="${dynamicURL}/admin/venue/user/saveInfo" method="post" enctype ="multipart/form-data">
			<input type="hidden" name="id" value="${entity.id }" />
			<div title="场馆人员信息" style="padding: 5px;">
				<table class="table_edit" style="text-align: center;">
					<tbody>
						<tr>
						     <td class="text_tr">登录名：&nbsp;&nbsp;</td>
						     <td>
						         <input class="form-control" type="text" name="loginName" id="loginName" value="${entity.loginName}"  style="width: 270px; height: 26px;" />
						    </td>
						    <td></td>
						</tr>
						<tr>
						    <td class="text_tr">姓名：&nbsp;&nbsp;</td>
						    <td>
						        <input class="form-control" type="text" value="${entity.name}"  name="name" style="width: 270px; height: 26px;"/>
						  </td>
						   <td></td>
						</tr>
						<tr> 
						  <td class="text_tr">性别：&nbsp;&nbsp;</td>
						  <td>
						      <select id="sex" name="sex" style="width: 270px; height: 26px;color: #666;background-color: #fefefe;border-color:rgba(102, 102, 102, 0.33);" >
						            <option value="0">男</option>
						            <option value="1">女</option>
						        </select>
						     <td></td>
						</tr>
						<tr>
						    <td class="text_tr">出生日期：&nbsp;&nbsp;</td>
						    <td>
						        <input class="easyui-datebox" data-options="editable:true" name="birthday" value="${entity.birthday}" type="text" id="birthday"  style="width: 270px; height: 26px"data-options="editable:false" />
						    </td>
						     <td></td>
						</tr>
						<tr>
						    <td class="text_tr">手机号码：&nbsp;&nbsp;</td>
						    <td>
						        <input class="form-control" type="text" name="mobile" value="${entity.mobile}" style="width: 270px; height: 26px" />
						    </td>
						     <td></td>
						</tr>
						<tr>
						    <td class="text_tr">电子邮箱：&nbsp;&nbsp;</td>
						    <td>
						        <input class="form-control" type="text" value="${entity.email}" id="email" name="email" style="width: 270px; height: 26px" />
						    </td>
						     <td></td>
						</tr>
						<tr>
							<td class="text_tr">所属场馆：&nbsp;&nbsp;</td>
							<td>
								<input id="venueFormId" name="venueId" style="width: 270px; height: 26px;">  
							</td>
							<td></td>
						</tr>
						<tr> 
						  <td class="text_tr">类型：&nbsp;&nbsp;</td>
						  <td>
						      <select id="type" name="type" style="width: 270px; height: 26px;color: #666;background-color: #fefefe;border-color:rgba(102, 102, 102, 0.33);" onchange="typeChange()">
						            <option value="0">管理</option>
						            <option value="1">教练</option>
						        </select>
						     <td></td>
						</tr>
						<tr> 
						  <td class="text_tr">状态：&nbsp;&nbsp;</td>
						  <td>
						      <select id="status" name="status" style="width: 270px; height: 26px;color: #666;background-color: #fefefe;border-color:rgba(102, 102, 102, 0.33);" >
						            <option value="0">在职</option>
						            <option value="1">离职</option>
						        </select>
						     <td></td>
						</tr>
						<tr>
							<td class="text_tr">教练类型：&nbsp;&nbsp;</td>
							<td>
								<input id="coachingTypeFormId" name="coachingTypeId" style="width: 270px; height: 26px;">  
							</td>
							<td></td>
						</tr>
						<tr>
						    <td class="text_tr">个人经历：&nbsp;&nbsp;</td>
						    <td>
						        <textarea class="form-control" type="text" name="experience" style="width: 270px; height: 52px;">${entity.experience}</textarea>
						  </td>
						   <td></td>
						</tr>
						<tr>
						<td class="text_tr" >头像图：</td>
						<td>
							<input type="file" name="headImg" id="headImg" style="width: 270px; height: 26px;">  
						</td>
						<td></td>
					</tr>
		            </tbody>
				</table>
			</div>
		</form>
	</div>
</div>
<script>
$(function() {  
	if("${entity.sex}"){
		$("#sex").val("${entity.sex}");
	}
	if("${entity.type}"){
		$("#type").val("${entity.type}");
		 if("${entity.type}" == 1){
	    	 $("#status").empty();
	    	 $("#status").append("<option value='0'>未认证</option>");
	    	 $("#status").append("<option value='1'>已认证</option>");
	     }
		 if("${entity.status}"){
			$("#status").val("${entity.status}");
		}
	}
	
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
	$('#coachingTypeFormId').combobox({
		valueField : 'id',
		textField : 'name',
		url : '${dynamicURL}/admin/system/dict/combobox?type=VENUE_TYPE',
		onLoadSuccess:function(data){
			if("${entity.coachingTypeId }"){
				$("#coachingTypeFormId").combobox('select', "${entity.coachingTypeId }");
			}else{
				var data = $('#coachingTypeFormId').combobox('getData');
	            if (data.length > 0) {
	                $("#coachingTypeFormId").combobox('select', data[0].id);
	            }
			}
		}
	});
});
function typeChange(){
	 var objS = document.getElementById("type");
     var value = objS.options[objS.selectedIndex].value;
     if(value == 0){
    	 $("#status").empty();
    	 $("#status").append("<option value='0'>在职</option>");
    	 $("#status").append("<option value='1'>离职</option>");
     }else if(value == 1){
    	 $("#status").empty();
    	 $("#status").append("<option value='0'>未认证</option>");
    	 $("#status").append("<option value='1'>已认证</option>");
     }
}
</script>