<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 多选人员 --%>
<div id="roleUserSelection" class="layer-cnt" title="选择人员"  modal="true" closed="true" style="overflow: hidden; width: 100%; height: 100%; padding: 10px; margin: auto;" >
	<table width="100%" align="center" border="0" cellpadding="0" style="border-collapse: separate; border-spacing: 5px;" cellspacing="0">
		<tr style="height: 50px;">
			<td colspan="5">
				<label for="company">公司：</label><select  id="company" style="width: 150px; font-size: 14px;" contenteditable="false"></select> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;部门：<select id="dept" style="width: 150px; font-size: 14px;" contenteditable="false"></select>
			</td>
			<td colspan="1"><input class="form-control" placeholder="请输入人员姓名"  id="searchBox" style="width: 150px; height: 28px;float: left;"></input>
				<div class="card-button">
					<div class="layui-btn-container">
						<button id="searchButton" class="layui-btn" plain="false">查询</button>
						<button id="reset" class="layui-btn" plain="false" style="margin-left:0px;">重置</button>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="3">待选人员：</td>
			<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;已选人员：</td>
		</tr>
		<tr>
			<td style="width: 200px;height: 300px;" colspan="2">
				<table id="userDatagrid"></table>
            </td>
            <style>
            	.moveBtn{
            		 color:black !important;
            		 font-weight: bold !important;
            		 width: 50px !important;
            	}
            </style>
			<td style="text-align: center;" colspan="2">
				<a href="#" class="button big moveBtn" id="add" title="选择">&gt;</a><br /> <br /> 
				<a href="#" class="button big moveBtn" id="remove" title="删除">&lt;</a><br />
				<br /> <a href="#" class="button big moveBtn" id="addAll" title="全部选择">&gt;&gt;</a><br />
				<br /> <a href="#" class="button big moveBtn" id="removeAll" title="全部删除">&lt;&lt;</a><br />
			</td>
			<td id="selectedData" style="width: 300px;height: 300px;text-align: right;" colspan="2">
				<table id="selectedDatagrid"></table>
			</td>
		</tr>
	</table>
</div>
<script>
var depCom,company,canLoad=false,userDatagrid,selectedDatagrid;
$(function(){
	userDatagrid = $('#userDatagrid').datagrid({
		url : '${dynamicURL}/admin/system/user/list',
		pagination : true,
		singleSelect : false,
		rownumbers : false,
		idField : 'id',
		nameField : 'name',
		lines:true,
		fit:true,
		columns : [ [ 
           {field : 'id',checkbox:true},
           {field : 'name',title : '名称',width : 100 ,align:'left'}
        ] ],
        onSelect:function(index, data){
        }, 
		onDblClickRow: function(index,row){
			addRows(row);
		},
		onBeforeLoad:function(){
			return canLoad;
		}
	});
	selectedDatagrid = $('#selectedDatagrid').datagrid({
		data:[{id:-100,name:"无数据"}],
		singleSelect : false,
		rownumbers : false,
		idField : 'id',
		nameField : 'name',
		lines:true,
		fit:true,
		columns : [ [ 
           {field : 'id',checkbox:true},
           {field : 'name',title : '名称',width : 100 ,align:'left'}
        ] ],
        onSelect:function(index, data){
        }, 
		onDblClickRow: function(index,row){
			removeRows(row);
		}
	});
	/* 调整右侧数据表格对齐方式 */
	$("#selectedData>div").css("float","right");
	depCom = $('#dept').combotree({
		   lines : true,
		   idField: 'id',
		   nameField: 'name',
		  	onChange:function(newValue, oldValue){
		  		canLoad=true;
		  		//人员加载
				userDatagrid.datagrid("load",{'search_EQ_departmentEntity.id':newValue});
		  	}
	});
	company=$('#company').combotree({
		   idField: 'id',
		   nameField: 'name',
		   url: '${dynamicURL}/admin/system/company/combotree?search_EQ_parentId=0',
		   onChange:function(newValue, oldValue){
			    canLoad=true;
		   		//级联加载
				$.get('${dynamicURL}/admin/system/department/combotree',{'search_EQ_companyEntity.id':newValue},function(data){
					depCom.combotree("clear").combotree('loadData',data);
				},'json');
		   		//人员加载
		   		userDatagrid.datagrid("load",{'search_EQ_companyEntity.id':newValue});
			}
		});
	//移到右边
	$('#add').click(function() {
		//获取选中的选项，删除并追加给对方
		var rows=userDatagrid.datagrid("getSelections");
		addRows(rows);
	});
	//移到左边
	$('#remove').click(function() {
		var rows=selectedDatagrid.datagrid("getSelections");
		removeRows(rows);
	});
	//全部移到右边
	$('#addAll').click(function() {
		//获取全部的选项,删除并追加给对方
		var rows=userDatagrid.datagrid("getRows");
		addRows(rows);
	});
	//全部移到左边
	$('#removeAll').click(function() {
		var rows=selectedDatagrid.datagrid("getRows");
		removeRows(rows);
	});
	//查询按钮
    $("#searchButton").click(function() {
    	canLoad=true;
		var searchText = $('#searchBox').val();
		var companyId=company.combotree("getValue");
		var deptId=depCom.combotree("getValue");
		var params={};
		searchText&&(params["search_LIKE_name"]=searchText);
		(companyId && companyId != "0")&&(params["search_EQ_companyEntity.id"]=companyId);
		(deptId && deptId != "0")&&(params["search_EQ_departmentEntity.id"]=deptId);
		userDatagrid.datagrid("load",params);
	});
    /* 重置 */
	$("#reset").click(function(){
		$('#searchBox').val("");
		company.combotree("setValue",0);
		userDatagrid.datagrid("load",{});
	});
	/* 选中  */
	function addRows(rows){
		var type=$.type(rows);
		if(type=='array'){
			if(rows.length){
				/* 向右插入新数据  */
				$.each(rows,function(i,d){
					insertRow(this);
				});
				/* 从左侧删除右移的数据  */
				var tempRows=rows.slice(0);
				$.each(tempRows,function(i,d){
					userDatagrid.datagrid("deleteRow",userDatagrid.datagrid('getRowIndex',this));
				});
			}
		}else if(type=="object"){
			insertRow(rows);
			userDatagrid.datagrid("deleteRow",userDatagrid.datagrid('getRowIndex',rows));
		}
		/* 如果列表长度为0,加入【无数据】 */
		var cnts=userDatagrid.datagrid('getRows');
		if(!cnts || !cnts.length){
			userDatagrid.datagrid('loadData',[{id:-100,name:"无数据"}]);
		}
		function insertRow(row){
			/* 去重 */
			var ix=selectedDatagrid.datagrid('getRowIndex',row.id);
			if(ix==-1){
				selectedDatagrid.datagrid('insertRow', {
					index:0,
					row:row
				});
			}
			/* 删除【无数据】  */
			var eix=selectedDatagrid.datagrid('getRowIndex',-100);
			if(eix!=-1){
				selectedDatagrid.datagrid('deleteRow',eix);
			}
		}
	}
	/* 取消  */
	function removeRows(rows){
		var type=$.type(rows);
		if(type=='array'){
			if(rows.length){
				$.each(rows,function(){
					insertRow(this);
				});
				/* 从左侧删除右移的数据  */
				var tempRows=rows.slice(0);
				$.each(tempRows,function(i,d){
					selectedDatagrid.datagrid("deleteRow",selectedDatagrid.datagrid('getRowIndex',this));
				});
			}
		}else if(type=="object"){
			insertRow(rows);
			selectedDatagrid.datagrid("deleteRow",selectedDatagrid.datagrid('getRowIndex',rows));
		}
		/* 如果列表长度为0,加入【无数据】 */
		var cnts=selectedDatagrid.datagrid('getRows');
		if(!cnts || !cnts.length){
			selectedDatagrid.datagrid('loadData',[{id:-100,name:"无数据"}]);
		}
		function insertRow(row){
			if(row.id==-100){
				return ;
			}
			/* 去重 */
			var ix=userDatagrid.datagrid('getRowIndex',row.id);
			if(ix==-1){
				userDatagrid.datagrid('insertRow', {
					index:0,
					row:row
				});
			}
			/* 删除【无数据】  */
			var eix=userDatagrid.datagrid('getRowIndex',-100);
			if(eix!=-1){
				userDatagrid.datagrid('deleteRow',eix);
			}
		}
	}
});
</script>
