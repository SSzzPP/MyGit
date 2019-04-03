<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ taglib prefix="security" uri="/tld/security.tld" %> --%>
<div class="padd15 easyui-layout" data-options="fit:true">
	<div class="easyui-layout layout-custom-resize" data-options="fit:true">
		<div data-options="region:'center'" border="false">
			<div style="width: 100%; padding: 10px 15px;"
				 class="easyui-layout layout" fit="true">
				<table id="wordsDatagrid"></table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
//分页
var wordsDatagrid;
$(function() {
    /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
    wordsDatagrid = $('#wordsDatagrid').datagrid({
    	url: '${dynamicURL}/admin/sensitive/view/list?search_LIKE_content=${content}',
        queryForm: "#queryHeader form",//列筛选时附带加上搜索表单的条件
        fit:true,
        pagination : true,
		rownumbers : true,
		singleSelect : true,
		lines:true,
		idField : 'id',
        columns: [
            [
                {field: 'id', checkbox: true,width:'2%'},
                {field: 'content', title: '内容',width:'33%', sortable: true,align:'left'},
                {field: 'venueName', title: '场馆',width:'33%', sortable: true,align:'left'},
                {field: 'type', title: '模块',width:'32%', sortable: true,align:'left',
                	formatter: function (value, rec) { 
                		return rec.type == 0?'场馆评价':'场馆投诉';
                	}	
                }
            ]
        ],
        onDblClickRow: function(index) {
        }

    });
});
</script>


