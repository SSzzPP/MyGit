<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="easyui-layout layout-custom-resize" data-options="fit:true">
	<div data-options="region:'center',split:false,collapsible:false" style="width: 400px;">
		<div class="easyui-layout layout-custom-resize" data-options="fit:true">
			<div data-options="region:'north'">
				<div id="queryHeader" style="padding: 10px; width: 100%; line-height: 40px;" class="easyui-panel">
					<form class="form-horizontal" for="surveyQuestionDatagrid">
						<table style="width: 800px; line-height: 40px;">
							<tr>
								<td>题干:</td> <!-- easyui-textbox -->
								<td><input class="input-sm col-md-3 pull-left message-search search-whit" type="text" id='topTitle' name="search_LIKE_surveyQuestionEntity.title" style="width: 150px; height: 26px"></td>
								<td>选项:</td>
								<td><input class="input-sm col-md-3 pull-left message-search search-whit" type="text" id='topOptions' name="search_LIKE_surveyQuestionEntity.options" style="width: 150px; height: 26px"></td>
								<td><!-- class="BtnLine"  style="border: 0px; margin: 0px; padding: 0px; text-align: left" -->
									<div class="search-white" style="width: 150px; height: 26px">
										<button type="button" class="layui-btn layui-btn" iconcls="icon-search" icon-class="search">搜索</button>
										<button type="button" class="layui-btn layui-btn" iconcls="icon-reload" icon-class="refresh">重置</button>
									</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div class="BtnLine btnBox tl " style="border-top: solid 1px #ddd; width: 100%;">
					<c:if test="${entity.status==0}">
						<span id="add"><button class="layui-btn layui-btn"  onclick="add()" type="button" iconcls="icon-add">新增问题</button></span>
						<button class="layui-btn layui-btn" id="remove" onclick="del()" type="button" iconcls="icon-delete">删除问题</button>
						<button class="layui-btn layui-btn" id="select" onclick="select()" type="button" iconcls="icon-edit">选择问题</button>
						<!-- <button class="ayui-btn layui-btn" id="download" onclick="download()" type="button" iconcls="icon-download">下载模板</button>
						<button class="ayui-btn layui-btn" id="import" onclick="importQuestions()" type="button" iconcls="icon-add">Excel导入</button> -->
					</c:if>
				</div>
			</div>
			<div data-options="region:'center'">
				<table id="surveyQuestionDatagrid"></table>
			</div>
		</div>
	</div>
</div>

<div id="addFileWindow" class="easyui-dialog" title="新增" style="width: 620px; height: 180px;" modal="true" closed="true">
	<form class="addForm" action="${dynamicURL}/admin/survey/paperQuestion/importQuestions" method="post" enctype="multipart/form-data">
		<input type="hidden" name="paperId" value="{entity.id}" id="paperId">
		<table class="table_edit">
			<tr>
				<td class="text_tr" style="width: 30%;">附件上传：</td>

				<td><input name="file" type="file"
					style="width: 300px; height: 30px;"></td>
			</tr>
		</table>
		<div class="BtnLine">
			<button type="button" class="easyui-linkbutton submit">导入</button>
			<button type="button" class="easyui-linkbutton stop" onclick="$('#addFileWindow').dialog('close');return false;">取消</button>
		</div>
	</form>
</div>
<div id="selectQuestionWindow" class="easyui-dialog" title="选择问题" style="width: 900px; height: 450px;" modal="true" closed="true">
	<div class="easyui-layout layout" fit="true">
		<div id="container" class="easyui-layout layout" fit="true">
			<div region="north" border="false">
				<div id="queryHeader2" style="padding: 10px; width: 100%; line-height: 40px;" class="easyui-panel">
					<form class="form-horizontal" for="selectQuestionDatagrid">
						<table style="width: 700px; line-height: 40px;">
							<tr>
								<td>题干:</td>
								<td><input id="nameFormId" class="easyui-textbox" type="text" name="search_LIKE_title" style="width: 150px; height: 26px"></td>
								<td>
									<div class="BtnLine" style="border: 0px; margin: 0p; padding: 0px; text-align: right">
										<button type="button" class="layui-btn layui-btn" iconcls="icon-search" icon-class="search" id="btn-addUser-query queryBtn">搜索</button>
										<button type="button" class="layui-btn layui-btn" iconcls="icon-reload" icon-class="refresh" id="btn-addUser-clear clearBtn">重置</button>
										<!-- <button type="button" class="easyui-linkbutton" iconcls="icon-search" id="btn-addUser-query queryBtn">搜索</button>
										<button type="button" class="easyui-linkbutton" iconcls="icon-reload" id="btn-addUser-clear clearBtn">重置</button> -->
									</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div region="center" border="false">
				<table id="selectQuestionDatagrid"></table>
			</div>
			<div region="south" border="false">
				<div class="BtnLine">
					<button type="button" class="layui-btn layui-btn submit" onclick="selectQuestion()">保存</button>
					<button type="button" class="layui-btn layui-btn" onclick="$('#selectQuestionWindow').dialog('close');return false;">取消</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var isLoad=false;//是否延迟加载
	var surveyQuestionDatagrid;
	var selectQuestionDatagrid;
	$(function () {
        /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
		surveyQuestionDatagrid = $('#surveyQuestionDatagrid').datagrid({
			url : '${dynamicURL}/admin/survey/paperQuestion/questionList?search_EQ_surveyPaperEntity.id=${entity.id}',
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
		selectQuestionDatagrid = $('#selectQuestionDatagrid').datagrid({
			url : '${dynamicURL}/admin/survey/question/list',
			pagination : true,
			rownumbers : true,//行数  
// 			queryForm : "#queryHeader form",//列筛选时附带加上搜索表单的条件
// 			custom_fit : true,//额外处理自适应性
// 			custom_heighter : "#queryHeader",//额外处理自适应性（计算时留出元素#queryHeader高度）
// 			custom_height : 5,//额外处理自适应性（计算时留5px高度）
			singleSelect : false,
			idField : 'id',
			fit:true,
			columns : [ [
				{field: 'id', checkbox: true},
				{field: 'title', title: '题干',width:400, sortable: true},
	 			{field: 'options', title: '选项',width:400, sortable: true},
	 			{field: 'questionType', title: '题型',width:80, sortable: true,
	 				formatter:function(value,rec){
	 					return rec.questionTypeStr;
	 				}
	 			},
	 			{field: 'createUserName', title: '创建人',width:400, sortable: true},
	 			{field: 'gmtCreate', title: '创建时间',width:130, sortable: true}
			] ]
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
	
     function download(){
//     	window.location="${dynamicURL}/template/试题模板.xlsx"; 
    	location.href="${dynamicURL}/admin/survey/question/downloadTemplate";
    }
    
 	// 文件新增
    function importQuestions(){
    	$("#addFileWindow form.addForm").form("clear");
    	$("#fileQueue").html("");
    	$("#paperId").val("${entity.id}");
		$("#addFileWindow").dialog("open");
    }
 	
    $("#addFileWindow form.addForm").form({
		onSubmit : function() {
			var isValid = $(this).form('validate');
			if (!isValid) {
				$.messager.progress('close');
				return false;
			}
			return true;
		},
		success : function(data) {
			if (typeof data == "string") {
				data = JSON.parse(data);
			}
			if (data.success) {
				layer.alert('保存成功！', "info");
				surveyQuestionDatagrid.datagrid('reload');
// 				$('#addFileWindow').dialog('close');
			} else {
				layer.alert(data.msg, 'error');
			}
		}
	});
 	
    $("#addFileWindow .BtnLine .submit").on("click", _.debounce(function() {
 			$("#addFileWindow form.addForm").submit();
 			$('#addFileWindow').dialog('close');
       	},waitTime,true)
    );
	
     function add(){
    	 layui.admin.openT("新增问题",'${dynamicURL}/admin/survey/paperQuestion/addTopic?paperId=${entity.id}');
    	// openTbyUrl( add, '${dynamicURL}/admin/survey/paperQuestion/addTopic?paperId=${entity.id}');
    } 
 	// 导出题库
    function exportQuestions(){
    	window.location.href = "${dynamicURL}/admin/education/survey/question/exportToExcel";
    }
 	
    // 删除
	function del() {
    	var paperId = '${entity.id}';
		 var row = surveyQuestionDatagrid.datagrid("getSelected");
	        if (row) {
	        	parent.layer.alert("您要删除当前所选记录？",{ btn: ['确定','取消']}, function (data) {
	                if (data) {
	               	 $.submit({
	                        url: "${dynamicURL}/admin/survey/paperQuestion/deleteByQuestion",
	                        data: "questionId="+row.id+"&paperId="+paperId,
	                        success: function (data) {
	                       	 	if(data.success){
		                       	 	parent.layer.alert('删除成功！', {
						       	        icon: 1,
						       	        skin: 'layer-ext-moon' 
						       	    });
		                       	 surveyQuestionDatagrid.datagrid("reload");
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
	       	        icon: 0,
	       	        skin: 'layer-ext-moon' 
	       	    });
	        }

		/*  if(row){
			 top._del(surveyQuestionDatagrid, {
					delUrl : "${dynamicURL}/admin/survey/paperQuestion/deleteByQuestion?questionId="+row.id+"&paperId=${entity.id}"
				});
		 }else{
			 layer.alert('请选择一行数据进行操作', 'error');
		 } */
	}
    function select(){
    	$("#selectQuestionWindow form").form("clear");
		$("#selectQuestionWindow").dialog("open");
    }
    function selectQuestion(){
    	var paperId = '${entity.id}';
		var rows = selectQuestionDatagrid.datagrid("getSelections");
		var userids=[];
		$.each(rows,function(i,p){
			userids.push(p.id);
		});
		$.submit({
			url:"${dynamicURL}/admin/survey/paperQuestion/saveSelectThis",
			data:"paperId="+paperId+"&questionIds="+userids,
			success:function(data){
				if(data.success){
					selectQuestionDatagrid.datagrid("reload");
					selectQuestionDatagrid.datagrid("clearSelections");
					layer.alert('保存成功！', {icon: 1});
					$('#selectQuestionWindow').dialog('close');
					surveyQuestionDatagrid.datagrid("reload");
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

