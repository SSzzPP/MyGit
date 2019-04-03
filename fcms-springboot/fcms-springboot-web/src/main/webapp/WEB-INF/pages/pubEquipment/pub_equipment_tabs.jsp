<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- <%@ taglib prefix="security" uri="/tld/security.tld" %> --%>
<!--监管信息管理  tab页总页面-->
<style>
.panel-body {
	font-size: 16px;
}

.tabs li a.tabs-inner:hover {
	background: transparent;
	color: #1E9FFF !important;
}

.tabs-header, .tabs, .tabs-panels {
	border: 0;
}

.tabs-header {
	padding: 10px;
}

.tabs {
	height: 40px !important;
	border-bottom: 1px solid #e6e6e6;
}

.tabs li a.tabs-inner {
	background: transparent;
	color: #000 !important;
	border: 0;
	height: 39px !important;
	line-height: 39px !important;
}

.tabs li.tabs-selected a.tabs-inner{
	background: transparent;
	color:#009688!important;
	border-bottom: 2px solid #009688;
}

.tabs-title {
	font-size: 14px;
}
</style>
<div class="padd15 easyui-layout" data-options="fit:true">
	<div id="pubEquipTab" class="easyui-tabs panel-body"
		data-options="tabWidth:125" style="width: 100%; height: 100%;"
		fit="true">
		<div title="设施详情"
			data-url="${dynamicURL}/admin/venue/equipment/type/toPubDetail?id=${pubEquipId}"></div>
		<div title="全景预览"
			data-url="${dynamicURL}/admin/venue/equipment/type/toPubView?id=${pubEquipId}"></div>
	</div>
</div>


<script type="text/javascript">
	$('#pubEquipTab').tabs({
		onSelect : function(title, index) {
			var tab = $('#pubEquipTab').tabs('getSelected');
			var url = tab.attr("data-url");
			$("#pubEquipTab").tabs('update',
			{
				tab : tab,
				options : {
					title : title,
					content : '<iframe id="secFrm" frameborder="0" src="'
							+ url
							+ '" style="width:100%;height:100%;"scrolling="yes"></iframe>'
				}
			});
		}
	});
</script>


