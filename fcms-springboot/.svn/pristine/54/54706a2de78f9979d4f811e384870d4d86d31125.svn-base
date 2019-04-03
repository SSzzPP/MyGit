<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<!--消息订阅-->
	<head>
		<meta charset="UTF-8">
		<title></title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<style>
			.mbt{
				margin-bottom:10px;
			}
			.mui-table-view-cell:after {
			    height: 1;
			}
		</style>
	</head>
	<body>
		<header class="mui-bar mui-bar-nav">
			<div class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left " onclick="back(),plus.nativeUI.closeWaiting();"></div>
			<h1 id="title" class="mui-title">消息订阅</h1>
		</header>
		<div class="mui-content">
			<ul class="mui-table-view">
				<li class="mui-table-view-cell">
					<span>体育赛事</span>
					<div class="mui-switch mui-switch-blue" id="SportMatchSwitch">
						<div class="mui-switch-handle"></div>
					</div>
				</li>
				<li class="mui-table-view-cell">
					<span>法律法规</span>
					<div class="mui-switch mui-switch-blue" id="lawSwitch"> 
						<div class="mui-switch-handle"></div>
					</div>
				</li>
			</ul>
			<div id="dynamicLoad"></div>
			<p class="padding">开启免打扰后，23:00 - 6:00时间段不会接受任何订阅消息</p>
			<ul class="mui-table-view mbt">
				<li class="mui-table-view-cell">
					<span>免打扰</span>
					<div class="mui-switch mui-switch-blue" id="undisturbStwitc">
						<div class="mui-switch-handle"></div>
					</div>
				</li>
			</ul>
		</div>
		<script>
			mui.init({
				swipeBack:true //启用右滑关闭功能
			});
			mui.ready(function(){
				loadNewsSubscribe();
				loadUndisturb();
			});
			mui('.mui-content').on('toggle','.mui-switch',function(event) { 
					if($(this).attr("id")=="undisturbStwitc"){
						var userId = $(this).attr("data-userId");
						var undisturb = null;
						if(event.detail.isActive)
							undisturb = 1;
						else
							undisturb = 0;
						topUtil.web_query("/mobile/venue/user/updateUndisturb",
							{
								undisturb : undisturb,
								userId : userId
							},function(data){
							if (typeof data == "string") {
				               data = JSON.parse(data);
				            }
							if(data.success){
								if(undisturb == 0)
									mui.toast('关闭夜间消息免打扰模式',{duration:'short'});
								else
									mui.toast('开启夜间消息免打扰模式',{duration:'short'});
							}
						});
					}else{
						var id = $(this).attr("data-id");
						var enabled = null;
						if(event.detail.isActive)
							enabled=0;
						else
							enabled=1;
						topUtil.web_query("/mobile/news/subscribe/updateEnabled",
							{
								enabled:enabled,
								id :id
							},function(data){
							if (typeof data == "string") {
				               data = JSON.parse(data);
				            }
						});
					}
				});
			//加载消息推送
			function loadNewsSubscribe(){
				topUtil.web_query("/mobile/news/subscribe/newsSubscribeList",{},function(data){
						if (typeof data == "string") {
			               data = JSON.parse(data);
			            }
						var circleFlag = false;
						var matchFlag = false;
						var circleStr = '<p class="padding">健身圈消息</p><ul class="mui-table-view">';
						var matchStr  = '<p class="padding">赛事消息</p><ul class="mui-table-view">';
						mui.each(data.rows,function(index,item){
							//赛事信息
							if(item.type == 0){
								$("#SportMatchSwitch").attr("data-id",item.id);
								if(item.enabled == 0){
									var SportMatchSwitch = document.getElementById("SportMatchSwitch");
									SportMatchSwitch.classList.add('mui-active');
								} 
							}
							//法律法规
							if(item.type == 1){
								$("#lawSwitch").attr("data-id",item.id);
								if(item.enabled == 0){
									var lawSwitch = document.getElementById("lawSwitch");
									lawSwitch.classList.add('mui-active');
								} 
							}
							if(item.type ==2 ){
								circleFlag=true;
								circleStr += '<li class="mui-table-view-cell">';
								circleStr += '<span>'+item.itemName+'</span>';
								if(item.enabled==0)
									circleStr += '<div class="mui-switch mui-switch-blue mui-active" data-id="'+item.id+'">';
								else
									circleStr += '<div class="mui-switch mui-switch-blue" data-id="'+item.id+'">';
								circleStr += '<div class="mui-switch-handle"></div>';
								circleStr += '</div></li>';
							}
							if(item.type ==3 ){
								matchFlag=true;
								matchStr += '<li class="mui-table-view-cell">';
								matchStr += '<span>'+item.itemName+'</span>';
								if(item.enabled==0)
									matchStr += '<div class="mui-switch mui-switch-blue mui-active" data-id="'+item.id+'">';
								else
									matchStr += '<div class="mui-switch mui-switch-blue" data-id="'+item.id+'">';
								matchStr += '<div class="mui-switch-handle"></div>';
								matchStr += '</div></li>';
							}
						});
						if(circleFlag){
							circleStr += '</ul>';
							$("#dynamicLoad").append(circleStr);
							mui('.mui-switch')['switch']();//动态加载的switch初始化
						}
						if(matchFlag){
							matchStr += '</ul>';
							$("#dynamicLoad").append(matchStr);
							mui('.mui-switch')['switch']();
						}
				});
				
			}
			//加载免打扰
			function loadUndisturb(){
				topUtil.web_query("/mobile/venue/user/loginUserDetail",{},function(data){
					if (typeof data == "string") {
			               data = JSON.parse(data);
			            }
					if(data.success){
						$("#undisturbStwitc").attr("data-userId",data.obj.id);
						if(data.obj.undisturb==1){
							var undisturbStwitc = document.getElementById("undisturbStwitc");
							undisturbStwitc.classList.add('mui-active');
						}
					}
				});
			}
		</script>
	</body>
</html>
