<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>编辑活动内容</title>

<style>
	#imghead {
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);
}

.a-upload {
	padding: 4px 10px;
	height: 20px;
	line-height: 20px;
	position: relative;
	cursor: pointer;
	color: #888;
	background: #fafafa;
	border: 1px solid #ddd;
	border-radius: 4px;
	overflow: hidden;
	display: inline-block;
	*display: inline;
	*zoom: 1
}

.a-upload  input {
	position: absolute;
	font-size: 20px;
	right: 0;
	top: 0;
	opacity: 0;
	filter: alpha(opacity = 0);
	cursor: pointer
}

.a-upload:hover {
	color: #444;
	background: #eee;
	border-color: #ccc;
	text-decoration: none
}
td{
	padding:0px 10px;
}
	
</style>
</head>
<body>
<div id="container">
 	<table style="line-height: 35px; width:95%;margin-left: 1%">
		<tr>
			<td width="10%">标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题：</td>
			<td>${infoEntity.title}</td>
		</tr>
		<tr>
    		<td width="10%">作&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;者：</td>
        	<td>${infoEntity.author}</td>
        </tr>
		<tr>
    		<td width="10%">分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类：</td>
        	<td>${infoEntity.moduleName}</td>
        </tr>
        <tr>
    		<td width="10%">封&nbsp;&nbsp;面&nbsp;&nbsp;图：</td>
            <td><img id="cover"  width="360px" height="200px" /></td>
    		<td id="imgPath" style="display:none;">${infoEntity.headImage}</td>
    		<script>
    			$(function(){
    				setTimeout(function(){
    					var imgPath=$("#imgPath").text();
    					var path=encodeURIComponent(imgPath);
    					$("#cover").attr("src",dynamicURL+"admin/information/info/coverImgCallBack?coverImgPath="+path);
    				},300);
    			});
    		</script>
    	</tr>
        <tr>
    		<td colspan="2" width="100%">
    			<hr style="height:2px;border:none;border-top:2px double #2c6aa0;">
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">${infoEntity.content }</td>
    	</tr>
	</table>
	<div class="BtnLine" style="text-align: center;">
		<button class="layui-btn layui-btn" onClick="parent.layui.admin.closeThisTabs();">关闭</button>
	</div>
</div>
</body>
</html>