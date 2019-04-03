package com.yhlt.showcase.system.utils;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * 自动生成增删查改的jsp页面 生成之后刷新此 类 上层的utils包
 * 生成的jsp中列名已经addWindow中属性的提示名称需要自己填入
 * @author stone
 * @date 2018-2-28
 */
public class AutoCreateJspUtil {
	/**
	 * controller action url
	 */
	private String controllerActionUrl = "/admin/system/dict";
	/**
	 * jsp 名称
	 */
	private String jspName = "dict_index";
	/**
	 * entity 路径
	 */
	private String entityUrl = "com.xzb.showcase.system.entity.DictEntity";
	/**
	 * datagridname(默认为controleractionurlsplit /最后一个单词)
	 */
	private String datagridName;

	/**
	 * 生成头部代码
	 * 
	 * @param sb
	 */
	private void parseHeader(StringBuffer sb) {
		sb.append("<%@ page contentType=\"text/html;charset=UTF-8\" pageEncoding=\"UTF-8\"%>\r\n");
		sb.append("<%@ taglib prefix=\"c\" uri=\"http://java.sun.com/jsp/jstl/core\"%>\r\n");
		sb.append("<%@ taglib prefix=\"fn\" uri=\"http://java.sun.com/jsp/jstl/functions\"%>\r\n");
	}

	/**
	 * 生成easyuicontainer
	 * 
	 * @param sb
	 */
	private void parseEasyuiContainer(StringBuffer sb) {
		sb.append("<div class=\"easyui-layout layout\" fit=\"true\">\r\n")
				.append("\t<div id=\"container\" class=\"easyui-layout layout\" fit=\"true\">\r\n");
		parseEasyuiNorthContainer(sb);
		parseEasyuiContainerCenter(sb);
		sb.append("\t</div>\r\n").append("</div>\r\n");
	}

	/**
	 * 生成esayUi上方搜索部分（搜索部分默认只有一个like_name,剩余部分自行填入）
	 * 
	 * @param sb
	 */
	private void parseEasyuiNorthContainer(StringBuffer sb) {
		sb.append("\t\t<div region=\"north\" border=\"false\">\r\n")
				.append("\t\t\t<div id=\"queryHeader\"\r\n")
				.append("\t\t\t\tstyle=\"padding: 10px; width: 100%; line-height: 40px;\"\r\n")
				.append("\t\t\t\tclass=\"easyui-panel\">\r\n")
				// form表单
				.append("\t\t\t\t<form class=\"form-horizontal\" for=\"")
				.append(this.datagridName)
				.append("\">\r\n")
				.append("\t\t\t\t\t<table style=\"width: 800px; line-height: 40px;\">\r\n")
				.append("\t\t\t\t\t\t<tr>\r\n")
				.append("\t\t\t\t\t\t\t<td>名称:</td>\r\n")
				.append("\t\t\t\t\t\t\t<td><input class=\"easyui-textbox\" type=\"text\"\r\n")
				.append("\t\t\t\t\t\t\t\tname=\"search_LIKE_name\" style=\"width: 150px; height: 26px\">\r\n")
				.append("\t\t\t\t\t\t\t</td>")
				.append("\t\t\t\t\t\t\t<td>\r\n")
				.append("\t\t\t\t\t\t\t\t<div class=\"BtnLine\"\r\n")
				.append("\t\t\t\t\t\t\t\t\tstyle=\"border: 0px; margin: 0px; padding: 0px; text-align: left\">\r\n")
				// 搜索按钮
				.append("\t\t\t\t\t\t\t\t\t<button type=\"button\" class=\"easyui-linkbutton queryBtn\" iconcls=\"icon-search\">搜索</button>\r\n")
				// 重置按钮
				.append("\t\t\t\t\t\t\t\t\t<button type=\"button\" class=\"easyui-linkbutton clearBtn\" iconcls=\"icon-reload\">重置</button>\r\n")
				.append("\t\t\t\t\t\t\t\t</div>\r\n")
				.append("\t\t\t\t\t\t\t</td>\r\n")
				.append("\t\t\t\t\t\t</tr>\r\n")
				.append("\t\t\t\t\t</table>\r\n").append("\t\t\t\t</form>\r\n")
				.append("\t\t\t</div>\r\n");
		// 拼接操作按钮
		parseOperationButtons(sb);
		sb.append("\t\t\t</div>\r\n");
	}

	/**
	 * 生成操作按钮（div）默认有增加，修改，删除
	 * 
	 * @param sb
	 */
	private void parseOperationButtons(StringBuffer sb) {
		sb.append("\t\t\t<div class=\"BtnLine btnBox tl\"\r\n")
				.append("\t\t\t\tstyle=\"border-top: solid 1px #ddd; width: 100%;\">\r\n")
				.append("\t\t\t\t<button class=\"easyui-linkbutton l-btn l-btn-small\" id=\"add\"\r\n")
				.append("\t\t\t\t\tonclick=\"add()\" type=\"button\" iconcls=\"icon-add\" group=\"\">新增</button>\r\n")
				.append("\t\t\t\t<button class=\"easyui-linkbutton l-btn l-btn-small\" id=\"edit\"\r\n")
				.append("\t\t\t\t\tonclick=\"edit()\" type=\"button\" iconcls=\"icon-edit\" group=\"\">修改</button>\r\n")
				.append("\t\t\t\t<button class=\"easyui-linkbutton l-btn l-btn-small\" id=\"delete\"\r\n")
				.append("\t\t\t\t\tonclick=\"del()\" type=\"button\" iconcls=\"icon-delete\" group=\"\">删除</button>\r\n")
				.append("\t\t\t</div>\r\n");
	}

	/**
	 * 生成exsyuicenter部分
	 * 
	 * @param sb
	 */
	private void parseEasyuiContainerCenter(StringBuffer sb) {
		sb.append("\t\t<div region=\"center\" border=\"false\">\r\n")
				.append("\t\t\t<div style=\"padding: 5px; width: 100%;\" class=\"easyui-layout layout\" fit=\"true\">\r\n")
				.append("\t\t\t\t<table id=\"").append(this.datagridName)
				.append("\"></table>\r\n").append("\t\t\t</div>\r\n")
				.append("\t\t</div>\r\n");
	}

	/**
	 * 生成addwindow
	 * 
	 * @param sb
	 */
	private void parseAddWindow(StringBuffer sb) {
		sb.append(
				"<div id=\"addWindow\" class=\"easyui-dialog\" title=\"新增\"\r\n")
				.append("\tstyle=\"width: 620px; height: 220px;\" modal=\"true\" closed=\"true\">\r\n")
				.append("\t<form class=\"addForm\" action=\"${dynamicURL}")
				.append(controllerActionUrl).append("/save\"\r\n")
				.append("\t\tmethod=\"post\">\r\n")
				.append("\t\t\t<input type=\"hidden\" name=\"id\" />\r\n")
				.append("\t\t\t<table class=\"table_edit\">\r\n");
		Map<String, String> map = this.getFieldNames();
		Iterator<Map.Entry<String, String>> it = map.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, String> entry = it.next();
			sb.append("\t\t\t\t<tr>\r\n")
					.append("\t\t\t\t\t<td class=\"text_tr\"></td>\r\n")
					.append("\t\t\t\t\t<td><input class=\"easyui-textbox\" type=\"text\" name=\"")
					.append(entry.getKey())
					.append("\"\r\n")
					.append("\t\t\t\t\t\tstyle=\"width: 270px; height: 26px\" data-options=\"required:true\" />\r\n")
					.append("\t\t\t\t\t</td>\r\n").append("\t\t\t\t</tr>\r\n");
		}
		sb.append("\t\t\t</table>\r\n")
				.append("\t\t\t<div class=\"BtnLine\">\r\n")
				.append("\t\t\t\t<button type=\"button\" class=\"easyui-linkbutton submit\">保存</button>\r\n")
				.append("\t\t\t\t<button type=\"button\" class=\"easyui-linkbutton\"\r\n")
				.append("\t\t\t\t\tonclick=\"$('#addWindow').dialog('close');return false;\">取消</button>\r\n")
				.append("\t\t</div>\r\n").append("\t</form>\r\n")
				.append("</div>\r\n");
	}

	private void parseJavaScript(StringBuffer sb) {
		sb.append("<script type=\"text/javascript\">\r\n")
				.append("\tvar ")
				.append(datagridName)
				.append(";\r\n")
				.append("\t$(function() {\r\n")
				.append("\t\t")
				.append(datagridName)
				.append(" = ")
				.append("$('#")
				.append(datagridName)
				.append("').datagrid({\r\n")
				.append("\t\t\turl : '${dynamicURL}")
				.append(controllerActionUrl)
				.append("/list',\r\n")
				.append("\t\t\tqueryForm : \"#queryHeader form\",\r\n")
				.append("\t\t\tfit : true,\r\n")
				.append("\t\t\tpagination : true,\r\n")
				.append("\t\t\trownumbers : true,\r\n")
				.append("\t\t\tsingleSelect : true,\r\n")
				.append("\t\t\tlines : true,\r\n")
				.append("\t\t\tidField : 'id',\r\n")
				.append("\t\t\tcolumns : [ [\r\n")
				// 拼接id属性
				.append("\t\t\t\t{field: 'id',formatter: function Ra(val, row, index) {\r\n")
				.append("\t\t\t\t\treturn '<input type=\"radio\" name=\"selectRadio\" id=\"selectRadio\"' + index + '/>';\r\n")
				.append("\t\t\t\t}},\r\n");
		// 遍历属性
		Map<String, String> map = getFieldNames();
		Iterator<Map.Entry<String, String>> it = map.entrySet().iterator();
		int size = map.size();
		int i = 0;
		while (it.hasNext()) {
			i++;
			Map.Entry<String, String> entry = it.next();
			sb.append("\t\t\t\t{field: '").append(entry.getKey());
			if (i != size) {
				sb.append("',title: '',width: 200,sortable: true}, \r\n");
			} else {
				sb.append("',title: '',width: 200,sortable: true}\r\n");
			}
		}
		sb.append("\t\t\t] ],\r\n")
				.append("\t\t\tonClickRow : function(rowIndex, rowData) {\r\n")
				.append("\t\t\t\tvar radio1 = $(\"input[type='radio']\")[rowIndex].disabled;\r\n")
				.append("\t\t\t\tif (radio1 != true) {\r\n")
				.append("\t\t\t\t\t$(\"input[type='radio']\")[rowIndex].checked = true;\r\n")
				.append("\t\t\t\t\treturn false;\r\n")
				.append("\t\t\t\t} else {\r\n")
				.append("\t\t\t\t\t$(\"#")
				.append(datagridName)
				.append("\").datagrid(\"clearSelections\");\r\n")
				.append("\t\t\t\t\t$(\"input[type='radio']\")[rowIndex].checked = false;\r\n")
				.append("\t\t\t\t\treturn false;\r\n")
				.append("\t\t\t\t}\r\n")
				.append("\t\t\t},\r\n")
				.append("\t\t\tonDblClickRow : function(index) {\r\n")
				.append("\t\t\t\tedit();\r\n")
				.append("\t\t\t}\r\n")
				.append("\t\t});\r\n")
				.append("\t$(\"form[for] button.queryBtn\").on(\"click.datagrid-query\", function() {\r\n")
				.append("\t\ttop._search($(this).parents(\"form[for]\"));\r\n")
				.append("\t});\r\n")
				.append("\t$(\"form[for] button.clearBtn\").on(\"click.datagrid-query\", function() {\r\n")
				.append("\t\ttop._clearSearch($(this).parents(\"form\"));\r\n")
				.append("\t});\r\n").append("})\r\n");
		parseAddMethod(sb);
		parseEditMethod(sb);
		parseDeleteMethod(sb);
		sb.append("</script>");
	}

	/**
	 * 生成add方法及表单提交
	 * 
	 * @param sb
	 */
	private void parseAddMethod(StringBuffer sb) {
		// add method
		sb.append("\tfunction add() {\r\n")
				.append("\t\t$(\"#addWindow form.addForm\").form(\"clear\");\r\n")
				.append("\t\t$(\"#addWindow\").dialog(\"open\");\r\n")
				.append("\t}\r\n");
		// 初始化form表单
		sb.append("\t$(\"#addWindow form.addForm\").form({\r\n")
				.append("\t\tonSubmit : function() {\r\n")
				.append("\t\t\tvar isValid = $(this).form('validate');\r\n")
				.append("\t\t\tif (!isValid) {\r\n")
				.append("\t\t\t\t$.messager.progress('close');\r\n")
				.append("\t\t\t}\r\n")
				.append("\t\t\treturn isValid;\r\n")
				.append("\t\t},\r\n")
				.append("\t\tsuccess : function(data) {\r\n")
				.append("\t\t\t\tdata = JSON.parse(data);\r\n")
				.append("\t\t\tif (data.success) {\r\n")
				.append("\t\t\t\t$.messager.alert('提示', '保存成功！', \"info\");\r\n")
				.append("\t\t\t\t$('#addWindow').dialog('close');\r\n")
				.append("\t\t\t\t")
				.append(datagridName)
				.append(".datagrid('reload');\r\n")
				.append("\t\t\t} else {\r\n")
				.append("\t\t\t\t$.messager.alert('提示', data.msg, 'error');\r\n")
				.append("\t\t\t}\r\n").append("\t\t}\r\n").append("\t});\r\n");
		// 窗口提交方法
		sb.append(
				"\t$(\"#addWindow .BtnLine .submit\").on(\"click\", _.debounce(function() {\r\n")
				.append("\t\t$(\"#addWindow form.addForm\").submit();\r\n")
				.append("\t}, waitTime, true));\r\n");
	}

	/**
	 * 生成edit方法
	 * 
	 * @param sb
	 */
	private void parseEditMethod(StringBuffer sb) {
		sb.append("\tfunction edit() {\r\n")
				.append("\t\tvar row = ")
				.append(datagridName)
				.append(".datagrid(\"getSelected\");\r\n")
				.append("\t\tif (row) {\r\n")
				.append("\t\t\tvar form = $(\"#addWindow form.addForm\");\r\n")
				.append("\t\t\tform.form(\"clear\");\r\n")
				.append("\t\t\t$.ajax({\r\n")
				.append("\t\t\t\turl : \"${dynamicURL}")
				.append(controllerActionUrl)
				.append("/detail\",\r\n")
				.append("\t\t\t\tdata : {\r\n")
				.append("\t\t\t\t\tid : row.id\r\n")
				.append("\t\t\t\t},\r\n")
				.append("\t\t\t\tdataType : \"json\",\r\n")
				.append("\t\t\t\tsuccess : function(response) {\r\n")
				.append("\t\t\t\t\tform.form(\"load\", response.obj);\r\n")
				.append("\t\t\t\t\t$(\"#addWindow\").dialog(\"open\");\r\n")
				.append("\t\t\t\t}\r\n")
				.append("\t\t\t});\r\n")
				.append("\t\t} else {\r\n")
				.append("\t\t\t$.messager.alert('提示', '请选择要修改的记录！', 'error');\r\n")
				.append("\t\t}\r\n").append("\t}\r\n");
	}

	/**
	 * 删除方法
	 * 
	 * @param sb
	 */
	private void parseDeleteMethod(StringBuffer sb) {
		sb.append("\tfunction del() {\r\n")
				.append("\t\ttop._del(")
				.append(datagridName)
				.append(", {\r\n")
				.append("\t\t\tdelUrl : \"${dynamicURL}/admin/system/dict/delete\"\r\n")
				.append("\t\t});\r\n").append("\t}\r\n");
	}

	public String getControllerActionUrl() {
		return controllerActionUrl;
	}

	public void setControllerActionUrl(String controllerActionUrl) {
		this.controllerActionUrl = controllerActionUrl;
	}

	public String getJspName() {
		return jspName;
	}

	public void setJspName(String jspName) {
		this.jspName = jspName;
	}

	public String getEntityurl() {
		return entityUrl;
	}

	public AutoCreateJspUtil(String controllerActionUrl, String jspName,
			String entityUrl) {
		super();
		this.controllerActionUrl = controllerActionUrl;
		this.jspName = jspName;
		this.entityUrl = entityUrl;
		this.datagridName = getDataGridName();
	}

	public AutoCreateJspUtil() {
		super();
	}

	/**
	 * 获取datagrid名称 默认为controllerActionUrl的 以/分割的最后一个单词， 例如
	 * controllerActionUrl="/admin/system/dict",则datagrid名称默认为dict
	 * 
	 * @return
	 */
	private String getDataGridName() {
		return controllerActionUrl.substring(controllerActionUrl
				.lastIndexOf("/") + 1) + "Datagrid";
	}

	private void create() {
		StringBuffer sb = new StringBuffer();
		parseHeader(sb);
		parseEasyuiContainer(sb);
		parseAddWindow(sb);
		parseJavaScript(sb);
		File directory = new File("");
		FileWriter fwJsp;
		try {
			fwJsp = new FileWriter(directory.getAbsolutePath()
					+ "/src/main/java/com/xzb/showcase/system/utils/" + jspName
					+ ".jsp");
			PrintWriter pwJsp = new PrintWriter(fwJsp);
			pwJsp.println(sb.toString());
			pwJsp.flush();
			pwJsp.close();
			System.err.println("生成完毕，请刷新utils包！");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 获取所有除了id的 key:属性名称,value:属性类型
	 * 
	 * @return
	 */
	private Map<String, String> getFieldNames() {
		Map<String, String> map = new HashMap<String, String>();
		Class clazz;
		try {
			clazz = Class.forName(entityUrl);
			Field[] fields = clazz.getDeclaredFields();
			for (Field f : fields) {
				if (f.getName().equals("serialVersionUID")) {
					continue;
				}
				map.put(f.getName(), f.getType().getSimpleName());
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return map;
	}

	public static void main(String[] args) {
		AutoCreateJspUtil autoCreateJspUtil = new AutoCreateJspUtil(
				"/admin/system/dict", "dict_index",
				"com.xzb.showcase.system.entity.DictEntity");
		autoCreateJspUtil.create();
	}
}
