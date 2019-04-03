<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ taglib prefix="security" uri="/tld/security.tld" %> --%>
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
				 class="easyui-layout layout ovh" fit="true">
				<table id="companyDatagrid"></table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
//分页
var companyDatagrid;
var depCom;
var company;
var $parent=$(parent);
$(function() {
    /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
    companyDatagrid = $('#companyDatagrid').treegrid({
        url: '${dynamicURL}/admin/system/company/combotree?search_EQ_parentId=0',
        queryForm: "#queryHeader form",
        //列筛选时附带加上搜索表单的条件
       	fit: true,
        pagination: false,
        rownumbers: true,
        singleSelect: true,
        lines: true,
        idField: 'id',
        treeField: 'name',
        columns: [[
        /* {
            field: 'id',
            checkbox: true
        }, */
        {
            field: 'name',
            title: '名称',
            width: '50%',
            align: 'left'
        },
        {
            field: 'sortNumber',
            title: '排序',
            align: 'left',
            width: '50%'
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
var rulesMsgs = {
    /* 校验规则  */
    rules: {
        name: "required",
    },
    /* 错误提示 */
    messages: {
        name: "请输入公司名称",
    }
}
/*添加*/
function add() {
		_layer({
	        url: '${dynamicURL}/admin/system/company/add',
	        title: "新增公司",
	        btn: ['保存', '取消']
	    },
	    {
	        yes: function(index, layero) {
	        	var bObj = layero.find("a.layui-layer-btn0");
	            var frm = $("#layui-layer-iframe" + ixs["新增公司"]).contents().find("form.addForm");
	            $.submit({
		            url: "${dynamicURL}/admin/system/company/save",
		            formTg:frm,
		            butObj : bObj,
		            success : function(){
		            	$('#companyDatagrid').treegrid('reload');
		            	layer.alert('保存成功！', {icon: 1});
		            	layer.close(ixs["新增公司"])
		            },
		            error : function(){
		            	layer.alert('出错啦！', {icon: 0});
		            }
	           	});
	            
	        },
	        btn2: function(index, layero) {
	            layer.close(ixs["新增公司"]);
	        }
	    }); 
}
/*修改*/
function edit() {
	layui.use('layer', function(){
		var layer = layui.layer;
		var row = companyDatagrid.treegrid("getSelected");
		if(row){
			_layer({
		        url: '${dynamicURL}/admin/system/company/add?companyId='+row.id,
		        title: "修改公司",
		        btn: ['保存', '取消']
		    },
		    {
		        yes: function(index, layero) {
		        	var bObj = layero.find("a.layui-layer-btn0");
		            var frm = $("#layui-layer-iframe" + ixs["修改公司"]).contents().find("form.addForm");
		            $.submit({
			            url: "${dynamicURL}/admin/system/company/save",
			            formTg:frm,
			            butObj : bObj,
			            success : function(res){
			            	if(res.success){
				            	$('#companyDatagrid').treegrid('reload');
				            	layer.alert('保存成功！', {icon: 1});
				            	layer.close(ixs["修改公司"])
			            	}else{
			            		layer.alert('操作失败', {icon: 0});
			            	}
			            },
		           	});
		        },
		        btn2: function(index, layero) {
		            layer.close(ixs["修改公司"]);
		        }
		    }); 
		}else{
			layer.alert('请选择要修改的记录！', {icon: 0});
		}
		
	});
}

/*删除*/
function del() {
	layui.use('layer', function(){
		var layer = layui.layer;
	    var row = companyDatagrid.treegrid("getSelected");
	    if (row) {
	        /* $.ajax({
	            url: "${dynamicURL}/admin/system/company/delete",
	            type: "POST",
	            dataType: "JSON",
	            data: {
	                "ids": row.id
	            },
	            success: function(msg) {
	                if (msg.success) {
	                	layer.alert('删除成功！', {icon: 1});
	                    $('#companyDatagrid').treegrid("reload");
	                } else {
	                	layer.alert('删除失败！', {icon: 0});
	                }
	            }
	        }); */ 
	        $.submit({
	            url: "${dynamicURL}/admin/system/company/delete",
	            data:{
	                "ids": row.id
	            },
	            butObj : null,
	            success: function(res) {
	                if (res.success) {
	                	layer.alert('删除成功！', {icon: 1});
	                    $('#companyDatagrid').treegrid("reload");
	                } else {
	                	layer.alert(res.msg, {icon: 0});
	                }
	            }
           	});
	    } else {
	        layer.msg('请选择待删除的信息！', {
	            icon: 1
	        });
	    }
	})
}

</script>


