<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
			.mui-table h4,
			.mui-table h5,
			.mui-table .mui-h5,
			.mui-table .mui-h6,
			.mui-table p {
				margin-top: 0;
			}
			
			.mui-table h4 {
				line-height: 21px;
				font-weight: 500;
			}
			
			.mui-table .oa-icon {
				position: absolute;
				right: 0;
				bottom: 0;
			}
			
			.mui-table .oa-icon-star-filled {
				color: #f14e41;
			}
		</style>

</head>
<body>
<!--下拉刷新容器-->
		<div id="pullrefresh" class="mui-content mui-scroll-wrapper">
			<div class="mui-scroll">
				<ul class="mui-table-view mui-table-view-chevron">
				</ul>
			</div>
		</div>
		
		<script>
			var count = 0;
			var totalCount = 0;
			var pageRows = 10;
			var pullRefreshElList = [];
			mui.init({
				wipeBack: true,
				pullRefresh: {
					container: '#pullrefresh',
					//					down: {
					//						callback: pulldownRefresh
					//					},
					up: {
						contentrefresh: '正在加载...',
						callback: pullupRefresh
					}
				} //启用右滑关闭功能
			});
			//mui.plusReady(function() {});
			/**
			 * 上拉加载具体业务实现
			 */
			function pullupRefresh() {
				//				var wait = plus.nativeUI.showWaiting('正在加载...');
				// 去重
				var cells = document.querySelector('.mui-table-view').querySelectorAll('.mui-table-view-cell');
				var pageNum = Math.ceil(cells.length / pageRows + 1);
				var param = {
					pageRows: pageRows,
					pageNum: pageNum,
					search_EQ_status: 1,
					order: 'desc'
				};
				topUtil.web_query("/mobile/survey/userTotal/list", param, function(data) {
					
						totalCount += data.total;
						var table = document.querySelector('.mui-table-view');
						mui.each(data.rows, function(number, object) {
							createContent(table, object);
						});
					
					mui('#pullrefresh').pullRefresh().endPullupToRefresh((totalCount >= data.total)); //参数为true代表没有更多数据了。(++count > 2))
				});

			}

			function createContent(table, object) {
				var li = document.createElement('li');
				li.setAttribute('paperId', object.id);
				li.setAttribute('paperTitle', object.title);
				li.setAttribute('total', object.total);
				li.setAttribute('actual', object.actual);
				li.className = 'mui-table-view-cell mui-media';
				var a = document.createElement('a');
				a.className = 'mui-navigate-right';
				var imageTag = document.createElement('img');
				imageTag.className = 'mui-media-object mui-pull-left';
				if(object.isExam == 1) {
					imageTag.src = "${staticURL}/images/pages/exam.png";
				} else {
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
				var str = object.title /* + '  (' + object.actual + '/' + object.total + ')' */ + '<p class="mui-ellipsis">' + object.createUserName + '&nbsp;&nbsp;&nbsp;结束时间：' + object.endDate.substring(0, 10) + '</p>';
				div.innerHTML = str;
				div.style = "word-break:normal;display:block;white-space:pre-wrap;";
				li.appendChild(a);
				a.appendChild(imageTag);
				a.appendChild(div);
				table.appendChild(li);
			}

			function addTableCellTapEvent(table) {
				mui(table).on('tap', '.mui-table-view-cell', function() {
					var paperId = this.getAttribute('paperId');
					var paperTitle = this.getAttribute('paperTitle');
					var total = this.getAttribute('total');
					var actual = this.getAttribute('actual');
					mui.openWindow({
						url: dynamicURL+'mobile/survey/paperQuestion/toSurveyQuestionTotal?paperId='+paperId+'&paperTitle='+paperTitle+'&total='+total+'&actual='+actual,
						id: 'mobile/survey/paperQuestion/toSurveyQuestionTotal',
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
			mui.ready(function() {
				setTimeout(function() {
					mui('#pullrefresh').pullRefresh().pullupLoading();
					// 添加监听事件
					var table = document.querySelector('.mui-table-view');
					addTableCellTapEvent(table);
				}, 200);

				//					var self = plus.webview.getWebviewById('chooseDepartmentUser_main.html');
				//					selectMode = self.selectMode;
			});
		</script>
</body>
</html>