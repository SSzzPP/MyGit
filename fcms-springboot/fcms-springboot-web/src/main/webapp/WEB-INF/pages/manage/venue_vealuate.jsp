<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 监管信息管理 场馆评价展示 -->
<style>
.padd15.layui-col-md12 {
	background: #fff;
	height: auto;
	padding-bottom: 50px;
}

.message-content {
	padding: 0 40px;
}

.message-content .media-body {
	margin-bottom: 60px;
}

.layadmin-homepage-list-imgtxt .media-body {
	width: auto;
	display: block;
	overflow: hidden;
}

.message-content .media-left {
	float: left;
	margin-right: 10px;
}

.layadmin-homepage-list-imgtxt .media-body .pad-btm p:first-child {
	padding-bottom: 5px
}

.layadmin-homepage-list-imgtxt .media-body .min-font {
	margin-bottom: 10px
}

.layadmin-homepage-list-imgtxt .media-body .min-font .layui-breadcrumb a
	{
	font-size: 11px
}

.layui-breadcrumb span[lay-separator] {
	margin: 0 5px
}

.layadmin-homepage-list-imgtxt .media-body .pad-btm .fontColor a {
	font-weight: 600;
	color: #337ab7
}

.layadmin-homepage-list-imgtxt .media-body .pad-btm .fontColor span {
	color: #758697;
	font-weight: 600
}

.message-content .media-body .pad-btm {
	padding-bottom: 0
}

.message-content .media-left {
	float: left;
	margin-right: 10px
}

.message-content .media-left img {
	border-radius: 50%
}

.message-text {
	padding-top: 10px
}

.message-content-btn {
	text-align: center
}

.message-content .layui-btn {
	height: auto;
	line-height: 26px;
	padding: 5px 30px;
	font-size: 16px
}

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

.icon-right {
	float: right;
	cursor: pointer;
}

.layui-table {
	display: none;
}

.media-body.opened .layui-table {
	display: block;
}

.media-body.opened .icon-right {
	transform: rotate(180deg);
	transition :all 0.2s;
}

.layui-table {
	table-layout: fixed;
}

.layui-table tbody tr {
	width: 100%;
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
	margin-left: 10px;
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
.noData{
	display: none;
}
.noDataContent{
	font-size:16px;
	color:#999;
	padding-top: 17%;
	padding-left: 42%;
} 
</style>
<div class="padd15">
	<div class="layui-row">
		<div class="layui-col-md12 layadmin-homepage-list-imgtxt message-content" id="vealuateBox">

		</div>
			<div class="layui-row message-content-btn" id="moreInfo">
				<a href="javascript:;" class="layui-btn">更多</a>
			</div>
	</div>
</div>
<script>
	$(function() {
		var pageNum=1;
		var venueId=${venueId};
		ajax(pageNum,venueId);
		$(".layui-btn").click(function(){
			pageNum=pageNum+1;
			ajax(pageNum,venueId);
		});
		$("#vealuateBox").on('click','.icon-right',function() {
			$(this).closest(".media-body").toggleClass("opened");
			if($(this).closest(".media-body").children('.layui-table').children().size()>0){
				$(this).closest(".media-body").children('.layui-table').children().remove();
				return;
			}
			var $this = $(this);
			var vealuateId  = $(this).attr('data-veaId');
			$.submit({
				url: dynamicURL+"/admin/venue/vealuate/showBlochChainDataMod",
				data: "venueId="+venueId+"&vealuateId="+vealuateId,
				success: function(result){
				    if(result.success){
				    	var str = blockStr(result.dataModItem);
				    	$this.closest(".media-body").children('.layui-table').append(str);
				    }
				},
				error:function(){
					layer.alert('失败！', {icon: 0});
				}
			})
		});
	})
	function formatStar(starLevel){
		var star = starLevel*10;
		starClass="sml-rank-stars sml-str"+star;
		return starClass;
	}
	function ajax(pageNum,venueId){
		var url = "${dynamicURL}/admin/venue/vealuate/list?search_EQ_venueId="+venueId+"&page="+pageNum+"&rows=3";
		$.ajax({
			url:url,
			type:"post",
			dataType:"json",
			success:function(result){
				if(result==null){
					return;
				}
				if(result.rows.length<3){
					$('#moreInfo').attr('class','noData');
				}
				if(result.rows.length==0){
					if($('#vealuateBox .media-body').length==0){
						$('#moreInfo').attr('class','noData');
						$("#vealuateBox").append('<div class="noDataContent"><p>该场馆暂无评价信息<p></div>');
					}
					return;
				}	
				loadList(result.rows);	
			},
			error:function(error){
				alert(error.status);
			}
		});
	}
	function loadList(data){
		var str = "";
		$(data).each(function(i,obj){
			var url="${dynamicURL}/admin/venue/user/userHeadImg?uuid="+obj.uuid;
			str+='<div class="media-body">';
			str+='<a href="javascript:;" class="media-left" style="float: left;">';
			str+='<img src="'+url+'" ';
			str+='width="46px" height="46px">';
			str+='</a>';
			str+='<div class="pad-btm">';
			str+='<p class="fontColor">';	
			str+='<a href="javascript:;">'+obj.userName+'</a><span '
			str+='class="'+formatStar(obj.starLevel)+'" title="场馆服务" name="starBox"></span>';
			str+='</p>';
			str+='<p class="min-font">';	
			str+='<span class="layui-breadcrumb" lay-separator="-"'	;	
			str+='style="visibility: visible;"> <a href="javascript:;"'			
			str+='class="layui-icon layui-icon-cellphone" ></a><span';
			str+='lay-separator="">-</span> <a href="javascript:;">从移动</a><span ';		
			str+='lay-separator="">-</span> <a href="javascript:;">'+obj.gmtCreate+'</a>';		
			str+='</span> <span class="layui-icon layui-icon-down icon-right" data-veaId="'+obj.id+'"></span>';	
			str+='</p>';
			str+='</div>';
			str+='<p class="message-text">'+obj.content+'</p>';
			str+='<table class="layui-table" name ="aaaa">';
			str+='</table> ';
			str+='</div>';
		});
		$("#vealuateBox").append(str);
	}
	function blockStr(obj){
		 var str = "";
	 	str+='<tbody>';
		str+='<tr>';
		str+='	<td>哈希</td>';
		str+='	<td>'+obj.blockhash+'</td>';
		str+='</tr>';
		str+='<tr>';
		str+='	<td>所在区块</td>';
		str+='	<td><a>区块 #'+obj.blockindex+'</a></td>';
		str+='</tr>';
		str+='<tr>';
		str+='	<td>发送时间</td>';
		str+='	<td><a>'+obj.timeStr+'</a></td>';
		str+='</tr>';
		str+='<tr>';
		str+='	<td>接收时间</td>';
		str+='	<td><a>'+obj.timereceivedStr+'</a></td>';
		str+='</tr>';
		str+='<tr>';
		str+='	<td>用户名</td>';
		str+='	<td>'+obj.dataobj.name+'</td>';
		str+='</tr>';
		str+='<tr>';
		str+='	<td>投诉内容</td>';
		str+='	<td>'+obj.dataobj.content+'</td>';
		str+='</tr>';
		str+='<tr>';
		str+='	<td>投诉时间</td>';
		str+='	<td>'+obj.dataobj.time+'</td>';
		str+='</tr>';
		str+='<tr>';
		str+='	<td>TXid</td>';
		str+='	<td>'+obj.txid+'</td>';
		str+='</tr>';
		str+='</tbody>';
		return str;
	}
</script>