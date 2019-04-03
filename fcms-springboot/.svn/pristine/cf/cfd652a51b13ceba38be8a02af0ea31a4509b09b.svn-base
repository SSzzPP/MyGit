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
			.content {
				padding: 15px;
				background-color: white;
			}
			
			.content p {
				line-height: 30px;
				font-size: 16px;
				color: black;
			}
			
			.list li {
				padding: 5px;
				border-bottom: 1px solid #e6e6e6;
			}
		</style>
</head>
<body style="background-color: white;">
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">更多信息</h1>
		</header>
		<div class="mui-content">
			<div id="slider" class="mui-slider mui-fullscreen">
				<div id="sliderSegmentedControl" class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
					<a class="mui-control-item" href="#item1mobile">
						场馆介绍
					</a>
					<a class="mui-control-item" href="#item2mobile">
						场馆公告
					</a>
					<a class="mui-control-item" href="#item3mobile">
						注意事项
					</a>
					<a class="mui-control-item" href="#item4mobile">
						温馨提示
					</a>
				</div>
				<div id="sliderProgressBar" class="mui-slider-progress-bar mui-col-xs-3"></div>
				<div class="mui-slider-group">
					<div id="item1mobile" class="mui-slider-item mui-control-content mui-active">
						<div id="myscroll" class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<div class="mui-content" style="background-color: white;">
									<div id="venueIntroduce" style="padding: 15px;"></div>
								</div>
							</div>
						</div>
					</div>
					<div id="item2mobile" class="mui-slider-item mui-control-content">
						<div id="scroll2" class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<div class="mui-content">
									<ul id="announcementList" class="mui-table-view list">
									</ul>
								</div>
							</div>
						</div>

					</div>
					<div id="item3mobile" class="mui-slider-item mui-control-content">
						<div id="scroll3" class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<div class="mui-content">
									<p id="attendtion" style="padding: 15px;background-color: white;"></p>
								</div>
							</div>
						</div>
					</div>
					<div id="item4mobile" class="mui-slider-item mui-control-content">
						<div id="scroll4" class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<div class="mui-content">
									<p id="tips" style="padding: 15px;background-color: white;"></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


<script type="text/javascript">
		var venueId = '${venueId}';
		mui.init({
			swipeBack: false //关闭右滑关闭功能
		});
		mui.ready(function() {
			loadIntroduce(venueId); //默认显示第一个选项卡
			//选项卡切换事件
			document.querySelector(".mui-slider").addEventListener('slide', function(e) {
				if(e.detail.slideNumber == 1) {
					loadAnnouncement(venueId);
				}
				if(e.detail.slideNumber == 2 || e.detail.slideNumber == 3) {
					loadAttendtionAndTips(venueId);
				}
			});
			//屏幕上下滑动开启
			mui('#myscroll').scroll();
		});
		/*加载第一个选项卡 场馆介绍*/
		function loadIntroduce(venueId) {
			topUtil.web_query("/mobile/information/info/findVenueIntroduce", {
				id: venueId
			}, function(data) {
				if(typeof data == "string") {
					data = JSON.parse(data);
				}
				if(data.obj != null) {
					document.getElementById("venueIntroduce").innerHTML = data.obj.content;
					mui.each($('#venueIntroduce img'), function(index, item) {
						$(item).attr('src', dynamicURL + "/mobile/information/info/showContentImage?fileName=" + $(item).attr('src'));
					});
				} else {
					document.getElementById("venueIntroduce").innerHTML = ('<p class="mui-text-center" style="margin-top:30px;">暂无信息</p>');
				}
			});
		}
		/*加载第2个选项卡 场馆公告*/
		function loadAnnouncement(venueId) {
			topUtil.web_query("/mobile/information/info/list", {
				search_EQ_venueId: venueId,
				search_EQ_moduleId: 504,
				search_EQ_status: 1
			}, function(data) {
				if(typeof data == "string") {
					data = JSON.parse(data);
				}
				if(data.total != 0) {
					var str = '';
					mui.each(data.rows, function(index, item) {
						var date = new Date(item.gmtCreate);
						var str2 = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
						str += '<li class="mui-table-view-cell" infoId="' + item.id + '">';
						if(item.headImage != null && item.headImage != "") {
							str += '<img style="width:94px;heigth:94px;border-radius:5px;margin:5px;" '
							str += 'class="mui-pull-left" src="' + dynamicURL + '/mobile/information/info/showImage?uuid=' + item.uuid + '">';
						}
						str += '	<div class="siteInfo">';
						str += '		<div class="siteName">' + item.title + '</div>';
						str += '		<div class="con"><span>' + str2 + '</span></div>';
						str += '	</div>';
						str += '</li>';
						document.getElementById("announcementList").innerHTML = str;

					});
				} else {
					document.getElementById("announcementList").innerHTML = ('<p class="mui-text-center" style="margin-top:45px!important;">暂无信息</p>');
				}
			});
		}
		/*加载第三 四个选项卡 注意事项 温馨提示*/
		function loadAttendtionAndTips(venueId) {
			topUtil.web_query("/mobile/venue/view/detail", {
				id: venueId
			}, function(data) {
				if(typeof data == "string") {
					data = JSON.parse(data);
				}
				if(data.obj.attendtion != null) {
					document.getElementById("attendtion").innerHTML = data.obj.attendtion;
				} else {
					document.getElementById("attendtion").innerHTML = ('<p class="mui-text-center" style="margin-top:30px;">暂无信息</p>');
				}
				if(data.obj.tips != null) {
					document.getElementById("tips").innerHTML = data.obj.tips;
				} else {
					document.getElementById("tips").innerHTML = ('<p class="mui-text-center" style="margin-top:30px;">暂无信息</p>');
				}
			});
		}
		/*第二个选项卡中每条公告点击查看详情*/
		mui("#announcementList").on('tap', 'li', function() {
			var infoId = $(this).attr('infoId');
			mui.openWindow({
				url: dynamicURL+'mobile/information/info/toAnnouncement?infoId='+infoId,
				id: 'mobile/information/infotoAnnouncement',
				show: {
					autoShow: true, //页面loaded事件发生后自动显示，默认为true
					aniShow: "slide-in-right",
					duration: '250'
				},
				waiting: {
					autoShow: false, //自动显示等待框，默认为true
				}
			});
		});
	</script>
</body>
</html>