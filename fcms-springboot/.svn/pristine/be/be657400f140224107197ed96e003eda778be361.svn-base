<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ taglib prefix="security" uri="/tld/security.tld" %> --%>
<!--预约信息管理  -->
<div class="padd15 easyui-layout" data-options="fit:true">
	<div class="easyui-layout layout-custom-resize" data-options="fit:true">
		<div region="north" border="false">
			<div id="queryHeader" style="padding: 10px;  line-height: 40px;" class="easyui-panel">
				<form class="form-horizontal" for="orderDatagrid">
					<table style="width: 800px; line-height: 40px;" >
						<tr>
							<td>姓名:</td>
							<td>
								<input class="easyui-textbox" type="text" name="search_LIKE_name" style="width: 150px; height: 26px">
							</td>
							<td>
								<div class="card-button">
									<div class="layui-btn-container">
										<button id="search" type="button" class="layui-btn queryBtn">搜索</button>
										<button id="reset" type="button" class="layui-btn clearBtn">重置</button>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div data-options="region:'center'" border="false">
			<div style="width: 100%; padding: 10px 15px;" class="easyui-layout layout" fit="true">
				<table id="orderDatagrid"></table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	//分页
	var orderDatagrid;
	$(function() {
		/* $('#equipmentId').combobox({
			url:"${dynamicURL}/admin/system/dict/combobox?type=VENUE_TYPE",
		    valueField:"id",
		    textField:"name",
		}); */
	    /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
	    orderDatagrid = $('#orderDatagrid').datagrid({
	        url: '${dynamicURL}/admin/order/info/list',
	        queryForm: "#queryHeader form",
	        //列筛选时附带加上搜索表单的条件
	        pagination: true,
	        rownumbers: true,
	        singleSelect: true,
	        lines: true,
	        idField: 'id',
	        columns: [[
		        /* {
		            field: 'id',
		            checkbox: true
		        }, */
		        {
		            field: 'type',
		            title: '类型',
		            width: '8%',
		            align: 'left',
		            formatter: function Ra(val, row, index) {
		            	if(row.type == 1 ){
							return '预约场馆';
		            	}else{
							return '预约教练';	
						}
		            }
		        },
		        {
		            field: 'name',
		            title: '姓名',
		            width: '7%',
		            align: 'left'
		        },
		        {
		            field: 'mobile',
		            title: '联系方式',
		            align: 'left',
		            width: '10%',
		        },
		        {
		            field: 'venueName',
		            title: '场馆名称',
		            align: 'left',
		            width: '10%',
		        },
		        {
		            field: 'equipmentName',
		            title: '设施名称',
		            align: 'left',
		            width: '10%',
		        },
		        {
		            field: 'coachName',
		            title: '教练姓名',
		            align: 'left',
		            width: '10%',
		        },
		        {
		            field: 'courseName',
		            title: '课程名称',
		            align: 'left',
		            width: '10%',
		        },
		        {
		            field: 'count',
		            title: '数量/课时',
		            align: 'left',
		            width: '8%',
		        },
		        {
		            field: 'orderTime',
		            title: '开始时间',
		            align: 'left',
		            width: '10%',
		            sortable: true,
		        },
		        {
		            field: 'orderEndTime',
		            title: '结束时间',
		            align: 'left',
		            width: '10%',
		        },
		        {
		            field: 'status',
		            title: '接单状态',
		            align: 'left',
		            width: '8%',
		            formatter: function Ra(val, row, index) {
		            	if(row.status == 0 ){
							return '未接单';
		            	}else{
							return '已接单';	
						}
		            }
		        },
		        {
		            field: 'editStatus',
		            title: '改签',
		            align: 'left',
		            width: '8%',
		            formatter: function Ra(val, row, index) {
		            	if(row.cancleStatus ==null ){
							if(row.editStatus==null)
								return '正常';
							if(row.editStatus==null)
								return '等待审核中';
							if(row.editStatus==1)
								return '已改签';
							if(row.editStatus==2)
								return '改签失败';
		            	}else{
							return '已退订，无法改签';	
						}
		            }
		        },
		        {
		            field: 'cancle',
		            title: '退订',
		            align: 'left',
		            width: '10%',
		            formatter: function Ra(val, row, index) {
		            	if(row.cancleStatus ==null){
							return '正常';
		            	}else{
							return '已退订';	
						}
		            }
		        }
	        ]],
	
	    });
	    $("form[for] button.queryBtn").on("click.datagrid-query",
	    function() {
	        top._search($(this).parents("form[for]"));
	    });
	    $("form[for] button.clearBtn").on("click.datagrid-query",
	    function() {
	        top._clearSearch($(this).parents("form"));
	    });
	  
	});
	/*退订*/
	/* function cancle(id) {
		layer.confirm('您确定要退订吗？', {
			  btn: ['确定','取消'] //按钮
			}, function(){
				$.submit({
		            url: "${dynamicURL}/admin/order/info/cancle",
		            data:{
		                "id": id,
		                "status": 1
		            },
		            butObj : null,
		            success: function(res) {
		                if (res.success) {
		                	layer.alert('操作成功！', {icon: 1});
		                    $('#orderDatagrid').datagrid("reload");
		                } else {
		                	layer.alert(res.msg, {icon: 0});
		                }
		            }
		    	});
			}, function(){
			  layer.close('all');
		});
        
	} */
	/*修改*/
	/* function edit(id) {
		if(id){
			parent._layer({
		        url: '${dynamicURL}/admin/order/info/toEdit?orderId='+id,
		        title: "改签",
		        width:'600px',
		        height:'600px',
		        btn: ['保存', '取消']
		    },
		    {
		        yes: function(index, layero) {
		        	var bObj = layero.find("a.layui-layer-btn0");
		            var frm = parent.$("#layui-layer-iframe" + parent.ixs["改签"]).contents().find("form.addForm");
		            $.submit({
			            url: "${dynamicURL}/admin/order/info/saveOrderEdit",
			            formTg:frm,
			            butObj : bObj,
			            success : function(res){
			            	if(res.success){
				            	$('#orderDatagrid').datagrid('reload');
				            	layer.alert('保存成功！', {icon: 1});
				            	parent.layer.close(parent.parent.ixs["改签"]);
			            	}else{
			            		layer.alert(res.msg, {icon: 0});
			            	}
			            },
		           	});
		        },
		        btn2: function(index, layero) {
		        	parent.layer.close(parent.parent.ixs["改签"]);
		        }
		    }); 
		}else{
			layer.alert('请选择要改签的记录！', {icon: 0});
		}
	} */

</script>


