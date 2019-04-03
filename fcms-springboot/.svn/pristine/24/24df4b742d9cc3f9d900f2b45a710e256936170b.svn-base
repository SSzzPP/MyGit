<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<div class="padd15 easyui-layout" data-options="fit:true">
	<div class="easyui-layout layout-custom-resize" data-options="fit:true">
		<div data-options="region:'north',split:false,collapsible:false" >
			<form class="form-horizontal padd15" for="userDatagrid">
	       		 <table style="border-collapse: separate; border-spacing: 5px; width: 80%; align: center; border: 0; cellpadding: 0;"cellspacing="0" >
	                <tr>
						<td>登录名:</td>
	                 	<td>
	                        <input autocomplete="off" class="input-sm col-md-3 pull-left message-search search-white" type="text" name="search_LIKE_loginName" style="width: 150px;">
	                    </td>
	                    <td>用户名:</td>
	                    <td>
	                        <input autocomplete="off" class="input-sm col-md-3 pull-left message-search search-white" type="text" name="search_LIKE_name" style="width: 150px;">
	                    </td>
	                    <td>登录状态:</td>
	                 	<td>
							<select class="search-white" name="search_EQ_logined" style="width: 150px" >
								<option value="-1">未选择</option>
								<option value="1">在线</option>
								<option value="0">离线</option>
							</select>
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
		<div data-options="region:'west',split:false,collapsible:false" style="width: 20%;height:100%;padding:10px 5px 10px 15px;">
	        <table class="searchTable" cellspacing="0" id="whiteForm">
				<tr>
					<td>公&nbsp;&nbsp;司:</td>
					<td><select class="search-white" id="companyComboTree" class="easyui-combotree search-white"></select></td>
		        </tr>
	        </table>
	        <div style="height:84%;width:100%;">
				<table id="departmentTreegrid"></table>
			</div>
		</div>
		<div data-options="region:'center',split:false,collapsible:false" style="width: 80%;padding:10px 15px 10px 5px;">
		    <div id="container" class="easyui-layout layout" fit="true">
		        <div region="center" border="false">
			    	<div class="card-button">
						<div class="layui-btn-container">
	                      	<button class="layui-btn layui-btn" id="add" onclick="add()" icon-class="add">增加</button>
	                       	<button class="layui-btn layui-btn" id="edit" onclick="edit()" icon-class="edit">修改</button>
	   	                	<button class="layui-btn layui-btn" id="delete" onclick="del()" icon-class="remove">删除</button>
	          	            <button class="layui-btn layui-btn" id="reset" onclick="resetPwd()" icon-class="edit">重置密码</button>
	          	         </div>
           	        </div>
					<div id="userDatagridCnt" style="height:84%;width:100%;">
				    	<table id="userDatagrid"></table>
				    </div>
		        </div>
		    </div>
	  	 </div>
	 </div>
 </div>
 <script type="text/javascript">
	var companyComboTree;
	var departmentTreegrid;
	var userDataGrid;
	var isLoad=false;//是否延迟加载
	$(function () {
		companyComboTree = $('#companyComboTree').combotree({
		 	idField:'id',
		    nameField:'name',
            url: '${dynamicURL}/admin/system/company/combotree?search_EQ_parentId=0',
            onChange:function(newId,oldId) {
            	$('#departmentTreegrid').treegrid('clearSelections');
            	isLoad = true;
            	departmentTreegrid.treegrid("load", {'companyId' : newId});
            	if(newId==0){
            	userDataGrid.datagrid("load");
            	}else{
            	userDataGrid.datagrid("load", {'search_EQ_companyEntity.id' :newId});}
            }, 
            onLoadSuccess: function (node, data) {
            	var data=$("#companyComboTree").combotree('tree').tree("getRoot");
            	$("#companyComboTree").combotree('setValue',data.id);
            },
            
        });
 		/*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
	    departmentTreegrid = $('#departmentTreegrid').treegrid({
	   		url: '${dynamicURL}/admin/system/department/treegrid?search_EQ_parentId=0',
			pagination: false,
// 			rownumbers : true,
			fit:true,
			/* fitColumns:true, */
			treeField: 'name',
			idField: 'id',
			columns: [
			    [
			        {field: 'name', title: '部门名称',width:200,align:'left'},
			    ]
			],
			onBeforeLoad:function(){
				return isLoad;
			},
            onSelect:function(rowIndex, rowData){
            	$('#userDatagrid').datagrid('clearSelections');
            	var comId = $("#companyComboTree").combotree('getValue');
				userDataGrid.datagrid("load", {'search_EQ_departmentEntity.id' : rowIndex.id,'search_EQ_companyEntity.id' :comId});
            },
             onLoadSuccess:function(row,data){
             $('#departmentTreegrid').treegrid('collapseAll');
             userDataGrid.datagrid("load"); 
            } 
		});
		userDataGrid = $('#userDatagrid').datagrid({
            url: '${dynamicURL}/admin/system/user/list',
            pagination: true,
            rownumbers : false,//行数  
            singleSelect:true, 
            fit:true, 
            queryForm: "#queryHeader form",//列筛选时附带加上搜索表单的条件
            idField: 'id',
            columns: [[
				 {field: 'id', formatter:function Ra(val, row, index) {return '<input type="radio" name="selectRadio" id="selectRadio"' + index + '/>';}},
                 {field: 'loginName', title: '登录名', width: 250, align: 'center', sortable: true,},
                 {field: 'name', title: '用户名', width: 250, align: 'center', sortable: true},
                 {field: 'companyEntity.name', title: '公司', width: 250, align: 'center', sortable: true, formatter: function (value, rec) { if(null!=rec.companyEntity) return rec.companyEntity['name'];}},
                 {field: 'departmentEntity.name', title: '部门', width: 250, align: 'center', sortable: true, formatter: function (value, rec) { if(null!=rec.departmentEntity) return rec.departmentEntity['name'];}},
            ]],
            onDblClickRow: function(index){
				edit();
            },
            onSelect: function(index,row){
            	var text="设为负责人";
            	if(1==row.isManager){text="取消负责人";}
            	$('#manager').html(text);
            	//加载完毕后获取所有的checkbox遍历
                var radio1 = $("#userDatagridCnt .datagrid-cell.datagrid-cell-c2-id input[type='radio']")[index].disabled;
                //如果当前的单选框不可选，则不让其选中
                if (radio1 != true) {
                    //让点击的行单选按钮选中
                    $("#userDatagridCnt .datagrid-cell.datagrid-cell-c2-id input[type='radio']")[index].checked = true;
                    return false;
                }
                else {
                    $("#userDatagrid").datagrid("clearSelections");
                    $("input[type='radio']")[rowIndex].checked = false;
                    return false;
                }
            }
        });
		
		$("form[for] button#queryBtn").on("click.datagrid-query", function () {
			top._search($(this).parents("form[for]"));
		});
		$("form[for] button#clearBtn").on("click.datagrid-query", function () {
			top._clearSearch($(this).parents("form[for]"));
        });
	})
	 var rulesMsgs = {
		/* 校验规则  */
		rules : {
			loginName :"required",
			name : "required",
			mobile: "number",
			telephone: "number",
			email:"email",
			departmentId:"required",
		},
		/* 错误提示 */
		messages : {
			loginName :"请填写登录名",
			name : "请输入姓名",
			mobile: "必须输入数字",
			telephone: "必须输入数字",
			email:"请输入正确邮箱格式",
			departmentId:"请选择部门",
		}
	} 
	function add() {
	    var url;
	    var company =$("#companyComboTree").combotree('tree').tree('getSelected');
	    var dep=$('#departmentTreegrid').treegrid('getSelected');
	    if(dep==null){
	    	url="${dynamicURL}/admin/system/user/toAddUserPage";
	    }else{
	    	url="${dynamicURL}/admin/system/user/toAddUserPageByCom?company="+company.id+"&dep="+dep.id;
	    }
    	_layer({
    	  	url:url,
    	  	title:"新增用户",
    	  	btn: ['保存', '取消'],
    	  	width : "600px",
    	    height: "600px",
    	},{
    	  	yes: _.debounce(function(index, layero){
    	  		var bObj = layero.find("a.layui-layer-btn0");
	            var frm = $("#layui-layer-iframe" + ixs["新增用户"]).contents().find("form.addForm");
                $.submit({
		            url: "${dynamicURL}/admin/system/user/save",
		            formTg:frm,
		            butObj : bObj,
		            success : function(){
		            	$('#userDataGrid').datagrid('reload');
		            	layer.alert('保存成功！', {icon: 1});
		            	layer.close(ixs["新增用户"])
		            },
		            error : function(){
		            	layer.alert('出错啦！', {icon: 0});
		            }
	           	});
    	  	},waitTime,true),btn2: function(index, layero){
    	    //按钮【取消】的回调
    	  	layer.close(parent.parent.ixs["新增用户"]);
    	  	}
	  	});
    }
	
	
    //修改
    function edit() {
        var row = userDataGrid.datagrid("getSelected");
        if (row) {
            _layer({
	    	  	url:"${dynamicURL}/admin/system/user/toAddUserPage?userId="+row.id,
	    	  	title:"修改用户",
	    	  	btn: ['保存', '取消'],
	    	  	width : "600px",
	    	    height: "600px",
	    	},{ 
	    	  	yes: _.debounce(function(index, layero){
	    	  		var bObj = layero.find("a.layui-layer-btn0");
		            var frm = $("#layui-layer-iframe" + ixs["修改用户"]).contents().find("form.addForm");
	                $.submit({
			            url: "${dynamicURL}/admin/system/user/save",
			            formTg:frm,
			            butObj : bObj,
			            success : function(){
			            	$('#departmentTreegrid').treegrid('reload');
			            	layer.alert('保存成功！', {icon: 1});
			            	layer.close(ixs["修改用户"])
			            },
			            error : function(){
			            	layer.alert('出错啦！', {icon: 0});
			            }
		           	});
	    	  	//按钮【保存】的回调
	    	  	},waitTime,true),btn2: function(index, layero){
	    	    //按钮【取消】的回调
	    	  	layer.close(parent.parent.ixs["修改用户"]);
	    	  	}
		  	});
        } else {
        	parent.layer.alert('请选择要修改的记录！', {
       	        icon: 1,
       	        skin: 'layer-ext-moon' 
       	    });
        }
    }
    
    //删除
    function del(){
    	var row = userDataGrid.datagrid("getSelected");
        if (row) {
        	parent.layer.alert("您要删除当前所选记录？",{ btn: ['确定','取消']}, function (data) {
                if (data) {
               	 $.submit({
                        url: "${dynamicURL}/admin/system/user/delete",
                        data: {"ids": row.id},
                        success: function (data) {
                       	 	if(data.success){
	                       	 	parent.layer.alert('删除成功！', {
					       	        icon: 1,
					       	        skin: 'layer-ext-moon' 
					       	    });
                       	 		userDataGrid.datagrid('reload');
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
    
  	// 重置密码
    function resetPwd() {
        var row = userDataGrid.datagrid("getSelected");
        if (row) {
        	parent.layer.alert("您确定要重置该用户密码吗？", function (data) {
                 if (data) {
                	 $.submit({
                         url: "${dynamicURL}/admin/system/user/resetPwd",
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