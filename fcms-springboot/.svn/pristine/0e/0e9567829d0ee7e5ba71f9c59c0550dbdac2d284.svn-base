<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title></title>
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
			
		</style>
</head>
<body>
<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">报名信息</h1>
		</header>
		<div class="mui-content">
			<form action="javascript:void(0)">
				<div class="mui-input-row">
					<label>姓名</label>
					<input id='name' type="text" class="" placeholder="请输入姓名" maxlength="18">
				</div>
				<div class="mui-input-row">
					<label>性别</label>
					<select id='sex'>
						<option value="0" id="man">男</option>
						<option value="1" id="manen">女</option>
					</select>
				</div>
				
				<div class="mui-input-row">
					<label>联系方式</label>
					<input id='mobile' type="number" class="" placeholder="请输入手机号" maxlength="18">
				</div>
				<div class="mui-content-padded">
					<button id='submit' class="mui-btn mui-btn-block mui-btn-self">提交</button>
				</div>
			</form>
		</div>
<script type="text/javascript">
var teamId = '${teamId}';
var matchId = '${matchId}';
var projectId = '${projectId}';
var type='${type}';
document.getElementById('submit').addEventListener('tap',function () {
	var name = $('#name').val();
	var mobile = $('#mobile').val();
	var sex = $('#sex').val();

    if(name==null||name==""||name.length>15){
    	mui.toast('请输入正确的姓名');
    } else if(sex==null||sex==""){
    	mui.toast('请选择性别');
    } else  if (dataUtil.isPoneAvailable(mobile)) {
    	mui.toast('请输入正确手机号');
    } else {
    	var param = {
    			type:type,
    			teamId:teamId,
    			name:name,
    			sex:sex,
    			mobile:mobile,
    			matchId:matchId,
    			projectId:projectId
    	}
    	if (teamId) {
    		param.teamId=teamId;
    	}
    	var btnArray = ['否', '是'];
    	mui.confirm('确定提交？',"", btnArray, _.debounce(function(e) {
    		if(e.index==1){
    			$('#submit').html("正在提交...");
				$('#submit').attr('disabled',true);
				topUtil.web_query('/match/sign/saveMatchUser',param,function (data) {
					if (typeof data == "string") {
			            data = JSON.parse(data);
			       }
					if (data.success) {
						mui.toast('添加成功！');
						if(type=='1'){
							mui.openWindow({
								url: dynamicURL+'/match/sign/toMatchContacts?projectId='+projectId+'&matchId='+matchId+'&teamId='+teamId, 
							    id : '${dynamicURL}/match/sign/toMatchContacts',
							    show:{
							      autoShow:true,//页面loaded事件发生后自动显示，默认为true
							      aniShow:"slide-in-right",
							      duration:'250'
							    },
							     waiting:{
							      autoShow:false,//自动显示等待框，默认为true
						      	}
							});	
						}else{
							var url = '${dynamicURL}/match/main/project/toProjectDetail?matchId='+matchId+'&projectId='+projectId+'&matchUserId='+data.obj.id;
							mui.openWindow({
							    url: url, 
							    id : '${dynamicURL}/match/sign/toProjectDetail',
							    show:{
							      autoShow:true,//页面loaded事件发生后自动显示，默认为true
							      aniShow:"slide-in-right",
							      duration:'250'
							    },
							     waiting:{
							      autoShow:false,//自动显示等待框，默认为true
						      	}
							});	
						}
						
					}
				})
    		}
        	
    	},waitTime,true))
    }
},false);
</script>
</body>
</html>