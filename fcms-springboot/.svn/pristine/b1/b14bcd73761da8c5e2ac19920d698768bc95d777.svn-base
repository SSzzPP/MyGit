<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="easyui-layout layout-custom-resize" data-options="fit:true">
	
	<div data-options="region:'north'">
		<div id="queryHeader" style="padding: 10px; width: 100%; line-height: 40px;" class="easyui-panel">
			<form class="form-horizontal" for="matchDataid">
				<table style="width: 1000px; line-height: 40px;">
					<tr>
						<td>赛事标题:</td>
						<td>
							<input id="matchTitle" class="easyui-textbox" type="text" name="search_LIKE_title" style="width: 150px">
						</td>
                        <td colspan="2">
							<div class="BtnLine" style="border: 0px; margin: 0px; padding: 0px; text-align: right">
								<button type="button" class="layui-btn layui-btn queryBtn" iconcls="icon-search" icon-class="search">搜索</button>
								<button type="button" class="layui-btn layui-btn clearBtn" iconcls="icon-reload" icon-class="refresh">重置</button>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div data-options="region:'north',split:false,collapsible:false">
			<div class="card-button">
				<div class="layui-btn-container">
					<button onclick="add()" class="layui-btn layui-btn">新增赛事</button>
					<button onclick="edit()" class="layui-btn">修改</button>
					<button id="del" onclick="del()" class="layui-btn layui-btn">删除</button>
					<button onclick="showProject()"  class="layui-btn layui-btn" iconcls="icon-edit">查看比赛项目</button>
				</div>
			</div>
		</div>
	</div>
	<div data-options="region:'center'">
		<table id="matchDataid"></table>
	</div>
</div>
<script>

var matchDataid;

$(function() {
	matchDataid = $('#matchDataid').datagrid({
        url: '${dynamicURL}/admin/match/main/list?order=desc',
        queryForm: "#queryHeader form",
       	fit : true,
		pagination : true,
		rownumbers : true,
		singleSelect : true,
		lines : true,
        idField: 'id',
        columns: [[
       	{field: 'id',formatter: function Ra(val, row, index) {
				return '<input type="radio" name="selectRadio" id="selectRadio"' + index + '/>';
		}},
        {
            field: 'title',
            title: '赛事标题',
            width: 200,
            align: 'left'
        },
        {
            field: 'endTime',
            title: '报名截止时间',
            align: 'left',
            width: 200,
        },
        {
            field: 'startTime',
            title: '开始时间',
            align: 'left',
            width: 200,
        },
        {
            field: 'matchEnd',
            title: '结束时间',
            align: 'left',
            width: 200,
        },
        {
            field: 'tel',
            title: '咨询电话',
            align: 'left',
            width: 200,
        },
        {
            field: 'location',
            title: '比赛地点',
            align: 'left',
            width: 200,
        },
        {
            field: 'instructions',
            title: '详细说明',
            align: 'left',
            width: 200,
        },
        {
            field: 'status',
            title: '状态',
            align: 'left',
            width: 100,
            formatter: function (value, rec) { 
            	var str = '';
            	if(rec.status != null && rec.status == 1) 
            		str = '<span style="color:green">已发布</span>';
            	if(rec.status != null && rec.status == 0) 
            		str = '<button id="edit" onclick="send('+rec.id+')" class="layui-btn">发布</button>';
            	return str;
            }
        },
        ]],
        onBeforeLoad:function(){
        	return true;// isLoad;
        },
        onClickRow : function(rowIndex, rowData) {
			//加载完毕后获取所有的checkbox遍历
			var radio1 = $("input[type='radio']")[rowIndex].disabled;
			//如果当前的单选框不可选，则不让其选中
			if (radio1 != true) {
				//让点击的行单选按钮选中
				$("input[type='radio']")[rowIndex].checked = true;
				return false;
			} else {
				$("#matchDataid").datagrid("clearSelections");
				$("input[type='radio']")[rowIndex].checked = false;
				return false;
			}
		},
		onDblClickRow : function(index) {
			edit();
		},
    });
    $("form[for] button.queryBtn").on("click.datagrid-query", function() {
        top._search($(this).parents("form[for]"));
    });
    $("form[for] button.clearBtn").on("click.datagrid-query",function() {
    	$("#matchTitle").textbox('setValue','');
    	$("#matchStartTime").textbox('setValue','');
        top._clearSearch($(this).parents("form"));
    });
});


function add () {
	parent._layer({
        url: '${dynamicURL}/admin/match/main/toMatchAdd',
        title: "新增赛事",
        width:'600px',
        height:'600px',
        btn: ['保存', '取消']
    },
    {
        yes: function(index, layero) {
        	var bObj = layero.find("a.layui-layer-btn0");
            var frm = parent.$("#layui-layer-iframe" + parent.ixs["新增赛事"]).contents().find("form.addForm");
            $.submit({
	            url: "${dynamicURL}/admin/match/main/save",
	            formTg : frm,
	            butObj : bObj,
	            success : function(res){
	            	if(res.success){
		            	$('#matchDataid').datagrid('reload');
		            	layer.alert('保存成功！', {icon: 1});
		            	parent.layer.close(parent.parent.ixs["新增赛事"]);
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
        	parent.layer.close(parent.parent.ixs["新增赛事"]);
        }
    }); 
}

function edit() {
	var row = matchDataid.datagrid("getSelected");
	if (row) {
		if (row.status == 0){
			parent._layer({
		        url: '${dynamicURL}/admin/match/main/toMatchAdd?matchId='+row.id,
		        title: "修改赛事",
		        width:'600px',
		        height:'600px',
		        btn: ['保存', '取消']
		    },
		    {
		        yes: function(index, layero) {
		        	var bObj = layero.find("a.layui-layer-btn0");
		            var frm = parent.$("#layui-layer-iframe" + parent.ixs["修改赛事"]).contents().find("form.addForm");
		            $.submit({
			            url: "${dynamicURL}/admin/match/main/save",
			            formTg : frm,
			            butObj : bObj,
			            success : function(res){
			            	if(res.success){
				            	$('#matchDataid').datagrid('reload');
				            	layer.alert('保存成功！', {icon: 1});
				            	parent.layer.close(parent.parent.ixs["修改赛事"]);
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
		        	parent.layer.close(parent.parent.ixs["修改赛事"]);
		        }
		    }); 
		} else {
			layer.alert('已发布不能进行修改', {icon: 0});
		}
		
	} else {
		layer.alert('请选择要修改的记录！', {icon: 0});
	}
}

function del() {
	var row = matchDataid.datagrid("getSelected");
	if (row) {
		var content = '您要删除当前所选记录？';
		if (row.status == 1){
			layer.alert('已发布不能删除！', {icon: 0});
		} else {
			parent.layer.alert(content,{ btn: ['确定','取消']}, function (data) {
	            if (data) {
	           	 	$.submit({
	                    url: "${dynamicURL}/admin/match/main/delete",
	                    data: {"ids": row.id},
	                    success: function (data) {
	                   	 	if(data.success){
	                   	 	parent.layer.alert('删除成功！', {
				       	        icon: 1,
				       	        skin: 'layer-ext-moon' 
				       	    });
	                   	 		matchDataid.datagrid('reload');
	                   	 	}else{
	                   	 	parent.layer.alert('删除失败！', {
				       	        icon: 0,
				       	        skin: 'layer-ext-moon' 
				       	    });
	                   	 	}
	                    }
	                });
	            }
	        });
		}
	} else {
		layer.alert('请选择要删除的记录！', {icon: 0});
	}
}
//发布
function send (matchId) {
	$.submit({
		url: "${dynamicURL}/admin/match/main/sendMatch",
		data: "matchId="+matchId,
		success: function (data) {
			if (data.success) {
				layer.alert('发送成功！', {icon: 1});
				 $('#matchDataid').datagrid("reload");
			} else {
				layer.alert('发送失败！', {icon: 0});
			}
		}
	})
}
//查看比赛项目
function showProject() {
	var row = matchDataid.datagrid("getSelected");
	if (row) {
		layui.admin.openT("查看比赛项目" , '${dynamicURL}/match/mainproject/toMatchProject?matchId='+row.id);
	} else {
		layer.alert('请选择要查看的记录！', {icon: 0});
	}
}
</script>