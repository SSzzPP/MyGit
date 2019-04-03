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
		<div data-options="region:'center'" border="false">
			<div style="width: 100%; padding: 10px 15px;"
				 class="easyui-layout layout" fit="true">
				<table id="classDatagrid"></table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
//分页
var classDatagrid;
$(function() {
    /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
    classDatagrid = $('#classDatagrid').datagrid({
        url: '${dynamicURL}/admin/system/class/list',
        queryForm: "#queryHeader form",
        //列筛选时附带加上搜索表单的条件
       	fit: true,
        pagination: true,
        rownumbers: true,
        singleSelect: true,
        lines: true,
        idField: 'id',
        columns: [[
        /* {
            field: 'id',
            checkbox: true
        }, */
        {
            field: 'name',
            title: '班级名称',
            width: '45%',
            align: 'left'
        },
        {
            field: 'gradeName',
            title: '年级名称',
            width: '45%',
            align: 'left'
        }
        ]],
        onDblClickRow: function(index) {
            edit();
        }

    });
    $("form[for] button.queryBtn").on("click.datagrid-query",
    function() {
        top._search($(this).parents("form[for]"));
    });
    $("form[for] button.clearBtn").on("click.datagrid-query",
    function() {
        top._clearSearch($(this).parents("form"));
    });
});
/*添加*/
function add() {
	parent._layer({
	    url: '${dynamicURL}/admin/system/class/add',
	    title: "新增班级",
	    width:'600px',
	    height:'600px',
	    btn: ['保存', '取消']
	},
	{
	    yes: function(index, layero) {
	    	var bObj = layero.find("a.layui-layer-btn0");
	        var frm = parent.$("#layui-layer-iframe" + parent.ixs["新增班级"]).contents().find("form.addForm");
	        $.submit({
	            url: "${dynamicURL}/admin/system/class/save",
	            formTg:frm,
	            butObj : bObj,
	            cache: false,
	            success : function(res){
	            	if(res.success){
	            		$('#classDatagrid').datagrid('reload');
	    	         	layer.alert('保存成功！', {icon: 1});
	    	         	parent.layer.close(parent.parent.ixs["新增班级"]);
	            	}else{
	            		parent.layer.alert(res.msg, {icon: 0});
	            	} 
	            },
	            error : function(){
	            	layer.alert('出错啦！', {icon: 0});
	            }
           	});
	    },
	    btn2: function(index, layero) {
	    	parent.layer.close(parent.parent.ixs["新增班级"]);
	    }
	}); 
}
/*删除*/
function del() {
    var row = classDatagrid.datagrid("getSelected");
    if (row) {  	
    	//删除询问框
    	layer.confirm('是否删除？', {
    	  btn: ['确定','取消'] //按钮
    	}, function(){
    		$.submit({
                url: "${dynamicURL}/admin/system/class/deleteInfo",
                data:{
                    "ids": row.id
                },
                butObj : null,
                success: function(res) {
                    if (res.success) {
                    	layer.alert('删除成功！', {icon: 1});
                        $('#classDatagrid').datagrid("reload");
                    } else {
                    	layer.alert(res.msg, {icon: 0});
                    }
                }
           });
    	});
    } else {
    	layer.alert('请选择要删除的记录！', {icon: 0});
    }
}
/*修改*/
function edit() {
	var row = classDatagrid.datagrid("getSelected");
	if(row){
		parent._layer({
	        url: '${dynamicURL}/admin/system/class/add?id='+row.id,
	        title: "修改班级",
	        width:'600px',
	        height:'600px',
	        btn: ['保存', '取消']
	    },
	    {
	        yes: function(index, layero) {
	        	var bObj = layero.find("a.layui-layer-btn0");
	        	var frm = parent.$("#layui-layer-iframe" + parent.ixs["修改班级"]).contents().find("form.addForm");
	           /*  	
	           		var validator=frm.validate(rulesMsgs);
	            	var valid=validator.form();
	            */
	        	$.submit({
		            url: "${dynamicURL}/admin/system/class/save",
		            formTg:frm,
		            butObj : bObj,
		            success : function(res){
		            	if(res.success){
			            	$('#classDatagrid').datagrid('reload');
			            	layer.alert('保存成功！', {icon: 1});
			            	parent.layer.close(parent.parent.ixs["修改班级"]);
		            	}else{
		            		layer.alert('操作失败', {icon: 0});
		            	}
		            },
	           	});
	        },
	        btn2: function(index, layero) {
	        	parent.layer.close(parent.parent.ixs["修改班级"]);
	        }
	    }); 
	}else{
		layer.alert('请选择要修改的记录！', {icon: 0});
	}
}
</script>