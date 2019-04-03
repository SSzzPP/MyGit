<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- meta后台 -->
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />

<title>全民共享健身平台</title>
<meta name="viewport" content="width=device-width" />

<link rel="stylesheet" href="${staticURL}/css/mui.min.css">
<link href="${staticURL}/css/v2/common.css" rel="stylesheet"/>
<link href="${staticURL}/css/mui.picker.css" rel="stylesheet"/>
<link href="${staticURL}/css/mui.picker.min.css" rel="stylesheet" type="text/css"/>
<link href="${staticURL}/css/mui.poppicker.css" rel="stylesheet"/>
<link href="${staticURL}/css/bvd.css" rel="stylesheet"/>
<link href="${staticURL}/css/iconfont.css" rel="stylesheet"/>

<script src="${staticURL}/js/mui.min.js"></script>
<script src="${staticURL}/js/jquery.min.js"></script>
<script src="${staticURL}/js/constants.js"></script>
<script src="${staticURL}/js/top-mobile-util.js"></script>
<script src="${staticURL}/js/top-mobile-update-util.js"></script>
<script src="${staticURL}/js/mui.pullToRefresh.js"></script>
<script src="${staticURL}/js/mui.pullToRefresh.material.js"></script>
<script src="${staticURL}/js/arttmpl.js"></script>
<script src="${staticURL}/js/socket.io.js"></script>
<script src="${staticURL}/js/mui.picker.min.js"></script>
<script src="${staticURL}/js/mui.poppicker.js"></script>
<script src="${staticURL}/js/recorder.js"></script>
<script src="${staticURL}/js/mui.zoom.js"></script>
<script src="${staticURL}/js/own.data.util.js"></script>
<script src="${staticURL}/js/bvd.js"></script>
<script src="${staticURL}/js/three.min.js"></script>
<script src="${staticURL}/js/photo-sphere-viewer.min.js"></script>
<script src="${staticURL}/js/data.util.js"></script>
<script src="${staticURL}/js/date.util.js"></script>
<script src="${staticURL}/js/jquery.cookie.js"></script>
<!-- layui -->
<script src="${staticURL}/js/layui/layui.js"></script>
<!-- 重复提交 -->
<script src="${staticURL }/js/underscore-min.js"></script>

<script type="text/javascript">
	var headerHost = "${header.Host}";
    var dynamicURL = "${dynamicURL}/";
    var staticURL = "${staticURL}/";
    var waitTime = 400;

	/* layui.config({
		base: '${staticURL}/layuiadmin/' //静态资源所在路径
	}).use(['index'], function(index) {

	}); */
	
</script>
