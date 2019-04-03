<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="padd15 easyui-layout" data-options="fit:true">
<div class="easyui-layout layout-custom-resize" data-options="custom_fit:true,fit:true">
	<div data-options="region:'west',split:false,collapsible:false" style="width: 33%;">
		<div id="container" class="easyui-layout layout" fit="true">
	        <div region="north" border="false">
			    <div class="card-button">
					<div class="layui-btn-container">
						<button id="add" onclick="addRole()" class="layui-btn layui-btn">增加</button>
						<button id="edit" onclick="editRole()" class="layui-btn">修改</button>
						<button id="del" onclick="delRole()" class="layui-btn layui-btn">删除</button>
					</div>
				</div>
            </div>
            <div region="center" border="false">
				<table id="roleDatagrid"></table>
			</div>
		</div>
	</div>
	<div data-options="region:'center',split:false,collapsible:false" style="width: 40%;">
		<div id="container" class="easyui-layout layout" fit="true">
	        <div region="north" border="false">
		        <div class="card-button">
					<div class="layui-btn-container">
						<button id="add" onclick="editUser()" class="layui-btn layui-btn">人员维护</button>
						<button id="edit" onclick="delUser()" class="layui-btn">人员删除</button>
					</div>
				</div>
	        </div>
	        <div region="center" border="false">
				<table id="userDatagrid"></table>
			</div>
		</div>
	</div>
	<div data-options="region:'east',split:false,collapsible:false" style="width: 30%;">
		<div id="container" class="easyui-layout layout" fit="true">
	        <div region="north" border="false">
	            <div class="card-button">
					<div class="layui-btn-container">
						<button id="add" onclick="editResources()" class="layui-btn layui-btn">保存</button>
					</div>
				</div>
	        </div>
	        <div region="center" border="false">
				<table id="resourceTreegrid"></table>
			</div>
		</div>
	</div>
</div>
</div>
<script>
var userDatagrid;
var roleDatagrid;
var resourceTreegrid;
var isLoad=false;//是否延迟加载
$(function() {
	userDatagrid = $('#userDatagrid').datagrid({
		url : '${dynamicURL}/admin/system/role/selectedUser',
		pagination : true,
		rownumbers : true,//行数  
		queryForm : "#queryHeader form",//列筛选时附带加上搜索表单的条件
		custom_fit : true,//额外处理自适应性
		custom_heighter : "#queryHeader",//额外处理自适应性（计算时留出元素#queryHeader高度）
		custom_height : 5,//额外处理自适应性（计算时留5px高度）
		singleSelect : false,
		idField : 'id',
		fit:true,
		columns : [ [ {
			field : 'id',
			checkbox : true
		}, {
			field : 'user.loginName',
			title : '登录名',
			width : '25%',
			align : 'left',
			sortable : true,
			formatter: function (value, rec) { return rec.user['loginName'];}
		}, {
			field : 'user.name',
			title : '中文用户名',
			width : '25%',
			align : 'left',
			sortable : true,
			formatter: function (value, rec) { return rec.user['name'];}
		} ,  {
			field : 'user.companyEntity.name',
			title : '公司名称',
			width : '25%',
			align : 'left',
			sortable : true,
			formatter: function (value, rec) { return rec.user.companyEntity["name"];}
		} , {
			field : 'user.departmentEntity.name',
			title : '部门名称',
			width : '25%',
			align : 'left',
			sortable : true,
			formatter: function (value, rec) { return rec.user.departmentEntity["name"];}
		}  ] ],
		//行右击菜单
		onRowContextMenu : function(e, rowIndex, rowData) {
			e.preventDefault();
			$(this).datagrid('unselectAll');
			$(this).datagrid('selectRow', rowIndex);
			$('#menu').menu('show', {
				left : e.pageX,
				top : e.pageY
			});
		},
        onBeforeLoad:function(){
        	return isLoad;
        }
	});
	
	resourceTreegrid = $('#resourceTreegrid').treegrid({
        url: '${dynamicURL}/admin/system/resources/ntreegrid?search_EQ_parentId=0&search_EQ_flag=0',
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
                {field: 'name', title: '名称',width:'50%', sortable: true,align:'left'},
                {field: 'description', width:'40%',title: '描述', sortable: true}
            ]
        ],
        onCheck:function(node){
        	cascadeCheck(node);
        },
        onLoadSuccess: function(node, data){
			checkResourceTree();
        },
        onBeforeCollapse:function(){
        }, 
        onBeforeLoad:function(){
        	return isLoad;
        }
    });
	roleDatagrid = $('#roleDatagrid').datagrid({
		url : '${dynamicURL}/admin/system/role/list',
		pagination : true,
		singleSelect : true,
		rownumbers : true,
		idField : 'id',
		nameField : 'name',
		lines:true,
		fit:true,
		columns : [ [ 
		              {field : 'id', formatter:function Ra(val, row, index) {return '<input type="radio" name="selectRadio" id="selectRadio"' + index + '/>';}},
		              {field : 'name',title : '名称',width : '30%' ,align:'left'}, 
		              {field : 'remark',title : '备注',width : '70%' },
		              {field : 'sortNumber',title : '排序',hidden : true}, 
		              {field : 'deleteFlag',title : '状态',hidden : true} 
		           ] ],
		           
        onSelect:function(index, data){
			isLoad=true;
			userDatagrid.datagrid("clearSelections");
			userDatagrid.datagrid("load", {'id' : data.id}); 
			resourceTreegrid.treegrid("reload");
        }, 
		onDblClickRow: function(index){
			editRole();
		}
	});
	
});

var rulesMsgs = {
    /* 校验规则  */
    rules: {
        name: "required",
        sortNumber: {
        	required : true,
        	number : true,
        }
    },   
    /* 错误提示 */
    messages: {
        name: "请输入角色名",
        sortNumber: {
        	required : "请输入序号",
        	number : "必须输入数字",
        }
    } 
}

function addRole() {
	_layer({
	  	url:"${dynamicURL}/admin/system/role/roleAdd",
	  	title:"新增角色",
	  	btn: ['保存', '取消']
	},{
	  	yes:  _.debounce(function(index, layero){
	  		var bObj = layero.find("a.layui-layer-btn0");
	  		var frm=$("#layui-layer-iframe"+ixs["新增角色"]).contents().find("#addRoleWindow form.addForm");
            $.submit({
	            url: "${dynamicURL}/admin/system/role/save",
	            formTg:frm,
	            butObj : bObj,
	            success : function(res){
	            	$('#roleDatagrid').datagrid('reload');
		          	layer.alert('保存成功！', {icon: 1});
		          	layer.close(ixs["新增角色"])
	            },
           	});
	  	},waitTime,true),
	  	btn2: function(index, layero){
	  		layer.close(ixs["新增角色"]);
	  	}
  	});
}

function editRole() {
	var row = roleDatagrid.datagrid("getSelected");
	if (row) {
		_layer({
		  	url:"${dynamicURL}/admin/system/role/roleAdd?roleId="+row.id,
		  	title:"编辑角色",
		  	btn: ['保存', '取消']
		},{
		  	yes:  _.debounce(function(index, layero){
		  		var bObj = layero.find("a.layui-layer-btn0");
		  		var frm=$("#layui-layer-iframe"+ixs["编辑角色"]).contents().find("#addRoleWindow form.addForm");
	            $.submit({
		            url: "${dynamicURL}/admin/system/role/save",
		            formTg:frm,
		            butObj : bObj,
		            success : function(res){
		            	$('#roleDatagrid').datagrid('reload');
			          	layer.alert('保存成功！', {icon: 1});
			          	layer.close(ixs["编辑角色"])
		            },
	           	});
		  	},waitTime,true),
		  	btn2: function(index, layero){
		  		layer.close(parent.parent.ixs["编辑角色"]);
		  	}
		});
	}else{
		parent.layer.msg('请选择待编辑的角色',{icon: 1}); 
	}
}

function delRole() {
	var row = roleDatagrid.datagrid("getSelected");
	if (row) {
		$.submit({
			url:"${dynamicURL}/admin/system/role/delete",
			data:{"ids":row.id},
			success:function(msg){
				if(msg.success){
					  parent.layer.confirm('确定删除该角色及该角色下所有人员及相应的权限吗？', {
               		  btn: ['删除','取消'] //按钮
               		}, function(){
               			parent.layer.msg('删除成功',{icon: 1}); 
               			roleDatagrid.datagrid("reload");
               			userDatagrid.datagrid("reload");
               		}, function(){
               		});
              	}else{
					parent.layer.msg('删除失败',{icon: 1}); 
				}
			}
		});
	} else {
		parent.layer.msg('请选择待删除的角色',{icon: 1}); 
	}
}

//人员新增
function editUser() {
	var row = roleDatagrid.datagrid("getSelected");
	if (row) {
		parent._layer({
		  	url:"${dynamicURL}/selection/users",
		  	title:"新增人员",
		  	btn: ['保存', '取消'],
		  	width: "800px",
		  	height: "500px",
		},{
		  	yes:_.debounce(function(index, layero){
				var arr = [];
				var childIfm=parent.$("#layui-layer-iframe" + index)[0].contentWindow.$('#selectedDatagrid').datagrid('getRows');
				$.each(childIfm,function(i, d) {
					arr.push(d.id);
				});
				if(arr[0]==-100){
				} else{
					var params = {};
					params["ids"]=arr;
					params["roleId"]=row.id;
			  		$.ajax({
			  			url:"${dynamicURL}/admin/system/role/editUser",
			  			type:"post",
			  			dataType:"json",
			  			data:$.param(params,true),
			  			success:function(data){
			  				if($.type(data)=="string"){
					    		data=JSON.parse(data);
					    	} 
			  				if(data.success){
			  					parent.layer.msg("添加成功",{ icon: 1, skin: 'layer-ext-moon' });
			  					parent.layer.close(index);
			  					userDatagrid.datagrid("reload");
			  				}else{
			  					parent.layer.msg("添加失败",{ icon: 8, skin: 'layer-ext-moon' });
			  				} 
			  			}
			  		});
				}
		  	},waitTime,true),
		  	btn2: function(index, layero){}
	  	});
	} else {
		parent.layer.msg('请选择待新增人员的角色',{icon: 1}); 
	}
}

function delUser(){
	var rows = userDatagrid.datagrid("getSelections");
	if (rows.length > 0) {
		 parent.layer.confirm('确定删除用户吗？', {
      		  btn: ['删除','取消'] //按钮
      		}, function(){
      			var p={};
				var idsz=[];
				$.each(rows,function(i,d){
					idsz.push(d.id);
				});
				p["ids"]=idsz;
				$.submit({
     				url:"${dynamicURL}/admin/system/role/deleteUser",
     				data:$.param(p,true),
     				success:function(msg){
     					if(msg.success){
     						parent.layer.msg('删除成功',{icon: 1}); 
     						userDatagrid.datagrid("clearSelections");
     		     			userDatagrid.datagrid("reload");
     	              	}else{
     						parent.layer.msg('删除失败',{icon: 1}); 
     					}
     				}
     			});  
      		}, function(){
      		});
     			
		
	} else {
		parent.layer.msg('请选择待删除的人员',{icon: 1}); 
	}
}

function editResources(){
	var rows=resourceTreegrid.treegrid("getSelections");
	var params={};
	var resourceIds=[];
	if(rows.length){
		$.each(rows,function(i,d){
			resourceIds.push(d.id);
		});
	}
	params["resourceIds"]=resourceIds;
	var selRow=roleDatagrid.datagrid("getSelected");
	params["roleId"]= selRow.id ;
	$.ajax({
		url:"${dynamicURL}/admin/system/role/editResources",
		type:"POST",
		dataType:"JSON",
		data:$.param(params,true),
	 	beforeSend : function(XMLHttpRequest){
			progress();
		},
		success:function(msg){
			$.messager.progress('close');
			if(msg.success){
				layer.msg('保存成功',{icon: 1}); 
				resourceTreegrid.treegrid("reload");
			}else{
				layer.msg('保存失败',{icon: 1}); 
			}
		},
		error:function(){
			$.messager.progress('close');
			layer.msg('保存失败',{icon: 1}); 
		}
	});
}
	

//勾选资源树
function checkResourceTree(){
	var row=roleDatagrid.datagrid("getSelected");
	if(row){
		resourceTreegrid.treegrid("unselectAll");
		$.ajax({
			url:"${dynamicURL}/admin/system/role/resourceTreegrid",
			type:"POST",
			dataType:"json",
			data:{"roleId":row.id},
			success:function(msg){
				$.each(msg,function(i,d){
					resourceTreegrid.treegrid('select',d);
				});
			}
		});
	}
}

//选择子节点级联父节点
function cascadeCheck(node){
	var parentNode=resourceTreegrid.treegrid("getParent",node.id);
	if(parentNode){
		resourceTreegrid.treegrid('select',parentNode.id);
		cascadeCheck(parentNode);
	}
}
//取消选中父节点级联所有子节点
function cascadeUnCheck(node){
	var childNodes=resourceTreegrid.treegrid("getChildren",node.id);
	$.each(childNodes,function(i,d){
		resourceTreegrid.treegrid("unselect",d.id);
	});
}
	
	
function progress(){
    var win = $.messager.progress({
        title:'保存',
        msg:'处理中...'
    });
}

//清空右侧列表
function clearList(){
	userDatagrid.datagrid('loadData',{total:0,rows:[]});//清空人员列表
	resourceTreegrid.treegrid('loadData',{total:0,rows:[]});//清空资源列表
}

</script>