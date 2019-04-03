<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="padd15 easyui-layout" data-options="fit:true">
	<div data-options="region:'north'">
		<div data-options="region:'north',split:false,collapsible:false" id="queryHeader">
			<form class="form-horizontal" for="projectDataid">
	       		 <table style="border-collapse: separate; border-spacing: 5px; width: 80%; align: center; border: 0; cellpadding: 0;"cellspacing="0" >
	                <tr>
	                    <td>项目名:</td>
	                    <td>
	                        <input class="easyui-textbox" id='topOptions' type="text" name="search_LIKE_name" style="width: 150px">
	                    </td>
						<td>
							<div class="BtnLine" style="border: 0px; margin: 0px; padding: 0px;text-align:left">
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
                   	<button class="layui-btn layui-btn" id="add" onclick="add()" icon-class="add">新增项目</button>
                	<button class="layui-btn layui-btn" id="delete" onclick="del()" icon-class="remove">删除</button>
                	<button class="layui-btn layui-btn" id="search" onclick="search()" iconcls="icon-edit">选择项目</button>
		        </div>
		    </div>
	  	</div>
	</div>
	<div data-options="region:'center'" border="false">
			<div style="width: 100%; padding: 10px 15px;" class="easyui-layout layout" fit="true">
				<table id="projectDataid"></table>
			</div>
	</div>
</div>

<div id="selectProjectWindow" class="easyui-dialog" title="选择项目" style="width: 900px; height: 450px;" modal="true" closed="true">
	<div class="easyui-layout layout" fit="true">
		<div id="container" class="easyui-layout layout" fit="true">
			<div region="north" border="false">
				<div id="queryHeader2" style="padding: 10px; width: 100%; line-height: 40px;" class="easyui-panel">
					<form class="form-horizontal" for="selectProjectDatagrid">
						<table style="width: 700px; line-height: 40px;">
							<tr>
								<td>项目名称:</td>
								<td><input id="nameFormId" class="easyui-textbox" type="text" name="search_LIKE_name" style="width: 150px; height: 26px"></td>
								<td>
									<div class="BtnLine" style="border: 0px; margin: 0p; padding: 0px; text-align: right">
										<button type="button" class="layui-btn layui-btn queryBtn" iconcls="icon-search" icon-class="search" id="btn-addUser-query queryBtn">搜索</button>
										<button type="button" class="layui-btn layui-btn clearBtn" iconcls="icon-reload" icon-class="refresh" id="btn-addUser-clear clearBtn">重置</button>
									</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div region="center" border="false">
				<table id="selectProjectDatagrid"></table>
			</div>
			<div region="south" border="false">
				<div class="BtnLine">
					<button type="button" class="layui-btn layui-btn submit" onclick="selectProject()">保存</button>
					<button type="button" class="layui-btn layui-btn" onclick="$('#selectProjectWindow').dialog('close');return false;">取消</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
var projectDataid;
var selectProjectDatagrid;
$(function() {
    projectDataid = $('#projectDataid').datagrid({
        url: '${dynamicURL}/match/mainproject/projectList?search_EQ_mainId=${matchId}',
        queryForm: "#queryHeader2 form",
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
            field: 'name',
            title: '比赛项目名称',
            width: '25%',
            align: 'left'
        },
        {
            field: 'type',
            title: '类型',
            width: '10%',
            align: 'left',
            formatter: function (value, rec) { 
            	var str = '';
            	if(rec.type != null && rec.type == 1) 
            		str = '<span >团队赛</span>';
            	if(rec.type != null && rec.type == 0) 
            		str = '<span >个人赛</span>';
            	return str;
            }
        },
        {
            field: 'peopleNum',
            title: '参赛人数',
            width: '10%',
            align: 'left'
        },
        {
            field: 'remark',
            title: '项目事宜',
            align: 'left',
            width: '25%',
        },
        {
            field: 'rule',
            title: '项目规则',
            align: 'left',
            width: '25%',
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
				$("#projectDataid").datagrid("clearSelections");
				$("input[type='radio']")[rowIndex].checked = false;
				return false;
			}
		},
		onDblClickRow : function(index) {
			edit();
		},
		onRowContextMenu : function(e, rowIndex, rowData) {
			e.preventDefault();
			$(this).datagrid('unselectAll');
			$(this).datagrid('selectRow', rowIndex);
			$('#menu').menu('show', {
				left : e.pageX,
				top : e.pageY
			});
		},
    });
    selectProjectDatagrid = $('#selectProjectDatagrid').datagrid({
		url : '${dynamicURL}/admin/match/project/list',
		pagination : true,
		rownumbers : true,
		singleSelect : false,
		idField : 'id',
		fit:true,
		columns : [ [
			{field: 'id', checkbox: true},
				
	        {
	            field: 'name',
	            title: '比赛项目名称',
	            width: '25%',
	            align: 'left'
	        },
	        {
	            field: 'remark',
	            title: '项目事宜',
	            align: 'left',
	            width: '25%',
	        },
	        {
	            field: 'rule',
	            title: '项目规则',
	            align: 'left',
	            width: '25%',
	        },
		] ]
	});
    $("form[for] button.queryBtn").on("click.datagrid-query", function() {
        top._search($(this).parents("form[for]"));
    });
    $("form[for] button.clearBtn").on("click.datagrid-query",function() {
    	$("#topOptions").textbox('setValue','');
        top._clearSearch($(this).parents("form"));
    });
});

function add() {
	 layui.admin.openT("新增比赛项目",'${dynamicURL}/admin/match/project/toProjectAdd?matchId=${matchId}');
}
function del () {
	var row = projectDataid.datagrid("getSelected");
	if (row) {
		parent.layer.alert("您要删除当前所选记录？",{ btn: ['确定','取消']}, function (data) {
            if (data) {
           	 $.submit({
                    url: "${dynamicURL}/match/mainproject/delete",
                    data: "ids="+row.id,
                    success: function (data) {
                   	 	if(data.success){
                       	 	parent.layer.alert('删除成功！', {
				       	        icon: 1,
				       	        skin: 'layer-ext-moon' 
				       	    });
                       	 surveyQuestionDatagrid.datagrid("reload");
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
	} else {
		parent.layer.alert('请选择要删除的记录！', {
   	        icon: 0,
   	        skin: 'layer-ext-moon' 
   	    });
	}
}
function search () {
	$("#selectProjectWindow form").form("clear");
	$("#selectProjectWindow").dialog("open");
}
function selectProject() {
	var matchId = ${matchId};
	var row = selectProjectDatagrid.datagrid("getSelections");
	var projectIds = [];
	$.each(row,function(i,p){
		projectIds.push(p.id);
	});
	$.submit({
		url:"${dynamicURL}/match/mainproject/saveMainProject",
		data:"matchId="+matchId+"&projectIds="+projectIds,
		success:function(data){
			if(data.success){
				selectProjectDatagrid.datagrid("reload");
				selectProjectDatagrid.datagrid("clearSelections");
				layer.alert('保存成功！', {icon: 1});
				$('#selectProjectDatagrid').dialog('close');
				selectProjectDatagrid.datagrid("reload");
			}else{
				layer.alert(data.errorMsg, 'error');
			}
		},
		error:function(){
			layer.alert('系统错误！', 'error');
		}
	}); 
}
</script>