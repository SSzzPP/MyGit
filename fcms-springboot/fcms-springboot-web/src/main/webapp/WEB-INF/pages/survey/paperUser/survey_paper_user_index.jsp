<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div class="easyui-layout layout-custom-resize" data-options="fit:true">
	<div data-options="region:'west',split:false,collapsible:false" style="width: 250px;overflow: scroll;">
        <div class="BtnLine btnBox tl" style="border-top:solid 1px #ddd;width:100%;">
			用户名称：<input class="easyui-textbox" type="text" id="userName"
									name="search_LIKE_userEntity.name" style="width: 150px; height: 26px">
        </div>
       <div class="BtnLine" style="border: 0px; margin: 0px; padding: 0px;text-align:left">
			<button type="button" class="easyui-linkbutton queryBtn" iconcls="icon-search" id="btn-searchUser">搜索</button>
		</div>
		<table id="userTreegrid"></table>
	</div>
	<div data-options="region:'center',split:false,collapsible:false" style="width: 400px;">
		<div class="easyui-layout layout" fit="true">
		    <div id="container" class="easyui-layout layout" fit="true">
		        <div region="north" border="false">
		            <div id="queryHeader" style="padding: 10px; width: 100%; line-height: 40px;" class="easyui-panel">
			        	<form class="form-horizontal" for="paperDatagrid">
			        		<table style="width: 800px; line-height: 40px;">
			                 <tr>
			                     <td>问卷名:</td>
			                     <td>
			                         <input class="easyui-textbox"  type="text" id="paperTitle" name="search_LIKE_surveyPaperEntity.title" style="width: 150px; height: 26px">
			                     </td>
			                     <td>
			                         <div class="BtnLine" style="border: 0px; margin: 0px; padding: 0px;text-align:left">
			                             <!-- <button type="button" class="easyui-linkbutton queryBtn" iconcls="icon-search" >搜索</button>
			                             <button type="button" class="easyui-linkbutton clearBtn" iconcls="icon-reload" >重置</button> -->
			                             <button type="button" class="layui-btn layui-btn" iconcls="icon-search" icon-class="search">搜索</button>
										<button type="button" class="layui-btn layui-btn" iconcls="icon-reload" icon-class="refresh">重置</button>
			                         </div>
			                     </td>
			                 </tr>
			             </table>
			        	</form>
			        </div>
					<div class="BtnLine btnBox tl" style="border-top:solid 1px #ddd;width:100%;">
			         <button class="easyui-linkbutton l-btn l-btn-small" id="edit" onclick="showQuestions()" type="button" iconcls="icon-edit" >查看问卷答案</button>
			        </div>
		        </div>
		        <div region="center" border="false">
		            <div style="padding: 5px; width: 100%; /**height: 505px;**/" class="easyui-layout layout" fit="true">
		                <table id="paperDatagrid"></table>
		            </div>
		        </div>
		    </div>
		</div>	
	</div>
</div>
<script type="text/javascript">
	var userTreegrid;
	var paperDatagrid;
	var userId=-1;
	var isLoad=false;//是否延迟加载
	$(function () {
 		/*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
		userTreegrid = $('#userTreegrid').treegrid({
	   		url: '${dynamicURL}/admin/survey/paperUser/userAllList',
			pagination: false,
// 			rownumbers : true,
			fit:false,
			fitColumns:true,
			treeField: 'name',
			idField: 'id',
			columns: [
			    [
// 			        {field: 'id', checkbox: true},
			        {field: 'name', title: '用户名称',width:200, sortable: true,align:'left'}
			    ]
			],
			onBeforeLoad:function(){
				return true;
			},
            onSelect:function(rowIndex, rowData){
            	userId=rowIndex.id;
            	isLoad=true;
				paperDatagrid.datagrid("load", "${dynamicURL}/admin/survey/paperUser/paperList?search_EQ_userEntity.id="+rowIndex.id);
            }
		});
		 paperDatagrid = $('#paperDatagrid').datagrid({
            url: '${dynamicURL}/admin/survey/paperUser/paperList',
            pagination: true,
            rownumbers : true,//行数  
            singleSelect:true, 
            fit:true,
            queryForm: "#queryHeader form",//列筛选时附带加上搜索表单的条件
            idField: 'id',
            columns: [[
                 {field: 'id', checkbox: true},
                 {field: 'status', title: '状态',width:50, sortable: true,formatter:function(value,rec){
 					if(rec.status==0) return "<span style='color:red'>未完成</span>"; else return "<span style='color:green'>已完成</span>";
 				}},
 				{field: 'surveyPaperEntity.title', title: '标题',width:200, sortable: true,formatter:function(value,rec){
 					return rec.surveyPaperEntity.title;
 				}},
 				{field: 'surveyPaperEntity.createUserName', title: '创建人',width:100, sortable: true,formatter:function(value,rec){
 					return rec.surveyPaperEntity.createUserName;
 				}},
 				{field: 'surveyPaperEntity.status', title: '发布状态',width:100, sortable: true,formatter:function(value,rec){
 					if(rec.surveyPaperEntity.status==0) return "<span style='color:red'>草稿</span>"; else return "<span style='color:green'>已发布</span>";
 				}},
 				{field: 'surveyPaperEntity.startDate', title: '发布时间',width:200, sortable: true,formatter:function(value,rec){
 					return rec.surveyPaperEntity.startDate;
 				}},
 				{field: 'surveyPaperEntity.endDate', title: '结束时间',width:200, sortable: true,formatter:function(value,rec){
 					return rec.surveyPaperEntity.endDate;
 				}},
            ]],
            onDblClickRow: function(index){
            },onBeforeLoad:function(){
				return isLoad;
			},
        }); 
		$("form[for] button.queryBtn").on("click.datagrid-query", function () {
			paperDatagrid.datagrid("load", {'search_LIKE_surveyPaperEntity.title' : $("#paperTitle").val()});
		});
		$("form[for] button.clearBtn").on("click.datagrid-query", function () {
			top._clearSearch($(this).parents("form")); 
        });
		$('#btn-searchUser').on('click',function(){
			userTreegrid.treegrid("load",{'search_LIKE_userEntity.name' : $('#userName').val()})
		})
	})
	function showQuestions(){
		var row = paperDatagrid.treegrid("getSelected");
		if(row){
			if(row.status==0){
				layer.alert('用户未完成，不得查看！', "info");
				return false;
			}
			window.parent.openT('问卷信息', '${dynamicURL}/admin/survey/record/toRecord?userId='+userId+'&paperId='+row.surveyPaperEntity.id,'0','300','300');
		}else{
			layer.alert('请选择一行记录进行操作', "info");
		}
	}
</script>

