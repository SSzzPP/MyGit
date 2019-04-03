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
</head>
<body>
<div class="container">
    <jsp:include page="../header.jsp" />
    <div class="line-big margin-top min-height">
        <div class="xs9">
            <div class="basic-info">
                <div class="shop-name">${venueEquipmentTypeEntity.name }</div>
                <div class="cont">场地数量：<span>${venueEquipmentTypeEntity.num }</span></div>
                <div class="cont">场地分类：<span>${venueEquipmentTypeEntity.typeName }</span></div>
                <div class="cont">运营模式：<span>${venueEquipmentTypeEntity.modeName }</span></div>
                <div class="cont">营业时间：<span>${venueEquipmentTypeEntity.businessHours }</span></div>
                <div class="cont">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地板：<span>${venueEquipmentTypeEntity.floor }</span></div>
                <div class="cont">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;灯光：<span>${venueEquipmentTypeEntity.lighting }</span></div>
                <div class="cont">&nbsp;&nbsp;&nbsp;休息区：<span>${venueEquipmentTypeEntity.restingArea }</span></div>
            </div>
            <div class="basic-info">
                <div class="shop-name">所属场馆</div>
                <div class="cont">场馆名称：<span>${venueInfoEntity.name }</span></div>
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
            </div>
            <div >
            </div>
            
        </div>
        <div class="xs3">
                <div class="aside">
                   <!--  <div class="J_mkt-group-2"></div>
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
		/* 加载星级 */
		var star = '${venueInfoEntity.star}'*10;
		var starStr = "sml-rank-stars sml-str"+star; 
		$("#star").attr('class',starStr);
	});
	
</script>
</body>
</html>