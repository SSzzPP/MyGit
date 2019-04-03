<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--场馆用户 我的预约详情展示  -->
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>预约详情</title>
		
		<style>
			.mui-content{
				background-color: #fff;
				min-height: 100%;
			}
			.mui-input-row {
				height:60px;
				padding:10px 0;
			}
			.mui-input-row:after{
				position: absolute;
			    right: 0;
			    bottom: 0;
			    left: 15px;
			    height: 1px;
			    content: '';
			    -webkit-transform: scaleY(.5);
			    transform: scaleY(.5);
			    background-color: #c8c7cc;
			}
			.mui-input-row label {
				width: 31%;
				font-size:16px;
			}
			.mui-input-row label~input,
			.mui-input-row label~select{
				width: 69%;
				font-size:16px;
				text-align: right;
			}
			.mui-input-row label~select{
				direction: rtl;
				padding-right:15px;
			}
			.mui-input-row .button{
				width: 69%;
				height:40px;
				border: 0;
				padding:12px 0;
				padding-right:15px;
				font-size:16px;
				color:#000;
				text-align: right;
			}
			.mui-input-row .button:enabled:active{
				color:#aaa;
				background-color:#fff;
			}
			img.imgcard{
				height:40px;
				width:110px;
				margin-left:15px;
			}
			.mui-btn {
				padding: 10px;
			}
			p{
				margin-bottom:0;
			}
			.mui-input-row .mui-input-clear~.mui-icon-clear{
				top:20px;
			}
			input[type='submit'], .mui-btn-my, .mui-btn-my {
			    color: #fff;
			    border: 1px solid #1799c5;
			    background-color: #1799c5;
			}
			.mui-btn-my:enabled:active{
				color: #fff;
			    border: 1px solid #1799c5;
			    background-color: #1799c5;
			}
			.set-btn{
				height:50px;
				width:90%;
				font-size:16px;
			}
		</style>
	</head>
	<body>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">预约详情</h1>
		</header>
		<div class="mui-content">
			<form action="javascript:void(0)">
				<div class="mui-input-row">
					<label>姓名</label>
					<input id='name' type="text" disabled="true">
				</div>
				<div class="mui-input-row">
					<label>手机号码</label>
					<input id='mobile' type="text" disabled="true">
				</div>
				<div class="mui-input-row">
					<label>场馆</label>
					<input id='venueName' type="text"  disabled="true">
				</div>
				<div class="mui-input-row">
					<label>设施</label>
					<input id='equipmentName' type="text" disabled="true">
				</div>
				<div class="mui-input-row">
					<label>数量</label>
					<input id='count' type="text" disabled="true">
				</div>
				<div class="mui-input-row">
					<label>开始时间</label>
					<input id='orderTime' type="text" disabled="true">
				</div>
				<div class="mui-input-row">
					<label>结束时间</label>
					<input id='orderEndTime' type="text" disabled="true">
				</div>
				<div class="mui-button-row">
					<button id='submit' class="mui-btn mui-btn-my set-btn"></button>
				</div>
				<div class="mui-button-row">
					<button id='edit' class="mui-btn mui-btn-my set-btn">同意改签</button>
				</div>
				<div class="mui-button-row">
					<button id='cancle' class="mui-btn mui-btn-my set-btn">同意退订</button>
				</div>
			</form>
		</div>
		<script>
			var uuid = '${uuid}';
			var userType = null;
			mui.init({
				swipeBack:true //启用右滑关闭功能
			});  
			mui.ready(function(){
			    //关闭等待框 
			    //plus.nativeUI.closeWaiting();
			    //uuid =  plus.webview.currentWebview().uuid;
			    //userType = plus.webview.currentWebview().userType;
			    orderDetail();
			    $('#edit').hide();
			    $('#cancle').hide();
			}); 
			function orderDetail() {
				topUtil.web_query('/mobile/order/getOrderDetail', {uuid:uuid}, function (data) {
					if (typeof data == "string") {
		                data = JSON.parse(data);
		            }
					var str = "";
					var disabled = false;
					if(data.success) {
						if (data.order.name)
							$('#name').attr('value',data.order.name);
						if (data.order.mobile)
							$('#mobile').attr('value',data.order.mobile);
						if (data.order.venueName)
							$('#venueName').attr('value',data.order.venueName);
						if (data.order.equipmentName)
							$("#equipmentName").attr('value',data.order.equipmentName);
						if (data.order.count)
							$("#count").attr('value',data.order.count);
						if (data.order.orderTime)
							$("#orderTime").attr('value',data.order.orderTime);
						if (data.order.orderEndTime)
							$("#orderEndTime").attr('value',data.order.orderEndTime);
				    	if (data.order.status == 0){
				    		str = '接单';
				    	}else{
				    		str = '已接单';
				    		disabled = true;
				    		if(data.order.editStatus != null && data.order.editStatus == 0){
				    			$('#edit').show();
				    			$('#submit').hide();
				    		}
				    	}
				    	if (data.order.cancleStatus != null){
				    		$('#edit').hide();
				    		$('#submit').hide();
				    		if (data.order.cancleStatus == 0){
				    			$('#cancle').show();
				    		}else{
				    			$('#cancle').show();
				    			$('#cancle').html('已退订');
					   			$('#cancle').attr("disabled",true);
				    		}
				    	}
					    $('#submit').html(str);
					    $('#submit').attr("disabled",disabled);
						
					}
				})
			}
			document.getElementById('submit').addEventListener('tap',function () {
				topUtil.web_query('/mobile/order/confirm', {uuid:uuid}, function (data) {
					if (typeof data == "string") {
		                data = JSON.parse(data);
		            }
					if(data.success) {
						mui.alert('接单成功！');
						$('#submit').html('已接单');
						$('#submit').attr("disabled",true);
					}
				})
			},false);
			document.getElementById('edit').addEventListener('tap',function () {
				var params = {};
				params.uuid = uuid;
				params.status = 1;
				topUtil.web_query('/mobile/order/changeEditStatus', params, function (data) {
					if (typeof data == "string") {
		                data = JSON.parse(data);
		            }
					if(data.success) {
						mui.alert('操作成功！');
						$('#edit').hide();
					}
				})
			},false);
			document.getElementById('cancle').addEventListener('tap',function () {
				var params = {};
				params.uuid = uuid;
				params.status = 1;
				topUtil.web_query('/mobile/order/cancle', params, function (data) {
					if (typeof data == "string") {
		                data = JSON.parse(data);
		            }
					if(data.success) {
						mui.alert('操作成功！');
						$('#cancle').html('已退订');
					   	$('#cancle').attr("disabled",true);
					}
				})
			},false);
		</script>
	</body>
</html>