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
				 class="easyui-layout layout" fit="true">
				<table id="vedioDatagrid"></table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
//分页
var vedioDatagrid;
var depCom;
var company;
var $parent=$(parent);
$(function() {
    /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
    vedioDatagrid = $('#vedioDatagrid').datagrid({
    	url: '${dynamicURL}/admin/vedio/list?sort=gmtCreate&order=desc',
        queryForm: "#queryHeader form",//列筛选时附带加上搜索表单的条件
        fit:true,
        pagination : true,
		rownumbers : true,
		singleSelect : true,
		lines:true,
		idField : 'id',
        columns: [
            [
                {field: 'id', checkbox: true},
                {field: 'title', title: '标题',width:'98%', sortable: true,align:'left'}
            ]
        ],
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
        name: "请输入视频名称",
    }
}
/*添加*/
function add() {
	parent._layer({
        url: '${dynamicURL}/admin/vedio/add',
        title: "新增视频",
        width:'600px',
        height:'600px',
        btn: ['保存', '取消']
    },
    {
        yes: function(index, layero) {
        	var bObj = layero.find("a.layui-layer-btn0");
            var frm = parent.$("#layui-layer-iframe" + parent.ixs["新增视频"]).contents().find("form.addForm");
            $.submit({
	            url: "${dynamicURL}/admin/vedio/saveInfo",
	            formTg:frm,
	            butObj : bObj,
	            cache: false,
	            success : function(res){
	            	if(res.success){
		            	$('#vedioDatagrid').datagrid('reload');
		            	layer.alert('保存成功！', {icon: 1});
		            	parent.layer.close(parent.parent.ixs["新增视频"]);
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
        	parent.layer.close(parent.parent.ixs["新增视频"]);
        }
    }); 
}
/*修改*/
function edit() {
	var row = vedioDatagrid.datagrid("getSelected");
	if(row){
		parent._layer({
	        url: '${dynamicURL}/admin/vedio/add?id='+row.id,
	        title: "修改视频",
	        width:'600px',
	        height:'600px',
	        btn: ['保存', '取消']
	    },
	    {
	        yes: function(index, layero) {
	        	var bObj = layero.find("a.layui-layer-btn0");
	            var frm = parent.$("#layui-layer-iframe" + parent.ixs["修改视频"]).contents().find("form.addForm");
	            $.submit({
		            url: "${dynamicURL}/admin/vedio/saveInfo",
		            formTg:frm,
		            butObj : bObj,
		            success : function(res){
		            	if(res.success){
			            	$('#vedioDatagrid').datagrid('reload');
			            	layer.alert('保存成功！', {icon: 1});
			            	parent.layer.close(parent.parent.ixs["修改视频"]);
		            	}else{
		            		layer.alert('操作失败', {icon: 0});
		            	}
		            },
	           	}); 
	        },
	        btn2: function(index, layero) {
	        	parent.layer.close(parent.parent.ixs["修改视频"]);
	        }
	    }); 
	}else{
		layer.alert('请选择要修改的记录！', {icon: 0});
	}
}

/*删除*/
function del() {
    var row = vedioDatagrid.datagrid("getSelected");
    if (row) {
        $.submit({
            url: "${dynamicURL}/admin/vedio/deleteInfo",
            data:{
                "ids": row.id
            },
            butObj : null,
            success: function(res) {
                if (res.success) {
                	layer.alert('删除成功！', {icon: 1});
                    $('#vedioDatagrid').datagrid("reload");
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


