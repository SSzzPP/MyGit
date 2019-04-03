<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>调查问卷</title>
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
		
		.span-title{
			word-break:normal;display:block;white-space:pre-wrap;
		}
	</style>
</head>
<body>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">调查问卷</h1>
		</header>
		<div class="mui-content">
			<div id="slider" class="mui-slider mui-fullscreen">
				<div id="sliderSegmentedControl" class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
					<a class="mui-control-item mui-active" href="#unfinishList">全部</a>
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
					<div id="unfinishList" class="mui-slider-item mui-control-content">
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
			var now;
			mui.init({
				wipeBack: true, //启用右滑关闭功能
			});

			mui.ready(function() {
				//阻尼系数
				var deceleration = mui.os.ios ? 0.003 : 0.0009;
				mui('.mui-scroll-wrapper').scroll({
					bounce: false,
					indicators: true, //是否显示滚动条
					deceleration: deceleration
				});

				//循环初始化所有下拉刷新，上拉加载。
				mui.each(document.querySelectorAll('.mui-slider-group .mui-scroll'), function(index, pullRefreshEl) {
					pullRefreshElList[index] = mui(pullRefreshEl).pullToRefresh({
						 down: {
							callback: function() {
								var status = index == 0 ? 0 : 1;
								var self = this;
								var table = self.element.querySelector('.mui-table-view');
								var param = {
									rows: pageRows,
									search_EQ_status: status,
									status: status
								};
								topUtil.web_query("/mobile/survey/paperUser/list", param, function(data) {
									if(typeof data == "string") {
										data = JSON.parse(data);
									}
									now = data.now;
									table.innerHTML = "";
									mui.each(data.rows, function(number, object) {
										createContent(table, object);
									});
									addTableCellTapEvent(table);
									//加载未完成的问卷
									var params = {
											rows: pageRows,
										}
										topUtil.web_query("/mobile/survey/paper/list",params,function (data) {
											if(typeof data == "string") {
												data = JSON.parse(data);
											}
											now = data.now;
											totalCount = data.total;
											var str = '';
											mui.each(data.rows, function(number, object) {
												str += createContentAll(object,data.userId);
											});
											$('#pendingList').html(str);
											addTableCellTapEvent(table);
											
										});
									
									
									self.endPullDownToRefresh();
									// 如果下拉刷新，并且还有数据可以加载，则激活pullRefresh插件
									if(data.total > pageRows) {
											self.refresh(true);
									}
								});
								
								// 加载完数据，结束下拉
								//self.endPullDownToRefresh();
								
							}
						},
						up: {
							callback: function() {
								var status = index == 0 ? 0 : 1;
								var self = this;
								var table = self.element.querySelector('.mui-table-view');
								var cells = self.element.querySelectorAll('.mui-table-view-cell');
								var pageNum = Math.ceil(cells.length / pageRows + 1);
								var param = {
									page: pageNum,
									rows: pageRows,
									search_EQ_status: status,
									status: status
								};
								var totalCount = 0;
								topUtil.web_query("/mobile/survey/paperUser/list", param, function(data) {
									if(typeof data == "string") {
										data = JSON.parse(data);
									}
									now = data.now;
									totalCount = data.total;
									mui.each(data.rows, function(number, object) {
										createContent(table, object);
									});
									addTableCellTapEvent(table);
									setEndPullUpToRefresh(self, (++pageNum > Math.ceil(totalCount / pageRows)));
								});
								var params = {
										page: pageNum,
										rows: pageRows,
									}
									topUtil.web_query("/mobile/survey/paper/list",params,function (data) {
										if(typeof data == "string") {
											data = JSON.parse(data);
										}
										now = data.now;
										totalCount = data.total;
										var str = '';
										mui.each(data.rows, function(number, object) {
											str += createContentAll(object,data.userId);
										});
										$('#pendingList').html(str);
										addTableCellTapEvent(table);
										setEndPullUpToRefresh(self, (++pageNum > Math.ceil(totalCount / pageRows)));
									});
							}
						}
					});

				});
				//监听slide-change
				document.getElementById('slider').addEventListener('slide', function(e) {
					if(e.detail.slideNumber === 0) {} else if(e.detail.slideNumber === 1) {}
					pullRefreshElList[e.detail.slideNumber].pullUpLoading();
				});
				//刷新第一个slide
				pullRefreshElList[0].pullUpLoading();
			});

			function setEndPullUpToRefresh(obj, flag) {
				obj.endPullUpToRefresh(flag);
			}
			
			function paperAll (pageNum) {
				var param = {
					page: pageNum,
					rows: pageRows,
					search_EQ_status: 1,
				}
				topUtil.web_query("/mobile/survey/paper/list",param,function (data) {
					if(typeof data == "string") {
						data = JSON.parse(data);
					}
					now = data.now;
					totalCount = data.total;
					var str = '';
					mui.each(data.rows, function(number, object) {
						str += createContentAll(object,data.userId);
					});
					$('#pendingList').html(str);
					addTableCellTapEvent(table);
					setEndPullUpToRefresh(self, (++pageNum > Math.ceil(totalCount / pageRows)));
				});
			}
			
			function createContentAll(object,userId) {
				var str = '';
				var finishStatus = 0;
				if (object.finishStatus) {
					//finishStatus = object.finishStatus;
					return str;
				}
				str += '<li paperid="'+object.id+'" userId="'+userId+'" enddate="'+object.endDate+'" paperTitle="'+object.title+'" status="'+finishStatus+'" class="mui-table-view-cell mui-media">';
				var imageSrc = '';
				if(object.isExam==1){
					imageSrc="${staticURL}/images/pages/exam.png";
				}else{
					if(!compareDate(object.endDate)) {
						imageSrc = "${staticURL}/images/pages/fail.png";
					} else {
						imageSrc = "${staticURL}/images/pages/wait.png";
					}
				
				}
				str += '<a class="mui-navigate-right"><img class="mui-media-object mui-pull-left" src="'+imageSrc+'"><div class="mui-media-body">';
				str += '<span class="span-title">'+ object.title + '</span><p class="mui-ellipsis">结束时间：' + object.endDate.substring(0, 10) + '</p></div></a></li>';
				
				return str;
				/* var li = document.createElement('li');
				li.setAttribute('paperId', object.id);
				li.setAttribute('userId', object.userId);
				li.setAttribute('endDate', object.endDate);
				li.setAttribute('paperTitle', object.title);
				li.className = 'mui-table-view-cell mui-media';
				var a = document.createElement('a');
				a.className = 'mui-navigate-right';
				var imageTag = document.createElement('img');
				imageTag.className = 'mui-media-object mui-pull-left';
				if(object.isExam==1){
					imageTag.src="${staticURL}/images/pages/exam.png";
				}else{
					
					if(!compareDate(object.endDate)) {
						imageTag.src = "${staticURL}/images/pages/fail.png";
					} else {
						imageTag.src = "${staticURL}/images/pages/wait.png";
					}
				
				}
				var div = document.createElement('div');
				div.className = 'mui-media-body';
				var score=0;
				if(object.isExam==1){
					score=Math.round(object.total*object.threshold); 
				}
				var str = '<span class="span-title">'+ object.title + '</span>';
				if(object.isExam==1){
					str+='<p>及格线：'+score+'</p>';
				}
				str+='<p class="mui-ellipsis">结束时间：' + object.endDate.substring(0, 10) + '</p>';
				
				div.innerHTML = str;
				li.appendChild(a);
				a.appendChild(imageTag);
				a.appendChild(div);
				table.appendChild(li); */
			}

			function addTableCellTapEvent(table) {
				mui(table).on('tap', '.mui-table-view-cell', function() {
					var paperId = this.getAttribute('paperId');
					var userId = this.getAttribute('userId');
					var endDate = this.getAttribute('endDate');
					var paperTitle = this.getAttribute('paperTitle');
					var status = this.getAttribute('status');
					//超出问卷结束时间
					mui.openWindow({
						url: dynamicURL+'mobile/survey/paperUser/toSurveyQuestion?paperId='+paperId+'&userId='+userId+'&status='+status+'&paperTitle='+paperTitle+'&endDate='+endDate+'&now='+now,
						id: 'mobile/survey/paperUser',
						show: {
							autoShow: true, //页面loaded事件发生后自动显示，默认为true
							aniShow: "slide-in-right",
							duration: '250'
						},
						waiting: {
							autoShow: false, //自动显示等待框，默认为true
							//			      title:'正在加载...'//等待对话框上显示的提示内容
						}
					});
				});
			}

			function createContent(table, object) {
				var li = document.createElement('li');
				li.setAttribute('paperId', object.surveyPaperEntity.id);
				li.setAttribute('userId', object.userEntity.id);
				li.setAttribute('endDate', object.surveyPaperEntity.endDate);
				li.setAttribute('paperTitle', object.surveyPaperEntity.title);
				li.setAttribute('status', object.status);
				li.className = 'mui-table-view-cell mui-media';
				var a = document.createElement('a');
				a.className = 'mui-navigate-right';
				var imageTag = document.createElement('img');
				imageTag.className = 'mui-media-object mui-pull-left';
				if(object.surveyPaperEntity.isExam==1){
					imageTag.src="${staticURL}/images/pages/exam.png";
				}else{
					if(object.status == 1) {
					imageTag.src = "${staticURL}/images/pages/success.png";
				} else {
					if(!compareDate(object.surveyPaperEntity.endDate)) {
						imageTag.src = "${staticURL}/images/pages/fail.png";
					} else {
						imageTag.src = "${staticURL}/images/pages/wait.png";
					}
				}
				}
				var div = document.createElement('div');
				div.className = 'mui-media-body';
				var score=0;
				if(object.surveyPaperEntity.isExam==1){
					score=Math.round(object.surveyPaperEntity.total*object.surveyPaperEntity.threshold); 
				}
				var str = '<span class="span-title">'+ object.surveyPaperEntity.title + '</span>';
				if(object.surveyPaperEntity.isExam==1){
					str+='<p>及格线：'+score+'</p>';
				}
				str+='<p class="mui-ellipsis">结束时间：' + object.surveyPaperEntity.endDate.substring(0, 10) + '</p>';
				if(object.surveyPaperEntity.isExam==1&&object.status==1){
					str+='<p>得分：'+object.score+';总分:'+object.surveyPaperEntity.total+'</p>'
					var str2='及格';
					if(object.score<score){
						str2='不及格';
					}
					str+='<p>当前考卷状态：'+str2+'</p>';
				}
				if(object.status==1){
					str+='<p>答卷时间：'+object.gmtCreate.substring(0,16)+'</p>'
				}
				div.innerHTML = str;
				li.appendChild(a);
				a.appendChild(imageTag);
				a.appendChild(div);
				table.appendChild(li);

			}
			/*
			 * 添加自定义事件，用户从填写页面返回刷新列表
			 */
			window.addEventListener("reload", function(e) {
				plus.webview.currentWebview().reload();
			});

			function compareDate(date) {
				var d1 = new Date(date.replace(/\-/g, "\/"));
				var str = addDate(now, -1).substring(0, 10);
				var today = new Date(str.replace(/-/g, "/"));
				if(d1 > today) {
					return true;
				} else {
					return false;
				}
			}

			function addDate(date, days) {
				var d = new Date(date.replace(/\-/g, "\/"));
				d=new Date(d.getTime()+days*24*60*60*1000);
				var month = d.getMonth() + 1;
				var day = d.getDate();
				if(month < 10) {
					month = "0" + month;
				}
				if(day < 10) {
					day = "0" + day;
				}
				var val = d.getFullYear() + "-" + month + "-" + day;
				return val;
			}
			//退回
			/*  mui.back = function(event) {
				closeme();
			};

			function closeme() {
				var previousPage = plus.webview.getWebviewById("main.html");
				mui.fire(previousPage, "reloadTaskCount", {});
				var ws = plus.webview.currentWebview();
				plus.webview.close(ws);
			} */ 
		</script>
</body>
</html>