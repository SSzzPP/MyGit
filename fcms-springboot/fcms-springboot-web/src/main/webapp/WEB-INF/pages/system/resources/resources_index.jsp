<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="padd15 easyui-layout" data-options="fit:true">
	<div class="easyui-layout layout-custom-resize" data-options="custom_fit:true,fit:true">
		<div data-options="region:'center',split:false,collapsible:false" style="width: 33%;">
			<div id="container" class="easyui-layout layout" fit="true">
		        <div region="north" border="false">
		        	<div class="card-button">
						<div class="layui-btn-container">
							<button  data-position='right' class="layui-btn layui-btn" id="add" onclick="add()" icon-class="add">新增</button>
			                <button  data-position='right' class="layui-btn layui-btn" id="edit" onclick="edit()" icon-class="edit">修改</button>
							<button  data-position='right' class="layui-btn layui-btn" id="del" onclick="del()" icon-class="remove">删除</button>
				    	</div>
				    </div>
	            </div>
	            <div region="center" border="false">
					<table id="resourcesTreegrid"></table>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
var resourcesTreegrid, resourcesCombotree;
$(function() {
    resourcesCombotree = $('#resourceInfoFormId').combotree({
        panelWidth: 180,
        panelHeight: 300,
        valueField: 'id',
        nameField: 'name',
        url: '${dynamicURL}/admin/system/resources/combotree?search_EQ_parentId=0&search_EQ_flag=0'
    });
    resourcesTreegrid = $('#resourcesTreegrid').treegrid({
        url: '${dynamicURL}/admin/system/resources/treegrid?search_EQ_parentId=0&search_EQ_flag=0&sort=sortNumber',
        queryForm: "#queryHeader form",
        //列筛选时附带加上搜索表单的条件
        fit: true,
        pagination: false,
        rownumbers: false,
        singleSelect: true,
        lines: true,
        idField: 'id',
        treeField: "name",
        columns: [[{
            field: 'id',
            checkbox: true
        },
        {
            field: 'name',
            title: '名称',
            width: 200,
            align: 'left'
        },
        {
            field: 'deleteFlag',
            title: '状态',
            width: 100,
            formatter: function(value, row, index) {
                return row.deleteFlag == '0' ? '正常': '禁用';
            }
        },
        {
            field: 'type',
            title: '类型',
            width: 100,
            formatter: function(value, row, index) {
                return row.type == '0' ? '菜单': '功能';
            },
            styler: function cellStyler(value, row, index) {
                if (value == 0) {
                    return 'background-color:rgba(0, 0, 0, 0.55);color:#FFF;';
                } else {
                    return 'background-color:rgba(255,255,255,0.55);color:#000;';
                }
            }
        },
        {
            field: 'icon',
            title: '图标',
            width: 180,
            formatter: function(value, row, index) {
            	var strIcon=(row.icon || "");
                return '<i class="' + strIcon + '"></i> ' + strIcon;
            }
        },
        {
            field: 'url',
            title: 'URL',
            width: 180,
        },
        {
            field: 'sortNumber',
            title: '顺序号',
            width: 60,
        },
        {
            field: 'code',
            title: '编码',
            width: 80,
        },
        {
            field: 'description',
            width: 350,
            title: '描述',
        }]],
        onDblClickRow: function(index) {
            edit();
        },

        onExpand: function(node) {
            var id = node.id;
            var tree = $('#resourceInfoFormId').combotree('tree');
            var node = tree.tree("find", id);
            tree.tree("expand", node.target);
        }
    });

});
var rulesMsgs = {
    /* 校验规则  */
    rules: {
        name: "required",
        type: "required",
    },
    /* 错误提示 */
    messages: {
        name: "请输入名称",
        type: "请选择类型",
    }
}
/* 新增资源 */
function add() {
    _layer({
        url: "${dynamicURL}/admin/system/resources/add",
        title: "新增资源",
        width: "600px",
        height: "500px",
        btn: ['保存', '取消']
    },
    {
        yes:  _.debounce(function(index, layero) {
        	var bObj = layero.find("a.layui-layer-btn0");
            var frm = $("#layui-layer-iframe" + ixs["新增资源"]).contents().find("form.addForm");
            $.submit({
	            url: "${dynamicURL}/admin/system/resources/save",
	            formTg:frm,
	            butObj : bObj,
	            success : function(rec){
	            	if(rec.success){
		            	$('#resourcesTreegrid').treegrid('reload');
		            	layer.alert('保存成功！', {icon: 1});
		            	layer.close(ixs["新增资源"])
	            	}else{
	            		layer.alert(rec.msg, {icon: 0});
	            	}
	            },
	            error : function(){
	            	layer.alert('出错啦！', {icon: 0});
	            }
           	});
        },waitTime,true),btn2: function(index, layero){
    	    //按钮【取消】的回调
    	  	layer.close(ixs["新增资源"]);
    	},
    });
}

//修改
function edit() {
    var row = resourcesTreegrid.datagrid("getSelected");
    if (row) {
        _layer({
            url: "${dynamicURL}/admin/system/resources/add?id=" + row.id,
            title: "修改资源",
            btn: ['保存', '取消'],
            width: "600px",
            height: "500px",
        },
        {
        	yes:  _.debounce(function(index, layero) {
            	var bObj = layero.find("a.layui-layer-btn0");
                var frm = $("#layui-layer-iframe" + ixs["修改资源"]).contents().find("form.addForm");
                $.submit({
    	            url: "${dynamicURL}/admin/system/resources/save",
    	            formTg:frm,
    	            butObj : bObj,
    	            success : function(){
    	            	$('#resourcesTreegrid').treegrid('reload');
    	            	layer.alert('保存成功！', {icon: 1});
    	            	layer.close(ixs["修改资源"])
    	            },
    	            error : function(){
    	            	layer.alert('出错啦！', {icon: 0});
    	            }
               	});
            },waitTime,true),btn2: function(index, layero){
        	    //按钮【取消】的回调
        	  	layer.close(ixs["修改资源"]);
        	},
        });
    } else {
    	parent.layer.alert('请选择要修改的记录！', {
            icon: 0,
            skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
        });
    }

}

//删除
function del() {
    var row = resourcesTreegrid.treegrid("getSelected");
    if (row) {
    	parent.layer.confirm('确定要删除所选的记录吗？', {
            btn: ['删除', '取消'] //按钮
        },
        function(data) {
            if (data) {
                $.submit({
                    url: "${dynamicURL}/admin/system/resources/delete",
                    data: {
                        "ids": row.id
                    },
                    dataType: "json",
                    success: function(data) {
                        if (data.success) {
                            parent.layer.alert('删除成功！', {
                                icon: 1,
                                skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
                            });
                            $("#resourcesTreegrid").treegrid('reload');
                        } else {
                        	parent.layer.alert('删除失败！', {
                                icon: 0,
                                skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
                            });
                        }
                    }
                });
            }
        });
    } else {
    	parent.layer.alert('请选择要删除的记录！', {
            icon: 0,
            skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
        });
    }
}
</script>

