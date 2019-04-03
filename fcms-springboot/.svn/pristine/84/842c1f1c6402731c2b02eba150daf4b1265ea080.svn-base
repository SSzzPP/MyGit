<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
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
<div class="layer-cnt" id="addRoleWindow" style="width:100%;height: 100%;" >
	<div style="margin-left: 50px;padding-top: 20px;" >
	<form id="addForm" class="addForm" method="post" >
		<input name="id" id="FormId" type="hidden" value="${roleEntity.id}"/>
             <table class="table_edit">
             	<tr>
             		<td style="width: 25%;" class="tr">名称：&nbsp;&nbsp;</td>
             		<td style="width: 40%;">
             		<input name="name" id="nameFormId" type="text" class="form-control" value="${roleEntity.name}" style="width: 230px; height: 30px;"/>
             		</td>
             		<td></td>
             	</tr>
                 <tr>
                     <td style="width: 25%;" class="tr">备注：&nbsp;&nbsp;</td>
                     <td style="width: 40%;" >
                         <input name="remark" id="remarkFormId" type="text" class="form-control" value="${roleEntity.remark}" style="width: 230px; height: 30px;"/>
                     </td>
                 </tr>
             </table>
	</form>
    </div>
</div>