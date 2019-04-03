<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ taglib prefix="security" uri="/tld/security.tld" %> --%>
<div class="padd15 easyui-layout" data-options="fit:true">
	<div class="easyui-layout layout-custom-resize" data-options="fit:true">
		<div data-options="region:'center'" border="false">
			<div style="width: 100%; padding: 10px 15px;"
				 class="easyui-layout layout" fit="true">
				<table id="coachCertificateDatagrid"></table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
//分页
var coachCertificateDatagrid;
$(function() {
    /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
    coachCertificateDatagrid = $('#coachCertificateDatagrid').datagrid({
        url: '${dynamicURL}/admin/coach/certificate/list',
        //列筛选时附带加上搜索表单的条件
       	fit: true,
        pagination: true,
        rownumbers: true,
        singleSelect: true,
        lines: true,
        idField: 'id',
        columns: [[
        	{field: 'gmtCreate', title: '申请时间', width: '10%', align: 'center', sortable: true},
            {field: 'realName', title: '真实姓名', width: '10%', align: 'center', sortable: true},
            {field: 'certificateType', title: '认证类型', width: '10%', align: 'center', sortable: true, 
            	formatter: function (value, rec) { 
            		if(rec.certificateType==0)
            			return '场馆管理认证';
            		else if(rec.certificateType==1)
            			return '教练认证';
            	}
            },
            {field: 'mobile', title: '电话号码', width: '10%', align: 'center', sortable: true},
            {field: 'venueName', title: '健身场馆', width: '20%', align: 'center', sortable: true},
            {field: 'teachStart', title: '从教时间', width: '10%', align: 'center', sortable: true},
            {field: 'achievement', title: '成就与荣誉', width: '15%', align: 'center', sortable: true},
            {field: 'status', title: '认证状态', width: '10%', align: 'center', sortable: true, 
            	formatter: function (value, rec) { 
            		if(rec.status==0)
            			return '等待审核';
            		else if(rec.status==1)
            			return '认证成功';
            		else if(rec.status==2)
            			return '认证失败';
            	}
            },
            {field: 'operation', title: '操作', width: '15%', align: 'center', sortable: true,
            	formatter: function Ra(val, row, index) {
            		var str = '';
                	if(row.status == 0 ){
                		str = '<button id="pass" onclick="editStatus('+row.id+',1)" class="layui-btn layui-btn-sm">通过</button>';
                		str += '<button id="reject" onclick="editStatus('+row.id+',2)" class="layui-btn layui-btn-sm">否决</button>';
                	}else{
                		str = '<span>审核完成</span>';
                	}
                	return str;
                }	
            }
		]],
    });
});
function editStatus(id,type){
	 $.submit({
         url: "${dynamicURL}/admin/coach/certificate/editStatus",
         data:{
             "id": id,
             "type":type
         },
         butObj : null,
         success: function(res) {
             if (res.success) {
             	layer.alert(res.msg, {icon: 1});
                 $('#coachCertificateDatagrid').datagrid("reload");
             } else {
             	layer.alert(res.msg, {icon: 0});
             }
         }
     });
}
	



</script>

