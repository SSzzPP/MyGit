<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="padd15 easyui-layout" data-options="fit:true">
	<div class="easyui-layout layout-custom-resize" data-options="fit:true">
		<div data-options="region:'north',split:false,collapsible:false">
			<div class="card-button">
				<div class="layui-btn-container">
					<button id="add" onclick="add()" class="layui-btn layui-btn">增加</button>
					<button id="edit" onclick="edit()" class="layui-btn">修改</button>
					<button id="del" onclick="del()" class="layui-btn layui-btn">删除</button>
				</div>
			</div>
		</div>
		<div data-options="region:'west'" border="false"  style="width: 20%;">
			<div style="width: 30%; padding: 10px 15px;"
				 class="easyui-layout layout" fit="true">
				<table id="companyDatagrid"></table>
			</div>
		</div>
		<div data-options="region:'center'" border="false"  style="width: 80%;">
			<div style="width: 70%; padding: 10px 15px;"
				 class="easyui-layout layout" fit="true">
				<table id="departmentTreegrid"></table>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var companyTreegrid;
	var departmentTreegrid;
	var isLoad=false;//是否延迟加载
	$(function () {
 	/*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
        companyTreegrid = $('#companyDatagrid').treegrid({
            url: '${dynamicURL}/admin/system/company/list?search_EQ_parentId=0',
            queryForm: "#queryHeader form",//列筛选时附带加上搜索表单的条件
            fit:true,
            pagination : false,
// 			rownumbers : true,
			singleSelect : true,
			lines:true,
			idField : 'id',
			treeField: 'name',
            columns: [ [
// 					{field : 'id',checkbox:true}, 
                    {field: 'name', title: '名称',width:200, sortable: true,align:'left'}
                ]
            ],
            onSelect:function(rowIndex, rowData){
				isLoad=true;
				departmentTreegrid.treegrid("load", {'companyId' : rowIndex.id});
            }
        });
        /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
		departmentTreegrid = $('#departmentTreegrid').treegrid({
		   		url: '${dynamicURL}/admin/system/department/treegrid?search_EQ_parentId=0',
				pagination: false,
				rownumbers : true,
				queryForm: "#queryHeader form",//列筛选时附带加上搜索表单的条件
				fit:true,
				fitColumns:true,
				treeField: 'name',
				idField: 'id',
				columns: [
				    [
				        {field: 'id', checkbox: true},
				        {field: 'name', title: '部门名称',width:200, sortable: true,align:'left'},
				        {field: 'companyEntity.name', title: '公司名称',width:180, sortable: true, formatter: function (value, rec) { return rec.companyEntity['name'];}},
				        {field: 'sortNumber', title: '顺序号',width:60, sortable: true},
				        {field: 'deleteFlag', title: '状态',width:100, sortable: true,
				            formatter: function (value, row, index) {
				            	var deleteFlagWrapper = "";
				            	if(row.deleteFlag == '0'){
				            		deleteFlagWrapper = "<span style='color:green'>正常</apan>";
				            	}else{
				            		deleteFlagWrapper = "<span style='color:red'>禁用</apan>";
				            	}
				                return deleteFlagWrapper;
				            }
				        }
				    ]
				],
				onBeforeLoad:function(){
					return isLoad;
				},
				onLoadSuccess: function (node, data) {
					departmentTreegrid.treegrid('collapseAll');
	            },
				onDblClickRow : function(index) {
					edit();
				}
		});
	   	$('#departmentFormId').combotree({
            panelWidth: 250,
            lines : true,
            panelHeight : 400,
            //下面这两个字段需要视情况修改
            idField: 'id',
            nameField: 'name'
     	});
	})
	function add() {
		var row = companyTreegrid.treegrid("getSelected");
		if(row){
			_layer({
	    	  	url:'${dynamicURL}/admin/system/department/toAddPage?companyId='+row.id,
	    	  	title:"新增部门",
	    	  	width : "600px",
	    	    height: "500px",
	    	  	btn: ['保存', '取消']
	    	   },{
	    	  	yes: _.debounce(function(index, layero){
	    	  		var bObj = layero.find("a.layui-layer-btn0");
		            var frm = $("#layui-layer-iframe" + ixs["新增部门"]).contents().find("form.addForm");
	                $.submit({
			            url: "${dynamicURL}/admin/system/department/save",
			            formTg:frm,
			            butObj : bObj,
			            success : function(){
			            	$('#departmentTreegrid').treegrid('reload');
			            	layer.alert('保存成功！', {icon: 1});
			            	layer.close(ixs["新增部门"])
			            },
			            error : function(){
			            	layer.alert('出错啦！', {icon: 0});
			            }
		           	});
	    	  	},waitTime,true), 
	    	  	btn2: function(index, layero){
	    	  		layer.close(parent.parent.ixs["新增部门"]);
	    	  	}
	      	});
		}else{
			layer.alert('请选择公司！', {icon: 0});
		}
    }
	function loadDepartmentCombotree(companyId,departmentId){
		if(companyId){
			$.post('${dynamicURL}/admin/system/department/combotree?search_EQ_parentId=0',{'search_EQ_companyEntity.id':companyId},function(data){
				$('#departmentFormId').combotree("clear");
				$('#departmentFormId').combotree('loadData',data);
				if(departmentId){
					$("#departmentFormId").combotree("setValue",departmentId);
				}else{
					$("#departmentFormId").combotree("setValue",0);
				}
			},'json');
		}
	}
    //修改
    function edit() {
        var row = departmentTreegrid.treegrid("getSelected");
        if (row) {
        	_layer({
	    	  	url:'${dynamicURL}/admin/system/department/toAddPage?companyId='+row.companyEntity.id+'&departmentId='+row.id,
	    	  	title:"修改部门",
	    	  	width : "600px",
	    	    height: "500px",
	    	  	btn: ['保存', '取消']
	    	   },{
	    	  	yes: _.debounce(function(index, layero){
	    	  		var bObj = layero.find("a.layui-layer-btn0");
		            var frm = $("#layui-layer-iframe" + ixs["修改部门"]).contents().find("form.addForm");
	                $.submit({
			            url: "${dynamicURL}/admin/system/department/save",
			            formTg:frm,
			            butObj : bObj,
			            success : function(){
			            	$('#departmentTreegrid').treegrid('reload');
			            	layer.alert('保存成功！', {icon: 1});
			            	layer.close(ixs["修改部门"])
			            },
			            error : function(){
			            	layer.alert('出错啦！', {icon: 0});
			            }
		           	});
	    	  	},waitTime,true), 
	    	  	btn2: function(index, layero){
	    	  		layer.close(parent.parent.ixs["修改部门"]);
	    	  	}
	      	});
        } else {
        	layer.alert('请选择要修改的记录！', {icon: 0});
        }
    }
    
    //删除
    function del(){
		var row = departmentTreegrid.treegrid("getSelected");
        if (row) {
            $.submit({
                url: "${dynamicURL}/admin/system/department/delete",
                data: {id: row.id},
                success: function (data) {
                	if (data.success) {
                		layer.alert('删除成功！', {icon: 1});
                        departmentTreegrid.treegrid('reload');
                    } else {
                        layer.alert( data.msg, {icon: 0});
                    }
                }
            });
        } else {
            layer.alert('请选择要删除的部门！', {icon: 0});
        }
    }
    
    //刷新公司
    function refreshCompany(){
    	companyTreegrid.treegrid("reload");
    }
    
    //人员维护
	function editUser(flag) {
		//初始化selectUser
		$.top._selectUserInitialization();
		$.top._selectUserOpenWindow();
		$.top._select(true,false,function(data){
			// 第一个boolean:多选为true
			var length = data.length;
			if(length != 0){
				var userName = "";
				var userIds = "";
				for(var i = 0; i < length; i++){
					if( i==0 ){
						userName += data[i].name;
						userIds += data[i].id;
					}else{
						userName += "," + data[i].name;
						userIds += "," + data[i].id;
					}
				}
				if(flag == "0"){
					$("input[name='leaderName']").val(userName);
					$("input[name='leaderId']").val(userIds);
				}else if(flag == "1"){
					$("input[name='headName']").val(userName);
					$("input[name='headId']").val(userIds);
				}else if(flag == '2'){
					$("input[name='auditName']").val(userName);
					$("input[name='auditId']").val(userIds);
				}
			}
			$.top._selectUserCloseWindow();
		});
	}
    
</script>

