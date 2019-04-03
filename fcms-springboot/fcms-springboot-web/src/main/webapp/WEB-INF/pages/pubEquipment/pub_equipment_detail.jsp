<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 监管信息管理 tab页场馆信息展示 -->
<script src='${staticURL}/js/scroll.js'></script>
<style>
.layui-table tbody tr:hover, .layui-table thead tr, .layui-table-click,
	.layui-table-header, .layui-table-hover, .layui-table-mend,
	.layui-table-patch, .layui-table-tool, .layui-table[lay-even] tr:nth-child(even)
	{
	background-color: transparent;
}

.layui-table td:nth-child(odd) {
	background-color: #f9f9f9;
	font-weight: bold;
}

.imgbox {
	width: 100%;
	height: 100%;
}

.imgbox img {
	width: 100%;
	height: 400px;
}

.scroll {
	width: 100%;
	height:200px;
	overflow: hidden;
}
.featureUL{
    width: auto;
	white-space: nowrap;
}
.featureBox {
	width:266px;
	display:inline-block;
}

.featureBox .box {
	padding-left: 12px;
	padding-right: 13px;
}

.featureBox .imgcol {
	height: 150px;
	width: 240px;
	text-align: center;
	vertical-align: middle;
	display: table-cell;
}

.featureBox .imgcol img {
	max-width: 240px;
	max-height: 150px;
	height: 150px;
	width: 240px;
}

.featureBox .imgtitle {
	line-height: 20px;
	padding-left: 1px;
	font-size: 14px;
	color: #000;
	font-weight: normal;
	text-align: center;
	font-style: normal;
	width: 240px;
	margin-top: 5px;
	cursor: pointer;
}

.big-rank-stars, .mid-rank-stars, .rating-wrap-big, .rating-wrap-mid,
	.rating-wrap-sml, .sml-rank-stars {
	display: inline-block;
	overflow: hidden;
	vertical-align: middle;
}

.sml-rank-stars {
	display: inline-block;
	width: 66px;
	height: 12px;
	vertical-align: -1px;
	background: url(${staticURL}/style_v2/images/remark.png) no-repeat;
	-webkit-background-size: 86px auto;
	-moz-background-size: 86px auto;
	background-size: 86px auto;
	margin-right: 10px;
}

.sml-str0 {
	background-position: 0 -134px
}

.sml-str10 {
	background-position: 0 -117px
}

.sml-str20 {
	background-position: 0 -100px
}

.sml-str30 {
	background-position: 0 -83px
}

.sml-str35 {
	background-position: 0 -66px
}

.sml-str40 {
	background-position: 0 -49px
}

.sml-str45 {
	background-position: 0 -32px
}

.sml-str50 {
	background-position: 0 -15px
}
.layui-table tbody tr td {
	word-wrap: break-word;
	word-break: break-all
}
.layui-table tbody tr td:first-child {
	width: 15%;
}

.layui-table tbody tr td:last-child {
	width: 85%;
}
.noData{
	display: none;
}
</style>
<div style="padding: 20px; background-color: #fff;">
	<div class="layui-row">
		<div class="layui-col-md12">
			<table class="layui-table">
				<colgroup>
					<col width="20%">
					<col width="30%">
					<col width="20%">
					<col width="30%">
				</colgroup>

				<tbody>
					<tr>
						<td>设施编号</td>
						<td>${pubEntity.id}</td>
						<td>地址</td>
						<td>${pubEntity.location}</td>
					</tr>
					<tr>
						<td>设施名称</td>
						<td>${pubEntity.name}</td>
						<td>开放时间</td>
						<td>
							${pubEntity.businessHours!=null?pubEntity.businessHours:'全天开放'}
						</td>
					</tr>
					<tr>
						<td>运营模式</td>
						<td>
							${pubEntity.modeName}
						</td>
						<td>是否公共</td>
						<td>
							${pubEntity.publicFlag==0?'是':'否' }
						</td>
					</tr>
					<tr>
						<td>所属街道</td>
						<td>${pubEntity.streetName }</td>
						<td>数量</td>
						<td>
							${pubEntity.num }
						</td>
					</tr>
					<tr>
					<td>项目描述</td>
					<td colspan="3">${pubEntity.description }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="layui-row layui-col-space15" id="imgs">
		<div class="layui-col-md12">
			<div class="layui-card">
				<div id = "imageHead"class="layui-card-header" style='font-size: 16px;'>场馆环境</div>
				<div class="layui-card-body">
					<div class="scroll">
						<div style="position:absolute;overflow:hidden;">
							<ul id="imgUL" class="featureUL">
							
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	 $(function() {
		var str = "";
		var mainUuid = "${pubEntity.mainImgUuids}";
		if(mainUuid!=null&&mainUuid!="") {
			var arr = mainUuid.split(',');
			for (var i=0;i<arr.length;i++){
				str += showImgBYUuid(arr[i]);
			}
		}else{
			$("#imageHead").attr('class',"noData");
		}
		$("#imgUL").append(str);
		$(".scroll").myScroll({
			speed : 40, //数值越大，速度越慢
			rowHeight : 265
		});
	});
	function showImgBYUuid(uuid){
		var str = '';
		var url="${dynamicURL}/admin/venue/equipment/type/showImg?uuid="+uuid;
		str +='<li class="featureBox">';
		str +='<div class="box">';
		str +='<div class="imgcol">';	
		str +='<a href=""> <img ';		
		str +='src="'+url+'">';			
		str +='</a>';		
		str +='</div>';		
		str +='</div>';
		str +='</li>';
		return str;
	}
</script>