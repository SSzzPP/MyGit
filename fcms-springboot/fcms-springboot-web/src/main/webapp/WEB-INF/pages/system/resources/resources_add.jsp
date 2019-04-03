<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		<form class="addForm" action="${dynamicURL}/system/resource/save" method="post">
			<input type="hidden" name="id"  value="${entity.id}"/>
			<div>
				<table class="table_edit">
	                 <tr>
	                     <td class="text_tr" style="">名称：</td>
	                     <td style="text-align: left;">
	                         <input class="form-control" type="text" name="name" value="${entity.name}"  style="width: 270px; height: 26px;"/>
	                     </td>
	                     <td></td>
	                 </tr>
	                 <tr>
	                     <td class="text_tr" style="">编码：</td>
	                     <td style="text-align: left;">
	                         <input class="form-control" type="text" name="code" value="${entity.code}" style="width: 270px; height: 26px;"/></td>
	                 	 <td></td>
	                 </tr>
	                 <tr>
	                     <td class="text_tr" style="">类型：</td>
	                     <td style="text-align: left;">
	                         <select  name="type" id="type" value="${entity.type}" style="width: 270px; height: 26px;color: #666;background-color: #fefefe;border-color:rgba(102, 102, 102, 0.33);">
			                      <option value="0">菜单</option>
			                      <option value="1">功能</option>
	             			</select></td>
	             		 <td></td>
	                 </tr>
	                 <tr>
	                     <td class="text_tr" style="">父节点：</td>
	                     <td style="text-align: left;">
	                         <input class="form-control input-sm input-transparent" type="text" id="resourceInfoFormId"  name="parentId"  style="width: 270px; height: 26px" /></td>
	                 	 <td></td>
	                 </tr>
	                 <tr>
	                     <td class="text_tr" style="">顺序号：</td>
	                     <td style="text-align: left;">
	                         <input class="form-control input-sm input-transparent" type="text" name="sortNumber" value="${entity.sortNumber}" style="width: 270px; height: 26px"/></td>
	                 	 <td></td>
	                 </tr>
	                 <tr>
	                     <td class="text_tr" style="">URL：</td>
	                     <td style="text-align: left;"> 
	                         <input class="form-control input-sm input-transparent" type="text" name="url" value="${entity.url}" style="width: 270px; height: 26px;"/></td>
	                     <td></td>
	                 </tr>
	                 <tr>
	                     <td class="text_tr" style="">图标：</td>
	                     <td style="text-align: left;">
	                         <input class="form-control input-sm input-transparent" type="text" name="icon" id="iconId" value="${entity.icon}" style="width: 270px; height: 26px ; color: black;"  /></td> 
	                     <td></td>
	                 </tr>
	                 <tr>
	                     <td class="text_tr" style="">描述：</td>
	                     <td style="text-align: left;">
	                         <input class="form-control input-sm input-transparent" type="text" name="description" value="${entity.description}" style="width: 270px; height: 26px;" /></td>
	                 	 <td></td>
	                 </tr>
	             </table>
	        </div>
		</form>
	</div>
</div>
<script type="text/javascript" src="${staticURL}/js/top-icons.js"></script>
<script>
$(function(){
	/* 加载图标  */
	$('#iconId').combobox({
		data : (function() {
			var data = [];
			$.each(top.icons, function(i) {
				data.push({
					value : this,
					text : this
				})
			});
			return data;
		})(),
		editable:false,
		formatter : function(row) {
			return '<i class="'+row.value+'"></i>'+row.value;
		}
	}).combo('panel').addClass("icons-combo");
	/* 树形选择 */
	$('#resourceInfoFormId').combotree({
	 	valueField:'id',
	 	nameField:'name',
        url: '${dynamicURL}/admin/system/resources/combotree?search_EQ_parentId=0&search_EQ_flag=0',
        onLoadSuccess:function(){
			/* combobox */
			/*$(this).next("span").find("input:eq(0)").attr("required",true);*/
			/* combotree 只能使用选择器获得对象，不能使用$(this) */
			/*$("#companyFormId").next("span").find("input:eq(0)").attr("required",true);*/
            $("#resourceInfoFormId").combotree("setValue","${entity.parentId}"||0);
		}
     });	
});
</script>