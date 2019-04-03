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
		<form class="addForm" id="addForm" action="${dynamicURL}/admin/system/student/save" method="post" enctype ="multipart/form-data">
			<input type="hidden" name="id" value="${entity.id }" />
			<div title="学生信息" style="padding: 5px;">
				<table class="table_edit" style="text-align: center;">
					<tbody>
						<tr>
						    <td class="text_tr">姓名：&nbsp;&nbsp;</td>
						    <td>
						        <input class="form-control" type="text" value="${entity.name}"  name="name" style="width: 270px; height: 26px;"/>
						  </td>
						  <td></td>
						</tr>
						<tr> 
						  <td class="text_tr">性别：&nbsp;&nbsp;</td>
						  <td>
						      <select class="easyui-combobox" id="sex" name="sex" style="width: 270px; height: 26px;color: #666;background-color: #fefefe;border-color:rgba(102, 102, 102, 0.33);" >
						            <option value="-1"></option>
						            <option value="0">男</option>
						            <option value="1">女</option>
						        </select>
						  </td>
						  <td></td>
						</tr>
						<tr>
						    <td class="text_tr">年龄：&nbsp;&nbsp;</td>
						    <td>
						        <input id="age" class="form-control" type="text" value="${entity.age}"  name="age" style="width: 270px; height: 26px;"/>
						  </td>
						  <td></td>
						</tr>
						<tr>
						    <td class="text_tr">手机号：&nbsp;&nbsp;</td>
						    <td>
						        <input id="tel" class="easyui-validatebox" data-options="validType:'minLength[11]'" type="text" value="${entity.tel}"  name="tel" style="width: 270px; height: 26px;"/>
						  </td>
						  <td></td>
						</tr>
						<tr>
						    <td class="text_tr">出生日期：&nbsp;&nbsp;</td>
						    <td>
						        <input class="easyui-datebox" name="birthday" value="${entity.birthday}" type="text" id="birthday"  style="width: 270px; height: 26px"/>
						    </td>
						    <td></td>
						</tr>
						<tr>
						    <td class="text_tr">地址：&nbsp;&nbsp;</td>
						    <td>
						        <input id="address" class="form-control" type="text" value="${entity.address}"  name="address" style="width: 270px; height: 26px;"/>
						  </td>
						  <td></td>
						</tr>
						<tr> 
						  <td class="text_tr">职位：&nbsp;&nbsp;</td>
						  <td>
						      <input class="easyui-combobox" id="studentType" name="studentType" style="width: 270px; height: 26px;color: #666;background-color: #fefefe;border-color:rgba(102, 102, 102, 0.33);" >
						  </td>
						  <td></td>
						</tr>
						<tr> 
						  <td class="text_tr">年级：&nbsp;&nbsp;</td>
						  <td>
						      <input class="easyui-combobox" id="gradeId" name="gradeId" style="width: 270px; height: 26px;color: #666;background-color: #fefefe;border-color:rgba(102, 102, 102, 0.33);" >
						  </td>
						  <td></td>
						</tr>
						<tr> 
						  <td class="text_tr">班级：&nbsp;&nbsp;</td>
						  <td>
						      <input class="easyui-combobox" id="classId" name="classId" style="width: 270px; height: 26px;color: #666;background-color: #fefefe;border-color:rgba(102, 102, 102, 0.33);" >
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
var studentType = "${entity.studentType}";
var sex = "${entity.sex}";
$(function() {  
	if(sex){
		$("#sex").combobox('setValue',sex);
	}

	$('#studentType').combobox({
		valueField : 'id',
		textField : 'name',
		multiple: false, 
		url : '${dynamicURL}/admin/system/dict/combobox?type=student_type',
		onLoadSuccess:function(data){
			if(studentType){
				$("#studentType").combobox('setValue',studentType);
			}
		}
	});
});

var gradeId = "${entity.gradeId}";
$(function() {  
	$('#gradeId').combobox({
		valueField : 'id',
		textField : 'name',
		multiple: false, 
		url : '${dynamicURL}/admin/system/grade/search',
		onLoadSuccess:function(data){
			if(gradeId){
				$("#gradeId").combobox('setValue',gradeId);
			}
		},
		onSelect: function(rec){    
			//console.log(rec);
            $('#classId').combobox('reload', '${dynamicURL}/admin/system/class/search?search_EQ_gradeId=' + rec.id);    
        }
	});
}); 

var classId = "${entity.classId}";
$(function() { 
	$('#classId').combobox({
		valueField : 'id',
		textField : 'name',
		multiple: false, 
		url : '${dynamicURL}/admin/system/class/search',
		onLoadSuccess:function(data){
			if(classId){
				$("#classId").combobox('setValue',classId);
			}
		}
	});
}); 

$.extend($.fn.validatebox.defaults.rules, {    
    minLength: {    
        validator: function(value, param){    
            return value.length >= param[0];    
        },    
        message: '请输入11位数字'
    }    
});  
</script>

