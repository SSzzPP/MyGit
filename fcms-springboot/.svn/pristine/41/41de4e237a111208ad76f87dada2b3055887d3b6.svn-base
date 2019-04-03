<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ taglib prefix="security" uri="/tld/security.tld" %> --%>
<div class="padd15 easyui-layout" data-options="fit:true">
	<div class="easyui-layout layout-custom-resize" data-options="fit:true">
		<div data-options="region:'north',split:false,collapsible:false">
			<div class="card-button">
				<div class="layui-btn-container">
					<button onclick="showLine()" class="layui-btn">查看路线</button>
				</div>
			</div>
		</div>
		<div data-options="region:'center'" border="false">
			<div style="width: 100%; padding: 10px 15px;"
				 class="easyui-layout layout" fit="true">
				<table id="checkListDatagrid"></table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
//分页
var checkListDatagrid;
var depCom;
var company;
var $parent=$(parent);
$(function() {
    /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
    checkListDatagrid = $('#checkListDatagrid').datagrid({
    	url: '${dynamicURL}/admin/checklistbill/list?sort=gmtCreate&order=desc',
        queryForm: "#queryHeader form",//列筛选时附带加上搜索表单的条件
        fit:true,
        pagination : true,
		rownumbers : true,
		singleSelect : true,
		lines:true,
		idField : 'id',
        columns: [
            [
                {field: 'id', checkbox: true,width:'5%'},
                /* {field: 'billType', title: '单据类型',width:'20%', sortable: true,align:'left'}, */
                {field: 'billDate', title: '检查单日期',width:'20%', sortable: true,align:'left'},
                {field: 'status', title: '状态',width:'20%', sortable: true,align:'left',
                	formatter: function (value, rec) { 
                    	return rec.status == 0?'检查中':'检查完成';
                    }	
                }, 
                {field: 'remark', title: '检查详情',width:'20%', sortable: true,align:'left'},
                /* {field: 'instruction', title: '指令说明',width:'20%', sortable: true,align:'left'}, */
                {field: 'settingUserName', title: '指令派发人',width:'20%', sortable: true,align:'left',
                	formatter: function (value, rec) { 
                		if(rec.type == 0)
                			return '自己创建';
                		else if(rec.type == 1)
                    		return rec.settingUserName;
                    }
                },
               /*  {field: 'createUserName', title: '检查人',width:'20%', sortable: true,align:'left'},
                {field: 'finishDate', title: '检查截止时间',width:'20%', sortable: true,align:'left'},
                {field: 'actualFinishTime', title: '实际完成时间',width:'20%', sortable: true,align:'left'}, */
                {field: 'billNo', title: '编号',width:'20%', sortable: true,align:'left'},
                {field: 'periodTypeWrapper', title: '周期类型',width:'20%', sortable: true,align:'left'},
                {field: 'areaName', title: '负责区域',width:'20%', sortable: true,align:'left'}
            ]
        ]

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
//查看路线
function showLine(){
	var row = checkListDatagrid.datagrid("getSelected");
	if(row){
		var url = '${dynamicURL}/admin/checklistbill/toShowPage?uuid='+row.uuid;
		layui.admin.openT("查看巡查路线",url);
	}else{
		layer.alert('请选择查看路线要的记录！', {icon: 0});
	}
}
</script>
