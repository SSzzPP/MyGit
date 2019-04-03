<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="easyui-layout layout-custom-resize" data-options="fit:true">
	<div data-options="region:'center',split:false,collapsible:false" style="width: 400px;">
        <div class="easyui-layout layout-custom-resize" data-options="fit:true">
			<div data-options="region:'north'">
				<div id="queryHeader" style="padding: 10px; width: 100%; line-height: 40px;" class="easyui-panel">
					<form class="form-horizontal" for="surveyQuestionDatagrid">
						<table style="width: 800px; line-height: 40px;">
							<tr>
								<td>题干:</td>
								<td><input class="easyui-textbox" type="text" id='topTitle'
									name="search_LIKE_title" style="width: 150px; height: 26px">
								</td>
								<td>选项:</td>
								<td><input class="easyui-textbox" type="text" id='topOptions'
									name="search_LIKE_options" style="width: 150px; height: 26px">
								</td>
							
							
								<td>题型：</td>
				            	<td>
				            	<select name="search_EQ_questionType" id="" style="width: 150px; height: 26px;" >
				            	<option value="" >全部</option>
				            	<option value="0">单选</option>
				            	<option value="1">多选</option>
				            	</select>
				            	</td>
				            	<td></td>
				            	<td>
									<div class="BtnLine" style="border: 0px; margin: 0px; padding: 0px; text-align: left">
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
							<button onclick="add()"  class="layui-btn layui-btn">新增问题</button>
				         	<button onclick="edit()"  class="layui-btn layui-btn">修改</button>
				         	<button class="layui-btn layui-btn" id="delete" onclick="del()" icon-class="remove">删除</button>
						</div>
					</div>
				</div>
			</div>
			<div data-options="region:'center'">
				<table id="surveyQuestionDatagrid"></table>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var isLoad=false;//是否延迟加载
	var surveyQuestionDatagrid;
	$(function () {
        /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
		surveyQuestionDatagrid = $('#surveyQuestionDatagrid').datagrid({
			url : '${dynamicURL}/admin/survey/question/list?order=desc',
			queryForm : "#queryHeader form",//列筛选时附带加上搜索表单的条件
			fit : true,
// 			fitcolumns: true,
			pagination : true,
			rownumbers : true,
			singleSelect : true,
			lines : true,
			idField : 'id',
			columns : [ [ 
			 			{field: 'id',formatter: function Ra(val, row, index) {
			 				return '<input type="radio" name="selectRadio" id="selectRadio"' + index + '/>';
			 			}},
			 			{field: 'title', title: '题干',width:400, sortable: true},
			 			{field: 'options', title: '选项',width:400, sortable: true},
			 			{field: 'questionType', title: '题型',width:80, sortable: true,
			 				formatter:function(value,rec){
			 					return rec.questionTypeStr;
			 				}
			 			},
			 			{field: 'answer', title: '答案',width:80, sortable: false},
			 			{field: 'createUserName', title: '创建人',width:400, sortable: true},
			 			{field: 'gmtCreate', title: '创建时间',width:130, sortable: true}
			 			] ],
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
					$("#surveyQuestionDatagrid").datagrid("clearSelections");
					$("input[type='radio']")[rowIndex].checked = false;
					return false;
				}
			},
			onDblClickRow : function(rowIndex, rowData) {
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
		 $("form[for] button.queryBtn").on("click.datagrid-query", function() {
			top._search($(this).parents("form[for]"));
		});
		$("form[for] button.clearBtn").on("click.datagrid-query", function() {
			$("#topOptions").textbox('setValue','');
			$("#topTitle").textbox('setValue','');
			top._search($(this).parents("form[for]"));
// 			$.top._clearSearch($(this).parents("form"));
		}); 
	  
	})

    function add(){
    	layui.admin.openT('增加问卷题目', '${dynamicURL}/admin/survey/question/addTopic');
    }
    
    function edit(){
    	var row = surveyQuestionDatagrid.datagrid("getSelected");
    	if(row){
    		layui.admin.openT("修改问卷",'${dynamicURL}/admin/survey/question/editTopic?id='+row.id);
		} else {
			layer.alert('请选择修改题目！', 'error');
		}
    }

 	
    // 删除
	function del() {
		var row = surveyQuestionDatagrid.datagrid("getSelected");
	        if (row) {
	        	parent.layer.alert("您要删除当前所选记录？",{ btn: ['确定','取消']}, function (data) {
	                if (data) {
	               	 $.submit({
	                        url: "${dynamicURL}/admin/survey/question/delete",
	                        data: {"id": row.id},
	                        success: function (data) {
	                       	 	if(data.success){
		                       	 	parent.layer.alert('删除成功！', {
						       	        icon: 1,
						       	        skin: 'layer-ext-moon' 
						       	    });
		                       	 surveyQuestionDatagrid.datagrid('reload');
	                       	 	}else{
		                       	 	parent.layer.alert('删除失败！', {
						       	        icon: 1,
						       	        skin: 'layer-ext-moon' 
						       	    });
	                       	 	}
	                        }
	                    });
	                }
	            });
	        } else {
	        	parent.layer.alert('请选择要删除的记录！', {
	       	        icon: 1,
	       	        skin: 'layer-ext-moon' 
	       	    });
	        }
	}
    
</script>

