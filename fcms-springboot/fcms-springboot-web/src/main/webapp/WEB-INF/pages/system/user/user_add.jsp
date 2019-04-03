<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div style="width:100%;height: 100%;" class="layer-cnt">
	<div style="margin-left: 50px;padding-top: 20px;" >
		<form class="addForm" method="post">
		   	<input type="hidden" name="id" value="${entity.id}"/>
		   	<input type="hidden" name="password" value="${entity.password}"/>
		        <table  class="table_edit" style="text-align: center;">
		          	<tbody>
		          	<tr>
		                <td class="text_tr">登录名：&nbsp;&nbsp;</td>
		                <td>
		                    <input class="form-control" type="text" name="loginName" id="loginName" value="${entity.loginName}"  style="width: 270px; height: 26px;" />
		                </td>
		                <td></td>
		            </tr>
		            <tr>
		                <td class="text_tr">公司名：&nbsp;&nbsp;</td>
		                <td>
		                    <select name="companyEntity.id" id="companyFormId" style="width: 270px; height: 26px;"></select>
		                </td>
		                 <td></td>
		            </tr>
		            <tr>
		                <td class="text_tr">部门名：&nbsp;&nbsp;</td>
		                <td>
		                    <select name="departmentEntity.id" id="departmentFormId" style="width: 270px ;height: 26px"></select>
		                </td>
		                 <td></td>
		            </tr>
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
		                    <select id="sex" name="sex" style="width: 270px; height: 26px;color: #666;background-color: #fefefe;border-color:rgba(102, 102, 102, 0.33);" >
		                        <option value="1">男</option>
		                        <option value="2">女</option>
		                    </select>
		                 <td></td>
		            </tr>
		            <tr>
		                <td class="text_tr">出生日期：&nbsp;&nbsp;</td>
		                <td>
		                    <input class="easyui-datebox" data-options="editable:true" name="birthday" value="${entity.birthday}" type="text" id="birthday"  style="width: 270px; height: 26px"data-options="editable:false" />
		                </td>
		                 <td></td>
		            </tr>
		            <tr>
		                <td class="text_tr">手机号码：&nbsp;&nbsp;</td>
		                <td>
		                    <input class="form-control" type="text" name="mobile" value="${entity.mobile}" style="width: 270px; height: 26px" />
		                </td>
		                 <td></td>
		            </tr>
		            <tr>
		                <td class="text_tr">单位电话：&nbsp;&nbsp;</td>
		                <td>
		                    <input class="form-control" type="text" id="telephone" name="telephone" value="${entity.telephone}" style="width: 270px; height: 26px" />
		                </td>
		                 <td></td>
		            </tr>
		            <tr>
		                <td class="text_tr">电子邮箱：&nbsp;&nbsp;</td>
		                <td>
		                    <input class="form-control" type="text" value="${entity.email}" id="email" name="email" style="width: 270px; height: 26px" />
		                </td>
		                 <td></td>
		            </tr>
		            <tr>
		                <td class="text_tr">家庭住址：&nbsp;&nbsp;</td>
		                <td>
		                    <input class="form-control" type="text" id="homeAddress" value="${entity.homeAddress}" name="homeAddress" style="width: 270px; height: 26px" />
		                </td>
		            </tr>
		            </tbody>
		      </table>
		 </form>
	 </div>
 </div>
<script>
$(function(){
   	// 公司树
   	$('#companyFormId').combotree({
	 	valueField:'id',
	 	nameField:'name',
         url: '${dynamicURL}/admin/system/company/combotree?search_EQ_parentId=0',
         onChange:function(newValue,oldValue){
         	$('#departmentFormId').combotree({
         		valueField:'id',
     		    nameField:'name',
                url: '${dynamicURL}/admin/system/department/treegrid?companyId='+newValue
          	});
         } ,
       	onLoadSuccess:function(){
			$("#companyFormId").next("span").find("input:eq(0)").attr("required",true);
		},
        });
   	 // 部门树
   	$('#departmentFormId').combotree({
   		valueField:'id',
	    nameField:'name',
        url: '${dynamicURL}/admin/system/department/treegrid?companyId=0',
       	onLoadSuccess:function(){
			$("#departmentFormId").next("span").find("input:eq(0)").attr("name","departmentId");
			$("#departmentFormId").combotree('tree').tree("collapseAll");  
       	}
    	}); 
   	  $("#companyFormId").combotree('setValue',"${entity.companyEntity.id}");
  	  $("#departmentFormId").combotree('setValue',"${entity.departmentEntity.id}");
});

$("#sex").val("${entity.sex}");
	
</script>
