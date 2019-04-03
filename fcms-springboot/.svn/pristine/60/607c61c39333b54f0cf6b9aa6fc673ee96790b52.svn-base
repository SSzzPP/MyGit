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
		<form class="addForm" id="addForm"  method="post" action="" enctype ="multipart/form-data">
			<input type="hidden" name="id" value="${entity.id }" />
			<div title="场馆基本信息" style="padding: 5px;">
				<table class="table_edit" style="text-align: center;">
					<tr>
						<td class="text_tr" >标题：</td>
						<td><input class="form-control" type="text" name="title" value="${entity.title }"
							style="width: 270px; height: 26px" /><span></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >封面图：</td>
						<td>
							<input type="file" name="PageImg" style="width: 270px; height: 26px;">  
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="text_tr" >视频：</td>
						<td>
							<input type="file" name="vedio" style="width: 270px; height: 26px;">  
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
});
</script>