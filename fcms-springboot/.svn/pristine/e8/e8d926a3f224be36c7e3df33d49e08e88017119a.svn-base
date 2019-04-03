<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/frontcommon/meta.jsp" %>
<%@ include file="/frontcommon/style_script.jsp"%>
<title>市北区体育局</title>
<decorator:head/>
</head>
<body 
<decorator:getProperty property="body.id" writeEntireProperty="true"/> 
<decorator:getProperty property="body.class" writeEntireProperty="true"/>>
<div id='Loading' style="position: absolute; top: 0px; left: 0px;width: 100%; height: 100%;position:fixed; background:#FFF; text-align: center;"> 
        <div style="top:45%;margin:0 auto; position: relative;background:url('${staticURL}/content/images/loadingPic.gif');width:32px;height:32px"></div>
</div> 
<%-- <%@include file="frontcommon/footer.jsp" %> --%>
<decorator:body/>
<script type="text/javascript">
//关闭loading-div
function closes() {
    $("#Loading").fadeOut("normal", function () {
        $(this).remove();
    });
}
var pc;
$.parser.onComplete = function () {
    if (pc) clearTimeout(pc);
    pc = setTimeout(closes, 500);
}
</script>
</body>
</html>

