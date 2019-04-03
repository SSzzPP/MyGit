<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ taglib prefix="security" uri="/tld/security.tld" %> --%>
<!--监管信息管理  -->
<div class="padd15 easyui-layout" data-options="fit:true">
	<div class="easyui-layout layout-custom-resize" data-options="fit:true">
		<div data-options="region:'center'" border="false">
			<div style="width: 100%; padding: 10px 15px;" class="easyui-layout layout" fit="true">
				<table id="vealuateDatagrid"></table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
//分页
var venueId = '${venueId}';
var vealuateDatagrid;
$(function() {
    /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
    vealuateDatagrid = $('#vealuateDatagrid').datagrid({
        url: '${dynamicURL}/admin/venue/vealuate/list?search_EQ_venueId='+venueId,
        queryForm: "#queryHeader form",
        //列筛选时附带加上搜索表单的条件
        pagination: true,
        rownumbers: true,
        singleSelect: true,
        lines: true,
        idField: 'id',
        columns: [[
            {field: 'content', title: '评价内容', width: '25%', align: 'left', sortable: true},
            {field: 'environmentStar', title: '场馆环境评分', width: '25%', align: 'left', sortable: true},
            {field: 'starLevel', title: '卫生情况评分', width: '25%', align: 'left', sortable: true},
            {field: 'serviceStar', title: '场馆服务评分', width: '25%', align: 'left', sortable: true},
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

</script>


