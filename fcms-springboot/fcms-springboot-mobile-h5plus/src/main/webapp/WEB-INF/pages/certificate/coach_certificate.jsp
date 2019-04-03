<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>我的信息</title>
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
			#liker{
				width: 69%;
				height:40px;
			    font-size: 16px;
			    text-align: right;
			    float: right;
			    overflow:auto;
			    white-space:nowrap;
			}
			.topBtn{
				color: #0099CC;
				display: inline-block;
				height:30px;
				line-height: 30px;
				width:100px;
				margin:5px 4px;
				border:1px solid #0099CC;
				border-radius:5px;
				text-align: center;
			}
			.layui-upload-file {
			    display: none!important;
			    opacity: .01;
			    filter: Alpha(opacity=1);
			}
		</style>
</head>
<body>
<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">用户认证</h1>
		</header>
		<div class="mui-content">
			<form action="javascript:void(0)">
				<div class="mui-input-row">
					<label>认证类型</label>
					<select id='certificateType'>
						 <option value="1" id="coachCertificate">教练认证</option> 
						 <option value="0" id="venueCertificate">场馆管理认证</option>
					</select>
				</div>
				<div class="mui-input-row">
					<label>真实姓名</label>
					<input id='realName' type="text" class="" placeholder="请输入真实姓名" maxlength="18">
				</div>
				<div class="mui-input-row">
					<label>工作场馆</label>
					<select id='venue'>
						 <option value="0" id="sel">请选择</option>
						 <option value="1" id="noVenue">无工作场馆</option> 
					</select>
				</div>
				<div class="mui-input-row">
					<label>手机号码</label>
					<input id='mobile' type="number" class="" placeholder="请输入手机号" maxlength="18">
				</div>
				<div class="mui-input-row" id="coachTeachStart">
					<label>从教时间</label>
					<button id='teachStart' data-options='{"type":"date"}' class="button"><span style="color:#999">请选择执教日期</span></button>
				</div>
				<div class="mui-input-row" id="coachAchievement">
					<label>成就与荣誉</label>
					<input id='achievement' type="text" class="" placeholder="请输入成就与荣誉">
				</div>
				<div class="mui-content-padded">
					<button id='submit' class="mui-btn mui-btn-block mui-btn-self">提交</button>
				</div>
			</form>
		</div>
		
		<script>
			mui.init({
				swipeBack:true //启用右滑关闭功能
			});  
			mui.ready(function(){
				loadVenue();
				
			}); 
			var uuid = constants.getSettings().uuid;
			var optionsJson1 = document.getElementById("teachStart").getAttribute('data-options') || '{}';
			var options1 = JSON.parse(optionsJson1);
			options1.beginYear='1900';
			options1.beginMonth='01';
			options1.beginDay='01';	
			var picker1 = new mui.DtPicker(options1);
			document.getElementById('teachStart').addEventListener('tap',function () {
				picker1.show(function(rs) {
					$('#teachStart').html(rs.text);
				});
			}, false);
			document.getElementById('certificateType').addEventListener('change',function (e) {
				/* console.log(e.target.value); */
				var certificateType = e.target.value;
				if(certificateType == 0){
					document.getElementById('coachTeachStart').style.display='none';
					document.getElementById('coachAchievement').style.display='none';
				}else{
					document.getElementById('coachTeachStart').style.display='block';
					document.getElementById('coachAchievement').style.display='block';
				}
				/* alert($("#certificateType").val()); */
			}, false);
			document.getElementById('submit').addEventListener('tap',function () {
		        var param = {};
		        var now = new Date();
		        var certificateType = $("#certificateType").val();
		        param.venueId = $("#venue").val();
		        param.realName = $("#realName").val();
		        param.teachStart = $("#teachStart").html();
		        param.mobile = $("#mobile").val();
		        param.achievement = $("#achievement").val();
		        param.certificateType = certificateType;
		        if(param.realName==null||param.realName==""||param.realName.length>5){
		        	mui.toast('请输入正确的姓名');
		        } else  if (dataUtil.isPoneAvailable(param.mobile)) {
		        	mui.toast('请输入正确手机号');
		        } else  if (param.achievement.length > 100) {
		        	mui.toast('个性签名最多可输入100个字符');
		        }else if(certificateType == 1 && dateUtil.checkdate(now.toString(),param.teachStart)){
		        	mui.toast('请正确选择从教时间！');
		        } else {
		        	var btnArray = ['否', '是'];
		        	mui.confirm('确定提交认证？',"", btnArray, _.debounce(function(e) {
		        		if(e.index==1){
		        			$('#submit').html("正在提交...");
							$('#submit').attr('disabled',true);
							topUtil.web_query("/mobile/coach/certificate/saveCoachCertificate",param,function(data){
					        	if (typeof data == "string") {
					                data = JSON.parse(data);
					            }
					        	if(data.success){
									mui.alert(data.msg,'提示',function(){
										$('#submit').html("等待审核中");	
									});
					        	}else{
					        		mui.toast(data.msg);
					        		$('#submit').html("提交");
					        		$('#submit').attr('disabled',false);
					        	}
							});
		        		}
			        	
		        	},waitTime,true))
		        }
			},false);
			
			function loadVenue(){
				var params = {};
				params.search_EQ_typeId=1;
				topUtil.web_query('/mobile/venue/view/search',params, function (data) {
					if (typeof data == "string") {
		                data = JSON.parse(data);
		            }
					if(data.length>0){
						var str = "";
						mui.each(data,function (index,item){
							str+='<option id="'+item.id+'" value="'+item.id+'" >'+item.name+'</option>';
						});
						$("#venue").append(str);
						userInfo();
					}
				});
				
			}
			function userInfo() {
				topUtil.web_query('/mobile/coach/certificate/certificateDetail', {}, function (data) {
					if (typeof data == "string") {
		                data = JSON.parse(data);
		            }
					//显示认证信息（等待审核，审核成功）  审核失败则重新填写 
					if(data.success&&data.obj.status!=2) {
						$('#certificateType').val(data.obj.certificateType);
						if(data.obj.certificateType == 0){
							document.getElementById('coachTeachStart').style.display='none';
							document.getElementById('coachAchievement').style.display='none';
						}else{
							document.getElementById('coachTeachStart').style.display='block';
							document.getElementById('coachAchievement').style.display='block';
						}
						if (data.obj.realName)
							$('#realName').attr('value',data.obj.realName);
						if (data.obj.mobile)
							$('#mobile').attr('value',data.obj.mobile);
						if (data.obj.teachStart)
							$("#teachStart").html(data.obj.teachStart);
						if (data.obj.venueId) {
							var options = $("#venue").children();
							$.each(options,function(){
								id=$(this).attr('id');
								if(id==data.obj.venueId){
									$(this).attr('selected',true);
									return false;
								};
							});
						}else{
							document.getElementById("noVenue").setAttribute("selected", "selected");
						}
						if (data.obj.achievement) 
							$('#achievement').attr('value',data.obj.achievement);
						if(data.obj.status==0){
							$('#submit').html("等待审核中");
							$('#submit').attr('disabled',true);
						}
						if(data.obj.status==1){
							$('#submit').html("认证成功");
							$('#submit').attr('disabled',true);
						}
					}else{
						return false;
					}
				})
			}
			
			
		</script>
</body>
</html>