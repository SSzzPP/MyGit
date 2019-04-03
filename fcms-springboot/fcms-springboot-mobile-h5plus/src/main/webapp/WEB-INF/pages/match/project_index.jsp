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
		padding-bottom:44px;
		min-height: 100vh;
	}
	.pobom{
		position:fixed;
		bottom:0;
		left:0;
		height:44px;
		width:100vw;
		z-index: 66;
		display:flex;
	}
	.btnRow{
		flex:1;
	}
	.btnRow .btnm{
		flex:1;
		height:44px;
		line-height: 44px;
		color:#fff;
		text-align: center;
	}
	.btnRow .btnm.bg3{
		background-color: #e9b901;
	}
	.btnRow .btnm.bg2{
		background-color: #00abaf;
	}
	.btnRow .btnm.bg1{
		background-color: #f28300;
	}
	.headline{
		padding:10px 15px;
		background-color:#fff;
	}
	.headline span{
		color: #43474d;
	    font-size: 15px;
	    font-weight: 600;
	}
	.disf{
		display:flex;
		padding:8px 0;
		justify-content: space-between;
		align-items:center;
	}
	.setPrice{
		text-align:right;
		color:#ff6632;
	}
	.news-body{
		padding:10px 15px;
	}
	.newsText{
		background-color: #f5f5f5;
	}
	.mt10{
		margin-top:10px;
	}
	.mt5{
		margin-top:5px;
	}
	.rowText {
		line-height: 30px;
		position:relative;
	}
	
	.rowText span:last-child {
		color: #a2a2a2;
	}
	.delete{
		position:absolute;
		right:20px;
		top:10px;
		font-size:20px;
	}
	.mui-checkbox{
		background-color:#fff!important;
	}
	.mui-checkbox label{
		padding-left:58px;
		padding-right:0;
	}
	.mui-checkbox input[type=checkbox], .mui-radio input[type=radio]{
		left:20px;
		right:auto;
	}
</style>
</head>
<body>
<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title"></h1>
		</header>
	<div class="mui-content">
		<div class="headline">
			<span id='title'></span>
		</div>
		
		<div class="infoData">
			<div class="news">
				<div class="news-header">
					<div>项目事宜</div>
				</div>
				<div class="news-body">
					<div class="newsText rowText">
						<p id="remark" ></p>
					</div>
				</div>
			</div>
		</div>
		<div class="infoData">
			<div class="news">
				<div class="news-header">
					<div>项目规则</div>
				</div>
				<div class="news-body">
					<div class="newsText rowText">
						<p id="rule"></p>
					</div>
				</div>
			</div>
		</div>
		<div class="infoData">
			<div class="news">
			
				 <div class="news-header" id = "matchUserList">
					<div>参赛人员（<span id="userNum">0</span>/<span id="peopleNum"></span>）</div>
					
				</div>
				<div class="news-body" id="sign-list">
					<!-- <div class="newsText rowText">
						<div class="con">联系人姓名：<span>成强</span></div>
						<div class="con">联系电话：<span>18353626973</span></div>
					</div>
					<div class="newsText rowText mt5">
						<span class='delete mui-icon mui-icon-trash'></span>
						<div class="con">联系人姓名：<span>成强</span></div>
						<div class="con">联系电话：<span>18353626973</span></div>
					</div> -->
				</div>
			</div>
		</div>
		<div id='tips' class="mui-input-row mui-checkbox">
		  <label>我已阅读并同意<a data-click='true'>《赛事报名须知》</a></label>
		  <input name="checkbox1" value="Item 1" type="checkbox" checked="checked">
		</div>
	</div>
	<div class="pobom">
			<div id="item1mobileBtn1" class="btnRow">
				<div class="btnm bg1">创建团队</div>
			</div>
			<div id="item1mobileBtn2" class="btnRow">
				<div class="btnm bg2">添加人员</div>
			</div>
			<div id="item1mobileBtn3" class="btnRow">
				<div class="btnm bg3">报名</div>
			</div>
		</div>
<script>
var projectId = '${projectId}';
var matchId = '${matchId}';
var teamId = '${teamId}';
var matchUserId = '${matchUserId}';
var type;
var statusStr;
mui.ready(function() {
	projectShow (projectId);
	signUser (projectId,matchId);
});

function signUser (projectId,matchId) {
	topUtil.web_query('/match/main/team/findMatchUser',{projectId:projectId,matchId:matchId},function (data) {
		if(typeof data == "string") {
			data = JSON.parse(data);
		}
		if (data.success) {
			var str = '';
			var teamStr = '';
			if (data.obj) {
				str += '<div class="newsText rowText">';
				str += '<div class="con">姓名：<span>'+data.obj.name+'</span></div>';	
				str += '<div class="con">联系电话：<span>'+data.obj.mobile+'</span></div></div>';
				$('#userNum').html(1);
				matchUserId = data.obj.id;
			} else if (data.rows){
				teamStr += '<div class="news-header"><div>队伍信息</div></div><div class="news-body" ><div class="newsText rowText">';
				teamStr += '<div class="con">队伍名称：<span>'+data.team.teamName+'</span></div>';
				teamStr += '<div class="con">领队姓名：<span>'+data.team.leaderName+'</span></div>';
				teamStr += '<div class="con">领队电话：<span>'+data.team.mobile+'</span></div></div></div>';
				$('#matchUserList').before(teamStr)
				mui.each(data.rows,function(index,item){
					str += '<div class="newsText rowText">';
					str += '<div class="con">人员姓名：<span>'+item.name+'</span></div>';	
					str += '<div class="con">联系电话：<span>'+item.mobile+'</span></div></div>';
				});
				$('#userNum').html(data.total);
				
				
				teamId = data.teamId;
			}
			$('#sign-list').html(str);
		}
	});
	
}

function projectShow (projectId) {
	topUtil.web_query('match/main/findProjectDetaile',{projectId:projectId,matchId:matchId},function(data) {
		if(typeof data == "string") {
			data = JSON.parse(data);
		}
		if (data.success) {
			$("#title").html(data.obj.name);
			$(".mui-title").html(data.obj.name);
			$("#rule").html(data.obj.rule);
			$("#remark").html(data.obj.remark);
			$("#peopleNum").html(data.obj.peopleNum);
			type = data.obj.type;
			statusStr = data.status;
		}
	})
}
//报名
$(document).on('tap','#item1mobileBtn3',function() {
	if (statusStr != '报名中') {
		mui.toast(statusStr+',不可报名');
		return;
	}
	if (type == 0) {
		if (matchUserId) {
			teamId = matchUserId;
		}
	}
	if (type != 1 && teamId == null) {
		mui.toast('请先创建一个团队');
		return;
	}
	var param = {
			matchId:matchId,
			projectId:projectId,
			type:type,
			teamId:teamId
	};
	var btnArray = ['否', '是'];
	mui.confirm('确定报名？',"", btnArray, _.debounce(function(e) {
		if(e.index==1){
			$('#item1mobileBtn3').attr('disabled',true);
			topUtil.web_query('/match/sign/saveSign',param,function (data) {
				if (typeof data == "string") {
		            data = JSON.parse(data);
		       }
				if (data.success) {
					mui.alert('报名成功！','提示',function(){
						mui.openWindow({
						    url: dynamicURL+'/match/main/toMatchMain', 
						    id : '/match/main/toMatchMain',
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
					
				}else {
					mui.toast(data.msg);
				}
			})
		}
    	
	},waitTime,true))
});
//添加人员
$(document).on('tap','#item1mobileBtn2',function() {
	if (statusStr != '报名中') {
		mui.toast(statusStr+',不可添加人员');
		return;
	}
	if (type == 0) {
		mui.openWindow({
		    url: dynamicURL+'/match/sign/toOneSign?matchId='+matchId+'&projectId='+projectId, 
		    id : '/match/sign/toOneSign',
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
	if (type == 1) {
		var userNum = $('#userNum').html();
		var peopleNum = $("#peopleNum").html();
		if(userNum>=peopleNum){
			mui.toast("参赛人数不能再多了！");
			return false;
		}
		mui.openWindow({
		    url: dynamicURL+'/match/sign/toMatchContacts?projectId='+projectId+'&matchId='+matchId+'&teamId='+teamId, 
		    id : '/match/sign/toOneSign',
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
});
//创建团队
$(document).on('tap','#item1mobileBtn1',function() {
	
	if (type == 0) {
		mui.toast('个人赛无需创建团队');
		return;
	}
	if (type == 1) {
		if (statusStr != '报名中') {
			mui.toast(statusStr+',不可创建团队');
			return;
		}
		mui.openWindow({
		    url: dynamicURL+'/match/main/team/toAddMatchTeam?matchId='+matchId+'&projectId='+projectId, 
		    id : 'match/main/team/toAddMatchTeam',
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
});
$("#tips").on('tap',function(e){
	if(e.target.dataset.click){
		mui.openWindow({
		    url: dynamicURL+'/match/main/toTips?matchId='+matchId, 
		    id : 'match/match_tips',
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
});
</script>
</body>
</html>