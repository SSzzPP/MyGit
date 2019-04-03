<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- meta -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!--为了让 IE 浏览器运行最新的渲染模式，建议将此 meta 标签加入到你页面的 head 中-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 为了让浏览器运行高速模式下，建议将此 meta 标签加入到你页面的 head 中-->
    <meta name="renderer" content="webkit">
    <!--为了确保适当的绘制和触屏缩放，需要在 之中添加viewport元数据标签-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    
    <title>市北区体育局业务管理系统</title>
</head>

<body>
    <div class="container">
        <jsp:include page="../header.jsp" />
	
	    <div class="line-big margin-big-top">
	        <div class="xs12">
	            <!--startprint-->
	            <div class="content">
	                <h1 class="text-center margin-bottom">${entity.title }</h1>
	                <div class="text-center pub-info">发布时间：<small><fmt:formatDate pattern="yyyy-MM-dd" value="${entity.gmtCreate}" /></small>来源：<span>${entity.author }</span></div>
	                <!-- <p class="text-indent"></p> -->
	                ${entity.content }
	            </div>
	            <!--endprint-->
	        </div>
	    </div>
	</div>
	<jsp:include page="../footer.jsp" />
	<script>
		$(function(){
	       $("#print").click(function(){
	           $(this).parent(".print-info").hide();
	           bdhtml=window.document.body.innerHTML;
	           sprnstr="<!--startprint-->"; //开始打印标识字符串有17个字符
	           eprnstr="<!--endprint-->"; //结束打印标识字符串
	           prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17); //从开始打印标识之后的内容
	           prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr)); //截取开始标识和结束标识之间的内容
	           window.document.body.innerHTML=prnhtml; //把需要打印的指定内容赋给body.innerHTML
	           window.print(); //调用浏览器的打印功能打印指定区域
	           window.document.body.innerHTML=bdhtml;//重新给页面内容赋值；
	       })
	    })
	</script>
</body>
</html>


