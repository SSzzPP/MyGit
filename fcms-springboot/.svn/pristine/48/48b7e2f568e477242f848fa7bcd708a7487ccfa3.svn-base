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
						<td>场馆编号</td>
						<td>${venueInfo.id}</td>
						<td>地址</td>
						<td>${venueInfo.location}</td>
					</tr>
					<tr>
						<td>场馆名称</td>
						<td>${venueInfo.name}</td>
						<td>营业时间</td>
						<td>
							${venueInfo.businessHours}
						</td>
					</tr>
					<tr>
						<td>统一社信码</td>
						<td>
							${venueInfo.creditCode}
						</td>
						<td>人均消费</td>
						<td>
							￥：${venueInfo.perCapita} 
						</td>
					</tr>
					<tr>
						<td>星级</td>
						<td><span id="star"></span></td>
						<td>所属商区</td>
						<td>
							${venueInfo.businessAreaStr}
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="layui-row layui-col-space15">
		<div class="layui-col-md12">
			<div class="layui-card">
				<div class="layui-card-header">场馆认证</div>
				<div class="layui-card-body" style="padding:0;">
					<table class="layui-table">
						<tbody>
							<tr>
								<td>哈希</td>
								<td>${dataModItem.blockhash}</td>
							</tr>
							<tr>
								<td>所在区块</td>
								<td><a>区块 #${dataModItem.blockindex}</a></td>
							</tr>
							
							<tr>
								<td>发送时间</td>
								<td><a>${dataModItem.timeStr }</a></td>
							</tr>
							<tr>
								<td>接收时间</td>
								<td><a>${dataModItem.timereceivedStr }</a></td>
							</tr>
							<tr>
								<td>认证名称</td>
								<td>${dataModItem.dataobj.name }</td>
							</tr>
							<tr>
								<td>认证状态</td>
								<td>${dataModItem.dataobj.status }</td>
							</tr>
							<tr>
								<td>TXid</td>
								<td>${dataModItem.txid}</td>
							</tr>
							<!-- <tr>
								<td>矿工签名</td>
								<td>53504b624630440220156b704d9e7b0a2c1c49580fc7128f0492d66aecdaef45d42272145f2e2a4d8102204a8b74a3f90778650a1760ca6395277a48ab005656f8050892a850ce8781545902210242040e2a96746b89685448f2150690e584239b08fe8e05d7eb4da6ceabb7cffa</td>
							</tr> -->
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="layui-col-md12" id ="venueImgs">
			<div class="layui-card">
				<div class="layui-card-header" style='font-size: 16px;'>场馆环境</div>
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
		var star = '${venueInfo.star}'*10;
		var starStr = "sml-rank-stars sml-str"+star; 
		$("#star").attr('class',starStr);
		var haveImgFlag = false;
		var str = "";
		var mainUuid = "${venueInfo.mainImageUuid}";
		if(mainUuid!=null&&mainUuid!="") {
			haveImgFlag=true;
			str += showImgBYUuid(mainUuid);
		}
		var envStrs = "${venueInfo.environmentImgUuids}";
		if(envStrs!=null&&envStrs!=""){
			haveImgFlag=true;
			var arr = envStrs.split(',');
			for (var i=0;i<arr.length;i++){
				str += showImgBYUuid(arr[i]);
			}
		}
		$("#imgUL").append(str);
		$(".scroll").myScroll({
			speed : 40, //数值越大，速度越慢
			rowHeight : 265
		});
		if(!haveImgFlag){
			$("#venueImgs").attr('class','noData');
		}
		
	});
	function showImgBYUuid(uuid){
		var str = '';
		var url="${dynamicURL}/admin/venue/info/venueImg?uuid="+uuid;
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