<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 部门检查区域管理  -->
<div class="padd15 easyui-layout" data-options="fit:true">
	<div class="easyui-layout layout-custom-resize" data-options="fit:true">
		<!-- 西边的 -->
		<div data-options="region:'west',split:false,collapsible:false" style="width: 250px;overflow: scroll;">
			<div class="BtnLine btnBox tl" style="border-top:solid 1px #ddd;width:100%;line-height: 50px;">
				公司：<select id="companyComboTree" style="width: 180px; height: 26px;padding: 10px;" data-options="required:true" ></select>
	        </div>
			<table id="departmentTreegrid"></table>
		</div>
		
		<!-- 中心部分 -->
		<div data-options="region:'center',split:false,collapsible:false" style="width: 250px;">
			<div class="easyui-layout layout-custom-resize" data-options="fit:true">
				<div data-options="region:'north'">
					<div class="card-button">
						<div class="layui-btn-container">
							<button id="add" onclick="add()" class="layui-btn layui-btn">增加</button>
							<button id="edit" onclick="edit()" class="layui-btn">修改</button>
							<button id="del" onclick="del()" class="layui-btn layui-btn">删除</button>
						</div>
					</div>
				</div>
				<div data-options="region:'center'">
					<table id="deptAreatDatagrid"></table>
				</div>
			</div>
		</div>
	</div>
</div>

