<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ taglib prefix="security" uri="/tld/security.tld" %> --%>
<div class="padd15 easyui-layout" data-options="fit:true">
	<div class="easyui-layout layout-custom-resize" data-options="fit:true">
		<div data-options="region:'west'" border="false" style="width: 40%; padding: 10px 15px;">
			<div style="width: 100%; padding: 10px 15px;" class="easyui-layout layout" fit="true">
				<table id="venueDatagrid"></table>
			</div>
		</div>
		<div data-options="region:'east'" border="false" style="width: 60%; padding: 10px 15px;">
				<table class="layui-table static" id="venueAnalysis" style="margin-top:0px">
					<colgroup>
						<col width="25%">
						<col width="25%">
						<col width="25%">
						<col width="25%">
					</colgroup>
				</table>
		</div>
	</div>
</div>
<script type="text/javascript">
//分页
var venueDatagrid;
$(function() {
    /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
    venueDatagrid = $('#venueDatagrid').datagrid({
        url: '${dynamicURL}/admin/venue/analysis/list',
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
            title: '名称',
            width: '100%',
            align: 'left'
        }
        ]],
        onSelect:function(rowIndex, rowData){
			loadAnalysis(rowData.id);
        },
        onLoadSuccess:function(data){
        	//console.log(data.rows[0].id)
        	loadAnalysis(data.rows[0].id);
        }
    });
});

function loadAnalysis(venueId){
	var url = "${dynamicURL}/admin/venue/analysis/findVenueAnalysisData";
		layui.config({
			base: '${staticURL}/layuiadmin/' //静态资源所在路径
		}).use('table', function() {
		var table = layui.table;
		table.render({
			elem : '#venueAnalysis',
			url : "${dynamicURL}/admin/venue/analysis/findVenueAnalysisData?venueId="+venueId,
			page : false,
			cols : [ [ {
				field : 'equipmentName',
				title : '设施名称'
			}, {
				field : 'todayCnt',
				title : '今日'
			}, {
				field : 'weekCnt',
				title : '本周'
			}, {
				field : 'monthCnt',
				title : '本月'
			},

			] ],
			response : {
				statusName : 'code',
				statusCode : 200,
				msgName : 'msg',
				countName : 'total',
				dataName : 'rows'
			}

		});
	});
}
	/* $.submit({
        url: "${dynamicURL}/admin/venue/analysis/findVenueAnalysisData",
        data:{
            "venueId": venueId
        },
        butObj : null,
        success : function(data){
        	var list = data.data;
        	$.each(list,function(index){
        		var dto = list[index];
        		var str = '<tr><td>'+dto.equipmentName+'</td><td>'+formatNumber(dto.todayCnt)+'</td><td>'+formatNumber(dto.weekCnt)+'</td><td>'+formatNumber(dto.monthCnt)+'</td></tr>';
        		$("#tbody").append(str);
        	})
        },
   	}); */

/* function formatNumber(cnt){
	if(cnt == null)
		return 0;
	else
		return cnt;
} */
</script>


