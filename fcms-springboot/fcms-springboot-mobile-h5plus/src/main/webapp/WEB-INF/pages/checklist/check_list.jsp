<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title></title>
<style>
	html,
	body {
		background-color: #efeff4;
	}
	.mui-bar~.mui-content .mui-fullscreen {
		top: 44px;
		height: auto;
	}
	.mui-pull-top-tips {
		position: absolute;
		top: -20px;
		left: 50%;
		margin-left: -25px;
		width: 40px;
		height: 40px;
		border-radius: 100%;
		z-index: 1;
	}
	.mui-bar~.mui-pull-top-tips {
		top: 24px;
	}
	.mui-pull-top-wrapper {
		width: 42px;
		height: 42px;
		display: block;
		text-align: center;
		background-color: #efeff4;
		border: 1px solid #ddd;
		border-radius: 25px;
		background-clip: padding-box;
		box-shadow: 0 4px 10px #bbb;
		overflow: hidden;
	}
	.mui-pull-top-tips.mui-transitioning {
		-webkit-transition-duration: 200ms;
		transition-duration: 200ms;
	}
	.mui-pull-top-tips .mui-pull-loading {
		/*-webkit-backface-visibility: hidden;
		-webkit-transition-duration: 400ms;
		transition-duration: 400ms;*/
		
		margin: 0;
	}
	.mui-pull-top-wrapper .mui-icon,
	.mui-pull-top-wrapper .mui-spinner {
		margin-top: 7px;
	}
	.mui-pull-top-wrapper .mui-icon.mui-reverse {
		/*-webkit-transform: rotate(180deg) translateZ(0);*/
	}
	.mui-pull-bottom-tips {
		text-align: center;
		background-color: #efeff4;
		font-size: 15px;
		line-height: 40px;
		color: #777;
	}
	.mui-pull-top-canvas {
		overflow: hidden;
		background-color: #fafafa;
		border-radius: 40px;
		box-shadow: 0 4px 10px #bbb;
		width: 40px;
		height: 40px;
		margin: 0 auto;
	}
	.mui-pull-top-canvas canvas {
		width: 40px;
	}
	.mui-slider-indicator.mui-segmented-control {
		background-color: #efeff4;
	}
	
	
	.mui-popover {
		height: 50px;
		width: 150px;
	}
	#topPopover {
		position: fixed;
		top: 16px;
		right: 6px;
	}
	#topPopover .mui-popover-arrow {
		left: auto;
		right: 6px;
	}
</style>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a> 
		<a id='addBtn' class="mui-icon mui-icon-plusempty mui-pull-right" href="#topPopover" style="display: none;"></a>
		<!--<button id="addBtn" class="mui-btn mui-btn-blue mui-btn-link mui-pull-right">新建</button>-->
		<!--<a id="addBtn" class="mui-icon mui-icon-compose mui-pull-right"></a>-->
		<h1 class="mui-title">检查单</h1>
	</header>
	<div class="mui-content">
		<div id="slider" class="mui-slider mui-fullscreen">
			<div id="sliderSegmentedControl" class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
				<a class="mui-control-item mui-active" href="#unfinishList">未完成</a>
				<a class="mui-control-item" href="#finishList">已完成</a>
			</div>
			<div id="sliderProgressBar" class="mui-slider-progress-bar mui-col-xs-6"></div>
			<div class="mui-slider-group">
				<!--<div id="unfinishList" class="mui-slider-item mui-control-content mui-active" >
					<div class="mui-scroll-wrapper">
						<div class="mui-scroll">
							<ul class="mui-table-view"></ul>
						</div>
					</div>
				</div>-->
				<div id="unfinishList" class="mui-slider-item mui-control-content" >
					<div class="mui-scroll-wrapper">
						<div class="mui-scroll">
							<ul id="pendingList" class="mui-table-view"></ul>
						</div>
					</div>
				</div>
				<div id="finishList" class="mui-slider-item mui-control-content">
					<div class="mui-scroll-wrapper">
						<div class="mui-scroll">
							<ul class="mui-table-view"></ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		
	<script>
	var count = 0;
	var totalCount = 0;
	var pageRows = 10;
	var pullRefreshElList = [];
	mui.init({ 
		wipeBack:true, //启用右滑关闭功能
    }); 
    
    mui('.mui-scroll-wrapper').scroll();
	mui('body').on('shown', '.mui-popover', function(e) {
		//console.log('shown', e.detail.id);//detail为当前popover元素
	});
	mui('body').on('hidden', '.mui-popover', function(e) {
		//console.log('hidden', e.detail.id);//detail为当前popover元素
	});
	
    mui.ready(function() {
    	//阻尼系数
		var deceleration = mui.os.ios?0.003:0.0009;
		mui('.mui-scroll-wrapper').scroll({
			bounce: false,
			indicators: true, //是否显示滚动条
			deceleration:deceleration
		});
		
		
		//循环初始化所有下拉刷新，上拉加载。
		mui.each(document.querySelectorAll('.mui-slider-group .mui-scroll'), function(index, pullRefreshEl) {
			pullRefreshElList[index] = mui(pullRefreshEl).pullToRefresh({
				down: {
					callback: function() {
						var status = index==0?0:1;
						var self = this;
						var table = self.element.querySelector('.mui-table-view');
						var param = {rows:pageRows,search_EQ_status:status};
						topUtil.web_query("/mobile/checklistbill/listChecklistBill",param,function(data){
							if (typeof data == "string") {
				                data = JSON.parse(data);
				            }
							table.innerHTML = "";
							mui.each(data.rows,function(number,object){
								createContent(table,object,status);
							});
							//点击表格页面跳转路径
							if(status==0){
								addTableCellTapEvent(table,dynamicURL+'mobile/checklist/toWrite','check_list_create');
							}else{
								addTableCellTapEvent(table,dynamicURL+'mobile/checklist/toRead','check_list_read');
							}
							// 加载完数据，结束下拉
							self.endPullDownToRefresh();
							// 如果下拉刷新，并且还有数据可以加载，则激活pullRefresh插件
							if(data.total > pageRows){
								self.refresh(true);
							}
						
						});
//						self.endPullDownToRefresh();
					}
				},
				up: {
					callback: function() {
						var status = index==0?0:1;
						var self = this;
						var table = self.element.querySelector('.mui-table-view');
						var cells = self.element.querySelectorAll('.mui-table-view-cell');
						var pageNum = Math.ceil(cells.length/pageRows + 1);
						var param = {page:pageNum,rows:pageRows,search_EQ_status:status};
						var totalCount = 0;
						topUtil.web_query("/mobile/checklistbill/listChecklistBill",param,function(data){
								if (typeof data == "string") {
					                data = JSON.parse(data);
					            }
								totalCount = data.total;
								mui.each(data.rows,function(number,object){
									createContent(table,object,status);
								});
								//点击表格页面跳转路径
								if(status==0){
									addTableCellTapEvent(table,dynamicURL+'mobile/checklist/toWrite','check_list_create');
								}else{
									addTableCellTapEvent(table,dynamicURL+'mobile/checklist/toRead','check_list_read');
								}
								setEndPullUpToRefresh(self,(++pageNum> Math.ceil(totalCount/pageRows)));
							}
						);
					}
				}
			});
			
		});
		//监听slide-change
		document.getElementById('slider').addEventListener('slide', function(e) {
			if (e.detail.slideNumber === 0) {
			} else if (e.detail.slideNumber === 1) {
			}
			pullRefreshElList[e.detail.slideNumber].pullUpLoading();
		});
		//刷新第一个slide
		pullRefreshElList[0].pullUpLoading();
		
		addTableCellSliderEvent();
//		pullRefreshElList[0].pullDownLoading();
	});
	
	
	function setEndPullUpToRefresh(obj,flag){
		obj.endPullUpToRefresh(flag);
	}
	
	function addTableCellTapEvent(table,urlStr,idStr){
		mui(table).on('tap','.mui-table-view-cell',function(){
		    var id = this.getAttribute('id');
		   	var uuid = this.getAttribute('uuid');
		   	var deptName = this.getAttribute('deptName');
			mui.openWindow({
			   url: urlStr + '?billUuid=' + uuid, 
			   id: idStr, 
			   show:{
			      autoShow:true,//页面loaded事件发生后自动显示，默认为true
			      aniShow:"slide-in-right"
			    },
			   waiting:{
			      autoShow:false,//自动显示等待框，默认为true
//			      title:'正在加载...'//等待对话框上显示的提示内容
		      	}
	  		});
		});
		
	}
	
	// 添加左滑删除事件 
	function addTableCellSliderEvent(){
		var table = document.getElementById("pendingList");
		var btnArray = ['确认', '取消'];
		//第二个demo，向左拖拽后显示操作图标，释放后自动触发的业务逻辑
		mui(table).on('slideright', '.mui-table-view-cell', function(event) {
			var elem = this;
			if($(elem).attr('type') == 1){
				mui.swipeoutClose(elem);
				mui.toast('指派的检查单不能删除！');
				return false;
			}
//			console.log($(elem).attr('id'));
			mui.confirm('确认删除该条记录？', '提示', btnArray, function(e) {
				if (e.index == 0) {
//					elem.parentNode.removeChild(elem);
					var param = {'uuid':$(elem).attr('uuid')};
					topUtil.web_query("/mobile/checklistbill/deleteByUuid",param,function(data){
						if (typeof data == "string") {
			                data = JSON.parse(data);
			            }
						if(data.success){
							mui.alert("删除成功！");
							mui.back();
							//plus.webview.currentWebview().reload();
						}else{
							mui.alert("删除失败！");
						}
						
					});
				} else {
					setTimeout(function() {
						mui.swipeoutClose(elem);
					}, 0);
				}
			});
		});
	}


	function createContent(table,object,status){
		var li = document.createElement('li');
		li.className = 'mui-table-view-cell mui-media';
		li.setAttribute('id',object.id);
		li.setAttribute('uuid',object.uuid);
		li.setAttribute('type',object.type);
		
		// 操作内容div
		var optDiv = document.createElement('div');
		optDiv.className = 'mui-slider-left mui-disabled';
		
		// 操作内容div a标签 
		var optATag = document.createElement('a');
		optATag.className='mui-btn mui-btn-red';
		optATag.innerHTML = '删除';
		
		
		//a标签
		//<a class="mui-navigate-right">
		var aTag = document.createElement('a');
		aTag.className='mui-navigate-right mui-slider-handle';
		//最外层div
		/* var imageTag = document.createElement('img');
		imageTag.className = 'mui-media-object mui-pull-left';
		if(object.type==1){
			imageTag.src="../../images/pages/paifa.png";
		}else{
			imageTag.src="../../images/pages/jiancha.png";
		} */
		
		//内容idv
		var infoDiv = document.createElement('div');
		infoDiv.className = 'mui-media-body';
		//内容
		var content = "";
		
		content+="<div style='white-space:normal;'>【"+object.billNo+"】";
		content+="</div>";
		if(object.finishDate){
			content += "<p class='mui-ellipsis'>截止时间："+object.finishDate+"</p>";
		}
		content += "<p class='mui-ellipsis'>创建时间："+object.gmtCreate+"</p>";
		infoDiv.innerHTML = content;
		
		// 待办并且是自己创建的检查单才可以删除，指派的不允许 任务类型:0自己创建,1指派任务
		if(status == 0 ){// &&type==0
			optDiv.appendChild(optATag);
			li.appendChild(optDiv);
		}
		
		//拼装paneldiv信息
		//aTag.appendChild(imageTag);
		aTag.appendChild(infoDiv);
		li.appendChild(aTag);
		table.appendChild(li);
	}
	
	/*
	 * 添加自定义事件，用户从填写页面返回刷新列表
	 */
	window.addEventListener("reload",function(e){
		alert("reload");
		//plus.webview.currentWebview().reload();
	});

	//退回
	/* mui.back = function(event) {
		closeme();
	}; */

	function closeme(){
		var previousPage = plus.webview.getWebviewById("main.html");
		mui.fire(previousPage, "reloadTaskCount", {});
		var ws=plus.webview.currentWebview();
		plus.webview.close(ws);
	}
	</script>
</body>
</html>