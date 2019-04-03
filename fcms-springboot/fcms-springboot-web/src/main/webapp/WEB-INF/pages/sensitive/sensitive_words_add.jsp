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
		<form class="addForm" id="addForm"  method="post" action="">
			<input type="hidden" name="id" value="${entity.id }" />
			<div title="场馆基本信息" style="padding: 5px;">
				<table class="table_edit" style="text-align: center;">
					<tr>
						<td class="text_tr" >不良词汇：</td>
						<td><input class="form-control" type="text" name="content" value="${entity.content }"
							style="width: 270px; height: 26px" /><span></span>
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