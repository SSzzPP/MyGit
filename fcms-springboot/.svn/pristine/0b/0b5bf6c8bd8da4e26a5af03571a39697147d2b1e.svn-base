<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--健身场地列表页  -->
	<head>
		<meta charset="utf-8">
		<title>Hello MUI</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<style>
			html,
			body {
				background-color: #efeff4;
			}
			.mui-bar~.mui-content .mui-fullscreen {
				top: 88px;
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
			.selectList{
				height:44px;
				display: flex;
				background-color:#fff;
				position: relative;
				padding: 0 10px;
				border-bottom:1px solid #e6e6e6;
			}
			.selectTab{
				line-height:44px;
				flex: 1;
				text-align: center;
				color:#43474d;
				max-width:33.33%;
			}
			.selectTab a{
				display: block;
				color:#43474d;
				font-size:14px;
				overflow: hidden;
			    white-space: nowrap;
			    text-overflow: ellipsis;
			}
			.selectTab a span.mui-icon{
				font-size:14px;
				color:#43474d;
			}
			.subSelect{
				position:absolute;
				top:44px;
				left:0;
				display: none;
				height:300px;
				overflow: auto;
				width:100%;
				z-index: 6666;
				background-color: #fff;
			}
			.subSelect div.selected{
				color:#008000;
			}
			.subSelect div.venBtn.selected{
				color:#43474d!important;
				border-color:#008000;
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
				font-size:15px;
				color:#43474d;
			}
			.list li{
				display:flex;
				padding:10px;
				border-bottom:1px solid #e6e6e6;
				align-items:center;
			}
			.list li img{
				width:90px;
				height:70px;
				border-radius:5px;
				margin:5px;
			}
			.siteInfo{
				flex:1;
				padding:5px;
			}
			.siteName{
				color:#43474d;
				font-size: 15px;
			    font-weight: 600;	
			}
			.con{
				line-height:25px;
				font-size:14px;
				overflow: hidden;
				text-overflow:ellipsis;
        		white-space: nowrap;
        		max-width: 230px;
			}
			.con span{
				color:#999;
			}
			.padd{
				padding:4px 15px;
				font-size:15px;
				color:#43474d;
				border-bottom: 1px solid #ebebeb;
			}
			.mui-backdrop{
				top:100px;
			}
			.mui-icon-search{
				font-size:20px!important;
				padding:7px!important;
				top:4px;
				left:10px;
				color:#aaa;
			}
			input.selinput{
				right:50px;
			    left: 0px;
			    display: inline-block;
			    width:calc(100% - 44px);
			    height:30px;
			    border-radius:5px;
			    line-height: 30px;
			    margin:7px 0;
			    background-color:#f1f2f5;
			    position:absolute;
			    padding-left:34px;
			    border:0;
			    font-size:14px;
			}
			.mui-bar .mui-input-row .mui-input-clear~.mui-icon-clear, .mui-bar .mui-input-row .mui-input-speech~.mui-icon-speech{
				top:3px;
				right:50px;
			}
			.mui-cancle{
				font-size:14px;
				height:44px;
				width:44px;
				text-align: center;
				line-height: 44px;
			}
		</style>
	</head>
	<body>
		<header class="mui-bar mui-bar-nav" style="text-align:left;background-color:#fff;box-shadow:none;">
			<div class="mui-input-row">
				<span class="mui-icon mui-icon-search"></span>
				<input id="serachInput"  name="search_LIKE_name" class="selinput mui-input-clear" type="text" placeholder="请输入场地名称"/>
				<a id="clearSearch" class="mui-cancle mui-pull-right" style="display: none;">取消</a>
				<a id="search" class="mui-cancle mui-pull-right">搜索</a>
			</div>
		</header>
		<div class="mui-content">
			<div id="selectList" class="selectList">
				<div class="selectTab">
					<a href="javascript:void(0)" data-item="1">
						<span>街道</span>
						<span class="mui-icon mui-icon-arrowdown"></span>
					</a>
					<div id="street" data-category='街道' class="subSelect">
					</div>
				</div>
				<div class="selectTab">
					<a href="javascript:void(0)" data-item="1">
						<span>模式</span>
						<span class="mui-icon mui-icon-arrowdown"></span>
					</a>
					<div id="modeList" data-category='模式' class="subSelect">
					</div>
				</div>
				<!-- <div class="selectTab">
					<a href="javascript:void(0)" data-item="2">
						<span>场馆</span>
						<span class="mui-icon mui-icon-arrowdown"></span>
					</a>
					<div id="venueList" data-category='场馆' class="subSelect">
					</div>
				</div> -->
			</div>
			<div id="slider" class="mui-slider mui-fullscreen" style="top:88px;">
				<div class="mui-scroll" id="pullRefresh">
					<ul id="equipmentList" class="mui-table-view list">
					</ul>
				</div>			
			</div>
		</div>
		<div id="select" class="mui-popover mui-popover-action mui-popover-bottom">
		</div>
		<script>
			var pageRows = 4;
			var pageNum = 0;
			var street = null;
			var pubEquipName = null;
			var pullRefresh = null;
			var typeId = 1;
			var mode = null;
			mui.init();
			(function($) {
				$.ready(function() {
					
				    pullRefresh = $("#pullRefresh").pullToRefresh({
						down: {
							callback: function() {
								pageNum = 1;
								//plus.webview.currentWebview().reload();
								loadPubEquip(street,mode,pageRows,pageNum,pubEquipName);
								pullRefresh.endPullDownToRefresh();
							}
						},
						up: {
							callback: function() {
								var cells = document.querySelector('.mui-table-view').querySelectorAll('.mui-table-view-cell');
								pageNum = Math.ceil(cells.length / pageRows + 1);
								loadPubEquip(street,mode,pageRows,pageNum,pubEquipName);
								// pullRefresh.endPullUpToRefresh();
							}
						}
					});
				});
			})(mui);
			mui.ready(function() {
		   	 	//加载类别
		   	 	loadCategory();
		   	 	//加载模式
		   	 	loadMode();
		   	 	//loadVenueList();
		   	 	var cells = document.querySelector('.mui-table-view').querySelectorAll('.mui-table-view-cell');
				pageNum = Math.ceil(cells.length / pageRows + 1);
		   	 	loadPubEquip(street,mode,pageRows,pageNum,pubEquipName);
			})
			//加载类别
			function loadCategory(){
	        	topUtil.web_query("/mobile/system/dict/pubEquipStreet",{},
					function (data) {
						if (typeof data == "string") {
			               data = JSON.parse(data);
			           }
						//街道
						var streetStr = '<div class="padd" data-value="">不限</div>';
						mui.each(data.street,function (index,item) {
							streetStr += '<div class="padd" data-value="'+item.id+'">'+item.name+'</div>'
						});
						$('#street').append(streetStr);
						
						bindEvent();
					});
			}
			//加载模式
			function loadMode(){
	        	topUtil.web_query("/mobile/system/dict/findByType",{type:'OPERATION_MODE'},
					function (data) {
						console.log(data);
						if (typeof data == "string") {
			               data = JSON.parse(data);
			            }
						//街道
						var modeStr = '<div class="padd" data-value="">不限</div>';
						mui.each(data,function (index,item) {
							modeStr += '<div class="padd" data-value="'+item.id+'">'+item.name+'</div>'
						});
						$('#modeList').append(modeStr);
						
						bindEvent();
					});
			}
			//加载场馆
			function loadVenueList(){
				var params = {};
				if(street) {
					params.search_EQ_streetId = street;
				}
				if(typeId) {
					params.search_EQ_typeId = typeId;
				}
	        	topUtil.web_query("/mobile/venue/view/list",params,
					function (data) {
						if (typeof data == "string") {
			               data = JSON.parse(data);
			           }
						//街道
						var venueStr = '<div class="padd" data-value="">不限</div>';
						mui.each(data.rows,function (index,item) {
							venueStr += '<div class="padd" data-value="'+item.id+'">'+item.name+'</div>'
						});
						$('#venueList').append(venueStr);
						
						bindEvent();
					});
			}
			/*加载健身路径*/
			function loadPubEquip(street,mode,pageRows,pageNum,pubEquipName) {
				if (pageNum == 1) {
					$("#equipmentList").empty();
				}
				var params = {
					rows:pageRows,
					page:pageNum,
					sort:'sortNumber',
					order:'desc'
				};
				if(street) {
					params.search_EQ_streetId = street;
				}
				if(pubEquipName) {
					params.search_LIKE_name = pubEquipName;
				}
				if(mode) {
					params.search_EQ_modeId = mode;
				}
				params.search_ISNOTNULL_venueId = 1;
	        	topUtil.web_query("/mobile/venue/equipment/list",params,
					function (data) {
						if (typeof data == "string") {
			               data = JSON.parse(data);
			            }
						var str = "";
						//var serverPath = window.constants.getServerPath();
						if(data.total != 0) {
							mui.each(data.rows,function (index,item) {
								if (item.businessHours==null){
									item.businessHours = '全天开放'
								}
								var imgUuid = null;
								if(item.mainImgUuids){
									var arr = item.mainImgUuids.split(',');
									imgUuid = arr[0];
								}
								str += '<li class="mui-table-view-cell" id="'+item.id+'">';
								str += '	<img src="'+dynamicURL+'/mobile/venue/equipment/showImg?uuid='+imgUuid+'"/>';
								str += '	<div class="siteInfo">';						
								str += '		<div class="siteName">'+item.name+'</div>';
								str += '		<div class="con">运营模式：<span>'+(item.modeName == null ? '暂未设置' : item.modeName)+'</span></div>';
								str += '		<div class="con">所属场馆：<span>'+(item.venueName == null ? '暂未设置' : item.venueName)+'</span></div>';
								str += '		<div class="con">所在地址：<span>'+(item.location == null ? '暂未设置' : item.location)+'</span></div>';
								str += '	</div>';
								str += '</li>';
							});
						}
						$('#equipmentList').append(str);
						toDetail();
						pullRefresh.endPullUpToRefresh(++pageNum> Math.ceil(data.total/pageRows));
					});
			}
			/*点击筛选*/
			function bindEvent() {
				$(".subSelect div").on('tap',function(){
					var categoryItem = $(this).parent(".subSelect").attr("data-category");
					$(this).parent(".subSelect").prev("a").children("span:first-child").text($(this).text());
					var category = $(this).attr("data-value");
					$(this).addClass("selected").siblings().removeClass("selected");
					switch (categoryItem){ 
						case '区域':street = category;
						break; 
						case '模式':mode=category;
						break; 
					}
					$(this).parent(".subSelect").prev("a").children("span:last-child").attr('class','mui-icon mui-icon-arrowdown');
					closeMask();
					mask.close();
					pageNum = 1;
					pullRefresh.refresh(true);
					loadPubEquip(street,mode,pageRows,pageNum,pubEquipName);
				})
			}
		/*显示  隐藏筛选条件*/
			var selectItm=null;
			var mask = mui.createMask(closeMask);
			function closeMask() {
				$(".subSelect").hide();
				selectItm=null;
				$(".selectTab a").children("span:last-child").attr('class','mui-icon mui-icon-arrowdown');
			};
			/*点击筛选大类别*/
			$(".selectTab a").click(function(e) {
				var item=e.currentTarget.dataset.item;
				$(this).children("span:last-child").attr('class','mui-icon mui-icon-arrowup');
				if(item==selectItm) {
					selectItm=null;
					mask.close();
					$(".subSelect").hide();
					$(this).children("span:last-child").attr('class','mui-icon mui-icon-arrowdown');
				} else {
					selectItm=item;
					mask.show();
					$(".subSelect").hide();
					$(this).next(".subSelect").show();
					$(".selectTab a").children("span:last-child").attr('class','mui-icon mui-icon-arrowdown');
					$(this).children("span:last-child").attr('class','mui-icon mui-icon-arrowup');
				}
			});
			
			function toDetail () {
				$("#equipmentList li").on('tap',function() {
					var pubEquipId = $(this).attr("id");
					mui.openWindow({
					    url: dynamicURL+'mobile/venue/equipment/toPubEquipDetail?pubEquipId='+pubEquipId, 
					    id : 'pub_equip_detail.html',
					    show:{
					      autoShow:true,//页面loaded事件发生后自动显示，默认为true
					      aniShow:"slide-in-bottom",
					      duration:'250'
					    },
					     waiting:{
					      autoShow:false,//自动显示等待框，默认为true
				      	}
			  		});
				});
			}
			$(".mui-tab-item").on('tap',function(){
				$($(this).attr("href")).toggleClass('showbox');
			})
			var search = document.getElementById('search');
			var clearSearch = document.getElementById('clearSearch');
			var serachInput = document.getElementById('serachInput');
			//搜索
			search.addEventListener('tap',function(){
				this.style.display='none';
				clearSearch.style.display='block';
				pubEquipName = serachInput.value;
				pageNum = 1;
				pullRefresh.refresh(true);
				loadPubEquip(street,mode,pageRows,pageNum,pubEquipName);
			})
			//取消搜索
			clearSearch.addEventListener('tap',function(){
				this.style.display='none';
				search.style.display='block';
				serachInput.value = null;
				pubEquipName = serachInput.value;
				pageNum = 1;
				pullRefresh.refresh(true);
				loadPubEquip(street,mode,pageRows,pageNum,pubEquipName);
			})
			serachInput.addEventListener('focus',function(){
				search.style.display='block';
				clearSearch.style.display='none';
			})
		</script>
	</body>

</html>