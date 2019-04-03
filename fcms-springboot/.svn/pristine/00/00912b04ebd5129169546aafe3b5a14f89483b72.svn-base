<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ taglib prefix="security" uri="/tld/security.tld" %> --%>
<div class="padd15 easyui-layout" data-options="fit:true">
	<div class="easyui-layout layout-custom-resize" data-options="fit:true">
		<div data-options="region:'north',split:false,collapsible:false">
			<div class="card-button">
				<div class="layui-btn-container">
					<button id="add" onclick="add()" class="layui-btn layui-btn">增加</button>
					<button id="edit" onclick="edit()" class="layui-btn">修改</button>
					<button id="del" onclick="del()" class="layui-btn layui-btn">删除</button>
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
$(function() {
    /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
    venueDatagrid = $('#venueDatagrid').datagrid({
        url: '${dynamicURL}/admin/venue/info/list',
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
            width: '10%',
            align: 'left'
        },
        {
            field: 'otherName',
            title: '别名',
            align: 'left',
            width: '10%',
        },
        {
            field: 'businessHours',
            title: '营业时间',
            align: 'left',
            width: '12%',
        },
        {
            field: 'location',
            title: '地址',
            align: 'left',
            width: '12%',
        },
        {
            field: 'star',
            title: '星级',
            align: 'left',
            width: '5%',
        },
        {
            field: 'lng',
            title: '经度',
            align: 'left',
            width: '9%',
        },
        {
            field: 'lat',
            title: '纬度',
            align: 'left',
            width: '9%',
        },
        {
            field: 'perCapita',
            title: '人均',
            align: 'left',
            width: '7%',
        },
        {
            field: 'unit',
            title: '所属单位',
            align: 'left',
            width: '9%',
        },
        {
            field: 'administrativeAreaStr',
            title: '所在行政区',
            align: 'left',
            width: '9%',
        },
        {
            field: 'businessAreaStr',
            title: '所在商区',
            align: 'left',
            width: '9%',
        },
        {
            field: 'certificationStatusStr',
            title: '认证状态',
            align: 'left',
            width: '7%',
            
        },
        {
            field: 'creditCode',
            title: '统一社会信用代码',
            align: 'left',
            width: '15%',
        },
        {
            field: 'type',
            title: '分类',
            align: 'left',
            width: '10%',
        },
        {
            field: 'transportationMode',
            title: '交通方式',
            align: 'left',
            width: '10%',
        },
        {
            field: 'equipmentLease',
            title: '器械租赁',
            align: 'left',
            width: '10%',
        },
        {
            field: 'equipmentMaintenance',
            title: '器械维护',
            align: 'left',
            width: '10%',
        },
        {
            field: 'scouringBath',
            title: '洗浴设施',
            align: 'left',
            width: '10%',
        },
        {
            field: 'saleArticle',
            title: '场馆卖品',
            align: 'left',
            width: '10%',
        },
        {
            field: 'invoice',
            title: '发票',
            align: 'left',
            width: '10%',
        },
        {
            field: 'otherServices',
            title: '其他服务',
            align: 'left',
            width: '10%',
        }
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
/*添加*/
function add() {
		parent._layer({
	        url: '${dynamicURL}/admin/venue/info/add',
	        title: "新增场馆",
	        width:'600px',
	        height:'600px',
	        btn: ['保存', '取消']
	    },
	    {
	        yes: function(index, layero) {
	        	var bObj = layero.find("a.layui-layer-btn0");
	            var frm = parent.$("#layui-layer-iframe" + parent.ixs["新增场馆"]).contents().find("form.addForm");
	            // frm.submit();
	            /* $('#venueDatagrid').datagrid('reload');
            	layer.alert('保存成功！', {icon: 1});
            	parent.layer.close(parent.parent.ixs["新增场馆"]); */
	            $.submit({
		            url: "${dynamicURL}/admin/venue/info/saveVenue",
		            formTg : frm,
		            butObj : bObj,
		            success : function(res){
		            	if(res.success){
			            	$('#venueDatagrid').datagrid('reload');
			            	layer.alert('保存成功！', {icon: 1});
			            	parent.layer.close(parent.parent.ixs["新增场馆"]);
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
	        	parent.layer.close(parent.parent.ixs["新增场馆"]);
	        }
	    }); 
}
/*修改*/
function edit() {
	var row = venueDatagrid.datagrid("getSelected");
	if(row){
		parent._layer({
	        url: '${dynamicURL}/admin/venue/info/add?venueId='+row.id,
	        title: "修改场馆",
	        width:'600px',
	        height:'600px',
	        btn: ['保存', '取消']
	    },
	    {
	        yes: function(index, layero) {
	        	var bObj = layero.find("a.layui-layer-btn0");
	            var frm = parent.$("#layui-layer-iframe" + parent.ixs["修改场馆"]).contents().find("form.addForm");
	            $.submit({
		            url: "${dynamicURL}/admin/venue/info/saveVenue",
		            formTg:frm,
		            butObj : bObj,
		            success : function(res){
		            	if(res.success){
			            	$('#venueDatagrid').datagrid('reload');
			            	layer.alert('保存成功！', {icon: 1});
			            	parent.layer.close(parent.parent.ixs["修改场馆"]);
		            	}else{
		            		layer.alert('操作失败', {icon: 0});
		            	}
		            },
	           	});
	        },
	        btn2: function(index, layero) {
	        	parent.layer.close(parent.parent.ixs["修改场馆"]);
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
            url: "${dynamicURL}/admin/venue/info/deleteInfo",
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

</script>


