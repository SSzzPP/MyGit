<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--常用联系人  -->
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
				/* height:60px;
				padding:10px 0; */
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
				width: 100%;
				font-size:16px;
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
			.divnone{
				display:none;
			}
		</style>
</head>
<body>
<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">添加人员</h1>
			
			<a id="addUser"class="mui-pull-right mui-icon mui-icon-plusempty"></a>
</header>
		<div class="mui-content">
			
				 <div class="mui-input-group">
					 <!-- <div class="mui-input-row mui-checkbox">
						<label>checked：false</label>
						<input name="checkbox1" value="Item 3" type="checkbox" >
					</div>
					<div class="mui-input-row mui-checkbox">
						<label>checked：true</label>
						<input name="checkbox1" value="Item 4" type="checkbox" checked>
					</div>  -->
				</div>
				<div id="submitDiv" class="mui-content-padded divnone">
					<button id='submit' class="mui-btn mui-btn-block mui-btn-self">提交</button>
				</div>
				
		</div>
<script type="text/javascript">
var teamId = '${teamId}';
var projectId = '${projectId}';
var matchId = '${matchId}';
mui.init({
	swipeBack:true //启用右滑关闭功能
});
mui.ready(function() {
	loadContacts();
	
});
$(document.body).on('tap', '#submit', function(e) {
	var existTeamUsers=$("#submit").attr("data-value-1");
	var peopleNum =$("#submit").attr("data-value-2");
	var addUserNum=peopleNum -existTeamUsers;
	//选中的联系人Id集合
	var array = getCheckBoxRes("checkbox1");
	if(array.length>addUserNum){
		mui.toast("最多能选"+addUserNum+"个人");
		return false;
	}
	var ids=array.join(",");
	var param={};
	param.teamId=teamId;
	param.matchUserIds=ids;
	topUtil.web_query("/match/team/user/saveMatchTeamUsers",param,function(data){
		if(typeof data == "string") {
			data = JSON.parse(data);
		}
		if(data.success){
			mui.openWindow({
			    url: dynamicURL+'match/main/project/toProjectDetail?projectId='+projectId+'&matchId='+matchId+'&teamId='+teamId, 
			    id : 'match/main/toMatchDetail',
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
});
$(document.body).on('tap', '#addUser', function(e) {
	 mui.openWindow({
		    url: dynamicURL+'/match/sign/toOneSign?matchId='+matchId+'&projectId='+projectId+'&teamId='+teamId+'&type=1', 
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
});

function loadContacts(){
	topUtil.web_query("/match/team/user/getMatchContactsList",{teamId:teamId,projectId:projectId},function(data){
		if(typeof data == "string") {
			data = JSON.parse(data);
		}
		if(data.success){
			var str = '';
			if(data.idNames.length>0){
				$("#submitDiv").show();
			}
			mui.each(data.idNames,function(index,item){
				var idAndName = item.split("-");
				str += '<div class="mui-input-row mui-checkbox">';
				str += '<label>'+idAndName[1]+'</label>';
				str += '<input name="checkbox1" value="'+idAndName[0]+'" type="checkbox" >';
				str += '</div>';
			});
			$(".mui-input-group").append(str);
			$("#submit").attr("data-value-1",data.existTeamUsers);
			$("#submit").attr("data-value-2",data.peopleNum);
		}
	});
}
//获取复选框的值
function getCheckBoxRes(name){
    var rdsObj   = document.getElementsByName(name); 
    var checkVal = new Array();
    var k        = 0;
    for(i = 0; i < rdsObj.length; i++){
        if(rdsObj[i].checked){
            checkVal[k] = rdsObj[i].value;
            k++;
        }
    }
    return checkVal;
}

</script>
</body>
</html>