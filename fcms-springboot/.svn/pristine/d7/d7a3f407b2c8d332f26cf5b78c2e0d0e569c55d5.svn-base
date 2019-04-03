<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- <div id="container" class="easyui-layout layout" fit="true"> -->
<style>
	.table_edit .errorMsg{
		width:150px;
	}
	.table_edit input,select{
		width: 270px !important; height: 26px !important;
	}
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
 <div style=" width: 100%;height: 100%;"  class="layer-cnt">
	<div style="margin-left: 50px;padding-top: 20px;" >
	<form class="addForm " action="" method="post">
    	<input type="hidden" name="id" value="${departmentEntity.id }"/>
    	<input type="hidden" name="companyEntity.id" value="${entity.id }">
    	<table class="table_edit" style="text-align: center;">
	        <tr>
	            <td>上级公司：</td>
	            <td>
	            	<input class="form-control"  type="text"  id="companyEntityName" value="${entity.name}" style="width: 270px; height: 30px" disabled="disabled" />
	            </td>
	        </tr>
	        <tr>
	            <td >上属部门：</td>
	            <td>
	            	<select class="form-control" name="parentId" id="departmentParentId" style="width: 270px; height: 30px" ></select>
	            </td>
	            <td class="errorMsg"></td>
	        </tr>
	        <tr>
	            <td>部门名称：</td>
	            <td>
	            	<input  class="form-control" type="text" name="name" id="nameFormId" value="${departmentEntity.name }" style="width: 270px; height: 30px" data-options="required:true" >
	            </td>
	            <td class="errorMsg"></td>
	        </tr>
	        <tr>
	            <td>序号：</td>
	            <td>
	            	<input class="form-control" type="text" name="sortNumber" value="${departmentEntity.sortNumber}" style="width: 270px; height: 30px" data-options="required:true" />
	            </td>
	            <td class="errorMsg"></td>
	        </tr>
	    </table>
    </form>
    </div>
</div>
<script>
var companyId="${entity.id}";
var departmentParentId="${departmentEntity.parentId}";
console.log(departmentParentId)
$(function(){
/* 	$("#companyEntityName").textbox('setValue',"${entity.name}"); */
	$('#departmentParentId').combotree({
	    panelWidth: 250,
	    lines : true,
	    panelHeight : 400,
	    //下面这两个字段需要视情况修改
	    idField: 'id',
	    nameField: 'name',
	});
	if(companyId){
			$.post('${dynamicURL}/admin/system/department/combotree?search_EQ_parentId=0',{'search_EQ_companyEntity.id':companyId},function(data){
			$('#departmentParentId').combotree("clear");
			$('#departmentParentId').combotree('loadData',data);
			 if(departmentParentId){
				$("#departmentParentId").combotree("setValue",departmentParentId);
			}else{
				$("#departmentParentId").combotree("setValue",0);
			}
		},'json');
	}
	$("#departmentParentId").combotree("setValue",departmentParentId||0);
});       
</script>