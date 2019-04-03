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
		<form class="addForm" id="addForm" action="${dynamicURL}/admin/venue/user/saveInfo" method="post" enctype ="multipart/form-data">
			<input type="hidden" name="id" value="${entity.id }" />
			<input type="hidden" name="venueUserId" value="${entity.venueUserId }" />
			<div title="场馆人员信息" style="padding: 5px;">
				<table class="table_edit" style="text-align: center;">
					<tbody>
						<tr>
						    <td class="text_tr">姓名：&nbsp;&nbsp;</td>
						    <td>
						        <input class="form-control" type="text" readonly="readonly" value="${entity.venueUserName}"  style="width: 270px; height: 26px;"/>
							</td>
							<td></td>
						</tr>
						<tr>
						    <td class="text_tr">履历内容：&nbsp;&nbsp;</td>
						    <td>
						        <textarea class="form-control" type="text"  name="content" id="content" rows="7" style="width: 270px; " maxlength="1000" placeholder="字数在1000字以内">${entity.content}</textarea>
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
</script>