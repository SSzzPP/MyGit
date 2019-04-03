<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ taglib prefix="security" uri="/tld/security.tld" %> --%>
<div class="padd15 easyui-layout" data-options="fit:true">
	<div class="easyui-layout layout-custom-resize" data-options="fit:true">
		<div data-options="region:'north',split:false,collapsible:false">
			<div class="card-button">
				<div class="layui-btn-container">
					<button lay-href="${dynamicURL}/admin/information/info/toAddPage" class="layui-btn layui-btn">新增资讯</button>
					<button onclick="edit()" class="layui-btn">修改</button>
					<button onclick="show()" class="layui-btn">预览</button>
					<button id="del" onclick="del()" class="layui-btn layui-btn">删除</button>
				</div>
			</div>
		</div>
		<div data-options="region:'center'" border="false">
			<div style="width: 100%; padding: 10px 15px;"
				 class="easyui-layout layout" fit="true">
				<table id="informationDatagrid"></table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
//分页
var informationDatagrid;
$(function() {
    /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
    informationDatagrid = $('#informationDatagrid').datagrid({
        url: '${dynamicURL}/admin/information/info/list',
        queryForm: "#queryHeader form",
        //列筛选时附带加上搜索表单的条件
       	fit: true,
        pagination: true,
        rownumbers: false,
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
            field: 'title',
            title: '标题',
            width: '25%',
            align: 'left'
        },
        {
            field: 'author',
            title: '作者',
            align: 'left',
            width: '25%',
        },
        {
            field: 'moduleName',
            title: '分类',
            align: 'left',
            width: '25%',
        },
        {
            field: 'status',
            title: '状态',
            align: 'left',
            width: '25%',
            formatter: function (value, rec) { 
            	var str = '';
            	if(rec.status != null && rec.status == 1) 
            		str = '<span style="color:green">已发布</span>';
            	if(rec.status != null && rec.status == 0) 
            		str = '<button id="edit" onclick="send('+rec.id+')" class="layui-btn">发布</button>';
            	return str;
            }
        },
        /* {
            field: 'operation',
            title: '操作',
            align: 'left',
            width: '25%',
            formatter: function (value, rec) { 
            	var str = '';
            	if(rec.status != null && rec.status == 1) 
            		str = '<span style="color:red">已发布，无法修改</span>';
            	if(rec.status != null && rec.status == 0) 
            		str = '<a lay-href="${dynamicURL}/admin/information/info/toEditPage?infoId='+rec.id+'"><button class="layui-btn">修改</button></a>';
            	return str;
            }
        } */
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
/*删除*/
function del() {
    var row = informationDatagrid.datagrid("getSelected");
    if (row) {
    	if(row.status == 1){
    		layer.alert('已发布，无法删除！', {icon: 0});
    	}else{
	        $.submit({
	            url: "${dynamicURL}/admin/information/info/deleteInformation",
	            data:{
	                "ids": row.id
	            },
	            butObj : null,
	            success: function(res) {
	                if (res.success) {
	                	layer.alert('删除成功！', {icon: 1});
	                    $('#informationDatagrid').datagrid("reload");
	                } else {
	                	layer.alert(res.msg, {icon: 0});
	                }
	            }
	          	});
    	}
    } else {
    	layer.alert('请选择要删除的记录！', {icon: 0});
    }
}
//修改
function edit(){
	var row = informationDatagrid.datagrid("getSelected");
	if(row){
		if(row.status != null && row.status == 1){
			layer.alert('已发布，无法修改！', {icon: 0});
		}else{
			var url = '${dynamicURL}/admin/information/info/toEditPage?infoId='+row.id;
			layui.admin.openT("修改资讯",url);
		}
	}else{
		layer.alert('请选择要修改的记录！', {icon: 0});
	}
}
//预览
function show(){
	var row = informationDatagrid.datagrid("getSelected");
	if(row){
		var url = '${dynamicURL}/admin/information/info/toShowPage?infoId='+row.id;
		layui.admin.openT("预览资讯",url);
	}else{
		layer.alert('请选择要预览的记录！', {icon: 0});
	}
}
function send(InfoId){
     $.submit({
         url: "${dynamicURL}/admin/information/info/send",
         data:{
             "InfoId": InfoId
         },
         butObj : null,
         success: function(res) {
             if (res.success) {
             	layer.alert(res.msg, {icon: 1});
                 $('#informationDatagrid').datagrid("reload");
             } else {
             	layer.alert(res.msg, {icon: 0});
             }
         }
     });
}
</script>


