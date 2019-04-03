<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ taglib prefix="security" uri="/tld/security.tld" %> --%>
<!--监管信息管理  -->
<div class="padd15 easyui-layout" data-options="fit:true">
	<div class="easyui-layout layout-custom-resize" data-options="fit:true">
		<div region="north" border="false">
			<div id="queryHeader" style="padding: 10px;  line-height: 40px;" class="easyui-panel">
				<form class="form-horizontal" for="venueDatagrid">
					<table style="width: 800px; line-height: 40px;">
						<tr>
							<td>名称:</td>
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
				<table id="venueDatagrid"></table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	//分页
	var venueDatagrid;
	$(function() {
	    /*------------------初始化当前table 列表  datagrid 变量为全局变量-------------------*/
	    venueDatagrid = $('#venueDatagrid').datagrid({
	        url: '${dynamicURL}/admin/manage/info/list',
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
		            field: 'name',
		            title: '名称',
		            width: '10%',
		            align: 'left'
		        },
		        {
		            field: 'otherName',
		            title: '别名',
		            align: 'left',
		            width: '10%',
		        },
		        {
		            field: 'businessHours',
		            title: '营业时间',
		            align: 'left',
		            width: '10%',
		        },
		        {
		            field: 'location',
		            title: '地址',
		            align: 'left',
		            width: '10%',
		        },
		        {
		            field: 'star',
		            title: '星级',
		            align: 'left',
		            width: '10%',
		        },
		        {
		            field: 'unit',
		            title: '所属单位',
		            align: 'left',
		            width: '10%',
		        },
		        {
		            field: 'administrativeAreaStr',
		            title: '所在行政区',
		            align: 'left',
		            width: '10%',
		        },
		        {
		            field: 'businessAreaStr',
		            title: '所在商区',
		            align: 'left',
		            width: '10%',
		        },
		        {
		            field: 'operation',
		            title: '操作',
		            align: 'left',
		            width: '20%',
		            formatter: function Ra(val, row, index) {
						return '<a lay-href="${dynamicURL}/admin/manage/info/toVealuate?venueId='+row.id+'"><button class="layui-btn layui-btn-sm">评价详情</button></a> &nbsp;&nbsp;'+
						'<a lay-href="${dynamicURL}/admin/manage/info/toComplaint?venueId='+row.id+'"><button class="layui-btn layui-btn-sm" >投诉详情</button></a>';
		            }
		        }
	        ]],
	        onDblClickRow: function(index) {
	            toVenueInfo();
	        }
	
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
	function toVenueInfo(venueId){
		var row = venueDatagrid.datagrid("getSelected");
		if(row){
			parent._layer({
		        url: '${dynamicURL}/admin/manage/info/toVenueInfo?venueId='+row.id,
		        title: "场馆信息",
		        width:'700px',
		        height:'700px',
		        btn: ['关闭']
		    },
		    {
		        yes: function(index, layero) {
		        	parent.layer.close(parent.parent.ixs["场馆信息"]);
		        }
		    }); 
		}else{
			layer.alert('请选择要修改的记录！', {icon: 0});
		}
	}

</script>


