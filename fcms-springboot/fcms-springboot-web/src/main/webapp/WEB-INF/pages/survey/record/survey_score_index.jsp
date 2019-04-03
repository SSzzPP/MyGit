<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="easyui-layout layout-custom-resize" data-options="fit:true">
	<div data-options="region:'center',split:false,collapsible:false" style="width: 400px;">
        <div class="easyui-layout layout-custom-resize" data-options="fit:true">
			<div data-options="region:'north'">
				<div id="queryHeader" style="padding: 10px; width: 100%; line-height: 40px;" class="easyui-panel">
					<form class="form-horizontal" for="surveyScoreDatagrid">
						<table style="width: 800px; line-height: 40px;">
							<tr>
								<td>用户名称:</td>
								<td><input class="easyui-textbox" type="text" name="search_keyword" style="width: 150px; height: 26px">
								</td>
							</tr>
							<tr>
				            	<td>
									<div class="BtnLine" style="border: 0px; margin: 0px; padding: 0px; text-align: left">
										<!-- <button type="button" class="easyui-linkbutton queryBtn" iconcls="icon-search">搜索</button>
										<button type="button" class="easyui-linkbutton clearBtn" iconcls="icon-reload">重置</button> -->
										<button type="button" class="layui-btn layui-btn" iconcls="icon-search" icon-class="search">搜索</button>
										<button type="button" class="layui-btn layui-btn" iconcls="icon-reload" icon-class="refresh">重置</button>
									</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div class="BtnLine btnBox tl" style="border-top:solid 1px #ddd;width:100%;">
				<span>当前问卷总分为<span style="color:red">${sumScore}</span>,得分为<span id="score" class="red"></span>即为及格。下方表格中得分列为红色即为不及格</span>
				    <button class="easyui-linkbutton l-btn l-btn-small" id="exportScoreList" onclick="exportScoreList()" type="button" iconcls="icon-add" >导出得分列表</button>
		        </div>
			</div>
			<div data-options="region:'center'">
				<table id="surveyScoreDatagrid"></table>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var isLoad=false;//是否延迟加载
	var surveyScoreDatagrid;
	$(function () {
		var sumScore=${sumScore};
		var yu=${paperEntity.threshold};
		console.log(sumScore);
		console.log(yu);
		var score=Math.round(sumScore*yu);
		console.log(score);
		$('#score').text(score);
        /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
		surveyScoreDatagrid = $('#surveyScoreDatagrid').datagrid({
			url : '${dynamicURL}/admin/survey/record/scoreTotalList?search_paperId=${paperEntity.id}',
			queryForm : "#queryHeader form",//列筛选时附带加上搜索表单的条件
			fit : true,
// 			fitcolumns: true,
			pagination : true,
			rownumbers : true,
			singleSelect : true,
			lines : true,
			idField : 'userId',
			columns : [ [ 
			 			{field: 'userId',formatter: function Ra(val, row, index) {
			 				return '<input type="radio" name="selectRadio" id="selectRadio"' + index + '/>';
			 			}},
			 			{field: 'name', title: '用户名称',width:200, sortable: true},
			 			{field: 'mobile', title: '手机号',width:400, sortable: true},
			 			{field: 'score', title: '得分',width:80, sortable: true,
			 				formatter:function(value,rec){
			 					console.log(rec.score+'--'+score);
			 					if(rec.score<score){
			 						return '<span style="color:red">'+rec.score+'</span>'
			 					}
			 					return rec.score;
			 				}
			 			}
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
					$("#surveyScoreDatagrid").datagrid("clearSelections");
					$("input[type='radio']")[rowIndex].checked = false;
					return false;
				}
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
		}); 
	  
	})
	//导出得分列表
	function exportScoreList(){
		window.location.href = "${dynamicURL}/admin/survey/record/exportToExcel?paperId=${paperEntity.id}&&paperName=${paperEntity.title}";
	}
</script>

