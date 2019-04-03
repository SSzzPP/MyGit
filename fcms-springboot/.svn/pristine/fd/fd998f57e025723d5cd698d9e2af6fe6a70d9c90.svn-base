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
						<td><input class="easyui-textbox" type="text" name="search_LIKE_title" style="width: 150px">
						</td>
						<td>发布时间:</td>
                        <td>
                            <input class="easyui-datebox" type="text" name="search_GTE_startDate" style="width: 150px" data-options='editable:false'>
                        </td>
                        <td>结束时间:</td>
                        <td>
                            <input class="easyui-datebox" type="text" name="search_LTE_startDate" style="width: 150px" data-options='editable:false'>
                        </td>
                        
                        <td colspan="2">
							<div class="BtnLine" style="border: 0px; margin: 0px; padding: 0px; text-align: right">
								<!-- <button type="button" class="easyui-linkbutton queryBtn" iconcls="icon-search">搜索</button>
								<button type="button" class="easyui-linkbutton clearBtn" iconcls="icon-reload">重置</button> -->
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
					<button onclick="add()"  class="layui-btn layui-btn" iconcls="icon-add" id="add">新增</button>
					<button onclick="edit()"  class="layui-btn layui-btn" iconcls="icon-edit" id="edit">修改</button>
					<button onclick="del()"  class="layui-btn layui-btn" iconcls="icon-delete" id="remove">删除</button>
					<button onclick="publish()"  class="layui-btn layui-btn" iconcls="icon-edit" id="publish">发布</button>
					<!-- <button onclick="showUsers()"  class="layui-btn layui-btn" iconcls="icon-edit" id="search">查看用户</button> -->
					<button onclick="showQuestions()"  class="layui-btn layui-btn" iconcls="icon-edit">查看问题</button>
					<button onclick="previewPaper()"  class="layui-btn layui-btn" iconcls="icon-edit">问卷预览</button>
				</div>
			</div>
		</div>
	</div>
	<div data-options="region:'center'">
		<table id="surveyPaperDatagrid"></table>
	</div>
</div>
<!-- 添加 -->
<div id="addWindow" class="easyui-dialog" title="新增" style="width: 700px; height: 350px;" modal="true" closed="true">
    <form class="addForm" action="${dynamicURL}/admin/survey/paper/save" method="post">
    	<input type="hidden" name="id" />
    	<input type="hidden" name="status" value="0">
    	<input type="hidden" name="isExam" value="0" />
    	<table class="table_edit">
	      	 <tr>
	            <td class="text_tr" style="width: 120px;">问卷标题：&nbsp;&nbsp;</td>
	            <td style="border-right:1px solid #000000;">
	            	<input class="easyui-textbox" type="text" name="title" id="titleInfoFormId"  style="width: 270px; height: 26px" data-options="required:true" >
	            </td>
	        </tr>
	        <tr>
	            <td class="text_tr" style="width: 120px;">备注：&nbsp;&nbsp;</td>
	            <td style="border-right:1px solid #000000;">
	            	<input class="easyui-textbox" type="text" name="remark" id="remarkInfoFormId"  style="width: 270px; height: 26px" >
	            </td>
	        </tr>
	        <tr>
                <td class="text_tr">结束时间：&nbsp;&nbsp;</td>
	            <td>
	            	<input class="easyui-datebox" type="text" name="endDate" id="endDateFormId"  style="width: 270px; height: 26px"  data-options="required:true,editable:false">
	            </td>
	        <tr>
	        <!-- <tr>
	         <td class="text_tr">是否为考卷：</td>
	        <td>
	        <input type="checkbox" id="form-isExam"/> 
	         </td>
	        </tr> -->
	        <tr style="display:none" id="tr_threshold">   
	        	<td class="text_tr file" id="" style="width: 10%;">阈值：</td>
        	    <td>
        	    	<input class="easyui-numberbox" min="0.01" max="1" precision="2" type="number" name="threshold"id="form-threshold" style="width: 150px; height: 26px">
	            	<span style="color: red">值为0~1 e.g.若为0.6表示考卷答对60%及以上的题目为及格，及格线按照四舍五入原则计算</span>
	            </td>
	        </tr> 
	    </table>
	    <div class="BtnLine">
	        <button type="button" class="layui-btn layui-btn submit">保存</button>
	        <button type="button" class="layui-btn layui-btn" onclick="$('#addWindow').dialog('close');return false;">取消</button>
	    </div>
    </form>
</div>
<!-- 查看 -->
<!-- <div id="searchWindow" class="easyui-dialog" title="查看用户"
	style="width: 900px; height: 450px;" modal="true" closed="true">
	<div class="easyui-layout layout" fit="true">
		<div id="container" class="easyui-layout layout" fit="true">
			<div data-options="region:'north'">
				<div data-options="region:'north',split:false,collapsible:false">
					<div class="card-button">
						<div class="layui-btn-container">
							<button onclick="addUser()"  class="layui-btn layui-btn" iconcls="icon-add" type="button" id="addUser">添加用户</button>
							<button class="layui-btn layui-btn" id="delUser" onclick="delUser()" type="button" iconcls="icon-edit">删除用户</button>
						</div>
					</div>
				</div>
				<div class="BtnLine" style="border-top: solid 1px #ddd; width: 100%;margin-bottom:5px;">
					<span>用户名：</span><input class="easyui-textbox" name="search_LIKE_userEntity.name" id="search-username" type="text" style="width: 270px; height: 26px;float:left">
					<button type="button" class="layui-btn layui-btn queryBtn" iconcls="icon-search" onclick="searchuser()">搜索</button>
						</div>
			</div>
			<div data-options="region:'center'">
				<table id="userDatagrid"></table>
			</div>
		</div>
	</div>
</div> -->
<!-- 添加用户 -->
<!-- <div id="addUserWindow" class="easyui-dialog" title="新增用户" style="width: 900px; height: 450px;" modal="true" closed="true">
	<div class="easyui-layout layout" fit="true">
		<div id="container" class="easyui-layout layout" fit="true">
			<div region="north" border="false">
				<div id="queryHeader2" style="padding: 10px; width: 100%; line-height: 40px;" class="easyui-panel">
					<form class="addForm" for="addUserDatagrid">
						<table style="width: 700px; line-height: 40px;">
							<tr>
								<td>运动分类:</td>
								<td>
									<input id="typeFormIds" name="strTypes" style="width: 270px; height: 26px;">
								</td>
								<td>
								<div class="BtnLine" style="border: 0px; margin: 0p; padding: 0px; text-align: right">
									<button type="button" class="layui-btn layui-btn" iconcls="icon-search" id="btn-addUser-query queryBtn" onclick="reloadAddUserDatagrid($(this))">搜索</button>
									<button type="button" class="layui-btn layui-btn" iconcls="icon-reload" id="btn-addUser-clear clearBtn" onclick="clearSearchAddUserDatagrid($(this))">重置</button>
								</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div region="center" border="false">
				<table id="addUserDatagrid"></table>
			</div>
			<div region="south" border="false">
				<div class="BtnLine">
					<button type="button" class="layui-btn" onclick="addTypeUser()">保存</button>
					<button type="button" class="layui-btn" onclick="$('#addUserWindow').dialog('close');return false;">取消</button>
				</div>
			</div>
		</div>
	</div>
</div> -->
<!-- <div id="addUserByOrganizationWindow" class="easyui-dialog" title="新增用户" style="width: 900px; height: 450px;" modal="true" closed="true">
	<div class="easyui-layout layout" fit="true">
		<div id="container" class="easyui-layout layout" fit="true">
			<div region="north" border="false">
				<div id="queryHeader3" style="padding: 10px; width: 100%; line-height: 40px;" class="easyui-panel">
					<form class="form-horizontal" for="addUserByOrganizationDatagrid">
						<table style="width: 700px; line-height: 40px;">
							<tr>
								<td>名称:</td>
								<td><input id="nameFormId" class="easyui-textbox" type="text" name="search_LIKE_userEntity.name" style="width: 150px; height: 26px"></td>
								<td>
								<td>组织机构：</td>
				            <td>
				            	<select name="search_EQ_organizationInfoEntity.id" id="search-organizationInfoFormId" style="width: 200px; height: 26px;" ></select>
				            </td>
									<div class="BtnLine" style="border: 0px; margin: 0p; padding: 0px; text-align: right">
										<button type="button" class="layui-btn layui-btn" iconcls="icon-search" id="btn-addUserByOrganization-query queryBtn" onclick="reloadAddUserByOrganizationDatagrid($(this))">搜索</button>
										<button type="button" class="layui-btn layui-btn" iconcls="icon-reload" id="btn-addUserByOrganization-clear clearBtn" onclick="clearSearchAddUserByOrganizationDatagrid($(this))">重置</button>
									</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div region="center" border="false">
				<table id="addUserByOrganizationDatagrid"></table>
			</div>
			<div region="south" border="false">
				<div class="BtnLine">
					<button type="button" class="layui-btn layui-btn submit" onclick="addTypeUserByOrganization()">保存</button>
					<button type="button" class="layui-btn layui-btn" onclick="$('#addUserByOrganizationWindow').dialog('close');return false;">取消</button>
				</div>
			</div>
		</div>
	</div>
</div> -->
<script type="text/javascript">
	var isLoad=false;//是否延迟加载
	var surveyPaperDatagrid;
	var userPaperDatagrid;
	var userDatatgrid;
	var url1;
	var addUserDatagrid;
	var addUserByOrganizationDatagrid;
	var urlDep='';
	var urlOrganization;
	//var questionDatagrid;
	//var addQuestionDatagrid;
	$(function () {
		url1='${dynamicURL}/admin/system/company/searchcompanyByRoleResources?code=survey';
		urlOrganization='${dynamicURL}/admin/system/organization/search';
        /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
		surveyPaperDatagrid = $('#surveyPaperDatagrid').datagrid({
			url : '${dynamicURL}/admin/survey/paper/list',
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
				{field: 'status', title: '状态',width:50, sortable: true,formatter:function(value,rec){
					if(rec.status==0) return "<span style='color:red'>"+rec.statusWrapper+"</span>"; else return "<span style='color:green'>"+rec.statusWrapper+"</span>";
				}},
				{field: 'isExam', title: '是否为考卷',width:80, sortable: true,formatter:function(value,rec){
					if(rec.isExam==1){
						return '<span style="color:red">是</span>';
					}else{
						return '<span>否</span>';
					}
				}},
				{field: 'total', title: '总分',width:80, sortable: true,formatter:function(value,rec){
					if(rec.status==1&&rec.isExam==1&&rec.total&&rec.total!=null){
						return rec.total;
					}else{
						return 0;
					}
				}},
				{field: 'threshold', title: '及格线',width:80, sortable: true,formatter:function(value,rec){
					if(rec.status==1&&rec.isExam==1&&rec.total&&rec.total!=null&&rec.threshold!=null){
						return Math.round(rec.total*rec.threshold);
					}else{
						return 0;
					}
				}},
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
				edit();
			}
		});
		  userDatagrid = $('#userDatagrid').datagrid({
				url : '${dynamicURL}/admin/survey/paperUser/userList',
				pagination : true,
				rownumbers : true,//行数  
//	 			queryForm : "#queryHeader form",//列筛选时附带加上搜索表单的条件
//	 			custom_fit : true,//额外处理自适应性
//	 			custom_heighter : "#queryHeader",//额外处理自适应性（计算时留出元素#queryHeader高度）
//	 			custom_height : 5,//额外处理自适应性（计算时留5px高度）
				singleSelect : true,
				idField : 'id',
				fit:true,
				columns : [ [
					{field: 'id', checkbox: true},
	                {field: 'loginName', title: '登录名', width: 200, align: 'center', sortable: true},
	                {field: 'name', title: '用户名', width: 200, align: 'center', sortable: true},
				] ],
				onClickRow : function(rowIndex, rowData) {
					//加载完毕后获取所有的checkbox遍历
					var radio1 = $("input[name='selectRadio']")[rowIndex].disabled;
					//如果当前的单选框不可选，则不让其选中
					if (radio1 != true) {
						//让点击的行单选按钮选中
						$("input[name='selectRadio']")[rowIndex].checked = true;
						return false;
					} else {
						$("#userDatagrid").datagrid("clearSelections");
						$("input[name='selectRadio']")[rowIndex].checked = false;
						return false;
					}
				},
				onBeforeLoad:function(){
		        	return isLoad;//isLoad;
		        }
			});
		  //搜索
			addUserByOrganizationDatagrid = $('#addUserByOrganizationDatagrid').datagrid({
				url : '${dynamicURL}/admin/user/type/view/searchType',
				pagination : true,
				rownumbers : true,
				singleSelect : false,
				idField : 'id',
				fit:true,
				columns : [ [
					{field: 'id', checkbox: true},
	                {field: 'loginName', title: '登录名', width: 200, align: 'center', sortable: true},
	                {field: 'name', title: '用户名', width: 200, align: 'center', sortable: true},
				] ],
				onBeforeLoad:function(){
		        	return isLoad;//isLoad;
		        }
			});
		$('#search-companyFormId').combotree({
		 	valueField:'id',
		    nameField:'name',
            url: url1,
            onChange:function(){
            	urlDep='${dynamicURL}/admin/system/department/search?search_EQ_companyEntity.id='+$('#search-companyFormId').combotree("getValue");
            	$('#search-departmentFormId').combotree({
    			 	valueField:'id',
    			    nameField:'name',
    	            url:urlDep ,
    	         });
            }
         });
		$('#form-isExam').on('change',function(){
			if($('#form-isExam').prop('checked')){
				$('#tr_threshold').show();
				$('input[name="isExam"]').val(1);
			}else{
				$('#tr_threshold').hide();
				$('input[name="isExam"]').val(0);
			}
		});
			$('#search-organizationInfoFormId').combotree({
			 	valueField:'id',
			    nameField:'name',
	            url: urlOrganization,
	         });
		$("form[for] button.queryBtn").on("click.datagrid-query", function() {
			top._search($(this).parents("form[for]"));
		});
		$("form[for] button.clearBtn").on("click.datagrid-query", function() {
			top._clearSearch($(this).parents("form"));
		});
		$('#typeFormIds').combobox({
			valueField : 'id',
			textField : 'name',
			multiple:true, 
			url : '${dynamicURL}/admin/system/dict/combobox?type=SPORT_TYPE',
			onLoadSuccess:function(data){
				$("#typeFormIds").combobox('setValues',data);
			}
		});
	});
	
	 function add() {
		$("#addWindow form.addForm").form("clear");
		$("#addWindow").dialog("open");
		$("input[name='status']").val(0);
		$('#tr_threshold').hide();
		$('input[name="isExam"]').val(0);
    	$('#form-isExam').prop('checked',false);
    	$('#form-threshold').numberbox('setValue',0);
    }
	 //初始化form表单
    $("#addWindow form.addForm").form({
        onSubmit: function () {
            var isValid = $(this).form('validate');
            if (!isValid) {
                $.messager.progress('close');
            }
            return isValid;
        },
        success: function (data) {
            if (typeof data == "string") {
                data = JSON.parse(data);
            }
            if (data.success) {
                layer.alert('保存成功！', "info");
                $('#addWindow').dialog('close');
                surveyPaperDatagrid.datagrid('reload');
            } else {
                layer.alert(data.msg, 'error');
            }
        }
    });
	 
    $("#addWindow .BtnLine .submit").on("click", function () {
		$("#addWindow form.addForm").submit();
    });
    
    function reloadAddUserDatagrid(t){
    	top._search(t.parents("form[for]"));
    }
    function clearSearchAddUserDatagrid(t){
    	top._clearSearch(t.parents("form"));
    }
    function reloadAddUserByOrganizationDatagrid(t){
    	top._search(t.parents("form[for]"));
    }
    function clearSearchAddUserByOrganizationDatagrid(t){
    	top._clearSearch(t.parents("form"));
    }
    function searchuser(){
    	userDatagrid.datagrid("reload", {'search_EQ_surveyPaperEntity.id' :surveyPaperDatagrid.datagrid("getSelected").id ,'search_LIKE_userEntity.name':$('#search-username').val()});
    }
    //修改
    function edit() {
        var row = surveyPaperDatagrid.datagrid("getSelected");
        if (row) {
            var form = $("#addWindow form.addForm");
            form.form("clear");
            $.ajax({
                url: "${dynamicURL}/admin/survey/paper/detail",
                data: {id: row.id},
                dataType: "json",
                success: function (response) {
                	if(response.obj.status==0){
                        form.form("load", response.obj);
                        if(response.obj.isExam==1){
                        	$('#form-isExam').prop('checked',true);
                        	$('#tr_threshold').show();
            				$('input[name="isExam"]').val(1);
                        	$('#form-threshold').numberbox('setValue',response.obj.threshold);
                        }else{
                        	$('#tr_threshold').hide();
            				$('input[name="isExam"]').val(0);
                        	$('#form-isExam').prop('checked',false);
                        	$('#form-threshold').numberbox('setValue',0);
                        }
                        $("#addWindow").dialog("open");
                	}else{
                		layer.alert('已发布,禁止修改！', 'error');
                	}
                }
            });
        } else {
            layer.alert('请选择要修改的记录！', 'error');
        }
    }
    
    //删除
    function del(){
    	 var row = surveyPaperDatagrid.datagrid("getSelected");
        if (row) {
        	parent.layer.alert("您要删除当前所选记录？",{ btn: ['确定','取消']}, function (data) {
                if (data) {
               	 $.submit({
                        url: "${dynamicURL}/admin/survey/paper/delete",
                        data: "ids="+row.id,
                        success: function (data) {
                       	 	if(data.success){
	                       	 	parent.layer.alert('删除成功！', {
					       	        icon: 1,
					       	        skin: 'layer-ext-moon' 
					       	    });
	                       	 surveyPaperDatagrid.datagrid('reload');
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
    	
    	/*  var row = surveyPaperDatagrid.datagrid("getSelected");
    	 if(row){
    		 if(row.status==1){
    			 var content = "该问卷已经发布，确认删除吗？";
    	        	layer.confirm("操作提示",content, function (data) {  
    	                if (data) {  
    	                	 top._del(surveyPaperDatagrid, {delUrl: "${dynamicURL}/admin/survey/paper/delete?id="+row.id+""}); 
    	                }
    	            });
        	 }else{
        		 top._del(surveyPaperDatagrid, {delUrl: "${dynamicURL}/admin/survey/paper/delete?id="+row.id+""}); 
        	 }
    	 }else{
    		layer.alert('请选择要删除的记录！', 'error');
    	 } */
    }
    function addUser(){
		$("#addUserWindow form").form("clear");
		$("#addUserWindow").dialog("open");
		
		  addUserDatagrid = $('#addUserDatagrid').datagrid({
				url : '${dynamicURL}/admin/user/type/view/searchType?strTypes=1',//'${dynamicURL}/admin/system/userCompanyDep/searchuserMap',
				pagination : true,
				rownumbers : true,//行数  
//	 			queryForm : "#queryHeader form",//列筛选时附带加上搜索表单的条件
//	 			custom_fit : true,//额外处理自适应性
//	 			custom_heighter : "#queryHeader",//额外处理自适应性（计算时留出元素#queryHeader高度）
//	 			custom_height : 5,//额外处理自适应性（计算时留5px高度）
				singleSelect : false,
				idField : 'id',
				fit:true,
				columns : [ [
					{field: 'id', checkbox: true},
	                {field: 'loginName', title: '登录名', width: 200, align: 'center', sortable: true},
	                {field: 'name', title: '用户名', width: 200, align: 'center', sortable: true},
				] ],
				onBeforeLoad:function(){
		        	return isLoad;//isLoad;
		        }
			});
	}
    function addUserByOrganization(){
    	$("#addUserByOrganizationWindow form").form("clear");
		$("#addUserByOrganizationWindow").dialog("open");
    }
    function addQuestion(){
		$("#addQuestionWindow form").form("clear");
		$("#addQuestionWindow").dialog("open");
	}
    function publish() {
        var row = surveyPaperDatagrid.datagrid("getSelected");
        if (row) {
        	if(row.status==1){
        		layer.alert('已经发布，不可重复发布！', 'error');
        		return false;
        	}
        	var content = "发布后，不可增加、修改、删除问题且不可重复发布，您确定要发布吗？";
        	parent.layer.alert(content,{ btn: ['确定','取消']},function (data) {  
                if (data) {  
                	$.submit({
                		   url: "${dynamicURL}/admin/survey/paper/publish?paperId="+row.id+"",
                		   data: "paperId="+row.id,
                		   success: function(data){
                			   if(data.success){
                 				  	parent.layer.alert('问卷发布成功！', {
    					       	        icon: 1,
    					       	        skin: 'layer-ext-moon' 
    					       	    });
                 				   surveyPaperDatagrid.datagrid('reload');
                			   }else{
                				   parent.layer.alert(data.msg, {
                		       	        icon: 1,
                		       	        skin: 'layer-ext-moon' 
                		       	    });
                			   }
                		   }
                		});
                }
            });
        } else {
            layer.alert('提示', '请选择要发布的记录！', 'error');
        }
    }
  /*   function showUsers(){
      	 var row = surveyPaperDatagrid.treegrid("getSelected");
           if (row) {
          	 $("#searchWindow form").form("clear");
   			$("#searchWindow").dialog("open");
   			isLoad = true;
   			userDatagrid.datagrid("reload", {'search_EQ_surveyPaperEntity.id' : row.id});
           } else {
               layer.alert('请选择要修改的记录！', 'error');
           }
      } */
    function showQuestions(){
    	var row = surveyPaperDatagrid.treegrid("getSelected");
        if (row) {
        	layui.admin.openT("查看问题" , '${dynamicURL}/admin/survey/paperQuestion/toPaperQuestion?uuid='+row.uuid);
        } else {
            layer.alert('请选择要修改的记录！', 'error');
        }
    }
    function previewPaper(){
    	var row = surveyPaperDatagrid.treegrid("getSelected");
        if (row) {
        	layui.admin.openT("问卷预览", '${dynamicURL}/admin/survey/paper/toPreviewPaper?paperId='+row.id);
        } else {
            layer.alert('请选择一条记录！', 'error');
        }
    }
    function delUser(){
		 var row = surveyPaperDatagrid.datagrid("getSelected");
		 var rows = userDatagrid.datagrid("getSelections");
		 if(rows&&rows!=null&&rows.length>0){
			 layer.confirm('确认删除吗', function (data) {  
	                if (data) {  
	                	var userids=[];
	    				$.each(rows,function(i,p){
	    					userids.push(p.id);
	    				});
	    				$.submit({
	    					url:"${dynamicURL}/admin/survey/paperUser/deleteThis",
	    					data:"paperId="+row.id+"&userIds="+userids,
	    					success:function(data){
	    						if(data.success){
	    							layer.alert('删除成功！', {icon: 1}/* 'info',function(){
	    								userDatagrid.datagrid("reload");
	    							} */);
	    						}else{
	    							layer.alert(data.errorMsg, 'error');
	    						}
	    					},
	    					error:function(){
	    						layer.alert('系统错误！', 'error');
	    					}
	    				});  
	                }
	            });
		 }else{
			 layer.alert('请选择要删除的用户', 'error');
		 }
			
	}
    function addTypeUser(){
		 var row = surveyPaperDatagrid.datagrid("getSelected");
		var rows = addUserDatagrid.datagrid("getSelections");
		var userids=[];
		$.each(rows,function(i,p){
			userids.push(p.id);
		});
		$.submit({
			url:"${dynamicURL}/admin/survey/paperUser/saveThis",
			data:"paperId="+row.id+"&userIds="+userids,	
			success:function(data){
				if(data.success){
					addUserDatagrid.datagrid("reload");
					addUserDatagrid.datagrid("clearSelections");
					/*  layer.confirm('保存成功！',function () {
						 $('#addUserWindow').dialog('close');
							userDatagrid.datagrid("reload");
					 }) */
					layer.alert('保存成功！', {icon: 1}/* ,function(){
						$('#addUserWindow').dialog('close');
						userDatagrid.datagrid("reload");
					} */);
				}else{
					layer.alert(data.errorMsg, 'error');
				}
			},
			error:function(){
				layer.alert('系统错误！', 'error');
			}
		}); 
	}
    function addTypeUserByOrganization(){
		 var row = surveyPaperDatagrid.datagrid("getSelected");
		var rows = addUserByOrganizationDatagrid.datagrid("getSelections");
		var userids=[];
		$.each(rows,function(i,p){
			userids.push(p.id);
		});
		$.submit({
			url:"${dynamicURL}/admin/survey/paperUser/saveThis?paperId="+row.id+"&userIds="+userids,
			data:"paperId="+row.id+"&userIds="+userids,
			success:function(data){
				if(data.success){
					addUserByOrganizationDatagrid.datagrid("reload");
					addUserByOrganizationDatagrid.datagrid("clearSelections");
					layer.alert('提示', '保存成功！',{icon: 1}/*  'info',function(){
						$('#addUserByOrganizationWindow').dialog('close');
						userDatagrid.datagrid("reload");
					}*/);
				}else{
					layer.alert(data.errorMsg, 'error');
				}
			},
			error:function(){
				layer.alert('系统错误！', 'error');
			}
		}); 
	}
 	//复制
    function copy() {
        var row = surveyPaperDatagrid.datagrid("getSelected");
        if (row) {
            var form = $("#addWindow form.addForm");
            form.form("clear");
            $.submit({
                url: "${dynamicURL}/admin/survey/paper/detail",
                data: "id="+row.id,
                success: function (response) {
               		$('#classroomEntityFormId').combobox('setValue',response.obj.classroomEntity.id);
               		//培训计划
               		if(response.obj.trainInfoEntity!=null){
            			$('#trainInfoEntityFormId').combobox('setValue',response.obj.trainInfoEntity.id);
           			}else{
           				$('#trainInfoEntityFormId').combobox('setValue',null);
           			}
                   	$('#surveyStrategyTypeEntityFormId').combobox('setValue',response.obj.surveyStrategyTypeEntity.id);
                   	if(response.obj.surveyUserStrategyTypeEntity==null)
                   		$('#surveyUserStrategyTypeEntityFormId').combobox('setValue',null);
                   	else{
                   		$('#surveyUserStrategyTypeEntityFormId').combobox('setValue',response.obj.surveyUserStrategyTypeEntity.id);
                   	}
                   	$('#surveyConfigEntityFormId').combobox('setValue',response.obj.surveyConfigEntity.id);
                   	response.obj.id=null;
                   	response.obj.status=0;
                    form.form("load", response.obj);
                    $("#addWindow").dialog("open");
                }
            });
        } else {
            layer.alert('请选择要修改的记录！', 'error');
        }
    }
   
</script>