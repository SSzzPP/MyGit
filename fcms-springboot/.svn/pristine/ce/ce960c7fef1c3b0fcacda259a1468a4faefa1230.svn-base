<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ taglib prefix="security" uri="/tld/security.tld" %> --%>
<div class="padd15 easyui-layout" data-options="fit:true">
	<div class="easyui-layout layout-custom-resize" data-options="fit:true">
		<div data-options="region:'north',split:false,collapsible:false" >
			<form class="form-horizontal padd15" for="informationDatagrid">
	       		 <table style="border-collapse: separate; border-spacing: 5px; width: 80%; align: center; border: 0; cellpadding: 0;"cellspacing="0" >
	                <tr>
						<td>标题:</td>
	                 	<td>
	                        <input  class="input-sm col-md-3 pull-left message-search search-white" type="text" name="search_LIKE_title" style="width: 150px;">
	                    </td>
	                    <td>状态:</td>
	                 	<td>
							<select class="search-white" name="search_EQ_status" style="width: 150px" >
								<option value="1">已发布</option>
								<option value="2">待审核</option>
								<option value="3">驳回</option>
							</select>
						</td>
						<td>
							<div class="BtnLine" style="border: 0px; margin: 0px; padding: 0px;text-align:left">
								<button type="button" class="layui-btn layui-btn" id="queryBtn"  icon-class="search" >搜索</button>
								<button type="button" class="layui-btn layui-btn" id="clearBtn" icon-class="refresh" >重置</button>
							</div>
						</td>
	                </tr>
	               </table>
	       	</form>
		</div>
		<div data-options="region:'center'" border="false">
			<div class="card-button">
				<div class="layui-btn-container">
					<button onclick="show()" class="layui-btn">预览</button>
				</div>
			</div>
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
        url: '${dynamicURL}/admin/information/info/list?search_NEQ_status=0',
        queryForm: "#queryHeader form",
		/* 列筛选时附带加上搜索表单的条件 */
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
            width: '20%',
            align: 'left'
        },
        {
            field: 'author',
            title: '作者',
            align: 'left',
            width: '20%',
        },
        {
            field: 'moduleName',
            title: '分类',
            align: 'left',
            width: '20%',
        },
        {
            field: 'status',
            title: '状态',
            align: 'left',
            width: '20%',
            formatter: function (value, rec) { 
            	var str = '';
            	if(rec.status != null && rec.status == 1) 
            		str = '<span style="color:green">已发布</span>';
            	if(rec.status != null && rec.status == 2) 
                	str = '<span style="color:green">待审核</span>&nbsp;&nbsp;<button id="edit" onclick="pass('+rec.id+')" class="layui-btn">通过</button><button id="edit" onclick="reject('+rec.id+')" class="layui-btn">驳回</button>';
               	if(rec.status != null && rec.status == 3) 
               		str = '<span style="color:green">已驳回</span>';
                return str;
            }
        },
        {
            field: 'reason',
            title: '审核意见',
            align: 'left',
            width: '20%'
        }
        ]],
        onDblClickRow: function(index) {
            edit();
        }

    });
    $("form[for] button#queryBtn").on("click.datagrid-query", function () {
		top._search($(this).parents("form[for]"));
	});
	$("form[for] button#clearBtn").on("click.datagrid-query", function () {
		top._clearSearch($(this).parents("form[for]"));
    });
});

function pass(InfoId){
     $.submit({
         url: "${dynamicURL}/admin/information/info/pass",
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
function reject(InfoId){
	parent._layer({
        url: '${dynamicURL}/admin/information/info/toCheckReason?InfoId='+InfoId,
        title: "审核意见",
        width:'600px',
        height:'400px',
        btn: ['保存', '取消']
    },
    {
        yes: function(index, layero) {
        	var bObj = layero.find("a.layui-layer-btn0");
            var frm = parent.$("#layui-layer-iframe" + parent.ixs["审核意见"]).contents().find("form.addForm");
            $.submit({
	            url: "${dynamicURL}/admin/information/info/reject",
	            formTg:frm,
	            butObj : bObj,
	            success : function(res){
	            	if(res.success){
	            		layer.alert(res.msg, {icon: 1});
	                    $('#informationDatagrid').datagrid("reload");
		            	parent.layer.close(parent.parent.ixs["审核意见"]);
	            	}else{
	            		layer.alert('操作失败', {icon: 0});
	            	}
	            },
           	}); 
        },
        btn2: function(index, layero) {
        	parent.layer.close(parent.parent.ixs["审核意见"]);
        }
    });
}
/* 
 *预览
 */
function show(){
	var row = informationDatagrid.datagrid("getSelected");
	if(row){
		var url = '${dynamicURL}/admin/information/info/toShowPage?infoId='+row.id;
		layui.admin.openT("预览资讯",url);
	}else{
		layer.alert('请选择要预览的记录！', {icon: 0});
	}
}
</script>


