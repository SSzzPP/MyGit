<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="easyui-layout layout-custom-resize" data-options="fit:true">
	
	<div data-options="region:'north'">
		<div id="queryHeader" style="padding: 10px; width: 100%; line-height: 40px;" class="easyui-panel">
			<form class="form-horizontal" for="surveyPaperDatagrid">
				<table style="width: 1000px; line-height: 40px;">
					<tr>
						<td>问卷标题:</td>
						<td><input class="easyui-textbox" type="text"
							name="search_LIKE_title" style="width: 150px; height: 26px">
						</td>
						<td>发布时间:</td>
                        <td>
                            <input class="easyui-datebox" type="text" name="search_GTE_startDate" style="width: 150px; height: 26px" data-options='editable:false'>
                        </td>
                        <td>结束时间:</td>
                        <td>
                            <input class="easyui-datebox" type="text" name="search_LTE_startDate" style="width: 150px; height: 26px" data-options='editable:false'>
                        </td>
                        
                        <td colspan="2">
							<div class="BtnLine" style="border: 0px; margin: 0px; padding: 0px; text-align: right">
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
         	<button class="easyui-linkbutton l-btn l-btn-small" id="search" onclick="previewPaper()" type="button" iconcls="icon-edit" >用户答案统计</button> 
         	<button class="easyui-linkbutton l-btn l-btn-small" id="notFinishUser" onclick="notFinishUser()" type="button" iconcls="icon-edit" >未完成用户统计</button> 
        	<button class="easyui-linkbutton l-btn l-btn-small" id="scoreTotal" onclick="scoreTotal()" type="button" iconcls="icon-edit" >用户得分统计</button> 
        </div>
	</div>
	<div data-options="region:'center'">
		<table id="surveyPaperDatagrid"></table>
	</div>
</div>
<div id="userWindow" class="easyui-dialog" title="未完成用户"
	style="width: 900px; height: 450px;" modal="true" closed="true">
	<div class="easyui-layout layout" fit="true">
		<div id="container" class="easyui-layout layout" fit="true">
			<div region="north" border="false">
				<div id="queryHeader2"
					style="padding: 10px; width: 100%; line-height: 40px;"
					class="easyui-panel">
					<form class="form-horizontal" for="userDatagrid">
						<table style="width: 700px; line-height: 40px;">
							<tr>
								<td>名称:</td>
								<td><input id="userNameFormId" class="easyui-textbox"
									type="text" name="search_LIKE_user.name"
									style="width: 150px; height: 26px"></td>
								<td>
								<input type="hidden" id="paperIdForm" name="paperId">
									<div class="BtnLine"
										style="border: 0px; margin: 0p; padding: 0px; text-align: right">
										<button type="button" class="easyui-linkbutton"
											iconcls="icon-search" id="btn-addUser-query queryBtn" onclick="reloadUserDatagrid($(this))">搜索</button>
									</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div region="center" border="false">
				<table id="userDatagrid"></table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var isLoad=false;//是否延迟加载
	var surveyPaperDatagrid;
	var userDatagrid;
	$(function () {
        /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
		surveyPaperDatagrid = $('#surveyPaperDatagrid').datagrid({
			url : '${dynamicURL}/admin/survey/userTotal/list?search_EQ_status=1&order=desc',
			pagination : true,
			rownumbers : true,//行数  
			queryForm : "#queryHeader form",//列筛选时附带加上搜索表单的条件
			custom_fit : true,//额外处理自适应性
			custom_heighter : "#queryHeader",//额外处理自适应性（计算时留出元素#queryHeader高度）
			custom_height : 5,//额外处理自适应性（计算时留5px高度）
			singleSelect : true,
			idField : 'id',
			fit:true,
			columns : [ [
				{field: 'id',formatter: function Ra(val, row, index) {
					return '<input type="radio" name="RadioD" id="RadioD"' + index + '/>';
				}},
				{field: 'title', title: '标题',width:200, sortable: true},
				{field: 'questionSize', title: '问题数量',width:200, sortable: true},
				{field: 'total', title: '应该参与人数',width:100, sortable: true},
				{field: 'actual', title: '实际参与人数',width:100, sortable: true},
				{field: 'createUserName', title: '创建人',width:50, sortable: true},
				{field: 'startDate', title: '发布时间',width:150, sortable: true},
				{field: 'endDate', title: '结束时间',width:150, sortable: true},
				{field: 'remark', title: '备注',width:100, sortable: true},
			] ],
			onBeforeLoad:function(){
            	return true;// isLoad;
            },
			onClickRow : function(rowIndex, rowData) {
				//加载完毕后获取所有的checkbox遍历
				var radio1 = $("input[name='RadioD']")[rowIndex].disabled;
				//如果当前的单选框不可选，则不让其选中
				if (radio1 != true) {
					//让点击的行单选按钮选中
					$("input[name='RadioD']")[rowIndex].checked = true;
					return false;
				} else {
					$("#surveyPaperDatagrid").datagrid("clearSelections");
					$("input[name='RadioD']")[rowIndex].checked = false;
					return false;
				}
			},
			onDblClickRow : function(rowIndex, rowData) {
				//edit();
			}
		});
		userDatagrid = $('#userDatagrid').datagrid({
			url : '${dynamicURL}/admin/survey/paperUser/notFinishUserList',
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
                {field: 'loginName', title: '登录名', width: 200, align: 'center', sortable: true},
                {field: 'name', title: '用户名', width: 200, align: 'center', sortable: true},
			] ],
			onBeforeLoad:function(){
	        	return isLoad;//isLoad;
	        }
		});
		$("form[for] button.queryBtn").on("click.datagrid-query", function() {
			top._search($(this).parents("form[for]"));
		});
		$("form[for] button.clearBtn").on("click.datagrid-query", function() {
			top._clearSearch($(this).parents("form"));
		});
	});
	 function previewPaper(){
		 var row = surveyPaperDatagrid.datagrid("getSelected");
	    	if(row){
	    		window.parent.openT('用户答案统计', '${dynamicURL}/admin/survey/record/toTotal?paperId='+row.id+'&total='+row.total+'&actual='+row.actual,'0','300','300');
			}
			else {
				layer.alert('请选择问卷！', 'error');
			}
	 }
	 function scoreTotal(){
		 var row = surveyPaperDatagrid.datagrid("getSelected");
	    	if(row){
	    		if(row.status==0){
	    			layer.alert('未发布，无法进行得分统计！', 'error');
	    		}else{
	    			if(row.isExam==1){
		    			window.parent.openT('用户得分统计', '${dynamicURL}/admin/survey/record/toScoreTotal?paperId='+row.id+'&total='+row.total+'&actual='+row.actual,'0','300','300');
		    		}else{
		    			layer.alert('非考试问卷无得分统计！', 'error');
		    		}
	    		}
			}
			else {
				layer.alert('请选择问卷！', 'error');
			}
	 }
	 function notFinishUser(){
		 var row = surveyPaperDatagrid.datagrid("getSelected");
	    	if(row){
	    		isLoad = true;
	    		$("#userWindow form").form("clear");
	    		$("#userWindow").dialog("open");
	    		userDatagrid.datagrid("reload", {'paperId' :row.id ,'search_LIKE_userEntity.name':$('#userNameFormId').val()});
			}
			else {
				layer.alert('请选择问卷！', 'error');
			}
	 }
	 function reloadUserDatagrid(t){
		 var row = surveyPaperDatagrid.datagrid("getSelected");
		 userDatagrid.datagrid("reload", {'paperId' :row.id ,'search_LIKE_userEntity.name':$('#userNameFormId').val()});
	 }
</script>