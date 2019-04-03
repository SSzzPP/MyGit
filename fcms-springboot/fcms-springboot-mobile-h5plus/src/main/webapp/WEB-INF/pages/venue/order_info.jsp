<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>场馆预约</title>
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
		</style>
</head>
<body>
<body class="mui-plus-pullrefresh">
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">预约信息</h1>
		</header>
		<div class="mui-content">
			<form action="javascript:void(0)">
				<div class="mui-input-row">
					<label>姓名</label>
					<input id='name' type="text" class="" placeholder="请输入姓名" maxlength="18">
					<input id='uuid' type="hidden" class="" >
					<input id='venueId' type="hidden" class="" >
					<input id='equipmentId' type="hidden" class="" >
				</div>
				<div class="mui-input-row">
					<label>手机号码</label>
					<input id='mobile' type="text" class="" placeholder="请输入手机号" maxlength="18">
				</div>
				<div class="mui-input-row">
					<label>场馆名称</label>
					<input id='venueName' type="text" class="" disabled="true">
				</div>
				<div class="mui-input-row">
					<label>设施名称</label>
					<input id='equipmentName' type="text" class="" disabled="true">
				</div>
				<div class="mui-input-row">
					<label>预约开始时间</label>
					<button id='orderTime' data-options='{}' class="button">请选择预约开始时间</button>
				</div>
				<div class="mui-input-row">
					<label>预约截止时间</label>
					<button id='orderEndTime' data-options='{}' class="button">请选择预约结束时间</button>
				</div>
				<div class="mui-input-row">
					<label>预约场地数量</label>
					<input id='count' type="number" class="" placeholder="请输入预约场地数量">
				</div>
				<div class="mui-content-padded">
					<button id='submit' class="mui-btn mui-btn-block mui-btn-self">提交</button>
				</div>
			</form>
		</div>
		
		<script>
			var venueId = '${venueId}';
			var equipmentId = '${equipmentId}';
			var orderUuid = '${orderUuid}';
			/*区分改签和新增0新增1改签*/
			var type = '${type}';
			mui.init({
				swipeBack:true //启用右滑关闭功能
			});  
			mui.ready(function(){
			    //关闭等待框 
			  //  plus.nativeUI.closeWaiting();
			    //venueId =  plus.webview.currentWebview().venueId;
			   // equipmentId = plus.webview.currentWebview().equipmentId;
			   // orderUuid = plus.webview.currentWebview().orderUuid;
			   // type = plus.webview.currentWebview().type;
				$("#count").val(1);
			    topUtil.web_query('/mobile/venue/equipment/getName', {equipmentId:equipmentId}, function (data) {
					if (typeof data == "string") {
		                data = JSON.parse(data);
		            }
					if(data.success) {
						$("#venueName").val(data.venueName);
		        		$("#equipmentName").val(data.equipmentName);
					}else{
						mui.alert(data.msg);
					}
				});
			    if(orderUuid){
			    	topUtil.web_query('/mobile/order/getOrder', {orderUuid:orderUuid}, function (data) {
						if (typeof data == "string") {
			                data = JSON.parse(data);
			            }
						if(data.success) {
							var order = data.order;
							$("#name").val(order.name);
			        		$("#orderTime").html(order.orderTime);
			        		$("#orderEndTime").html(order.orderEndTime);
			        		$("#mobile").val(order.mobile);
			        		$("#count").val(order.count);
			        		venueId = order.venueId;
			        		equipmentId = order.equipmentId;
			        		orderUuid = order.uuid;
						}
					})
			    }
			}); 
			
			//var serverPath = window.constants.getServerPath();
			/**
			 * 选择预约时间
			 */
			var date = new Date();
			
			var optionsJson1 = document.getElementById("orderTime").getAttribute('data-options') || '{}';
			var options1 = JSON.parse(optionsJson1);
			options1.beginYear = '1900';
			options1.beginMonth = '1';
			options1.beginDay = '1';
			var optionsJson2 = document.getElementById("orderEndTime").getAttribute('data-options') || '{}';
			var options2 = JSON.parse(optionsJson2);
			options2.beginYear = '1900';
			options2.beginMonth = '1';
			options2.beginDay = '1';
			var picker1 = new mui.DtPicker(options1);
			var picker2 = new mui.DtPicker(options2);
			document.getElementById('orderTime').addEventListener('tap',function () {
				picker1.show(function(rs) {
					$('#orderTime').html(rs.text);
					//picker1.dispose();
				});
			}, false);
			document.getElementById('orderEndTime').addEventListener('tap',function () {
				picker2.show(function(rs) {
					$('#orderEndTime').html(rs.text);
					//picker2.dispose();
				});
			}, false);
			document.getElementById('submit').addEventListener('tap',function () {
				var param = {};
				var now = new Date();
				var submitFlag = true;
				var mobile = $("#mobile").val();
				var startTime = $("#orderTime").html()
				var orderEndTime = $("#orderEndTime").html();
				var name = $("#name").val();
				//验证姓名
				if(name==''||name==null||name.length>6){
					var submitFlag = false;
					mui.alert('请正确输入姓名');
					return;
				}
				//验证手机号
				if (dataUtil.isPoneAvailable(mobile)){
					mui.alert('请正确输入手机号！')
					submitFlag = false;
					return;
				}
				//验证日期
		        if( dateUtil.checkdate(orderEndTime,startTime)||!dateUtil.checkdate(now.toString(),startTime)||$("#orderTime").html() == '请选择预约开始时间' 
		        		|| $("#orderEndTime").html() == '请选择预约结束时间'){
		        	submitFlag = false;
		        	mui.alert('请正确选择预约开始、结束时间！')
		        	return;
		        }
				if(submitFlag){
					var btnArray = ['否', '是'];
		        	mui.confirm('确定提交预约？',"", btnArray, _.debounce(function(e) {
		        		if(e.index==1){
		        			$("#submit").html("正在提交..");
		        			$('#submit').attr('disabled',true);
		        			param.name = $("#name").val();
					        param.orderTime = $("#orderTime").html();
					        param.orderEndTime = $("#orderEndTime").html();
					        param.mobile = $("#mobile").val();
					        param.count = $("#count").val();
					        param.venueId = venueId;
					        param.equipmentId = equipmentId;
					        param.orderUuid = orderUuid;
					        topUtil.web_query("/mobile/order/saveOrderInfo",param,function(data){
					        	if(data.success){
					        		mui.alert('操作成功，请耐心等待商家确认！');
					        		$("#submit").html("等待商家接单..");
					        	}else{
					        		if(data.msg){
					        			mui.alert(data.msg);
					        		}else{
					        			mui.alert('预约失败，请联系客服！');
					        		}
					        		$("#submit").html("提交");
					        		$('#submit').attr('disabled',false);
					        		
					        	}
							});
		        		}
			        	
		        	},waitTime,true))
		        }
			},false);
		</script>
</body>
</html>