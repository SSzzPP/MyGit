<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.table_edit input{
		width: 270px !important; height: 26px !important;
	}
.table_edit tr{
 		height: 40px;
 	}
 	.table_edit tr td{
 		padding-left:15px;
 	}
</style>

<div style="width:100%;height: 100%;" class="layer-cnt">
	<div style="margin-left: 50px;padding-top: 20px;" >
		<form class="addForm" method="post">
			<table  class="table_edit" style="text-align: center;">
		          	<tr>
		                <td class="text_tr">当前密码：&nbsp;&nbsp;</td>
		                <td>
		                    <input class="form-control" type="password" name="oldPassword" id="oldPassword" style="width: 270px; height: 26px;" />
		                </td>
		                <td></td>
		            </tr>
		            <tr>
		                <td class="text_tr">新设密码：&nbsp;&nbsp;</td>
		                <td>
		                    <input class="form-control" type="password" name="newPassword" id="newPassword" style="width: 270px; height: 26px;" />
		                </td>
		                <td></td>
		            </tr>
		            <tr>
		                <td class="text_tr">确认密码：&nbsp;&nbsp;</td>
		                <td>
		                    <input class="form-control" type="password" name="confirmPassword" id="confirmPassword" style="width: 270px; height: 26px;" />
		                </td>
		                <td></td>
		            </tr>
		      </table>
		 </form>
	 </div>
 </div>
<script>
	/* var newPassword; 
	$("#confirmPassword").blur(function(){
		newPassword = $("#newPassword").val();
		var confirmPassword = $('#confirmPassword').val();
		if(newPassword != confirmPassword) {
			alert("确认密码与新设密码不一致！");
		}
	});

	$("#button").click(function(){
		var oldPassword = $("#oldPassword").val();
		$.submit({
			url:'${dynamicURL}/admin/system/user/saveNewPassword',
			data:{newPassword:newPassword,
				oldPassword:oldPassword
			},
			success:function(data){
				if(data.success){
					alert(data.msg);
				}else{
					alert(data.msg);
				}
			}
		})
	}) */

</script>