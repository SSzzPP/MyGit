<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <!-- meta -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!--为了让 IE 浏览器运行最新的渲染模式，建议将此 meta 标签加入到你页面的 head 中-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 为了让浏览器运行高速模式下，建议将此 meta 标签加入到你页面的 head 中-->
    <meta name="renderer" content="webkit">
    <!--为了确保适当的绘制和触屏缩放，需要在 之中添加viewport元数据标签-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
   <!--  <link rel="stylesheet" href="css/pintuer.css"/>
    <link rel="stylesheet" href="css/common.css"/>
    <link rel="stylesheet" href="css/dianping.css"/>
    <script src="js/jquery.min.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="js/index.js"></script>
    <script src="js/slides.js"></script> -->
    <title>市北区体育局业务管理系统</title>
    <style>
        .siteImg {
            margin: 10px 0 20px;
        }

        .siteImg img {
            height: 120px;
            width: 100px;
            margin-right: 10px;
        }
		
		.padd15.layui-col-md12 {
			background: #fff;
			height: auto;
			padding-bottom: 50px;
		}
		
		.message-content {
			padding: 0 22px;
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
		
		#environmentImages {
			padding: 0;
		}
		.basic-info{
			padding : 17px 20px 0px;
		}   
    </style>
</head>
<body>
<div class="container">
	<jsp:include page="../header.jsp" />
    <div class="line-big margin-top min-height">
        <div class="xs9">
            <div class="basic-info">
                <div class="shop-name">${venueInfoEntity.name }</div>
                <div class="brief-info">
                    <!-- <span title="四星商户" class="mid-rank-stars mid-str40"></span> -->
                    <span id="star"></span>
                    <!-- <span id="reviewCount" class="item">228条评论</span> -->
                    <span id="avgPriceTitle" class="item">人均：${venueInfoEntity.perCapita }元</span>
                        <span id="comment_score">
                            <span class="item">设施：7.9</span>
                            <span class="item">场地：7.9</span>
                            <span class="item">划算：7.8</span>
                        </span>
                </div>
                <div class="cont">联系电话：<span>${venueInfoEntity.tel }</span></div>
                <div class="cont">场馆地址：<span>${venueInfoEntity.location }</span></div>
                <div class="cont">营业时间：<span>${venueInfoEntity.businessHours }</span></div>
                <div class="siteImg" id="licenseImages">
                </div>
            </div>
            <div id="shoptabs-wrapper">
                <div id="shop-tabs" class="mod">
                    <h2 class="mod-title single">
                        <a class="item J_item" data-click-name="环境" data-click-title="商户信息tab">环境</a>
                    </h2>
                    <div class="shop-tab-photos clearfix J-panel">
                        <div class="container clearfix" id="environmentImages">
                        </div>
                    </div>
                </div>
            </div>
            <div id="comment" class="mod comment">
                <h2 class="mod-title J-tab" id="defaultcomment-wrapper" style="border-bottom: none;">
                    <a class="item all-review" data-type="all" href="">网友点评</a>
                </h2>
                <div class="layui-row">
					<div class="layui-col-md12 layadmin-homepage-list-imgtxt message-content" id="vealuateBox">
			
					</div>
						<div class="layui-row message-content-btn" id="moreInfo">
							<a href="javascript:;" class="layui-btn">更多</a>
						</div>
				</div>
            </div>
        </div>
        <div class="xs3">
            <div class="aside">
	             <!-- <div class="J_mkt-group-2"></div>
	             <div class="J_aside-qrcode">
	                 <a href="">
	                     <div class="qrcode-aside-left">
	                         <p><span class="tag1">券</span><span>专享优惠</span></p>
	                         <p><span class="tag1 discount">惠</span><span>手机特价</span></p>
	                     </div>
	                     <div class="qrcode-aside-right"></div>
	                 </a>
	             </div> -->
	             <div class="J_midas-3">
	                 <div class="midas-wrap midas-wrap-search">
	                     <div class="title clearfix">
	                         <h4>你可能会喜欢</h4>
	                     </div>
	                     <div class="J_con" id="likeList">
	                       
	                     </div>
	                 </div>
	             </div>
	         </div>
        </div>
    </div>
</div>
<jsp:include page="../footer.jsp" />
<script>
	$(function() {
		
		loadLike();
		
		/* 加载星级 */
		var star = '${venueInfoEntity.star}'*10;
		var starStr = "sml-rank-stars sml-str"+star; 
		$("#star").attr('class',starStr);
		
		/* 加载营业执照 */
		var haveImgFlag = false;
		var str = "";
		var licenseStrs = "${venueInfoEntity.licenseImgUuids}";
		if(licenseStrs != null && licenseStrs != ""){
			haveImgFlag = true;
			var arr = licenseStrs.split(',');
			for (var i=0 ; i<arr.length ; i++){
				str += showImgBYUuid(arr[i]);
			}
		}
		$("#licenseImages").append(str);
		
		/* 加载环境图 */
		var haveEnvironmentImgFlag = false;
		var str = "";
		var envStrs = "${venueInfoEntity.environmentImgUuids}";
		if(envStrs != null && envStrs != ""){
			haveEnvironmentImgFlag = true;
			var arr = envStrs.split(',');
			for (var i=0;i<arr.length;i++){
				var url="${dynamicURL}/front/venue/info/venueImg?uuid="+arr[i];
				str +='<a href="" class="item"><img ';		
				str +='src="'+url+'">';			
				str +='</a>';
			}
		}
		$("#environmentImages").append(str);
		if(!haveImgFlag){
			$("#venueImgs").attr('class','noData');
		}
		
		/* 
		*加载评论 
		*/
		var pageNum=1;
		var venueId='${venueInfoEntity.id}';
		ajax(pageNum,venueId);
		$(".layui-btn").click(function(){
			pageNum=pageNum+1;
			ajax(pageNum , venueId);
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
				url: dynamicURL+"/front/venue/vealuate/showBlochChainDataMod",
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
	});
	function showImgBYUuid(uuid){
		var str = '';
		var url="${dynamicURL}/front/venue/info/venueImg?uuid="+uuid;
		str +='<a href=""><img ';		
		str +='src="'+url+'">';			
		str +='</a>';		
		return str;
	}
	function formatStar(starLevel){
		var star = starLevel*10;
		starClass="sml-rank-stars sml-str"+star;
		return starClass;
	}
	function ajax(pageNum,venueId){
		var url = "${dynamicURL}/front/venue/vealuate/list?search_EQ_venueId="+venueId+"&page="+pageNum+"&rows=3";
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
			var url="${dynamicURL}/front/venue/user/userHeadImg?uuid="+obj.uuid;
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
	function loadLike(){
        
		var params = {
			rows:2
		};
		params.search_EQ_typeId=1
    	$.submit({
			url: dynamicURL+"/front/venue/view/list",
			data:params,
			success: function(result){
			    if(result.rows.length>0){
			    	var str= '';
			    	$.each(result.rows,function(index,value){
			    		str+='<div class="item " onclick="venueDetails('+value.id+')">';
			    		str+='<ul class="mn">';
			    		str+='<li class="shop">';
			    		str+='<a target="_blank" class="img-shop">';
			    		str += '	<img src="'+dynamicURL+'/front/venue/view/showImg?uuid='+value.mainImageUuid+'"/>';
			    		str+='  </a>';
			    		str+='</li>';
			    		str+='<li class="tit">';
			    		str+='<a target="_blank">'+value.name+'</a>';
			    		str+=' </li>';
			    		str+=' <li class="star">';
			    		str+='<span class="'+formatStar(value.star)+'" name="starBox"></span>';
			    		str+='</li>';
			    		str+=' <li class="text  Fix">';
			    		str+='<span class="ave fr">人均 ¥'+value.perCapita+'</span>';
			    		str+='<span class="region">'+value.location+'</span>';
			    		str+='</li>';
			    		str+='</ul>';
			    		str+='</div>';
			    	});
			    	$("#likeList").append(str);
			    }
			}
		});
    }
	 function venueDetails(venueId){
     	window.location.href='${dynamicURL}/front/toVenueDetails?venueId='+venueId;
     }
</script>
</body>
</html>