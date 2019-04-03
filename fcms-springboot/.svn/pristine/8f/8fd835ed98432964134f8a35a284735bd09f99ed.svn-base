<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="security" uri="/tld/security.tld" %> --%>

<!-- meta后台 -->
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>全民共享健身平台</title>
<meta name="viewport" content="width=device-width" />
<link rel="shortcut icon" href="${staticURL}/style_v2/images/logoFont.ico">
<%-- <link rel="stylesheet" type="text/css" href="${staticURL}/jquery-easyui-1.4.3/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${staticURL}/jquery-easyui-1.4.3/themes/default/easyui_icons.css" />
<link rel="stylesheet" type="text/css" href="${staticURL}/jquery-easyui-1.4.3/themes/icon.css" />
<link href="${staticURL}/style/css/style.css" rel="stylesheet"> --%>
<!-- upload -->
<!-- font -->
<link href="${staticURL}/style/css/elusive-webfont.css" type="text/css" rel="stylesheet" />
<!-- 字体图标 -->
<link href="${staticURL}/style/front/font-awesome.min.css" rel="stylesheet" type="text/css" >
<!-- layui -->
<link rel="stylesheet" href="${staticURL}/layuiadmin/layui/css/layui.css" media="all">

<link rel="stylesheet" href="${staticURL}/style/css/pintuer.css"/>
<link rel="stylesheet" href="${staticURL}/style/css/common.css"/>
<link rel="stylesheet" href="${staticURL}/style/css/dianping.css"/>
<link rel="stylesheet" href="${staticURL}/style_v2/css/iconfont.css"/>
<!--[if lte IE 8]>
<script src="${staticURL}/js/html5shiv.min.js"></script>
<script src="${staticURL}/js/respond.min.js"></script>
<![endif]-->
<script src="${staticURL}/js/jquery.min.js"></script>
<script src="${staticURL}/js/pintuer.js"></script>
<script src="${staticURL}/js/index.js"></script>
<script src="${staticURL}/js/slides.js"></script>
<!-- 下面的jQuery重复引用,上面已经有一个 -->       
<%-- <script type="text/javascript" src="${staticURL }/jquery-easyui-1.4.3/jquery.min.js"></script> --%>
<script type="text/javascript" src="${staticURL }/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${staticURL }/jquery-easyui-1.4.3/jquery.earyui.merge.js"></script>
<script type="text/javascript" src="${staticURL}/jquery-easyui-1.4.3/easyui-extend/datagrid-detailview.js" ></script>
<script type="text/javascript" src="${staticURL}/jquery-easyui-1.4.3/easyui-extend/datagrid-groupview.js" ></script>
<script type="text/javascript" src="${staticURL}/jquery-easyui-1.4.3/easyui-extend/easyui-extend.js"></script>
<script src="${staticURL }/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<script src="${staticURL }/scripts/common/Common.js"></script>
<script src="${staticURL }/plugins/plugins.js"></script>
<script src="${staticURL }/js/common-utils.js"></script>
    
<script src="${staticURL }/scripts/jquery.cookie.js"></script>
<script src="${staticURL }/scripts/json.js"></script>
<script src="${staticURL }/scripts/roadui.core.js"></script>

<!-- 日程 -->
<%-- <link rel='stylesheet' href='${staticURL}/fullCalendar/lib/cupertino/jquery-ui.min.css' type="text/css"/>
<link href='${staticURL}/fullCalendar/fullcalendar.css' rel='stylesheet' type="text/css"/>
<link href='${staticURL}/fullCalendar/fullcalendar.print.css' rel='stylesheet' media='print' type="text/css"/>
<script src='${staticURL}/fullCalendar/lib/moment.min.js' type="text/javascript"></script>
<script src='${staticURL}/fullCalendar/fullcalendar.js' type="text/javascript"></script>
<script src='${staticURL}/fullCalendar/lang-all.js' type="text/javascript"></script>
 --%>

<!-- 图形报表-->
<%-- <script src="${staticURL}/highcharts-4.0.3/highcharts.js" type="text/javascript"></script>
<script src="${staticURL}/highcharts-4.0.3/modules/exporting.js" type="text/javascript"></script>
<script src="${staticURL}/highcharts-4.0.3/highcharts-more.js" type="text/javascript"></script>
<script src="${staticURL}/highcharts-4.0.3/highcharts-3d.js" type="text/javascript"></script> --%>



<!-- upload -->
<%-- <script src="${staticURL}/uploadify/jquery.uploadify.min.js" type="text/javascript"></script> --%>
<!-- top-util -->
<script src="${staticURL}/scripts/top-util.js" type="text/javascript"></script>
<!-- icons -->
<script src="${staticURL}/scripts/top-icons.js" type="text/javascript"></script>


<!-- 重复提交 -->
<script src="${staticURL }/scripts/underscore-min.js"></script>

<!-- 图片上传 -->
<script type="text/javascript" src="${staticURL}/jquery-easyui-1.4.3/plugins/ajaxfileupload.js"></script>

<!-- js带回 -->
<script type="text/javascript" src="${staticURL}/scripts/top-dialog-parent.js"></script>

<script type="text/javascript" src="${staticURL}/scripts/top-dialog-parent.js"></script>

<script type="text/javascript" src="${staticURL}/js/menu.js"></script>
<script type="text/javascript" src="${staticURL}/layuiadmin/layui/layui.js"></script>
<!-- ckeditor 4.8.0-->
<script type="text/javascript" src="${staticURL }/js/ckeditor.js"></script>

<script type="text/javascript">
	var headerHost = "${header.Host}";
    var dynamicURL = "${dynamicURL}/";
    var staticURL = "${staticURL}/";
    var ueditorHomeUrl = "${ueditorHomeUrl}";
    var waitTime = 400;

	
	/* layui.extend({
		index: 'lib/index' //主入口模块
	}).use(['layer', 'index'], function(){
    	layer = layui.layer;
	}); */
	
    $(document).ajaxError(function(event, jqXHR, options, errorMsg){
    	if(jqXHR.responseText=="{'statusCode':301}"){
    		/* $.messager.alert("提示","会话超时,请重新登录！","error",function(){
    			window.parent.location.href="${dynamicURL}/login/userLogin";
    		}); */
    		parpent.layer.alert('会话超时,请重新登录！',{ btn: ['确定']}, function(data){
    			if (data) {
    				window.parent.location.href="${dynamicURL}/login/userLogin";
    			}
    			
    		});
    		
    	}
    });
    var ixs={};
    var objNew;
    function _layer(options,callbacks){
    	if(!options.url){
    		alert("没有设置URL！");
    		return ;
    	}
    	var settings = {  
           url : 'top',  
           title : '标题', 
           width : "600px",
           height: "450px",
           btn: ['保存', '取消'],
    	   shadeClose: true,
    	   closeBtn: 1,
           callbacks:null,
           success:null,
    	}; 
    	if (options) {   
    	   $.extend(settings, options);  
    	}  
    	var opts={
    		shade: [0.8, '#393D49'],
    	    type: 2,
    	    title: settings.title,
    	    shadeClose: settings.shadeClose,
    		closeBtn: settings.closeBtn,
    	    maxmin: false, //关闭最大化最小化按钮
    	    area: [settings.width, settings.height],
    	    content: settings.url,
    		btn: settings.btn,
    		success:settings.success,
    		scrollbar: false
    	}
    	if(callbacks){
    		$.extend(opts,callbacks);  
    	}
    	var ix=layer.open(opts);
    	ixs[options.title]=ix;
    	return ix;
    }
</script>
