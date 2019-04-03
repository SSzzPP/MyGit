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
		<form class="addForm" id="addForm"  method="post">
			<input type="hidden" name="id" value="${entity.id }" />
			<div title="公司基本信息" style="padding: 5px;">
				<table class="table_edit" style="text-align: center;">
					<tr style="margin-bottom: 10px;">
						<td class="text_tr" >上级公司：</td>
						<td><select name="parentId" id="companyFormId"
							style="width: 270px; height: 26px;" required></select>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >公司名称：</td>
						<td><input class="form-control" type="text" name="name" value="${entity.name }" id="companyName"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >序号   ：</td>
						<td><input class="form-control" type="text" value="${entity.sortNumber }"
							name="sortNumber" style="width: 270px; height: 26px" required/></td>
						<td></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</div>
<script>
    var companyId="${entity.id}";
    var companyFormId="${entity.parentId}";
	$(function() {  
		$('#companyFormId').combotree({
			valueField : 'id',
			nameField : 'name',
			url : '${dynamicURL}/admin/system/company/combotree?search_EQ_parentId=0',
			onLoadSuccess:function(){
				/* combobox */
				/*$(this).next("span").find("input:eq(0)").attr("required",true);*/
				/* combotree 只能使用选择器获得对象，不能使用$(this) */
				/*$("#companyFormId").next("span").find("input:eq(0)").attr("required",true);*/
			}
		});
		if(companyId){
     		$('#companyFormId').combotree("reload");
		} 
		$("#companyFormId").combotree("setValue",companyFormId||0);
	});
	
</script>