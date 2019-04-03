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
</style>

<div style="width:100%;height: 100%;" class="layer-cnt">
	<div style="margin-left: 50px;padding-top: 20px;" >
		<form class="addForm" id="addForm" action="${dynamicURL}/admin/match/main/save"  method="post" enctype ="multipart/form-data">
			<input type="hidden" name="id" value="${matchEntity.id }" />
			<div title="新增赛事" style="padding: 5px;">
				<table class="table_edit" style="text-align: center;">
					<tr>
						<td class="text_tr" >赛事标题：</td>
						<td><input class="form-control" type="text" name="title" value="${matchEntity.title}"style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >报名截止时间：</td>
						<td>
							<input class="easyui-datetimebox" data-options="editable:true" name="endTime" value="${matchEntity.endTime}" type="text" id="endTime"  style="width: 270px; height: 26px"data-options="editable:false" />
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr">开始时间：&nbsp;&nbsp;</td>
						<td>
						   <input class="easyui-datetimebox" data-options="editable:true" name="startTime" value="${matchEntity.startTime}" type="text" id="startTime"  style="width: 270px; height: 26px"data-options="editable:false" />
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr">结束时间：&nbsp;&nbsp;</td>
						<td>
						   <input class="easyui-datetimebox" data-options="editable:true" name="matchEnd" value="${matchEntity.matchEnd}" type="text" id="startTime"  style="width: 270px; height: 26px"data-options="editable:false" />
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >咨询电话：</td>
						<td><input class="form-control" type="text" name="tel" value="${matchEntity.tel}"style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >举行地点：</td>
						<td><input class="form-control" type="text" name="location" value="${matchEntity.location}"style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >说明：</td>
						<td> 
							<textarea class="form-control" type="text" name="instructions" style="width: 270px; height: 52px;">${matchEntity.instructions}</textarea><span></span>
						</td>
						<td></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</div>