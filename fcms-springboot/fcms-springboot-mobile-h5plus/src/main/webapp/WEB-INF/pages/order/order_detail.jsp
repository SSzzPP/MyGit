<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--普通用户 我的预约详情展示  -->
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
				<!--教练或者场馆-->
				<div class="mui-input-row">
					<label id="venueOrCaoch"></label>
					<input id='venueOrCaochName' type="text"  disabled="true">
				</div>
				<!--课程或者设施-->
				<div class="mui-input-row">
					<label id="equipmentOrCourse"></label>
					<input id='equipmentOrCourseName' type="text" disabled="true">
				</div>
				<div class="mui-input-row">
					<label id="num"></label>
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
					<button id='edit' class="mui-btn mui-btn-my set-btn" style="display: none;">改签</button>
				</div>
				<div class="mui-button-row">
					<button id='cancle' class="mui-btn mui-btn-my set-btn" style="display: none;">退订</button>
				</div>
				<div class="mui-button-row">
					<button id='complaint' class="mui-btn mui-btn-my set-btn">消费投诉</button>
				</div>
			</form>
		</div>
		<script>
			var uuid = '${uuid}';
			var courseId = null;
			var equipmentId=null;
			var orderType = '${orderType}';
			mui.init({
				swipeBack:true //启用右滑关闭功能
			});  
			mui.ready(function(){
			    //关闭等待框 
			    /* plus.nativeUI.closeWaiting();
			    uuid =  plus.webview.currentWebview().uuid;
			    userType = plus.webview.currentWebview().userType;
			    orderType = plus.webview.currentWebview().orderType */
			    orderDetail();
			}); 
			function orderDetail() {
				topUtil.web_query('/mobile/order/getOrderDetail', {uuid:uuid}, function (data) {
					if (typeof data == "string") {
		                data = JSON.parse(data);
		            }
					var str = "写评价";
					var disabled = false;
					if(data.success) {
						if (data.order.name)
							$('#name').attr('value',data.order.name);
						if (data.order.mobile)
							$('#mobile').attr('value',data.order.mobile);
						if(orderType==1){
							equipmentId = data.order.equipmentId;
							$("#venueOrCaoch").html('场馆');
							$("#equipmentOrCourse").html('设施');
							if (data.order.venueName)
								$('#venueOrCaochName').attr('value',data.order.venueName);
							if (data.order.equipmentName)
								$("#equipmentOrCourseName").attr('value',data.order.equipmentName);
							$("#num").html('数量');
						}
						if(orderType==2){
							$('#complaint').hide();
							courseId = data.order.courseId;
							$("#venueOrCaoch").html('教练');
							$("#equipmentOrCourse").html('课程');
							if (data.order.coachName)
								$('#venueOrCaochName').attr('value',data.order.coachName);
							if (data.order.courseName)
								$("#equipmentOrCourseName").attr('value',data.order.courseName);
							$("#num").html('课时');
						}
						if (data.order.count)
							$("#count").attr('value',data.order.count);
						if (data.order.orderTime)
							$("#orderTime").attr('value',data.order.orderTime);
						if (data.order.orderEndTime)
							$("#orderEndTime").attr('value',data.order.orderEndTime);
				    	if(data.order.vealuateStatus == 1){
				    		str = '已评价';
				    		disabled = true;
				    		$('#submit').html(str);
					    	$('#submit').attr("disabled",disabled);
					    	$('#cancle').hide();
				    		$('#edit').hide();
				    	}else{
				    		if(data.order.status == 1){
				    			str = '写评价';
				    		}else{
				    			$('#submit').hide();
				    			$('#complaint').hide();
				    		}
				    		$('#cancle').show();
				    		$('#edit').show();
				    	}
				    	if(data.order.cancleStatus != null){
				    		$('#cancle').attr("disabled",true);
				    		$('#cancle').show();
				    		$('#submit').hide();
				    		$('#complaint').hide();
				    		$('#edit').hide();
				    		if(data.order.cancleStatus == 0){
					    		$('#cancle').html('退订处理中');
					    	}else{
					    		$('#cancle').html('已退订');
					    	}
				    	}
				    	if(data.order.editStatus == 0){
				    		$('#edit').html('改签处理中');
				    		$('#edit').attr("disabled",true);
				    	}
					    $('#submit').html(str);
					    if(data.order.complaintId != null){
				    		afterComplaint();
					    }
					}
				})
			}
			window.addEventListener("afterComplaint", function(e) {
				afterComplaint();
			});
			function afterComplaint(){
				$('#complaint').html('已投诉');
				$('#complaint').attr("disabled",true);
			}
			document.getElementById('submit').addEventListener('tap',function () {
				var url="";
				var id = "";
				if (orderType==1){
					url=dynamicURL+"mobile/venue/vealuate/toVenueVealuate?orderUuid="+uuid;
					id="mobile/venue/vealuatel/toVenueVealuate";
				}else if(orderType==2){
					url=dynamicURL+"mobile/vealuate/user/toCoachVealuate?orderUuid="+uuid;
					id="mobile/vealuate/user/toCoachVealuate";
				}
				mui.openWindow({
				    url: url, 
				    id : id,
				    show:{
				      autoShow:true,//页面loaded事件发生后自动显示，默认为true
				      aniShow:"slide-in-bottom",
				      duration:'250'
				    },
				    waiting:{
				      autoShow:false,//自动显示等待框，默认为true
			      	}
	  			});
	  			/*$('#submit').html('已评价');
				$('#submit').attr("disabled",true);*/
			},false);
			/*改签*/
				document.getElementById('edit').addEventListener('tap',function () {
					if(orderType==1){
						mui.openWindow({
							url: dynamicURL+'mobile/venue/view/toOrderInfo?equipmentId='+equipmentId+"&type=1&orderUuid="+uuid, 
						    id : 'mobile/venue/view/toOrderInfo',
						    show:{
						      autoShow:true,//页面loaded事件发生后自动显示，默认为true
						      aniShow:"slide-in-bottom",
						      duration:'250'
						    },
						    waiting:{
						      autoShow:false,//自动显示等待框，默认为true
					      	}
		  				});
					}else if(orderType==2){
						mui.openWindow({
							 url: dynamicURL+'mobile/order/toCoachOrder?courseId='+courseId+"&type=1&orderUuid="+uuid, 
							 id : 'mobile/order/toCoachOrder',
						    show:{
						      autoShow:true,//页面loaded事件发生后自动显示，默认为true
						      aniShow:"slide-in-bottom",
						      duration:'250'
						    },
						    waiting:{
						      autoShow:false,//自动显示等待框，默认为true
					      	}
		  			});
					}
				
			},false);
				
				/*document.getElementById('edit').addEventListener('tap',function () {
				mui.openWindow({
				    url: '../venue/order_coach_info.html', 
				    id : 'order_coach_info.html',
				    show:{
				      autoShow:true,//页面loaded事件发生后自动显示，默认为true
				      aniShow:"slide-in-bottom",
				      duration:'250'
				    },
				    extras: {
	                    orderUuid:uuid,
	                    type:'1',
	                    courseId :courseId
	                },
				    waiting:{
				      autoShow:false,//自动显示等待框，默认为true
			      	}
	  			});
			},false);
			*/
			/*退订*/
			document.getElementById('cancle').addEventListener('tap',function () {
				var btnArray = ['否', '是'];
				mui.confirm('您真的要退订吗？', '提示', btnArray, function(e) {
					if (e.index == 1) {
						var params = {};
						params.uuid = uuid;
						params.status = 0;
						topUtil.web_query('/mobile/order/cancle', params, function (data) {
							if (typeof data == "string") {
				                data = JSON.parse(data);
				            }
							if(data.success) {
								mui.alert('退订申请已提交，请耐心等待商家处理！');
								$('#cancle').html('退订处理中');
								$('#edit').hide();
								$('#cancle').attr("disabled",true);
							}
						})
					} else {
						mui.toast('感谢您的支持与肯定~');
					}
				})
				
			},false);
			/**
			 * 消费投诉
			 */
			document.getElementById('complaint').addEventListener('tap',function () {
				mui.openWindow({ 
				    url: dynamicURL+'mobile/complaint/toComplaintPage?orderUuid='+uuid, 
				    id : 'mobile/complaint/toComplaintPage',
				    show:{
				      autoShow:true,//页面loaded事件发生后自动显示，默认为true
				      aniShow:"slide-in-right",
				      duration:'250'
				    },
				     waiting:{
				      autoShow:false,//自动显示等待框，默认为true
			      	}
		  		});
			},false)
			window.addEventListener("reload", function(e) {
				plus.webview.currentWebview().reload();
			});
		</script>
	</body>
</html>