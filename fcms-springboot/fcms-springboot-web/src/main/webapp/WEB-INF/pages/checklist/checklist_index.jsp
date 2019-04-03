<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="padd15 easyui-layout" data-options="fit:true">
	<div class="easyui-layout layout-custom-resize" data-options="fit:true">
		<div data-options="region:'west',split:false,collapsible:false" style="width:400px;overflow:scroll;overflow-x:hidden"><!-- 禁止横向滚动 -->
			<div class="easyui-layout layout-custom-resize" data-options="fit:true">
				<div data-options="region:'north'">
			        <div class="card-button">
						<div class="layui-btn-container">
							<button id="add" onclick="add()" class="layui-btn layui-btn">增加</button>
							<button id="edit" onclick="edit()" class="layui-btn">修改</button>
							<button id="del" onclick="del()" class="layui-btn layui-btn">删除</button>
						</div>
					</div>
		        </div>
		        <div data-options="region:'center'">
		        	<div style="width: 100%; padding: 10px 15px;" class="easyui-layout layout" fit="true">
						<table id="checklistDatagrid" ></table>
					</div>
		        </div>
			</div>
		</div>
		<div data-options="region:'center'" border="false">
			<!-- 里面北边的 -->
			<div data-options="region:'north',split:true,collapsible:false" style="height: 100%;">
				<div class="easyui-layout layout-custom-resize" data-options="fit:true">
					<div data-options="region:'north'">
						<div class="card-button">
							<div class="layui-btn-container">
								<button id="add" onclick="addConfig()" class="layui-btn layui-btn">增加</button>
								<button id="edit" onclick="editConfig()" class="layui-btn">修改</button>
								<button id="del" onclick="delConfig()" class="layui-btn layui-btn">删除</button>
							</div>
						</div>
			        </div>
			        <div data-options="region:'center'">
			        	<table id="checklistConfigDatagrid"></table>
			        </div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var isLoad = false;
	var checklistDatagrid;
	var checklistConfigDatagrid;
	$(function () {
 /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
        checklistDatagrid = $('#checklistDatagrid').treegrid({
            url: '${dynamicURL}/admin/checklist/list?search_EQ_parentId=0&search_EQ_type=0&sort=sortNumber',
            queryForm: "#queryHeader form",//列筛选时附带加上搜索表单的条件
            fit:true,
            pagination : false,
			rownumbers : true,
			singleSelect : true,
			lines:true,
			idField : 'id',
			treeField: 'name',
            columns: [ [
                    {field: 'id', checkbox: true},
                    {field: 'name', title: '分类名称',width:300, sortable: true,align: 'left'}
                ]
            ],
	        onDblClickRow: function(index){
	        	edit();
	        },
	        onSelect:function(rowIndex, rowData){
				isLoad=true;
				checklistConfigDatagrid.datagrid("load", {'search_EQ_parentId' : rowIndex.id,'search_EQ_type':1});
            }

        });
 
        /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
        checklistConfigDatagrid = $('#checklistConfigDatagrid').datagrid({
            url: '${dynamicURL}/admin/checklist/list?sort=sortNumber',
            queryForm: "#queryHeader form",//列筛选时附带加上搜索表单的条件
            fit:true,
            pagination : true,
			rownumbers : true,
			singleSelect : true,
			lines:true,
			idField : 'id',
			treeField: 'name',
            columns: [ [
                    {field: 'id', checkbox: true},
                    {field: 'name', title: '检查标准',width:600, sortable: true,align: 'left'}
                ]
            ],
	        onDblClickRow: function(index){
	        	editConfig();
	        },
	        onBeforeLoad:function(){
				return isLoad;
			}

        });
	})
	
	/*添加*/
	function add() {
			parent._layer({
		        url: '${dynamicURL}/admin/checklist/add',
		        title: "新增检查项",
		        width:'600px',
		        height:'600px',
		        btn: ['保存', '取消']
		    },
		    {
		        yes: function(index, layero) {
		        	var bObj = layero.find("a.layui-layer-btn0");
		            var frm = parent.$("#layui-layer-iframe" + parent.ixs["新增检查项"]).contents().find("form.addForm");
					//frm.submit();
		            $.submit({
			            url: "${dynamicURL}/admin/checklist/save?type=0",
			            formTg:frm,
			            butObj : bObj,
			            success : function(res){
			            	if(res.success){
			            		$('#checklistDatagrid').treegrid('reload');
				            	layer.alert('保存成功！', {icon: 1});
				            	parent.layer.close(parent.parent.ixs["新增检查项"]);
			            	}else{
			            		layer.alert('操作失败', {icon: 0});
			            	}
			            },
		           	});
		        },
		        btn2: function(index, layero) {
		        	parent.layer.close(parent.parent.ixs["新增检查项"]);
		        }
		    }); 
	}
	
	/*修改*/
	function edit() {
		var row = checklistDatagrid.treegrid("getSelected");
		if(row){
			parent._layer({
		        url: '${dynamicURL}/admin/checklist/add?entityId='+row.id,
		        title: "修改检查单分类",
		        width:'600px',
		        height:'600px',
		        btn: ['保存', '取消']
		    },
		    {
		        yes: function(index, layero) {
		        	var bObj = layero.find("a.layui-layer-btn0");
		            var frm = parent.$("#layui-layer-iframe" + parent.ixs["修改检查单分类"]).contents().find("form.addForm");
		            $.submit({
			            url: "${dynamicURL}/admin/checklist/save",
			            formTg:frm,
			            butObj : bObj,
			            success : function(res){
			            	if(res.success){
				            	$('#checklistDatagrid').treegrid('reload');
				            	layer.alert('保存成功！', {icon: 1});
				            	parent.layer.close(parent.parent.ixs["修改检查单分类"]);
			            	}else{
			            		layer.alert('操作失败', {icon: 0});
			            	}
			            },
		           	});
		        },
		        btn2: function(index, layero) {
		        	parent.layer.close(parent.parent.ixs["修改检查单分类"]);
		        }
		    }); 
		}else{
			layer.alert('请选择要修改的记录！', {icon: 0});
		}
	}

	/*删除*/
	function del() {
	    var row = checklistDatagrid.treegrid("getSelected");
	    if (row) {
	        $.submit({
	            url: "${dynamicURL}/admin/checklist/delete",
	            data:{
	                "id": row.id
	            },
	            butObj : null,
	            success: function(res) {
	                if (res.success) {
	                	layer.alert('删除成功！', {icon: 1});
	                    $('#checklistDatagrid').treegrid("reload");
	                } else {
	                	layer.alert(res.msg, {icon: 0});
	                }
	            }
	          	});
	    } else {
	    	layer.alert('请选择要删除的记录！', {icon: 0});
	    }
	}
	
	
	/*添加*/
	function addConfig() {
		var row = checklistDatagrid.treegrid("getSelected");
		parent._layer({
	        url: '${dynamicURL}/admin/checklist/addConfig?parentId='+row.id,
	        title: "新增检查标准",
	        width:'600px',
	        height:'600px',
	        btn: ['保存', '取消']
	    },
	    {
	        yes: function(index, layero) {
	        	var bObj = layero.find("a.layui-layer-btn0");
	            var frm = parent.$("#layui-layer-iframe" + parent.ixs["新增检查标准"]).contents().find("form.addForm");
	            //frm.submit();
	            $.submit({
		            url: "${dynamicURL}/admin/checklist/save?type=1",
		            formTg:frm,
		            butObj : bObj,
		            success : function(res){
		            	if(res.success){
		            		$('#checklistConfigDatagrid').datagrid('reload');
			            	layer.alert('保存成功！', {icon: 1});
			            	parent.layer.close(parent.parent.ixs["新增检查标准"]);
		            	}else{
		            		layer.alert('操作失败', {icon: 0});
		            	}
		            },
	           	});
	        },
	        btn2: function(index, layero) {
	        	parent.layer.close(parent.parent.ixs["新增检查标准"]);
	        }
	    }); 
	}
	
	/*修改*/
	function editConfig() {
		var row = checklistDatagrid.treegrid("getSelected");
		var configRow = checklistConfigDatagrid.datagrid("getSelected");
		if(row && configRow){
			parent._layer({
		        url: '${dynamicURL}/admin/checklist/addConfig?entityId='+configRow.id+"&parentId="+row.id,
		        title: "修改检查标准",
		        width:'600px',
		        height:'600px',
		        btn: ['保存', '取消']
		    },
		    {
		        yes: function(index, layero) {
		        	var bObj = layero.find("a.layui-layer-btn0");
		            var frm = parent.$("#layui-layer-iframe" + parent.ixs["修改检查标准"]).contents().find("form.addForm");
		            $.submit({
			            url: "${dynamicURL}/admin/checklist/save",
			            formTg:frm,
			            butObj : bObj,
			            success : function(res){
			            	if(res.success){
				            	$('#checklistConfigDatagrid').datagrid('reload');
				            	layer.alert('保存成功！', {icon: 1});
				            	parent.layer.close(parent.parent.ixs["修改检查标准"]);
			            	}else{
			            		layer.alert('操作失败', {icon: 0});
			            	}
			            },
		           	});
		        },
		        btn2: function(index, layero) {
		        	parent.layer.close(parent.parent.ixs["修改检查标准"]);
		        }
		    }); 
		}else{
			layer.alert('请选择要修改的记录！', {icon: 0});
		}
	}

	/*删除*/
	function delConfig() {
	    var row = checklistConfigDatagrid.datagrid("getSelected");
	    if (row) {
	        $.submit({
	            url: "${dynamicURL}/admin/checklist/delete",
	            data:{
	                "id": row.id
	            },
	            butObj : null,
	            success: function(res) {
	                if (res.success) {
	                	layer.alert('删除成功！', {icon: 1});
	                    $('#checklistConfigDatagrid').datagrid("reload");
	                } else {
	                	layer.alert(res.msg, {icon: 0});
	                }
	            }
	          	});
	    } else {
	    	layer.alert('请选择要删除的记录！', {icon: 0});
	    }
	}
	
</script>

