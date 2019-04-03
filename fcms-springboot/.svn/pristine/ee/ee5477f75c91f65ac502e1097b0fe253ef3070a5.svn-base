<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--健身路径详情页  -->
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link rel="stylesheet" href="${staticURL}/css/v2/siteDetails.css" />
		<link rel="stylesheet" href="${staticURL}/css/iconfont.css" />
		<title></title>
		<style>
			#equipmentType .mui-control-content{
				display: none!important;
			}
			#equipmentType .mui-control-content.mui-active{
				display: inline-block!important;
			}
			.infoData {
				padding: 0 10px;
			}
			
			.bt {
				border-bottom: 1px solid #e6e6e6;
				padding-bottom: 5px;
			}
			
			.allComment {
				width: 100%;
				padding: 10px 0;
				text-align: center;
				color: #000;
				display: block;
				font-size: 14px;
			}

			/*预览图片*/
			.mui-preview-image.mui-fullscreen {
				position: fixed;
				z-index: 20;
				background-color: #000;
			}
			
			.mui-preview-header, .mui-preview-footer {
				position: absolute;
				width: 100%;
				left: 0;
				z-index: 10;
			}
			
			.mui-preview-header {
				height: 44px;
				top: 0;
			}
			
			.mui-preview-footer {
				height: 50px;
				bottom: 0px;
			}
			
			.mui-preview-header .mui-preview-indicator {
				display: block;
				line-height: 25px;
				color: #fff;
				text-align: center;
				margin: 15px auto 4;
				width: 70px;
				background-color: rgba(0, 0, 0, 0.4);
				border-radius: 12px;
				font-size: 16px;
			}
			
			.mui-preview-image {
				display: none;
				-webkit-animation-duration: 0.5s;
				animation-duration: 0.5s;
				-webkit-animation-fill-mode: both;
				animation-fill-mode: both;
			}
			
			.mui-preview-image.mui-preview-in {
				-webkit-animation-name: fadeIn;
				animation-name: fadeIn;
			}
			
			.mui-preview-image.mui-preview-out {
				background: none;
				-webkit-animation-name: fadeOut;
				animation-name: fadeOut;
			}
			
			.mui-preview-image.mui-preview-out .mui-preview-header,
				.mui-preview-image.mui-preview-out .mui-preview-footer {
				display: none;
			}
			
			.mui-zoom-scroller {
				position: absolute;
				display: -webkit-box;
				display: -webkit-flex;
				display: flex;
				-webkit-box-align: center;
				-webkit-align-items: center;
				align-items: center;
				-webkit-box-pack: center;
				-webkit-justify-content: center;
				justify-content: center;
				left: 0;
				right: 0;
				bottom: 0;
				top: 0;
				width: 100%;
				height: 100%;
				margin: 0;
				-webkit-backface-visibility: hidden;
			}
			
			.mui-zoom {
				-webkit-transform-style: preserve-3d;
				transform-style: preserve-3d;
			}
			
			.mui-slider .mui-slider-group .mui-slider-item img {
				width: 100%;
				height: auto;
				max-width: 100%;
				max-height: 100%;
			}
			
			.mui-android-4-1 .mui-slider .mui-slider-group .mui-slider-item img {
				width: 100%;
			}
			
			.mui-android-4-1 .mui-slider.mui-preview-image .mui-slider-group .mui-slider-item
				{
				display: inline-table;
			}
			
			.mui-android-4-1 .mui-slider.mui-preview-image .mui-zoom-scroller img {
				display: table-cell;
				vertical-align: middle;
			}
			
			.mui-preview-loading {
				position: absolute;
				width: 100%;
				height: 100%;
				top: 0;
				left: 0;
				display: none;
			}
			
			.mui-preview-loading.mui-active {
				display: block;
			}
			
			.mui-preview-loading .mui-spinner-white {
				position: absolute;
				top: 50%;
				left: 50%;
				margin-left: -25px;
				margin-top: -25px;
				height: 50px;
				width: 50px;
			}
			
			.mui-preview-image img.mui-transitioning {
				-webkit-transition: -webkit-transform 0.5s ease, opacity 0.5s ease;
				transition: transform 0.5s ease, opacity 0.5s ease;
			}
			*{
				box-sizing:content-box;
				-webkit-box-sizing:content-box;
			}
			.mui-preview-bottom{
				width:30px;
				height:30px;
				line-height:30px;
				border-radius:50%;	
				color:#fff;
				border:1px solid #fff;
				display:inline-block;
				position:absolute;
				text-align:center;
				left:50%;
				bottom:10%;
				margin-left:-15px;
			}

			.spanColor{
			color : #999;
			}

		</style>
	</head>
	<body style="background: white;">
		<header class="mui-bar mui-bar-nav">
			<div class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left " onclick="back(),plus.nativeUI.closeWaiting();"></div>
			<h1 id="title" class="mui-title"></h1>
			<a class="mui-pull-right all-img-preview" style='line-height:44px;'>全景预览</a>
		</header>
		<div class="mui-content">
			<div id="sliderImg" class="mui-slider" style="height: 200px;">
				<div class="mui-slider-group mui-slider-loop" id="sliderContent">
				</div>
				<div class="mui-slider-indicator">
					<!-- <div class="mui-indicator mui-active"></div>
					<div class="mui-indicator"></div> -->
				</div>
			</div>
			<div class="siteInfo bort">
				<div class="venueName"></div>
			</div>
			<div class="siteInfo bort">
				<div class="paddtop" >
					<span style="font-weight: bold;">运营模式:</span>
					<span class="spanColor" id="modeName"></span>
				</div>
			</div>
			<div class="siteInfo bort">
				<div class="paddtop" >
					<span style="font-weight: bold;">开放时间:</span>
					<span class="spanColor" id="businessHours"></span>
				</div>
			</div>
			<div class="siteInfo disflex bort">
				<div class="addBox">
					<span style="font-weight:bold;">所属街道:</span>
					<span class="spanColor" id="street"></span>
				</div>
			</div>
			<div class="siteInfo disflex bort">
				<div class="addBox">
					<span style="font-weight:bold;">设施地址:</span>
					<span class="spanColor" id="location"></span>
				</div>
			</div>
			<div class="siteInfo bort">
				<div class="paddtop">
					<span style="font-weight:bold;">设施描述:</span>
					<span class="spanColor" id="equipDescription"></span>
				</div>
			</div>
			<!-- <div style="float: right;">
		    	<button id="uploadBtn" type="button" class="mui-btn mui-btn-primary button">上传环境图</button>
		        <button id="pointBtn" type="button" class="mui-btn mui-btn-primary button">设置定位</button>
		    </div> -->
		</div>
		<div id="previewContainer" class="mui-slider mui-preview-image mui-fullscreen" style="display:none">
			<div id='containerImg' style="width:100%;height:400px;"></div>
			<div id="closePreview" class="mui-preview-bottom">X</div>
		</div>
	</body>
	<script>
		var pubEquipId = '${pubEquipId}';
		var PSV = null;
		mui.init({
			swipeBack: false //关闭右滑关闭功能
		});
		mui.ready(function(){
			detail(pubEquipId);	
			$(document.body).on('tap', '.all-img-preview', function(e) {
				var envImgUuid = $(this).attr('data-uuid');
				if(envImgUuid!=null){
					$("#previewContainer").show();
					PSV = new PhotoSphereViewer({
						//true为自动调用全景图，false为在后面加载全景图（通过.load()方法）
						autoload:true,
					    // Path to the panorama
					    panorama: '${dynamicURL}/mobile/venue/equipment/showImg?uuid='+envImgUuid,
					    //显示导航条
					    navbar:true,
					    // Container
					    container: $("#containerImg")[0]
					}); 
					//PSV.load();
				}else{
					mui.toast('很抱歉，暂无全景图',{duration:'short'});	
				}
				
			});
			$("#closePreview").click(function(){
				$("#previewContainer").hide();
				PSV=null;
			});
		});
		function detail(pubEquipId) {
			topUtil.web_query("/mobile/venue/equipment/detail", {id:pubEquipId}, function (data) {
				if (typeof data == "string") {
	               data = JSON.parse(data);
	           }
				if (data.success) {
					var pointStr='';
					var str = '';
					var envImgView=null;
					if(data.obj.equipmentImgUuids){
						var arr = data.obj.equipmentImgUuids.split(',');
						envImgView = arr[0];
					}
					$(".all-img-preview").attr("data-uuid",envImgView);
					if(data.obj.mainImgUuids) {
						var arr = data.obj.mainImgUuids.split(',');
						var first = '';
						var last = '';
						
						mui.each(arr,function(index,item) {
							pointStr +='<div class="mui-indicator"></div>';
							str += '<div class="mui-slider-item"><a href="#">';
							str += '<a href="#"><img src="'+dynamicURL+'/mobile/venue/view/showImg?uuid='+item+'" /></a></div>';
							if(index == 0) {
								first += '<div class="mui-slider-item mui-slider-item-duplicate">';
								first += '<a href="#"><img src="'+dynamicURL+'/mobile/venue/equipment/showImg?uuid='+item+'" /></a></div>';
							} 
							if(index == arr.length-1) {
								last += '<div class="mui-slider-item mui-slider-item-duplicate">';
								last += '<a href="#"><img src="'+dynamicURL+'/mobile/venue/equipment/showImg?uuid='+item+'" /></a></div>';
							} 
						});
						str = last + str + first;
						
					}else{
						str += '<div class="mui-slider-item mui-slider-item-duplicate">';
						str += '<a href="#" style="padding:10px;"><img style="height:180px;" src="${staticURL}/images/front/notFound.jpg" /></a></div>';
					}
					$('.mui-slider-indicator').html(pointStr);
					$('#sliderContent').html(str);
					mui("#sliderImg").slider({
						interval: 3000
					});
					$("#title").html(data.obj.name);
					$(".venueName").html(data.obj.name);
					$("#street").html(data.obj.streetName);
					$("#location").html(data.obj.location);
					$("#businessHours").html((data.obj.businessHours==null? '全天开放':data.obj.businessHours));
					$("#equipDescription").html(ifNull(data.obj.description));
					$("#modeName").html(ifNull(data.obj.modeName));
					
				}
			});
		}
		/*为空则返回暂未设置*/
		function ifNull(object){
			if(object!=null){
				return object;
			}else{
				return '暂未设置';
			}	
		}
		/* //上传环境图
		document.getElementById('uploadBtn').addEventListener('tap', function() {
			mui.openWindow({ 
				url: '${dynamicURL}/mobile/venue/equipment/toUploadEnvironment?pubEquipId=${pubEquipId}', 
				id : 'pub_equip_upload',
				show:{
					autoShow:true,//页面loaded事件发生后自动显示，默认为true
					aniShow:"slide-in-right",
					duration:'250'
				},
				waiting:{
					autoShow:false,//自动显示等待框，默认为true
				}
			});
		});
		//定位设置
		document.getElementById('pointBtn').addEventListener('tap', function() {
			mui.openWindow({ 
				url: '${dynamicURL}/mobile/venue/equipment/toPoint?pubEquipId=${pubEquipId}', 
				id : 'pub_equip_upload',
				show:{
					autoShow:true,//页面loaded事件发生后自动显示，默认为true
					aniShow:"slide-in-right",
					duration:'250'
				},
				waiting:{
					autoShow:false,//自动显示等待框，默认为true
				}
			});
		}); */
		
	</script>

</html>