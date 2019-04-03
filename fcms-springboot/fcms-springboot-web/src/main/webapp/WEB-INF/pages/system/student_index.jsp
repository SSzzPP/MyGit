<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="padd15 easyui-layout" data-options="fit:true">
	<div class="easyui-layout layout-custom-resize" data-options="fit:true">
		<div data-options="region:'north',split:false,collapsible:false">
			<div class="card-button">
				<div class="layui-btn-container">
					<button id="add" onclick="add()" class="layui-btn layui-btn">增加</button>
					<button id="edit" onclick="edit()" class="layui-btn">修改</button>
					<button id="del" onclick="del()" class="layui-btn layui-btn">删除</button>
					<div class="layui-btn-container" style="float:right;">
						<form class="form-horizontal" for="studentDatagrid">
							<table class="table_edit" style="text-align: center;">
								<tbody>
									<tr>
										<td class="text_tr">姓名：&nbsp;&nbsp;</td>
						    			<td>
						        			<input class="easyui-textbox" id="name" name="search_LIKE_name" style="width: 80px; height: 26px;color: #666;background-color: #fefefe;border-color:rgba(102, 102, 102, 0.33);" >
						  				</td>
						  				<td class="text_tr">&nbsp;&nbsp;&nbsp;&nbsp;性别：&nbsp;&nbsp;</td>
						    			<td>
						        			<select class="easyui-combobox" id="sex" name="search_LIKE_sex" style="width: 60px; height: 26px;color: #666;background-color: #fefefe;border-color:rgba(102, 102, 102, 0.33);" >
						            			<option value="-1"></option>
						            			<option value="0">男</option>
						            			<option value="1">女</option>
						        			</select>
						  				</td>
						    			<td class="text_tr">&nbsp;&nbsp;&nbsp;&nbsp;年级名称：&nbsp;&nbsp;</td>
						    			<td>
						        			<input class="easyui-combobox" id="gradeId" name="search_EQ_gradeId" style="width: 80px; height: 26px;color: #666;background-color: #fefefe;border-color:rgba(102, 102, 102, 0.33);" >
						  				</td>
						  				<td class="text_tr">&nbsp;&nbsp;&nbsp;&nbsp;班级名称：&nbsp;&nbsp;</td>
						  				<td>
						      				<input class="easyui-combobox" id="classId" name="search_EQ_classId" style="width: 70px; height: 26px;color: #666;background-color: #fefefe;border-color:rgba(102, 102, 102, 0.33);" >
						  				</td>
						  				<td>
						  					&nbsp;&nbsp;<button id="search" type="button" class="layui-btn queryBtn">搜索</button>
						  					<button id="reset" type="button" class="layui-btn clearBtn">重置</button>
										</td>
									</tr>
		            			</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div data-options="region:'center'" border="false">
			<div style="width: 100%; padding: 10px 15px;"
				 class="easyui-layout layout" fit="true">
				<table id="studentDatagrid"></table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
//分页
var studentDatagrid;
$(function() {
    /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
    studentDatagrid = $('#studentDatagrid').datagrid({
        url: '${dynamicURL}/admin/system/student/list',
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
            title: '姓名',
            width: '10%',
            align: 'left'
        },
        {
            field: 'sex',
            title: '性别',
            align: 'left',
            width: '10%',
            formatter: function (value, rec) {
            	return rec.sex==0?'男':'女';
            }
        },
        {
            field: 'age',
            title: '年龄',
            align: 'left',
            width: '13%',
        },
        {
            field: 'tel',
            title: '手机号',
            align: 'left',
            width: '15%',
        },
        {
            field: 'birthday',
            title: '出生日期',
            align: 'left',
            width: '10%',
        },
        {
            field: 'address',
            title: '地址',
            align: 'left',
            width: '10%',
        },
        {
            field: 'position',
            title: '职位',
            align: 'left',
            width: '10%',
        },
        {
            field: 'gradeStudent',
            title: '年级',
            align: 'left',
            width: '10%',
        },
        {
            field: 'classStudent',
            title: '班级',
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
	    url: '${dynamicURL}/admin/system/student/add',
	    title: "新增学生",
	    width:'600px',
	    height:'600px',
	    btn: ['保存', '取消']
	},
	{
	    yes: function(index, layero) {
	    	var bObj = layero.find("a.layui-layer-btn0");
	        var frm = parent.$("#layui-layer-iframe" + parent.ixs["新增学生"]).contents().find("form.addForm");
	        $.submit({
	            url: "${dynamicURL}/admin/system/student/save",
	            formTg:frm,
	            butObj : bObj,
	            cache: false,
	            success : function(res){
	            	if(res.success){
	            		$('#studentDatagrid').datagrid('reload');
	    	         	layer.alert('保存成功！', {icon: 1});
	    	         	parent.layer.close(parent.parent.ixs["新增学生"]);
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
	    	parent.layer.close(parent.parent.ixs["新增学生"]);
	    }
	}); 
}
/*删除*/
function del() {
    var row = studentDatagrid.datagrid("getSelected");
    if (row) {  	
    	//删除询问框
    	layer.confirm('是否删除？', {
    	  btn: ['确定','取消'] //按钮
    	}, function(){
    		$.submit({
                url: "${dynamicURL}/admin/system/student/deleteInfo",
                data:{
                    "ids": row.id
                },
                butObj : null,
                success: function(res) {
                    if (res.success) {
                    	layer.alert('删除成功！', {icon: 1});
                        $('#studentDatagrid').datagrid("reload");
                    } else {
                    	layer.alert(res.msg, {icon: 0});
                    }
                }
           });
    	});
    } else {
    	layer.alert('请选择要删除的记录！', {icon: 0});
    }
}
/*修改*/
function edit() {
	var row = studentDatagrid.datagrid("getSelected");
	if(row){
		parent._layer({
	        url: '${dynamicURL}/admin/system/student/add?id='+row.id,
	        title: "修改学生",
	        width:'600px',
	        height:'600px',
	        btn: ['保存', '取消']
	    },
	    {
	        yes: function(index, layero) {
	        	var bObj = layero.find("a.layui-layer-btn0");
	        	var frm = parent.$("#layui-layer-iframe" + parent.ixs["修改学生"]).contents().find("form.addForm");
	           /*  	
	           		var validator=frm.validate(rulesMsgs);
	            	var valid=validator.form();
	            */
	        	$.submit({
		            url: "${dynamicURL}/admin/system/student/save",
		            formTg:frm,
		            butObj : bObj,
		            success : function(res){
		            	if(res.success){
			            	$('#studentDatagrid').datagrid('reload');
			            	layer.alert('保存成功！', {icon: 1});
			            	parent.layer.close(parent.parent.ixs["修改学生"]);
		            	}else{
		            		layer.alert('操作失败', {icon: 0});
		            	}
		            },
	           	});
	        },
	        btn2: function(index, layero) {
	        	parent.layer.close(parent.parent.ixs["修改学生"]);
	        }
	    }); 
	}else{
		layer.alert('请选择要修改的记录！', {icon: 0});
	}
}

var gradeId = "${entity.gradeId}";
$(function() {  
	$('#gradeId').combobox({
		valueField : 'id',
		textField : 'name',
		multiple: false, 
		url : '${dynamicURL}/admin/system/grade/search',
		onLoadSuccess:function(data){
			if(gradeId){
				$("#gradeId").combobox('setValue',gradeId);
			}
		},
		onSelect: function(rec){    
			//console.log(rec);
            $('#classId').combobox('reload', '${dynamicURL}/admin/system/class/search?search_EQ_gradeId='+rec.id);    
        }
	});
}); 

var classId = "${entity.classId}";
$(function() { 
	$('#classId').combobox({
		valueField : 'id',
		textField : 'name',
		multiple: false, 
		url : '${dynamicURL}/admin/system/class/search',
		onLoadSuccess:function(data){
			if(classId){
				$("#classId").combobox('setValue',classId);
			}
		}
	});
});
</script>