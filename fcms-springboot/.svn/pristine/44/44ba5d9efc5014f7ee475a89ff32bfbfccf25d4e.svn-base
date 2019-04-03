<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="security" uri="/tld/security.tld" %>

<div class="easyui-layout layout-custom-resize" data-options="fit:true">
	<!-- 左侧公司树 -->
	<div data-options="region:'west',split:false,collapsible:false" style="width: 250px;overflow: scroll;">
		<!-- <div class="BtnLine btnBox tl" style="border-top:solid 1px #ddd;width:100%;">
         	<button class="easyui-linkbutton l-btn l-btn-small" id="refreshCompany" onclick="refreshCompany()" type="button" iconcls="icon-reload" >刷新</button>
        </div> -->
        <div class="BtnLine btnBox tl" style="border-top:solid 1px #ddd;width:100%;">
			类型：<select id="dictComboTree" style="width: 180px; height: 26px" data-options="required:true" ></select>
        </div>
		<table id="companyTreegrid"></table>
	</div>
	
	
	<div data-options="region:'center',split:false,collapsible:false" style="width: 400px;">
				<div region="north" border="false">
					<div class="BtnLine btnBox tl" style="border-top:solid 1px #ddd;width:100%;">
		             	<button class="easyui-linkbutton l-btn l-btn-small" id="add" onclick="editPermission()" type="button" iconcls="icon-save" group="">保存</button>
		            </div>
		        </div>
		<table id="companyTreegrid2"></table>
	</div>
</div> 
 
<script type="text/javascript">
	var dictComboTree;// 数据类型 
	var companyTreegrid;// 左侧公司树
	var companyTreegrid2;// 右侧公司树
	var isLoad=false;//是否延迟加载
	$(function () {
		
		dictComboTree = $('#dictComboTree').combotree({
		 	valueField:'id',
		    nameField:'name',
            url: '${dynamicURL}/admin/system/dict/combobox?type=CATEGORY_TYPE',
            onChange:function(newId,oldId) {
            //	refreshCompany();
            	/* isLoad = true;
            	companyTreegrid.treegrid("load", {'parentId' : 0}); */
            	companyTreegrid.datagrid("clearSelections");
            	companyTreegrid2.datagrid("clearSelections");
            },
            onLoadSuccess: function (node, data) {
            	$.each(data,function(i,d){
            		if(i == 0)
                		dictComboTree.combotree('setValue',d.id);
				});
            }
        });
		
 	/*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
        companyTreegrid = $('#companyTreegrid').treegrid({
            url: '${dynamicURL}/admin/system/company/list?search_EQ_parentId=0',
            queryForm: "#queryHeader form",//列筛选时附带加上搜索表单的条件
            fit:false,
            pagination : false,
// 			rownumbers : true,
			singleSelect : true,
			lines:true,
			idField : 'id',
			treeField: 'name',
            columns: [ [
// 					{field : 'id',checkbox:true}, 
                    {field: 'name', title: '名称',width:200, sortable: true,align:'left'},
                ]
            ],
            onSelect:function(rowIndex, rowData){
				isLoad=true;
				companyTreegrid2.treegrid("reload");
            }
        });
 	
        companyTreegrid2 = $('#companyTreegrid2').treegrid({
        	url: '${dynamicURL}/admin/system/company/list?search_EQ_parentId=0',
            pagination: false,
            queryForm: "#queryHeader form",//列筛选时附带加上搜索表单的条件
            fit:true,
            fitColumns:true,
            treeField: 'name',
            idField: 'id',
            singleSelect : false,
            lines:true,
            columns: [
                [
                    {field: 'id',checkbox : true},
                    {field: 'name', title: '名称',width:500, sortable: true,align:'left'}/* ,
                    {field: 'description', width:500,title: '描述', sortable: true} */
                ]
            ],
            onCheck:function(node){
            	//cascadeCheck(node);
            	//cascadeUnCheck(node);
            },
            onLoadSuccess: function(node, data){
 				//$(this).treegrid('collapseAll');
				checkResourceTree();
            },
            onBeforeCollapse:function(){
            	//return false;
            },
            onBeforeLoad:function(){
            	return isLoad;
            }
        });
 	
        /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
	    
	})
	 
    $("#addWindow .BtnLine .submit").on("click",
   		_.debounce(function() {
     		$("#addWindow form.addForm").submit();
    	},waitTime,true)
    );
    
    //刷新公司
    function refreshCompany(){
    	companyTreegrid.treegrid("reload");
    }
    
  //勾选资源树
	function checkResourceTree(){
		var row=companyTreegrid.treegrid("getSelected");
		var typeId = dictComboTree.combotree("getValue");
		if(row){
			companyTreegrid2.treegrid("unselectAll");
			$.ajax({
				url:"${dynamicURL}/admin/system/company/permission/tree",
				type:"POST",
				dataType:"json",
				data:{"companyId":row.id,"typeId":typeId},
				success:function(msg){
					$.each(msg,function(i,d){
						companyTreegrid2.treegrid('select',d);
					});
				}
			});
		}
	}
  
	//保存资源
	function editPermission(){
		var rows=companyTreegrid2.treegrid("getSelections");
		var params={};
		var companyIds;
		if(rows.length){
			companyIds=[];
			$.each(rows,function(i,d){
				companyIds.push(d.id);
			});
		}
		var typeId = dictComboTree.combotree("getValue");
		params["companyIdsRight"]=companyIds;
		var selRow=companyTreegrid.treegrid("getSelected");
		params["companyIdLeft"] = selRow.id ;
		params["typeId"] = typeId;
		$.ajax({
			url:"${dynamicURL}/admin/system/company/permission/editPermission",
			type:"POST",
			dataType:"JSON",
			data:$.param(params,true),
		 	beforeSend : function(XMLHttpRequest){
				progress();
			},
			success:function(msg){
				$.messager.progress('close');
				if(msg.success){
					$.messager.alert('提示', '保存成功！', 'info');
					resourceTreegrid.treegrid("reload");
				}else{
					$.messager.alert('提示', '保存失败！', 'error');
				}
			},
			error:function(){
				$.messager.progress('close');
			}
		});
	}
	
	function progress(){
	    var win = $.messager.progress({
	        title:'保存',
	        msg:'处理中...'
	    });
	}
	
	
</script>

