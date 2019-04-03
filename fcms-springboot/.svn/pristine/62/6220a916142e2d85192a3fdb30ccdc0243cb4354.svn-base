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
			#btn{
				padding:6px;
				overflow: hidden;
			}
			.venBtn{
				float: left;
				height:30px;
				line-height: 30px;
				width:calc(33.333333% - 8px);
				margin:5px 4px;
				border:1px solid #ddd;
				border-radius:5px;
				transition: all 0.3s;
				font-size:14px;
				text-align: center;
			}
			.topBtn{
				color: #0099CC;
				float: left;
				height:30px;
				line-height: 30px;
				width:calc(33.333333% - 8px);
				margin:5px 4px;
				border:1px solid #0099CC;
				border-radius:5px;
				transition: all 0.3s;
				font-size:14px;
				text-align: center;
			}
			.mui-btn {
				padding: 10px;
			}
		</style>
</head>
<body>
		<header class="mui-bar mui-bar-nav">
			<div class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left "></div>
			<h1 class="mui-title" id="titleofLast"></h1>
		</header>
		<div class="mui-content">
			<div id="btn">
				<!--<div class="venBtn" data-value="1">篮球</div>
				<div class="venBtn" data-value="2">乒乓球</div>
				<div class="venBtn" data-value="3">攀岩</div>
				<div class="venBtn" data-value="4">散打</div>
				<div class="venBtn" data-value="5">健身</div>
				<div class="venBtn" data-value="6">太极</div>
				<div class="venBtn" data-value="7">剑道</div>
				<div class="venBtn" data-value="8">游泳</div>
				<div class="venBtn" data-value="9">网球</div>
				<div class="venBtn" data-value="10">足球</div>-->
			</div>
			
			
			<div class="mui-content-padded">
				<button id='submit' class="mui-btn mui-btn-block mui-btn-self">保存</button>
			</div>
		</div>
		
		<script>
			var likes = '';
			mui.ready(function(){
				loadCategory();
				userLike ();
				$('#titleofLast').html('${titleofLast}');
			});
			
			function loadCategory(){
	        	topUtil.web_query("/mobile/system/dict/findByType",{type:"SPORT_TYPE"},
					function (data) {
						if (typeof data == "string") {
			               data = JSON.parse(data);
			           	}
						//分类
						var venueTypeStr = '';
						mui.each(data,function (index,item) {
							venueTypeStr += '<div class="venBtn" id="'+item.id+'" data-value="'+item.id+'">'+item.name+'</div>';
						});
						$('#btn').append(venueTypeStr);
						chick();
					});
			}
			
			function chick () {
				$('#btn div').on('tap',function () {
					var btn = $(this).prop("className");
					if (btn == "venBtn") {
						$(this).addClass("topBtn");
						$(this).removeClass("venBtn");
						if (likes.length < 21) {
							var value = $(this).attr("data-value");
							likes += value +',';
						} else {
							mui.toast('最多可选择5个');
						}
					} else if (btn == "topBtn") {
						$(this).addClass("venBtn");
						$(this).removeClass("topBtn");
						var value = $(this).attr("data-value");
						likes = likes.replace(value+',','');
					}
				})
			}
			
			function userLike () {
				topUtil.web_query('/mobile/venue/user/likeList', {}, function (data) {
					if (typeof data == "string") {
		                data = JSON.parse(data);
		            }
					if (data) {
						setTimeout(function() {
							mui.each(data,function (index, item) {
								$('#'+item.likeId+'').attr("class","topBtn");
								likes += item.likeId+',';
							});
						}, 100);
						
					}
				});
			}
			
			document.getElementById('submit').addEventListener('tap',_.debounce(function () {
				$(this).html("保存中...");
				$(this).attr('disabled',true);
				if (likes.length > 20) {
					mui.toast("最多可选择5个");
					$(this).html("保存");
					$(this).attr('disabled',false);
				} else {
					topUtil.web_query('/mobile/venue/user/saveLike', {userLikes: likes}, function (data) {
						if (typeof data == "string") {
		               		data = JSON.parse(data);
		            	}
						if (data.success) {
							/* var myPage = plus.webview.getWebviewById("myInfo.html");
							mui.fire(myPage, "reload");
							plus.webview.currentWebview().close(); */
							mui.openWindow({
							    url: dynamicURL+'mobile/venue/user/toMyInfo', 
							    id : 'mobile/venue/user/toMyInfo',
							    show:{
							      autoShow:true,//页面loaded事件发生后自动显示，默认为true
							      aniShow:"slide-in-bottom",
							      duration:'250'
							    },
							     waiting:{
							      autoShow:false,//自动显示等待框，默认为true
						      	}
					  		});
						}
					});
				}
			},waitTime,true));
		</script>
</body>
</html>