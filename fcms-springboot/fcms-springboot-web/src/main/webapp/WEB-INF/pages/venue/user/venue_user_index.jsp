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
					<button id="reset" onclick="resetPwd()" class="layui-btn layui-btn">重置密码</button>
				</div>
			</div>
		</div>
		<div data-options="region:'center'" border="false">
			<div style="width: 100%; padding: 10px 15px;"
				 class="easyui-layout layout" fit="true">
				<table id="venueUserDatagrid"></table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
//分页
var venueUserDatagrid;
$(function() {
    /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
    venueUserDatagrid = $('#venueUserDatagrid').datagrid({
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
            {field: 'loginName', title: '登录名', width: '10%', align: 'center', sortable: true},
            {field: 'name', title: '用户名', width: '10%', align: 'center', sortable: true},
            {field: 'sex', title: '性别', width: '5%', align: 'center', sortable: true, formatter: function (value, rec) { return rec.sex==0?'男':'女';}},
            {field: 'birthday', title: '生日', width: '10%', align: 'center', sortable: true},
            {field: 'mobile', title: '电话号码', width: '10%', align: 'center', sortable: true},
            {field: 'email', title: '邮箱', width: '10%', align: 'center', sortable: true},
            {field: 'venueName', title: '健身场馆', width: '10%', align: 'center', sortable: true},
            {field: 'type', title: '类型', width: '10%', align: 'center', sortable: true, 
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
            {field: 'status', title: '状态', width: '5%', align: 'center', sortable: true, 
            	formatter: function (value, rec) { 
            		if(rec.type == 0){
	            		return rec.status==0?'正常':'离职';
            		}else if(rec.type == 1){
	            		return rec.status==0?'未认证':'已认证';
            		}
            		return null;
            	}
            },
            {field: 'coachingTypeName', title: '教练类型', width: '10%', align: 'center', sortable: true},
            {field: 'experience', title: '个人经历', width: '10%', align: 'center', sortable: true},
            {field: 'operation', title: '操作', width: '10%', align: 'center', sortable: true,
            	formatter: function Ra(val, row, index) {
            		var str = '';
                	if(row.type == 1 ){
    					str = '<button lay-href="${dynamicURL}/admin/venue/user/record/toRecordDetail?venueUserId='+row.id+'" class="layui-btn layui-btn-sm" >查看履历</button>';
                	}
                	return str;
                }	
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
	    url: '${dynamicURL}/admin/venue/user/add',
	    title: "新增场馆人员",
	    width:'600px',
	    height:'600px',
	    btn: ['保存', '取消']
	},
	{
	    yes: function(index, layero) {
	    	var bObj = layero.find("a.layui-layer-btn0");
	        var frm = parent.$("#layui-layer-iframe" + parent.ixs["新增场馆人员"]).contents().find("form.addForm");
	        $.submit({
	            url: "${dynamicURL}/admin/venue/user/saveInfo",
	            formTg:frm,
	            butObj : bObj,
	            cache: false,
	            success : function(res){
	            	if(res.success){
	            		$('#venueUserDatagrid').datagrid('reload');
	    	         	layer.alert('保存成功！', {icon: 1});
	    	         	parent.layer.close(parent.parent.ixs["新增场馆人员"]);
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
	    	parent.layer.close(parent.parent.ixs["新增场馆人员"]);
	    }
	}); 
}
/*修改*/
function edit() {
	var row = venueUserDatagrid.datagrid("getSelected");
	if(row){
		parent._layer({
	        url: '${dynamicURL}/admin/venue/user/add?id='+row.id,
	        title: "修改场馆人员",
	        width:'600px',
	        height:'600px',
	        btn: ['保存', '取消']
	    },
	    {
	        yes: function(index, layero) {
	        	var bObj = layero.find("a.layui-layer-btn0");
	            var frm = parent.$("#layui-layer-iframe" + parent.ixs["修改场馆人员"]).contents().find("form.addForm");
	            $.submit({
		            url: "${dynamicURL}/admin/venue/user/saveInfo",
		            formTg:frm,
		            butObj : bObj,
		            success : function(res){
		            	if(res.success){
			            	$('#venueUserDatagrid').datagrid('reload');
			            	layer.alert('保存成功！', {icon: 1});
			            	parent.layer.close(parent.parent.ixs["修改场馆人员"]);
		            	}else{
		            		layer.alert('操作失败', {icon: 0});
		            	}
		            },
	           	});
	        },
	        btn2: function(index, layero) {
	        	parent.layer.close(parent.parent.ixs["修改场馆人员"]);
	        }
	    }); 
	}else{
		layer.alert('请选择要修改的记录！', {icon: 0});
	}
}

/*删除*/
function del() {
    var row = venueUserDatagrid.datagrid("getSelected");
    if (row) {
        $.submit({
            url: "${dynamicURL}/admin/venue/user/deleteInfo",
            data:{
                "ids": row.id
            },
            butObj : null,
            success: function(res) {
                if (res.success) {
                	layer.alert('删除成功！', {icon: 1});
                    $('#venueUserDatagrid').datagrid("reload");
                } else {
                	layer.alert(res.msg, {icon: 0});
                }
            }
          	});
    } else {
    	layer.alert('请选择要删除的记录！', {icon: 0});
    }
}
// 重置密码
function resetPwd() {
    var row = venueUserDatagrid.datagrid("getSelected");
    if (row) {
    	parent.layer.alert("您确定要重置该用户密码吗？", function (data) {
             if (data) {
            	 $.submit({
                     url: "${dynamicURL}/admin/venue/user/resetPwd",
                     data: {id: row.id},
                     success: function (data) {
                    	 parent.layer.alert(data.msg, {icon: 1});
                     }
                 });
             }
         });
    } else {
    	parent.layer.alert('请选择要密码重置的记录！');
    }
}
</script>


