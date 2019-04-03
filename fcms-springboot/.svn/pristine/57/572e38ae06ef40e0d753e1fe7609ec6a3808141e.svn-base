<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ taglib prefix="security" uri="/tld/security.tld" %> --%>
<!-- 健身路径列表页 -->
<div class="padd15 easyui-layout" data-options="fit:true">
	<div class="easyui-layout layout-custom-resize" data-options="fit:true">
		<div data-options="region:'north',split:false,collapsible:false">
			<div id="queryHeader" style="padding: 10px;  line-height: 40px;" class="easyui-panel">
				<form class="form-horizontal" for="venueDatagrid">
					<table style="width: 800px; line-height: 40px;" >
						<tr>
							<td>名称:</td>
							<td>
								<input class="easyui-textbox" type="text" name="search_LIKE_name" style="width: 150px; height: 26px">
							</td>
							<td>位置:</td>
							<td>
								<input class="easyui-textbox" type="text" name="search_LIKE_location" style="width: 150px; height: 26px">
							</td>
							<td>
								<div class="card-button">
									<div class="layui-btn-container">
										<button id="search" type="button" class="layui-btn queryBtn">搜索</button>
										<button id="reset" type="button" class="layui-btn clearBtn">重置</button>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="card-button">
				<div class="layui-btn-container">
					<button id="add" onclick="add()" class="layui-btn layui-btn">增加</button>
					<button id="edit" onclick="edit()" class="layui-btn">修改</button>
					<button id="del" onclick="del()" class="layui-btn layui-btn">删除</button>
					<button id="editInfo" onclick="editInfo()" class="layui-btn layui-btn">设置经纬度</button>
				</div>
			</div>
		</div>
		<div data-options="region:'center'" border="false">
			<div style="width: 100%; padding: 10px 15px;"
				 class="easyui-layout layout" fit="true">
				<table id="venueDatagrid"></table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
//分页
var venueDatagrid;
var depCom;
var company;
var $parent=$(parent);
$(function() {
    /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
    venueDatagrid = $('#venueDatagrid').datagrid({
    	url: '${dynamicURL}/admin/venue/equipment/type/list?sort=sortNumber&order=desc&search_EQ_publicFlag=0',
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
                {field: 'name', title: '名称',width:'13%', sortable: true,align:'left'},
                {field: 'typeName', title: '分类',width:'10%', sortable: true,align:'left'},
                {field: 'num', title: '数量',width:'10%', sortable: true},
                {field: 'modeName', title: '运营模式',width:'10%', sortable: true},
                {field: 'publicFlag', title: '是否公共',width:'10%', sortable: true,align:'left', 
                	formatter: function (value, rec) { 
                		return rec.publicFlag == 0 ? '是' : '否';
                	}
                },
                {field: 'location', title: '位置',width:'10%', sortable: true},
                {field: 'lng', title: '百度地图经度',width:'10%', sortable: true},
                {field: 'lat', title: '百度地图纬度',width:'10%', sortable: true},
                {
		            field: 'operation',
		            title: '操作',
		            align: 'left',
		            width: '20%',
		            formatter: function Ra(val, row, index) {
		            	return '<a lay-href="${dynamicURL}/admin/venue/equipment/type/toPubEquipTabs?id='+row.id+'"><button class="layui-btn">详情</button></a>';
		            }
		        }
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
        name: "请输入设施名称",
    }
}
/*添加*/
function add() {
	parent._layer({
        url: '${dynamicURL}/admin/venue/equipment/type/addPub',
        title: "新增设施",
        width:'600px',
        height:'600px',
        btn: ['保存', '取消']
    },
    {
        yes: function(index, layero) {
        	var bObj = layero.find("a.layui-layer-btn0");
            var frm = parent.$("#layui-layer-iframe" + parent.ixs["新增设施"]).contents().find("form.addForm");
            $.submit({
	            url: "${dynamicURL}/admin/venue/equipment/type/saveVenue",
	            formTg:frm,
	            butObj : bObj,
	            cache: false,
	            success : function(res){
	            	if(res.success){
		            	$('#venueDatagrid').datagrid('reload');
		            	layer.alert('保存成功！', {icon: 1});
		            	parent.layer.close(parent.parent.ixs["新增设施"]);
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
        	parent.layer.close(parent.parent.ixs["新增设施"]);
        }
    }); 
}
/*修改*/
function edit() {
	var row = venueDatagrid.datagrid("getSelected");
	if(row){
		parent._layer({
	        url: '${dynamicURL}/admin/venue/equipment/type/addPub?id='+row.id,
	        title: "修改设施",
	        width:'600px',
	        height:'600px',
	        btn: ['保存', '取消']
	    },
	    {
	        yes: function(index, layero) {
	        	var bObj = layero.find("a.layui-layer-btn0");
	            var frm = parent.$("#layui-layer-iframe" + parent.ixs["修改设施"]).contents().find("form.addForm");
	            $.submit({
		            url: "${dynamicURL}/admin/venue/equipment/type/saveVenue",
		            formTg:frm,
		            butObj : bObj,
		            success : function(res){
		            	if(res.success){
			            	$('#venueDatagrid').datagrid('reload');
			            	layer.alert('保存成功！', {icon: 1});
			            	parent.layer.close(parent.parent.ixs["修改设施"]);
		            	}else{
		            		layer.alert('操作失败', {icon: 0});
		            	}
		            },
	           	}); 
	        },
	        btn2: function(index, layero) {
	        	parent.layer.close(parent.parent.ixs["修改设施"]);
	        }
	    }); 
	}else{
		layer.alert('请选择要修改的记录！', {icon: 0});
	}
}

/*删除*/
function del() {
    var row = venueDatagrid.datagrid("getSelected");
    if (row) {
        $.submit({
            url: "${dynamicURL}/admin/venue/equipment/type/deleteInfo",
            data:{
                "ids": row.id
            },
            butObj : null,
            success: function(res) {
                if (res.success) {
                	layer.alert('删除成功！', {icon: 1});
                    $('#venueDatagrid').datagrid("reload");
                } else {
                	layer.alert(res.msg, {icon: 0});
                }
            }
          	});
    } else {
    	layer.alert('请选择要删除的记录！', {icon: 0});
    }
}
/*修改*/
function editInfo() {
	var row = venueDatagrid.datagrid("getSelected");
	if(row){
		parent._layer({
	        url: '${dynamicURL}/admin/venue/equipment/type/toEditInfo?id='+row.id,
	        title: "设置经纬度",
	        width:'600px',
	        height:'600px',
	        btn: ['保存', '取消']
	    },
	    {
	        yes: function(index, layero) {
	        	var bObj = layero.find("a.layui-layer-btn0");
	            var frm = parent.$("#layui-layer-iframe" + parent.ixs["设置经纬度"]).contents().find("form.addForm");
	            $.submit({
		            url: "${dynamicURL}/admin/venue/equipment/type/updateInfo",
		            formTg:frm,
		            butObj : bObj,
		            success : function(res){
		            	if(res.success){
			            	$('#venueDatagrid').datagrid('reload');
			            	layer.alert('保存成功！', {icon: 1});
			            	parent.layer.close(parent.parent.ixs["设置经纬度"]);
		            	}else{
		            		layer.alert('操作失败', {icon: 0});
		            	}
		            },
	           	}); 
	        },
	        btn2: function(index, layero) {
	        	parent.layer.close(parent.parent.ixs["修改设施"]);
	        }
	    }); 
	}else{
		layer.alert('请选择要修改的记录！', {icon: 0});
	}
}
</script>


