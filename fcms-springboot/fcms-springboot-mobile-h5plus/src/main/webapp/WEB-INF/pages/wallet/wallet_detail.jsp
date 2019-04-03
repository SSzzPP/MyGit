<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<link href="${staticURL}/css/pintuer.css" rel="stylesheet" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title class="i18n" key="yqemu_system_name"></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title></title>
<style>
	html,
	body {
		background-color: #efeff4;
	}
	.mui-bar~.mui-content .mui-fullscreen {
		top: 44px;
		height: auto;
	}
	.mui-pull-top-tips {
		position: absolute;
		top: -20px;
		left: 50%;
		margin-left: -25px;
		width: 40px;
		height: 40px;
		border-radius: 100%;
		z-index: 1;
	}
	.mui-bar~.mui-pull-top-tips {
		top: 24px;
	}
	.mui-pull-top-wrapper {
		width: 42px;
		height: 42px;
		display: block;
		text-align: center;
		background-color: #efeff4;
		border: 1px solid #ddd;
		border-radius: 25px;
		background-clip: padding-box;
		box-shadow: 0 4px 10px #bbb;
		overflow: hidden;
	}
	.mui-pull-top-tips.mui-transitioning {
		-webkit-transition-duration: 200ms;
		transition-duration: 200ms;
	}
	.mui-pull-top-tips .mui-pull-loading {
		/*-webkit-backface-visibility: hidden;
		-webkit-transition-duration: 400ms;
		transition-duration: 400ms;*/
		
		margin: 0;
	}
	.mui-pull-top-wrapper .mui-icon,
	.mui-pull-top-wrapper .mui-spinner {
		margin-top: 7px;
	}
	.mui-pull-top-wrapper .mui-icon.mui-reverse {
		/*-webkit-transform: rotate(180deg) translateZ(0);*/
	}
	.mui-pull-bottom-tips {
		text-align: center;
		background-color: #efeff4;
		font-size: 15px;
		line-height: 40px;
		color: #777;
	}
	.mui-pull-top-canvas {
		overflow: hidden;
		background-color: #fafafa;
		border-radius: 40px;
		box-shadow: 0 4px 10px #bbb;
		width: 40px;
		height: 40px;
		margin: 0 auto;
	}
	.mui-pull-top-canvas canvas {
		width: 40px;
	}
	.mui-slider-indicator.mui-segmented-control {
		background-color: #efeff4;
	}
	
	
	.mui-popover {
		height: 50px;
		width: 150px;
	}
	#topPopover {
		position: fixed;
		top: 16px;
		right: 6px;
	}
	#topPopover .mui-popover-arrow {
		left: auto;
		right: 6px;
	}
</style>
</head>
<body>
	<header class="mui-bar mui-bar-nav bg-white">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left "></a>
		<h1 class="mui-title">交易明细</h1>
	</header>
	
	<div id="pullrefresh" class="mui-content">
		<div class="mui-fullscreen">
			<div class="mui-scroll-wrapper">
				<div id="muiScrollDiv" class="mui-scroll">
					<!--交易日志-->
					<div id="walletLogList"></div>
				</div>
			</div>
		</div>
	</div>
	<script src="${staticURL}/js/jquery.js" type="text/javascript" charset="utf-8"></script>
	<script src="${staticURL}/js/mui.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="${staticURL}/js/jquery.i18n.properties.js" type="text/javascript" charset="utf-8"></script>
	<script src="${staticURL}/js/yqemu-wallet-utils.js" type="text/javascript" charset="utf-8"></script>
	<script>
	mui.init({
		swipeBack:true //启用右滑关闭功能
	});
	mui.ready(function(){
		loadWalletData();
		//阻尼系数
		var deceleration = mui.os.ios?0.003:0.0009;
		mui('.mui-scroll-wrapper').scroll({
			bounce: false,
			indicators: true, //是否显示滚动条
			deceleration:deceleration
		});
	});
	
	function loadWalletData(){
		var params = {txid:"${txid}"};
		topUtil.web_query('/mobile/wallet/showWalletDealWithoutDetail',params,
			function (data) {
				if (typeof data == "string") {
	               data = JSON.parse(data);
	            }
				var str = '';
				if(data){
					str += '<div class="radius-rounded box-shadow-big bg-gray" style="margin: 20px;">'+
								'<div class="padding-big text-white">'+
									'<div class="margin-top i18n" key="yqemu_user_deallog_name"></div>';
					if(data.balance.assets.length>0) {
						str += '<div class="line margin-large-top">'+
									'<div class="text-white text-big x4">';
						mui.each(data.balance.assets,function (i,item) {
							str += item.name;
						});
						str += '</div>'+
								'<div class="text-white text-big x8">';
						if(data.balance.amount>0) {
							str += data.balance.amount + '<hr>';
						}
						mui.each(data.balance.assets,function (i,item) {
							if(item.qty>0) {
								str += '+' + item.qty;
							}else{ 
								str += item.qty;
							}
							str += '<hr>';
						});
						str +=		'</div>'+
								'</div>';
						<!--手续费已定是负数-->
						if(data.balance.amount<0) {
							str += '<div class="line margin-large-top">'+
										'<div class="text-white text-big x4 i18n" key="yqemu_user_deallog_fee">'+
										'</div>'+
										'<div class="text-white text-big x8">'+
											data.balance.amount + 'YQF'+
										'</div>'
									'</div>';
						}
					}else{
						str += '<div class="line margin-large-top">'+
									'<div class="text-white text-big x4">'+
										'YQF<hr>'+
									'</div>'+
									'<div class="text-white text-big x8">';
						if(data.balance.amount>0) {
							str += '+' + data.balance.amount;
						}else{ 
							str += data.balance.amount;
						}
						str +=			'<hr>'+
									'</div>'+
								'</div>';
					}
						str += '<div class="line margin-large-top">'+
									'<div class="text-white text-big x4 text-break i18n" key="yqemu_user_deallog_time">'+
									'</div>'+
									'<div class="text-white text-big x8">'+
										data.timeStr+
									'</div>'+
								'</div>'+
								'<div class="line margin-large-top">'+
									'<div class="text-white text-big x4 text-break i18n" key="yqemu_user_deallog_confrimtime">'+
									'</div>'+
								'<div class="text-white text-big x8">'+
									data.blocktimeStr +
								'</div>'+
							'</div>'+
							'<div class="line margin-large-top">'+
								'<div class="text-white text-big x4 text-break i18n" key="yqemu_user_deallog_txid">'+
								'</div>'+
								'<div class="text-white text-big x8 text-break">'+
									data.txid +
								'</div>'+
							'</div>'+
							'<div class="line margin-large-top">'+
								'<div class="text-white text-big x4 text-break i18n" key="yqemu_user_deallog_block">'+
								'</div>'+
								'<div class="text-white text-big x8 text-break">'+
									data.blockhash +
								'</div>'+
							'</div>'+
							'<div class="line margin-large-top">'+
								'<div class="text-white text-big x4 text-break i18n" key="yqemu_user_deallog_fromadd">'+
								'</div>'+
								'<div class="text-white text-big x8 text-break">'+
									data.myaddresses[0] +
								'</div>'+
							'</div>'+
							'<div class="line margin-large-top">'+
								'<div class="text-white text-big x4 text-break i18n" key="yqemu_user_deallog_toadd">'+
								'</div>'+
								'<div class="text-white text-big x8 text-break">'+
									data.addresses[0] +
								'</div>'+
							'</div>'+
						'</div>'+
					'</div>';
				}
				document.getElementById("walletLogList").innerHTML = str;
				initI18N();
		});
	}
	
	// 监听刷新请求
	window.addEventListener("refreshWalletData",function(event){
		loadWalletData(walletdata);
	});
	</script>
</body>
</html>