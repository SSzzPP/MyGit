<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	body{
		background-image: none;
	}
	.layui-form-label{
		width:100px;
	}
	img{
		height:50px;
	}
	.layui-table td, .layui-table th{
		vertical-align:middle;
	}
</style>
<div style="width:100%;height: 100%;" class="layer-cnt">
	<div style="padding: 20px;">
		<div class="layui-form">
		  <table class="layui-table">
		    <colgroup>
		      <col width="100">
		      <col width="150">
		      <col width="150">
		      <col>
		    </colgroup>
		    <thead>
		      <tr>
		        <th>头像</th>
		        <th>昵称</th>
		        <th>联系方式</th>
		        <th>报名时间</th>
		      </tr> 
		    </thead>
		    <tbody id="list">
		     <c:forEach items="${singUsers }" var="user">
		      <tr>
		        <td><img src='/fcms/front/venue/user/userHeadImg?uuid=${user.uuid}'/></td>
		        <td>${user.userName}</td>
		        <td>${user.mobile }</td>
		        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${user.gmtCreate}" /></td>
		      </tr>
    		 </c:forEach>
		    </tbody>
		  </table>
		</div>
	</div>
</div>
<script>

</script>