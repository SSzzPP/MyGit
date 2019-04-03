<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ taglib prefix="security" uri="/tld/security.tld" %> --%>
<div class="padd15 easyui-layout" data-options="fit:true">
	<div class="easyui-layout layout-custom-resize" data-options="fit:true">
		<div data-options="region:'center'" border="false">
			<div style="width: 100%; padding: 10px 15px;"
				 class="easyui-layout layout" fit="true">
				<table id="userChainDatagrid"></table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
//分页
var userChainDatagrid;
$(function() {
    /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
    userChainDatagrid = $('#userChainDatagrid').datagrid({
        url: '${dynamicURL}/admin/venue/user/list',
        queryForm: "#queryHeader form",
        //列筛选时附带加上搜索表单的条件
       	fit: true,
        pagination: true,
        rownumbers: true,
        singleSelect: true,
        lines: true,
        idField: 'id',
        columns: [[
            {field: 'loginName', title: '登录名', width: '20%', align: 'left', sortable: true},
            {field: 'name', title: '用户名', width: '10%', align: 'left', sortable: true},
            {field: 'venueName', title: '健身场馆', width: '20%', align: 'left', sortable: true},
            {field: 'type', title: '类型', width: '10%', align: 'left', sortable: true, 
            	formatter: function (value, rec) { 
            		if(rec.type==0)
            			return '管理';
            		else if(rec.type==1)
            			return '教练';
            		else if(rec.type==2)
            			return '普通用户';
            		else if(rec.type==3)
            			return '体育局工作人员';
            	}
            },
            {field: 'blockChainAddress', title: '钱包地址', width: '25%', align: 'left', sortable: true},
            {field: 'blockChainTotal', title: '用户积分', width: '15%', align: 'left', sortable: true},
            
		]],
		onDblClickRow: function(index) {
		    Detail();
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
function Detail() {
	var row = userChainDatagrid.datagrid("getSelected");
	if(row){
		parent._layer({
	        url: '${dynamicURL}/admin/user/blockChain/toDetail?uuid='+row.uuid,
	        title: "交易详情",
	        width:'600px',
	        height:'600px',
	        btn: ['关闭']
	    },
	    {
	        yes: function(index, layero) {
	        	parent.layer.close(parent.parent.ixs["交易详情"]);
	        }
	    }); 
	}else{
		layer.alert('请选择要查看的记录！', {icon: 0});
	}
}

</script>


