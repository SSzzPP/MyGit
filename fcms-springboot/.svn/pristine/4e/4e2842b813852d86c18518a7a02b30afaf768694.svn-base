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
    <script src='${staticURL}/js/scroll.js'></script>
	<script src='${staticURL}/js/three.min.js'></script>
	<script src='${staticURL}/js/photo-sphere-viewer.min.js'></script>
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
                <div class="shop-name">${venueEquipmentTypeEntity.name }</div>
                <div class="cont">设施数量：<span>${venueEquipmentTypeEntity.num }</span></div>
                <div class="cont">设施地址：<span>${venueEquipmentTypeEntity.location }</span></div>
                <div class="cont">营业时间：<span>${venueEquipmentTypeEntity.businessHours }</span></div>
                <div class="siteImg" id="mainImages">
                </div>
            </div>
            <div >
                <div id="shop-tabs" class="mod">
                    <h2 class="mod-title single">
                        <a class="item J_item" data-click-name="全景图" data-click-title="全景图">全景图</a>
                    </h2>
                    <div id="noData" style="display:none">
						<p class="noDataContent">该设施暂未上传全景图</p>
					</div>
					<div id="previewContainer"  style="display:none">
						<div id='containerImg' style="width:97%;height:70%;color:#999"></div>
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
                </div>
            </div>
    </div>
</div>
<jsp:include page="../footer.jsp" />
<script>
	$(function() {
		/* 加载首页图 */
		var haveImgFlag = false;
		var str = "";
		var mainImgStrs = "${venueEquipmentTypeEntity.mainImgUuids}";
		if(mainImgStrs != null && mainImgStrs != ""){
			haveImgFlag = true;
			var arr = mainImgStrs.split(',');
			for (var i=0 ; i<arr.length ; i++){
				str += showImgBYUuid(arr[i]);
			}
		}
		$("#mainImages").append(str);
		
		/* 加载环境图 */
		var haveEnvironmentImgFlag = false;
		var str = "";
		var equipmentStrs = "${venueEquipmentTypeEntity.equipmentImgUuids}";
		if(equipmentStrs != null && equipmentStrs != ""){
			haveEnvironmentImgFlag = true;
			var arr = equipmentStrs.split(',');
			for (var i=0;i<arr.length;i++){
				var url="${dynamicURL}/front/venue/info/venueImg?uuid="+arr[i];
				str +='<a href="" class="item"><img ';		
				str +='src="'+url+'">';			
				str +='</a>';
			}
		}
		$("#environmentImages").append(str);
		if(!haveImgFlag){
			$("#environmentImages").attr('class','noData');
		}
		/* 加载全景图 */
		var envImgUuid = '${venueEquipmentTypeEntity.equipmentImgUuids}';
		var PSV = null;	
		if(envImgUuid!=null&&envImgUuid!=""){
			var arr = envImgUuid.split(',');
			envImgView = arr[0];
			$("#previewContainer").show();
			PSV = new PhotoSphereViewer({
				//true为自动调用全景图，false为在后面加载全景图（通过.load()方法）
				autoload:true,
			    // Path to the panorama
			    panorama: '${dynamicURL}/front/venue/equipment/type/showImg?uuid='+envImgView,
			    //显示导航条
			    navbar:true,
			    //图片旋转速度，默认为2rpm
			    anim_speed:'1rpm',
			    //图片加载时的提示文字,默认为loading
			    loading_msg:'',
			 	// Container
			    container: $("#containerImg")[0]
			}); 
			//PSV.load();
		}else{
			$("#noData").show();
		}
		
	});
	function showImgBYUuid(uuid){
		var str = '';
		var url="${dynamicURL}/front/venue/equipment/type/showImg?uuid="+uuid;
		str +='<a href=""><img ';		
		str +='src="'+url+'">';			
		str +='</a>';		
		return str;
	}
	
</script>
</body>
</html>