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
		<form class="addForm" action="${dynamicURL}/admin/checklist/save?type=0" method="post">
	    	<input type="hidden" name="id"/>
	    	
	    	<table class="table_edit">
		        <tr>
		            <td class="text_tr" style="width: 30%;">上级节点：</td>
		            <td>
		            	<select name="parentId" id="checklistFormId" style="width: 270px; height: 26px;" data-options="required:true"></select>
		            </td>
		        </tr>
		        <tr>
		            <td class="text_tr">名称：</td>
		            <td>
		            	<input class="easyui-textbox" type="text"  name="name" style="width: 270px; height: 26px" data-options="required:true" />
		            </td>
		        </tr>
		    </table>
		    <div class="BtnLine">
		        <button type="button" class="easyui-linkbutton submit">保存</button>
		        <button type="button" class="easyui-linkbutton" onclick="$('#addWindow').dialog('close');return false;">取消</button>
		    </div>
	    </form>
	</div>
</div>
<script>
	var entityJson=JSON.parse('${empty entity?"{}":entity}');
	$(function() {  
		$('#checklistFormId').combotree({
			panelWidth : 250,
			lines : true,
			panelHeight : 400,
			//下面这两个字段需要视情况修改
			idField : 'id',
			nameField : 'name',
			url : '${dynamicURL}/admin/checklist/combotree?search_EQ_parentId=0',
			onLoadSuccess:function(node, data){
				$("#checklistFormId").combotree("setValue","0");
				if(entityJson.parentId){
					$("#checklistFormId").combotree("setValue",entityJson.parentId);
				}
			}
		});
		
		function loadData(){
		 	var form = $("form.addForm");
            form.form("clear");
            form.form("load", entityJson);
		}
		
		if(entityJson){
			loadData();
		}
	});
</script>