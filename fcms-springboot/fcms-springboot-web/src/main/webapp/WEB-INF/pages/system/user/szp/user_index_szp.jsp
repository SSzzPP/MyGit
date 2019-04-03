<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<div class="padd15 easyui-layout" data-options="fit:true">
	<div class="easyui-layout layout-custom-resize" data-options="fit:true">
		<div data-options="region:'north',split:false,collapsible:false" >
			<form class="form-horizontal padd15" for="userDatagrid">
	       		 <table style="border-collapse: separate; border-spacing: 5px; width: 100%; align: center; border: 0; cellpadding: 0;"cellspacing="0" >
	                <tr>
	                    <td>用户名:</td>
	                    <td>
	                        <input autocomplete="off" class="input-sm col-md-3 pull-left message-search search-white" type="text" name="search_userName" style="width: 50px;">
	                    </td>
						<td>公司:</td>
						<td>
							<select id="companyComboTree" class="easyui-combotree search-white"  name="search_companyName" style="width: 120px;"></select>
						</td>
						<td>部门:</td>
						<td>
							<select id="departmentId" class="easyui-combobox"  name="search_departmentName" style="width: 80px;"></select>
						</td>
						<td>出生日期:</td>
	                    <td>
	                        <input id="birthday" autocomplete="off" class="easyui-datebox" name="search_userBirthday" style="width: 120px;">
	                    </td>
						<td>最小年龄:</td>
	                    <td>
	                        <input autocomplete="off" class="input-sm col-md-3 pull-left message-search search-white" type="text" name="search_minAge" style="width: 50px;">
	                    </td>
	                    <td>最大年龄:</td>
	                    <td>
	                        <input autocomplete="off" class="input-sm col-md-3 pull-left message-search search-white" type="text" name="search_maxAge" style="width: 50px;">
	                    </td>
						<td>
							<div class="BtnLine" style="border: 0px; margin: 0px; padding: 0px;text-align:left">
								<button type="button" class="layui-btn layui-btn" id="queryBtn"  icon-class="search" >搜索</button>
								<button type="button" class="layui-btn layui-btn" id="clearBtn" icon-class="refresh" >重置</button>
							</div>
						</td>
	                </tr>
	           </table>
	       	</form>
		</div>
		<div data-options="region:'center'" border="false">
			<div style="width: 100%; padding: 10px 15px;"class="easyui-layout layout" fit="true">
				<table id="userDatagrid"></table>
			</div>
		</div>
	 </div>
 </div>
 <script type="text/javascript">
	var companyComboTree;
	var userDataGrid;
	var isLoad=false;
	// 公司树形菜单
	$(function () {
		companyComboTree = $('#companyComboTree').combotree({
	 	idField:'id',
	    nameField:'name',
        url: '${dynamicURL}/admin/system/company/combotree?search_EQ_parentId=0',
        onLoadSuccess: function (node, data) {
        	var data=$("#companyComboTree").combotree('tree').tree("getRoot");
        	$("#companyComboTree").combotree('setValue',data.id);
        },
        onSelect: function(rec){    
			//console.log(rec);
            $('#departmentId').combobox('reload', '${dynamicURL}/admin/system/department/search?search_EQ_companyEntity.id='+rec.id);    
        }
	});
    // 部门下拉框
   	var departmentId = "${DepartmentEntity.id}";
   	$(function() { 
   		$('#departmentId').combobox({
   			valueField : 'id',
   			textField : 'name',
   			multiple: false, 
   			url : '${dynamicURL}/admin/system/department/search',
   			onLoadSuccess:function(data){
   				//console.log(data);
   				if(departmentId){
   					$("#departmentId").combobox('setValue',departmentId);
   				}
   			}
   		});
   	});
       	
	// 用户信息
    userDataGrid = $('#userDatagrid').datagrid({
    	url: '${dynamicURL}/admin/system/user/szp/list',
        pagination: true,
        rownumbers : false,//行数  
        singleSelect:true, 
        fit:true, 
        queryForm: "#queryHeader form",//列筛选时附带加上搜索表单的条件
        idField: 'id',
        // 定义哪些列可以进行排序
        //sortName: 'age',
        // 定义列的排序顺序，只能是'asc'或'desc'
        //sortOrder: 'desc',
        columns: [[
			{field: 'id',checkbox: true},
            {field: 'userName', title: '用户名', width: 150, align: 'center'},
            {field: 'age', title: '年龄', width: 100, align: 'center', sortable: true},
            {field: 'userBirthday', title: '出生日期', width: 200, align: 'center', sortable: true},
            {field: 'companyName', title: '公司名称', width: 300, align: 'center'},
            {field: 'departmentName', title: '部门名称', width: 300, align: 'center'}
        ]],
        onDblClickRow: function(index){
			edit();
        } 
    });
    $("form[for] button#queryBtn").on("click.datagrid-query", function () {
		top._search($(this).parents("form[for]"));
	});
	$("form[for] button#clearBtn").on("click.datagrid-query", function () {
		top._clearSearch($(this).parents("form[for]"));
   	});
});	
</script>