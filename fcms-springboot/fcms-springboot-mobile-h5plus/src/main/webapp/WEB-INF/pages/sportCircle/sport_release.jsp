<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>Insert title here</title>
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
			
			.mui-btn {
				padding: 10px;
			}
			p{
				margin-bottom:0;
			}
			.mui-input-row .mui-input-clear~.mui-icon-clear{
				top:20px;
			}
			textarea{
				min-height:80px;
				text-align:left;
			}
			
		</style>
</head>
<body>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title"></h1>
		</header>
		<div class="mui-content">
			<form action="javascript:void(0)">
				<div class="mui-input-row">
					<label>所属圈子</label>
					<input id='item' type="text" class="" placeholder="" maxlength="18" readonly="readonly">
				</div>
				<div class="mui-input-row">
					<label id="activityTitle">活动标题</label>
					<input id='title' type="text" class="" placeholder="请输入标题" maxlength="18">
				</div>
				<div class="mui-input-row">
					<label id="time">活动时间</label>
					<button id='acvitityTime' data-options='{"type":"datetime"}' class="button">请选择时间</button>
				</div>
				<div class="mui-input-row">
					<label>集合地点</label>
					<input id='location' type="text" class="" placeholder="请输入地点" maxlength="18">
				</div>
				
				<div class="mui-input-row">
					<label>报名截止时间</label>
					<button id='stopTime' data-options='{"type":"datetime"}' class="button">请选择时间</button>
				</div>
				<div class="mui-input-row">
					<label>要求人员</label>
					<select id='member'>
						<option value="0" id="man">男女不限</option>
						<option value="1" id="manen">限帅哥</option>
						<option value="2" id="manen">限美女</option>
					</select>
				</div>
				<div class="mui-input-row">
					<label>要求人数</label>
					<input id='peopleNum' type="number" class="" placeholder="请输入人数" maxlength="18">
				</div>
				<div class="mui-input-row">
					<label>费用类型</label>
					<select id='costType'>
						<option value="0" id="man">AA</option>
						<option value="1" id="manen">我请客</option>
						<option value="2" id="manen">求请客</option>
					</select>
				</div>
				<div class="mui-input-row" >
					<label>联系方式</label>
					<input id='tel' type="number" class="" placeholder="请输入联系方式">
				</div>
				<div class="mui-input-row" style="height: auto;">
					<label>邀请说明</label><br />
					<textarea id="instructions" rows="3" style="width:100%;padding: 15px;" placeholder="请输入说明"></textarea>
				</div>
				
				<div class="mui-content-padded">
					<button id='submit' class="mui-btn mui-btn-block mui-btn-self">发布</button>
				</div>
			</form>
		</div>
		
		<script>
			var itemId;
			var itemName;
			var type;
			
			mui.ready(function () {
				itemId = '${itemId}';
				itemName = '${itemName}';
				type = '${type}';
				$('#item').val(itemName);
				if (type == 1) {
					$(".mui-title").html("赛事发布");
					$("#activityTitle").html("赛事标题");
					$("#time").html("比赛时间");
				}else{
					$(".mui-title").html("运动邀请");
				}
			});
			//活动时间
			var optionsJson1 = document.getElementById("acvitityTime").getAttribute('data-options') || '{}';
			var options1 = JSON.parse(optionsJson1);
			options1.beginYear='1900';
			options1.beginMonth='01';
			options1.beginDay='01';
			options1.beginHours='00';
			options1.beginMonth='00';
		
			var picker1 = new mui.DtPicker(options1);
			document.getElementById('acvitityTime').addEventListener('tap',function () {
				picker1.show(function(rs) {
					$('#acvitityTime').html(rs.text);
					//picker1.dispose();
				});
			}, false);
			//截止时间
			var optionsJson1 = document.getElementById("stopTime").getAttribute('data-options') || '{}';
			var options1 = JSON.parse(optionsJson1);
			options1.beginYear='1900';
			options1.beginMonth='01';
			options1.beginDay='01';
			options1.beginHours='00';
			options1.beginMonth='00';
		
			var picker1 = new mui.DtPicker(options1);
			document.getElementById('stopTime').addEventListener('tap',function () {
				picker1.show(function(rs) {
					$('#stopTime').html(rs.text);
					//picker1.dispose();
				});
			}, false);
			
			document.getElementById('submit').addEventListener('tap', _.debounce(function () {
				$("#submit").attr('disabled',true);
				$("#submit").html("发布中...");
				var params = {
					itemId:itemId
				}
				params.title=$('#title').val();
				params.acvitityTime=$('#acvitityTime').html();
				params.stopTime=$('#stopTime').html();
				params.location=$('#location').val();
				params.member=$('#member').val();
				params.peopleNum=$('#peopleNum').val();
				params.costType=$('#costType').val();
				params.instructions=$('#instructions').val();
				params.tel=$('#tel').val();
				if (!params.title) {
					mui.toast("请输入标题");
					$(this).attr('disabled',false);
	        		$(this).html("发布");
				} else if (params.acvitityTime == '请选择时间') {
					mui.toast("请输入活动时间");
					$(this).attr('disabled',false);
	        		$(this).html("发布");
				}else if (params.stopTime == '请选择时间') {
					mui.toast("请输入报名截止时间");
					$(this).attr('disabled',false);
	        		$(this).html("发布");
				} else if (!params.tel) {
					mui.toast("请输入联系方式");
					$(this).attr('disabled',false);
	        		$(this).html("发布");
				}else if (!params.peopleNum) {
					mui.toast("请输入人数");
					$(this).attr('disabled',false);
	        		$(this).html("发布");
				} else if (!params.instructions) {
					mui.toast("请输入邀请说明");
					$(this).attr('disabled',false);
	        		$(this).html("发布");
				} else  if (dataUtil.isPoneAvailable(params.tel)) {
					mui.toast("请输入正确联系方式");
					$(this).attr('disabled',false);
	        		$(this).html("发布");
				}else if (dateUtil.checkdate(params.acvitityTime,params.stopTime)) {
					mui.toast("截止时间要早于活动时间");
					$(this).attr('disabled',false);
	        		$(this).html("发布");
				} else {
					topUtil.web_query('/mobile/activity/main/saveActivityMain',params,function(data) {
						if (typeof data == "string") {
		               		data = JSON.parse(data);
		            	}
						if (data.success) {
							mui.toast("发布成功");
							mui.back();
						} else {
							mui.toast(data.msg);
							$(this).attr('disabled',false);
			        		$(this).html("发布");
						}
					});
				}
				
			},waitTime,true));
		</script>
</body>
</html>