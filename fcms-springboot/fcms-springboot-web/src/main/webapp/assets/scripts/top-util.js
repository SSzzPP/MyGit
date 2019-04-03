var top = $.extend({}, top);
//缓存
$.ajaxSetup ({
    cache: false
});
// 状态修改方法
function changestatus(datagrid, options, callback) {
	// 判断idField
	var idField = options.idField ? (options.idField) : (datagrid
			.datagrid("options").idField);
	idField = idField ? idField : "id";
	var paramName = options.paramName ? options.paramName : "ids";
	var prompt = options.prompt ? options.prompt : "您要修改当前所选记录状态？";
	var delUpdateReload = datagrid.datagrid("options").delUpdateReload;
	var rows = datagrid.datagrid('getSelections');
	if (rows.length > 0) {
		$.messager.confirm('请确认', prompt, function(r) {
			if (r) {
				var ids = [];
				var delEditing = false;
				var editIndex = datagrid.data("editIndex");
				$.each(rows, function(i) {
					if (this[idField]) {
						ids.push(this[idField]);
					}
					var index = datagrid.datagrid("getRowIndex", this);
					if (typeof editIndex == 'number' && editIndex == index) {
						delEditing = true;
					}
				});
				function success() {
					if (datagrid.data().treegrid) {
						datagrid.treegrid('reload');
						datagrid.removeData("editIndex");
					} else {
						if (delEditing) {
							datagrid.datagrid("deleteRow", editIndex)
						}
						if (delUpdateReload === false && rows.length > 0) {
							// 倒序删
							for ( var i = rows.length - 1; i >= 0; i--) {
								var index = datagrid.datagrid("getRowIndex",
										rows[i]);
								datagrid.datagrid("deleteRow", index);
							}
						} else {
							datagrid.removeData("editIndex");
							datagrid.datagrid('reload');
						}
						datagrid.datagrid("clearSelections");
						datagrid.datagrid("clearChecked");
					}
				}
				if (ids.length > 0) {
					var params = {};
					params[paramName] = ids;
					$.ajax({
						url : options.statusUrl,
						data : $.param(params, true),// 表示传统的“shallow”的序列化
						dataType : 'json',
						type : 'post',
						success : function(response) {
							success(response);
							$.messager.show({
								title : '提示',
								msg : '状态修改成功！'
							});
							if (callback && typeof callback == 'function') {
								callback(response)
							}
						},
						error : function() {
							$.messager.show({
								title : '提示',
								msg : '状态修改失败！'
							});
						}
					});
				} else {
					success()
				}
			}
		});
	} else {
		$.messager.alert('提示', '请选择要修改状态的记录！', 'info');
	}
}

/**
 * @requires jQuery 将form表单元素的值序列化成对象
 * @returns object
 */
top.serializeObject = function(form) {
	var o = {};
	$.each(form.serializeArray(), function(index) {
		if(this['value'] == "-1"){
			this['value'] = "";
		}
		if (o[this['name']]) {
			o[this['name']] = o[this['name']] + "," + this['value'];
		} else {
			o[this['name']] = this['value'];
		}
	});
	return o;
};

top._search = function(form, dg) {
	dg = dg == null ? $("#" + form.attr("for")) : dg;
	if (dg) {
		if (dg.data().treegrid) {
			dg.treegrid('load', top.serializeObject(form));
		} else {
			dg.datagrid('load', top.serializeObject(form));
		}
	}

}

top._clearSearch = function(form) {
	form.form('clear');
	top._search(form);
}

top._del = function(datagrid, options, callback) {
	// 判断idField
	var idField = options.idField ? (options.idField) : (datagrid
			.datagrid("options").idField);
	idField = idField ? idField : "id";
	var paramName = options.paramName ? options.paramName : "ids";
	var prompt = options.prompt ? options.prompt : "您要删除当前所选记录？";
	var delUpdateReload = datagrid.datagrid("options").delUpdateReload;
	var rows = datagrid.datagrid('getSelections');
	if (rows.length > 0) {
		$.messager.confirm('请确认', prompt, function(r) {
			if (r) {
				var ids = [];
				var delEditing = false;
				var editIndex = datagrid.data("editIndex");
				$.each(rows, function(i) {
					if (this[idField]) {
						ids.push(this[idField]);
					}
					var index = datagrid.datagrid("getRowIndex", this);
					if (typeof editIndex == 'number' && editIndex == index) {
						delEditing = true;
					}
				});
				function success() {
					if (datagrid.data().treegrid) {
						datagrid.treegrid('reload');
						datagrid.removeData("editIndex");
						datagrid.treegrid("clearSelections");
						datagrid.treegrid("clearChecked");
					} else {
						if (delEditing) {
							datagrid.datagrid("deleteRow", editIndex)
						}
						if (delUpdateReload === false && rows.length > 0) {
							// 倒序删
							for ( var i = rows.length - 1; i >= 0; i--) {
								var index = datagrid.datagrid("getRowIndex",
										rows[i]);
								datagrid.datagrid("deleteRow", index);
							}
						} else {
							datagrid.removeData("editIndex");
							datagrid.datagrid('reload');
						}
						datagrid.datagrid("clearSelections");
						datagrid.datagrid("clearChecked");
					}
				}
				if (ids.length > 0) {
					var params = {};
					params[paramName] = ids;
					$.ajax({
						url : options.delUrl,
						data : $.param(params, true),// 表示传统的“shallow”的序列化
						dataType : 'json',
						type : 'post',
						success : function(response) {
							if(response.success){
								success(response);
								$.messager.alert('提示', '删除成功！', 'info');
								if (callback && typeof callback == 'function') {
									callback(response)
								}
							}else{
								$.messager.alert('提示', response.msg||'删除失败！', 'error');
							}
							
						},
						error : function() {
//							$.messager.show({
//								title : '提示',
//								msg : '删除失败！'
//							});
							$.messager.alert('提示', '删除失败！', 'error');
						}
					});
				} else {
					success()
				}
			}
		});
	} else {
		$.messager.alert('提示', '请选择要删除的记录！', 'info');
	}
}

// 提交方法
top._commit = function(datagrid, options, callback) {
	// 判断idField
	var idField = options.idField ? (options.idField) : (datagrid
			.datagrid("options").idField);
	idField = idField ? idField : "id";
	var paramName = options.paramName ? options.paramName : "ids";
	var prompt = options.prompt ? options.prompt : "您要提交当前所选记录？";
	var delUpdateReload = datagrid.datagrid("options").delUpdateReload;
	var rows = datagrid.datagrid('getSelections');
	if (rows.length > 0) {
		$.messager.confirm('请确认', prompt, function(r) {
			if (r) {
				var ids = [];
				var delEditing = false;
				var editIndex = datagrid.data("editIndex");
				$.each(rows, function(i) {
					if (this[idField]) {
						ids.push(this[idField]);
					}
					var index = datagrid.datagrid("getRowIndex", this);
					if (typeof editIndex == 'number' && editIndex == index) {
						delEditing = true;
					}
				});
				function success() {
					if (datagrid.data().treegrid) {
						datagrid.treegrid('reload');
						datagrid.removeData("editIndex");
					} else {
						if (delEditing) {
							datagrid.datagrid("deleteRow", editIndex)
						}
						if (delUpdateReload === false && rows.length > 0) {
							// 倒序删
							for ( var i = rows.length - 1; i >= 0; i--) {
								var index = datagrid.datagrid("getRowIndex",
										rows[i]);
								datagrid.datagrid("deleteRow", index);
							}
						} else {
							datagrid.removeData("editIndex");
							datagrid.datagrid('reload');
						}
						datagrid.datagrid("clearSelections");
						datagrid.datagrid("clearChecked");
					}
				}
				if (ids.length > 0) {
					var params = {};
					params[paramName] = ids;
					$.ajax({
						url : options.delUrl,
						data : $.param(params, true),// 表示传统的“shallow”的序列化
						dataType : 'json',
						type : 'post',
						success : function(response) {
							success(response);
							$.messager.show({
								title : '提示',
								msg : '提交成功！'
							});
							if (callback && typeof callback == 'function') {
								callback(response)
							}
						},
						error : function() {
							$.messager.show({
								title : '提示',
								msg : '提交失败！'
							});
						}
					});
				} else {
					success()
				}
			}
		});
	} else {
		$.messager.alert('提示', '请选择要删除的记录！', 'info');
	}
}

// 下拉框
top._select = function(selectid, options) {
	var id = "#" + selectid;
	if ($(id).length > 0) {
		$.ajax({
			url : options.url,
			dataType : "json",
			success : function(data) {
				$(id).empty();
				for ( var i = 0; i < data.length; i++) {
					if(data[i][options.valueField]==options.selectedId){
						$(id).append("<option value=" + data[i][options.valueField] + " selected=selected>" + data[i][options.textField] + "</option>");
					}else{
						$(id).append("<option value=" + data[i][options.valueField] + ">" + data[i][options.textField] + "</option>");
					}
				}
			}
		});
	}
}
//统一设置combo行高，列宽，是否可以编辑
$.fn.combobox.defaults = $.extend({}, $.fn.combobox.defaults, {height:28,editable:false});
$.fn.combotree.defaults = $.extend({}, $.fn.combotree.defaults, {height:28,editable:false});
//日期控件行高
$.fn.datetimebox.defaults = $.extend({}, $.fn.datetimebox.defaults, {height:28});
//window.onresize = setSelectWidth;

//datagrid 默认属性
$.fn.datagrid.defaults.striped = true;
$.fn.datagrid.defaults.rownumbers = true;
$.fn.datagrid.defaults.border = false;
$.fn.datagrid.defaults.fit = true;

$.extend($.fn.validatebox.defaults.rules, {
    integer: {// 验证整数 可正负数
        validator: function (value) {
            var type = /^[0-9]*[1-9][0-9]*$/;
            var re = new RegExp(type);
            return value.match(re);
        },
        message: '请输入整数'
    },
    number: {// 验证金额含小数
        validator: function (value) {
            var type = /^\d+(\.\d{0,4})?$/;
            var re = new RegExp(type);
            return value.match(re);
        },
        message: '请输入非负数字'
    }
});  