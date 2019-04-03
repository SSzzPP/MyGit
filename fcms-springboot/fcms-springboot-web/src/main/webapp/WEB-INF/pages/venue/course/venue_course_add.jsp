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
		<form class="addForm" id="addForm" action="${dynamicURL}/admin/venue/course/saveInfo"  method="post">
			<input type="hidden" name="id" value="${entity.id }" />
			<div title="场馆人员信息" style="padding: 5px;">
				<table class="table_edit" style="text-align: center;">
					<tbody>
						<tr>
						    <td class="text_tr">名称：&nbsp;&nbsp;</td>
						    <td>
						        <input class="form-control" type="text" value="${entity.name}"  name="name" style="width: 270px; height: 26px;"/>
						  </td>
						   <td></td>
						</tr>
						<tr>
							<td class="text_tr" >教练：&nbsp;&nbsp;</td>
							<td>
								<input id="venueUserFormId" name="userId" style="width: 270px; height: 26px;">  
							</td>
							<td></td>
						</tr>
						<tr>
						    <td class="text_tr">收费标准：&nbsp;&nbsp;</td>
						    <td>
						        <input class="form-control" type="text" name="feeScale" value="${entity.feeScale}" style="width: 270px; height: 26px" />
						    </td>
						     <td></td>
						</tr>
						<tr>
						    <td class="text_tr">描述：&nbsp;&nbsp;</td>
						    <td>
						        <input class="form-control" type="text" value="${entity.courseDescribe}" id="describe" name="describe" style="width: 270px; height: 26px" />
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
	$('#venueUserFormId').combobox({
		valueField : 'id',
		textField : 'name',
		url : '${dynamicURL}/admin/venue/user/search?search_EQ_type=1',
		onLoadSuccess:function(data){
			if("${entity.userId }"){
				$("#venueUserFormId").combobox('select', "${entity.userId }");
			}else{
				var data = $('#venueUserFormId').combobox('getData');
	            if (data.length > 0) {
	                $("#venueUserFormId").combobox('select', data[0].id);
	            }
			}
		}
	});
});
</script>