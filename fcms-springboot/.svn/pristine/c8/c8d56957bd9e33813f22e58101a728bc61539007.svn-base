<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<link href="${staticURL}/css/pintuer.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${staticURL}/css/pullToRefresh.css"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title class="i18n" key="yqemu_system_name"></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title></title>
<style>
	.mui-action-back{
		color:#1799c5;
	}
</style>
</head>
<body>
	<header class="mui-bar mui-bar-nav bg-white">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left "></a>
		<h1 class="mui-title">钱包</h1>
	</header>
	<div id="pullrefresh" class="mui-content">
		<div class="mui-fullscreen">
			<div class="mui-scroll-wrapper">
				<div id="muiScrollDiv" class="mui-scroll">
					<div class="banner text-center" style="background-image:url(${staticURL}/images/front/banner.gif)">
						<div class="keypoint bg-inverse">
						    <h2 id="accountNum" class="i18n" key="yqemu_system_account_name"g</h2>
						    <p><span class="i18n" key="yqemu_system_version"></span>V1.0.0</p>
						</div>
					</div>
					<!--钱包列表-->	
					<div id="walletList">
						<div class="radius-rounded box-shadow-big" style="margin: 20px;background-color: #518adb;">
							<div class="padding-big text-white">
								<div class="line">
									<div class="x6 text-left" style="color: #4d69a7;">
										<span class="text-yellow-light i18n" key="yqemu_user_wallet_remain"></span>
									</div>
									<div  class="x6 text-right">
										<img id="publicAddImg" class="copyImg ring-hover" publicAdd="" src="${staticURL}/images/front/qrcode.png" style="height: 30px;"/>
									</div>
								</div>
									<div class="text-white text-large margin-top"><pre id="qty">point:</pre></div>
								<div class="margin-top" style="color: #4d69a7;"><span class="text-yellow-light i18n" key="yqemu_user_wallet_account"></span></div>
								<div  class="line">
									<div class="x12 text-left text-white copyContent text-break" id="publicAdd">
									</div>
								</div>
								<!-- <div id="" class="text-center margin-large-top" style="">
									<button id="transferButton" class="button radius-rounded bg-white text-center" style="width: 200px;"><span class="text-yellow i18n" key="yqemu_user_wallet_totransfer">转账</span></button>
								</div> -->
							</div>
						</div>
					</div>
					<!--交易日志-->
					<div id="walletLogList"></div>
					<p class="mui-text-center">此数据来源于区块链</p>
				</div>
			</div>
		</div>
	</div>
	<div id="qrcode" class="mui-popover mui-content text-center" style="height: 250px;width: 250px;top: 40%;left: 20%;">
		<div id="qrcodeImg" style="width: 150px;height: 150px;margin: 0 auto;"></div>
		<div class="padding-top i18n" style="margin: 0 auto;" key="yqemu_user_wallet_qrcode"></div>
	</div>
	<script src="${staticURL}/js/jquery.js" type="text/javascript" charset="utf-8"></script>
	<script src="${staticURL}/js/mui.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="${staticURL}/js/jquery.i18n.properties.js" type="text/javascript" charset="utf-8"></script>
	<script src="${staticURL}/js/pintuer.js" type="text/javascript" charset="utf-8"></script>
	<script src="${staticURL}/js/qrcode.js" type="text/javascript" charset="utf-8"></script>
	<script src="${staticURL}/js/arttmpl.js" type="text/javascript" charset="utf-8"></script>
	<script src="${staticURL}/js/mui.pullToRefresh.js"></script>
	<script src="${staticURL}/js/mui.pullToRefresh.material.js"></script>
	<script src="${staticURL}/js/yqemu-share.js" type="text/javascript" charset="utf-8"></script>
	<script src="${staticURL}/js/core-min.js" type="text/javascript" charset="utf-8"></script>
	<script src="${staticURL}/js/tripledes.js" type="text/javascript" charset="utf-8"></script>
	<script src="${staticURL}/js/yqemu-wallet-utils.js" type="text/javascript" charset="utf-8"></script>
	<script>
		var walletObj;// 钱包对象
		var walletLogData;
		var pullRefreshElList;
		mui.init({
			swipeBack:true, //启用右滑关闭功能
			gestureConfig:{
			   tap: true, //默认为true
			   longtap: true, //默认为false
			   swipe: true //默认为true
			}
		});
		mui.ready(function(){
			//updateSerivces();
			getWallet();
			//阻尼系数
			var deceleration = mui.os.ios?0.003:0.0009;
			mui('.mui-scroll-wrapper').scroll({
				bounce: false,
				indicators: true, //是否显示滚动条
				deceleration:deceleration
			});
			pullRefreshElList = mui("#muiScrollDiv").pullToRefresh({
				down: {
					callback: function() {
						loadWalletData();
						this.endPullDownToRefresh();
					}
				},
				up: {
					contentnomore: '', //上拉无更多信息时提示信息
					callback: function() {
						loadWalletData();
						this.endPullUpToRefresh(true);
					}
				}
			});
			//刷新
			pullRefreshElList.pullUpLoading();
		});
		
		function getWallet() {
			var params = {};
			topUtil.web_query('/mobile/wallet/getWallet',params,
				function (data) {
					if (typeof data == "string") {
		               data = JSON.parse(data);
		            }
					console.log(data);
					$("#publicAddImg").attr('publicAdd',data.publicAdd);
					$("#qty").append(data.qty);
					document.getElementById("publicAdd").innerHTML = data.publicAdd;
					$("#accountNum").html(getI18NContent("yqemu_system_account_name",1));
			});
		}
		function loadWalletData() {
			var params = {};
			topUtil.web_query('/mobile/wallet/getBlockChainDeals',params,
				function (data) {
					if (typeof data == "string") {
		               data = JSON.parse(data);
		            }
					console.log(data);
					var str = '';
					if(data){
						str += '<div class="radius-rounded box-shadow-big bg-gray " style="margin: 20px;">'+
									'<div class="padding-big text-white">'+
										'<div class="margin-top i18n" key="yqemu_user_wallet_deallog"></div>';
						mui.each(data,function (index,item) {
							if(item.balance.assets.length>0) {
								<!--assets数组循环-->
								mui.each(item.balance.assets,function (j,item2) {
									if(item.balance.assets.length>0) {
										str += '<div class="line margin-large-top logcontent shake-hover" index="' + index + '">'+
													'<div class="text-big x2">';
										if(item2.qty>0) {
											str += '<img src="${staticURL}/images/front/transfer-in.png" height="20px"/>';
										} else {
											str += '<img src="${staticURL}/images/front/transfer-out.png" height="20px"/>';
										}
										str += '</div>'+
												'<div class="text-big x2">' + item2.name + '</div>'+
												'<div class="text-big x8 text-break text-right">';
										if(item2.qty>0) {
											str += '<span class="text-yellow-light">' + item2.qty + '</span>';
										} else {
											str += item2.qty ;
										}
										str +=		'</div>'+
												'</div>';
									}
								});
								str += '<div class="line margin-large-top text-small text-break">'+
											item.timeStr +
										'</div>'+
										'<hr>';
							}
						});
						str +=		'</div>'+
								'</div>';
					}
					document.getElementById("walletLogList").innerHTML = str;
					walletLogData = data;
				}
			);
		}
		// 监听刷新请求
		window.addEventListener("refreshWalletData",function(event){
			loadWalletData();
		});
		
		mui("#walletList").on('longtap','.copyContent',function(){
			copyDataToClipboard(walletObj.publicAdd);
			return false;
		});
		
		
		mui("#walletLogList").on('tap','.logcontent',function(){
			var index = this.getAttribute("index");
			var walletLogDataDetail = walletLogData[index];
			mui.openWindow({ 
				url: dynamicURL+'mobile/wallet/toDetail?txid=' + walletLogDataDetail.txid, 
			    id : 'wallet_detail',
			    show:{
			      autoShow:true,//页面loaded事件发生后自动显示，默认为true
			      aniShow:"slide-in-right",
			      duration:'250'
			    },
			     waiting:{
			      autoShow:false//自动显示等待框，默认为true
	//		      title:'正在加载...'//等待对话框上显示的提示内容
		      	}
	  		});
			return false;
		});
	
		mui("#pullrefresh").on('tap','#transferButton',function(){
			 mui.openWindow({ 
				url: 'transfer_detail.html', 
			    id : 'transfer_detail.html',
			    show:{
			      autoShow:true,//页面loaded事件发生后自动显示，默认为true
			      aniShow:"slide-in-right",
			      duration:'250'
			    },
			    waiting:{
			      autoShow:false//自动显示等待框，默认为true
	//		      title:'正在加载...'//等待对话框上显示的提示内容
		      	},
		      	extras:  { 
			    	walletObj:walletObj// 钱包对象
			    }
	  		});
			return false;
		}) 
		
		mui("#pullrefresh").on('tap','.copyImg',function(){
			var publicAdd = this.getAttribute("publicAdd");
			$('#qrcodeImg')[0].innerHTML="";
			var qrcode = new QRCode('qrcodeImg', {
			  text: publicAdd,
			  width: 150,
			  height: 150,
			  colorDark : '#000000',
			  colorLight : '#ffffff',
			  correctLevel : QRCode.CorrectLevel.H
			});
	
			mui('#qrcode').popover('toggle');
			return false;
		}) 
		
    
 	</script>
</body>
</html>