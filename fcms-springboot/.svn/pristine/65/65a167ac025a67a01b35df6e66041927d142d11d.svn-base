<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ taglib prefix="security" uri="/tld/security.tld" %> --%>
<div class="padd15 easyui-layout" data-options="fit:true">
	<div class="easyui-layout layout-custom-resize" data-options="fit:true">
		<div data-options="region:'north',split:false,collapsible:false">
			<div class="card-button">
				<div class="layui-btn-container">
					<button id="add" onclick="addRecord()" class="layui-btn layui-btn">增加</button>
					<button id="edit" onclick="edit()" class="layui-btn">修改</button>
					<button id="del" onclick="del()" class="layui-btn layui-btn">删除</button>
				</div>
			</div>
		</div>
		<div data-options="region:'center'" border="false">
			<div style="width: 100%; padding: 10px 15px;"
				 class="easyui-layout layout" fit="true">
				<table id="userRecordDatagrid"></table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
//分页
var venueUserId = "${venueUserId}";
var userRecordDatagrid;
$(function() {
    /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
    userRecordDatagrid = $('#userRecordDatagrid').datagrid({
        url: '${dynamicURL}/admin/venue/user/record/list?search_EQ_venueUserId=' + venueUserId,
        queryForm: "#queryHeader form",
        //列筛选时附带加上搜索表单的条件
       	fit: true,
        pagination: true,
        rownumbers: true,
        singleSelect: true,
        lines: true,
        idField: 'id',
        columns: [[
            {field: 'venueUserName', title: '用户名', width: '30%', align: 'left', sortable: true},
            {field: 'content', title: '履历', width: '70%', align: 'left', sortable: true}
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
/*修改*/
function edit() {
	var row = userRecordDatagrid.datagrid("getSelected");
	if(row){
		parent._layer({
			url: '${dynamicURL}/admin/venue/user/record/toAddRecord?venueUserId=' + venueUserId + '&id=' + row.id,
	        title: "修改教练履历",
	        width:'600px',
	        height:'350px',
	        btn: ['保存', '取消']
	    },
	    {
	        yes: function(index, layero) {
	        	var bObj = layero.find("a.layui-layer-btn0");
	            var frm = parent.$("#layui-layer-iframe" + parent.ixs["修改教练履历"]).contents().find("form.addForm");
	            $.submit({
	            	url: "${dynamicURL}/admin/venue/user/record/saveRecord",
		            formTg:frm,
		            butObj : bObj,
		            success : function(res){
		            	if(res.success){
			            	$('#userRecordDatagrid').datagrid('reload');
			            	layer.alert('保存成功！', {icon: 1});
			            	parent.layer.close(parent.parent.ixs["修改教练履历"]);
		            	}else{
		            		layer.alert('操作失败', {icon: 0});
		            	}
		            },
	           	});
	        },
	        btn2: function(index, layero) {
	        	parent.layer.close(parent.parent.ixs["修改教练履历"]);
	        }
	    }); 
	}else{
		layer.alert('请选择要修改的记录！', {icon: 0});
	}
}

/*删除*/
function del() {
    var row = userRecordDatagrid.datagrid("getSelected");
    if (row) {
        $.submit({
            url: "${dynamicURL}/admin/venue/user/record/delete",
            data:{
                "ids": row.id
            },
            butObj : null,
            success: function(res) {
                if (res.success) {
                	layer.alert('删除成功！', {icon: 1});
                    $('#userRecordDatagrid').datagrid("reload");
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
function addRecord() {
		parent._layer({
	        url: '${dynamicURL}/admin/venue/user/record/toAddRecord?venueUserId=' + venueUserId,
	        title: "新增教练履历",
	        width:'600px',
	        height:'350px',
	        btn: ['保存', '取消']
	    },
	    {
	        yes: function(index, layero) {
	        	var bObj = layero.find("a.layui-layer-btn0");
	            var frm = parent.$("#layui-layer-iframe" + parent.ixs["新增教练履历"]).contents().find("form.addForm");
	            $.submit({
		            url: "${dynamicURL}/admin/venue/user/record/saveRecord",
		            formTg:frm,
		            butObj : bObj,
		            success : function(){
		            	$('#userRecordDatagrid').datagrid('reload');
		            	layer.alert('保存成功！', {icon: 1});
		            	parent.layer.close(parent.parent.ixs["新增教练履历"]);
		            },
		            error : function(){
		            	layer.alert('出错啦！', {icon: 0});
		            }
	           	});
	            
	        },
	        btn2: function(index, layero) {
	        	parent.layer.close(parent.parent.ixs["新增场馆人员"]);
	        }
	    }); 
}
</script>


