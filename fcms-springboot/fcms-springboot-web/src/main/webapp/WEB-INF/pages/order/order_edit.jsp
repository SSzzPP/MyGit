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
			<%-- <input type="hidden" name="status" value="1" />
			<input type="hidden" name="editStatus" value="1" />
			<input type="hidden" name="venueId" value="${entity.venueId }" />
			<input type="hidden" name="equipmentId" value="${entity.equipmentId }" />
			<input type="hidden" name="uuid" value="${entity.uuid }" />
			<input type="hidden" name="complaintId" value="${entity.complaintId }" />
			<input type="hidden" name="cancleStatus" value="${entity.cancleStatus }" />
			<input type="hidden" name="vealuateStatus" value="${entity.vealuateStatus }" /> --%>
			<div title="改签信息" style="padding: 5px;">
				<table class="table_edit" style="text-align: center;">
					<tr>
						<td class="text_tr" >姓名：</td>
						<td><input class="form-control" type="text" name="name" value="${entity.name }" 
							style="width: 270px; height: 26px" readonly="readonly"/><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >联系方式：</td>
						<td><input class="form-control" type="text" name="mobile" value="${entity.mobile }" 
							style="width: 270px; height: 26px" readonly="readonly"/><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >设施：</td>
						<td><input class="form-control" type="text" name="equipmentName" value="${entity.equipmentName }" 
							style="width: 270px; height: 26px" readonly="readonly"/>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >预定数量：</td>
						<td><input class="form-control" type="text" name="count" value="${entity.count }" 
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >开始时间：</td>
						<td>
							<input class="easyui-datetimebox" type="text" name="orderTime" id="orderEndTime" style="width: 270px; height: 26px;" value="${entity.orderTime}" data-options="editable:false , showSeconds:false , onShowPanel:function(){if($(this).val()==null){$(this).datetimebox('spinner').timespinner('setValue','09:30');}}" >
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >结束时间：</td>
						<td>
							<input class="easyui-datetimebox" type="text" name="orderEndTime" id="orderEndTime" style="width: 270px; height: 26px;" value="${entity.orderEndTime}" data-options="editable:false , showSeconds:false , onShowPanel:function(){if($(this).val()==null){$(this).datetimebox('spinner').timespinner('setValue','09:30');}}" >
						</td>
						<td></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</div>
<script>
	
</script>