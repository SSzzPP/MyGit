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
<div style="width:100%;height: 100%;" class="layer-cnt">
	<div style="margin-left: 50px;padding-top: 20px;">
		<form class="addForm" id="addForm" action="${dynamicURL}/admin/system/grade/save" method="post" enctype ="multipart/form-data">
			<input type="hidden" name="id" value="${entity.id }" />
			<div title="年级信息" style="padding: 5px;">
				<table class="table_edit" style="text-align: center;">
					<tbody>
						<tr>
						    <td class="text_tr">年级名称：&nbsp;&nbsp;</td>
						    <td>
						        <input class="form-control" type="text" value="${entity.name}"  name="name" style="width: 270px; height: 26px;"/>
						  </td>
						  <td></td>
						</tr>
		            </tbody>
				</table>
			</div>
		</form>
	</div>
</div>
<div style="width:100%;height: 100%;" class="layer-cnt">
	<div style="margin-left: 50px;padding-top: 20px;">
		<form class="addForm" id="addForm" action="${dynamicURL}/admin/system/class/save" method="post" enctype ="multipart/form-data">
			<input type="hidden" name="id" value="${entity.id }" />
			<div title="年级信息" style="padding: 5px;">
				<table class="table_edit" style="text-align: center;">
					<tbody>
						<tr>
						    <td class="text_tr">年级名称：&nbsp;&nbsp;</td>
						    <td>
						        <input class="form-control" type="text" value="${entity.name}"  name="name" style="width: 270px; height: 26px;"/>
						  </td>
						  <td></td>
						</tr>
		            </tbody>
				</table>
			</div>
		</form>
	</div>
</div>