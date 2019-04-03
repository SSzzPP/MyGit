<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="tab_bottom.jsp" flush="true">
<jsp:param name="home" value="mui-active"/>
</jsp:include>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>Hello MUI</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<style>
			.menu-col{
				background-color: white;
				overflow: hidden;
				margin-top:10px;
			}
			.menu{
				width:25%;
				height:90px;
				text-align: center;
				float: left;
				padding:20px 0;
			}
			.menu img{
				width:30px;
				height:30px;
			}
			.menu span:first-child{
				font-size:24px;
				/*color:#1799C5;*/
				/*color:#0eadd4; 
				color:#0ae; 
				color:#1C82D4;/*支付宝头部*/
				/*color:#0B84CE;支付宝图标*/
				/*color:#52ACE5;UC*/
				/*color:#21A3FD;*/
				color: #52ACE5;
			}
			.menu span:last-child{
				display: block;
				font-size:12px;
				line-height:20px;
			}
			.newscol{
				border:1px solid #ced8e1;
				border-radius:4px;
				text-align: center;
				color:#1799C5;
			}
			.bg-set1{
				background-color:#e6f0fa;
			}
			.setmar{
				margin-top:10px;
			}
			.studycol{
				height:100px;
				display: block;
			}
			.imgcol{
				height:100px;
				float: left;
				width:50%;
				position:relative;
			}
			.imgcol span.maskspan{
				position:absolute;
				top:3px;
				right:3px;
				left:3px;
				bottom:3px;
				opacity: 0.7;
				border-radius:4px;
			}
			.imgcol span.maskspan.bg1{
				background: linear-gradient(to right,#ff5858, #f09819);
			}
			.imgcol span.maskspan.bg2{
				background: linear-gradient(to right,#ff758c, #ff7eb3);
			}
			.imgcol span.maskspan.bg3{
				background: linear-gradient(to right,#824dbf, #687de8);
			}
			.imgcol span.maskspan.bg4{
				background: linear-gradient(to right,#16d9e3, #46aef7);
			}
			.imgcol span.textname{
				position:absolute;
				top:30px;
				left:20px;
				font-size:16px;
				color:#333;
				
				letter-spacing: 2px;
			}
			.imgcol span.subtextname{
				position:absolute;
				top:50px;
				left:20px;
				font-size:11px;
				color:#333;
			}
			.imgcol img,.study,.report{
				width:100%;
				height:100%;
			}
			.mui-slider img{
				height:200px;
			}
			
			.mui-table-view-cell:after{
				background-color: #EEEEEE;
				height:1px;
			}
			.mui-table-view:before{
				background-color: #FFFFFF;
			}
			
			#study .mui-table-view .mui-media-object{
				height: 25px;line-height: 25px;
			}
			.subtitle {
			    position: absolute;
			    height: 50px;
			    left: 0;
			    bottom: 0px;
			    z-index: 2;
			    background: rgba(0,0,0,0.4);
			    /*opacity:0.7;*/
			    text-align: left;
			    width:100%;
			}
			.subtitle h6 {
			    color: #ffffff;
			    font-size: 18px;
			    font-weight: bold;
			    overflow: hidden;
			}
			.subtitle h6 a {
			    text-decoration: none;
			    font-weight: normal;
			    color: white;
			    font-size: 15px;
			    overflow: hidden;
			    font-family: "微软雅黑","宋体";
			    padding-left: 15px;
			    line-height: 22px;
			}
			.fasImport{
				overflow: hidden;
				width:100%;
				background-color: #fff;
				padding:7px;
			}
			.fasImport a{
				padding:3px;
			}
			.mui-media {
			font-size: 14px;
		}
		
		.setmediaIMg .mui-table-view-cell .mui-media-object {
			max-width: initial;
			width: 90px!important;
			height: 70px;
			border-radius:5px;
			margin-right: 10px;
		}
		
		.meta-info {
			position: absolute;
			left: 115px;
			right: 15px;
			bottom: 8px;
			color: #8f8f94;
			display: flex;
			align-items: center;
		}
		</style>
</head>
<body>
<div class="mui-content">
			
			<!--<div id="slider" class="mui-slider" style="height: 200px;">
				<div id='sliderContent' class="mui-slider-group mui-slider-loop"></div>
				<div id='sliderIndicator' class="mui-slider-indicator" style="text-align: right;bottom: 0px;"></div>
			</div>-->
			<div id="slider" class="mui-slider" style="height: 200px;">
				<div class="mui-slider-group mui-slider-loop"  id="sliderContent">
				</div>
				<div class="mui-slider-indicator">
					<div class="mui-indicator mui-active"></div>
					<div class="mui-indicator"></div>
					<div class="mui-indicator"></div>
				</div>
					
			</div>
			<!--<div id='mainParts' class="menu-col">
				<div class="menu" id="venue/venue_search.html" status="1">
					<span class="mui-icon iconfont icon-jianshen"></span>
					<span>健身馆</span>
				</div>
				<div class="menu" id="venue/coach_search.html" status="1">
					<span class="mui-icon iconfont icon-youyong4"></span>
					<span>游泳馆</span>
				</div>
				<div class="menu" id="channel/sports_channel.html" status="1">
					<span class="mui-icon iconfont icon-lanqiu"></span>
					<span>篮球馆</span>
				</div>
				<div class="menu" id="main/safetyEducation.html" status="0">
					<span class="mui-icon iconfont icon-pingpangqiu1"></span>
					<span>乒乓球馆</span>
				</div>
				<div class="menu" id="main/fileManagement.html" status="0">
					<span class="mui-icon iconfont icon-yumaoqiu1"></span>
					<span>羽毛球馆</span>
				</div>
				<div class="menu" id="main/safetyInformation2.html" status="0">
					<span class="mui-icon iconfont icon-taiqiu1"></span>
					<span>台球馆</span>
				</div>
				<div class="menu" id="main/riskManage.html" status="0">
					<span class="mui-icon iconfont icon-zuqiu-copy"></span>
					<span>足球馆</span>
				</div>
				<div class="menu" id="sportCircle/sport_circle.html" status="0">
					<span class="mui-icon iconfont icon-biqiu"></span>
					<span>壁球馆</span>
				</div>
				<div class="menu" id="main/emergency.html" status="0">
					<span class="mui-icon iconfont icon-baolingqiu1"></span>
					<span>保龄球馆</span>
				</div>
				<div class="menu" id="" status="0">
					<span class="mui-icon iconfont icon-gengduo1"></span>
					<span>更多</span>
				</div>
			</div> -->
			<div id='mainParts' class="menu-col">
				<div class="menu" id="${dynamicURL}/mobile/venue/view/toVenueInfo" status="1">
					<img src="${staticURL}/images/front/tab6.png" alt="" />
					<span>场馆预约</span>
				</div>
				<div class="menu" id="${dynamicURL}/match/main/toMatchMain" status="1">
					<img src="${staticURL}/images/front/tab5.png" alt="" />
					<span>赛事资讯</span>
				</div>
				<div class="menu" id="${dynamicURL}/mobile/user/view/toCoach" status="1">
					<img src="${staticURL}/images/front/tab7.png" alt="" />
					<span>教练预约</span>
				</div>
				<div class="menu" id="${dynamicURL}/mobile/channel/toSportsChannel" status="1">
					<img src="${staticURL}/images/front/tab10.png" alt="" />
					<span>健身资讯</span>
				</div>
				<div class="menu" name="point" id="${dynamicURL}/mobile/wallet/toWallet" status="1">
					<img src="${staticURL}/images/front/mytab5.png" alt="" />
					<span>积分</span>
				</div>
				<div class="menu" id="${dynamicURL}/admin/main/toActivity" status="1">
					<img src="${staticURL}/images/front/tab8.png" alt="" />
					<span>结伴运动</span>
				</div>
				<div class="menu" id="${dynamicURL}/mobile/venue/equipment/toEquipment" status="1">
					<img src="${staticURL}/images/front/tab11.png" alt="" />
					<span>场地管理</span>
				</div>
				<%-- <div class="menu" id="${dynamicURL}/mobile/venue/equipment/toPubEquip" status="1">
					<img src="${staticURL}/images/front/tab11.png" alt="" />
					<span>健身路径</span>
				</div> --%>
				<div class="menu" id="${dynamicURL}/mobile/user/view/toCoach" status="1">
					<img src="${staticURL}/images/front/mytab2.png" alt="" />
					<span>教练管理</span>
				</div>
			</div>
			<!--<div class="fasImport">
	       		<a id="venue" class="imgcol">
	       			<img src="../../images/front/imgvenue1.png"/>
	       			<span class="maskspan bg1"></span>
	       			<span class="textname">健身场馆</span>
	       			<span class="subtextname">找场馆、想约就约</span>
	       		</a>
	       		<a class="imgcol">
	       			<img src="../../images/front/tu2.jpg"/>
	       			<span class="maskspan bg2"></span>
	       			<span class="textname">预约教练</span>
	       			<span class="subtextname">找教练、定制服务</span>
	       		</a>
	       		<a class="imgcol">
	       			<img src="../../images/front/tu3.jpg"/>
	       			<span class="maskspan bg3"></span>
	       			<span class="textname">竞技赛事</span>
	       			<span class="subtextname">各类比赛、应有尽有</span>
	       		</a>
	       		<a class="imgcol">
	       			<img src="../../images/front/tu4.jpg"/>
	       			<span class="maskspan bg4"></span>
	       			<span class="textname">运动资讯</span>
	       			<span class="subtextname">最新、最快、最权威</span>
	       		</a>
	       </div>-->
	       <!--<div class="fasImport">
	       		<a id="venue" class="imgcol">
	       			<img src="../../images/front/imgvenue1.png"/>
	       			<span class="maskspan"></span>
	       			<span class="textname">健身场馆</span>
	       			<span class="subtextname">找场馆、想约就约</span>
	       		</a>
	       		<a class="imgcol">
	       			<img src="../../images/front/imgvenue2.png"/>
	       		</a>
	       		<a class="imgcol">
	       			<img src="../../images/front/imgvenue3.png"/>
	       		</a>
	       		<a class="imgcol">
	       			<img src="../../images/front/imgvenue2.png"/>
	       		</a>
	       </div>-->
			<div class="mui-menu setmar">
	       		<div class="mui-menu-header">
	       			<span class="font-big borLeft">体育赛事</span>
	       			<a class="more" style='color: black' id="toTongzhigonggaoMoreHtml">
	       				查看全部
	       				<span class='mui-icon mui-icon-arrowright' style="font-size: 16px;line-height: 21px;"></span>
	       			</a>
	       		</div>
	       		<div class="mui-row">
			    	<div class="mui-col-xs-12 setmediaIMg" id="tongzhigonggaoDivId">
			    		<!--<li class="mui-table-view-cell mui-media">
							<a href="javascript:;">
								<img class="mui-media-object mui-pull-left" src="../../images/front/example5.jpg">
								<div class="mui-media-body">
									<div class="mui-ellipsis-2 color-brave">2018年全国U17青少年女子篮球决赛在青完美收官
									2018年全国U17青少年女子篮球决赛在青完美收官2018年全国U17青少年女子篮球决赛在青完美收官2018年全国U17青少年女子篮球决赛在青完美收官
									</div>
								</div>
								<div class="meta-info">
									2018-05-04
								</div>
							</a>
						</li> 
			            <li class="mui-table-view-cell mui-media">
							<a href="javascript:;">
								<img class="mui-media-object mui-pull-left" src="../../images/front/example5.jpg">
								<div class="mui-media-body">
									<div class="mui-ellipsis-2 color-brave">2018年全国U17青少年女子篮球决赛在青完美收官</div>
								</div>
								<div class="meta-info">
									2018-05-04
								</div>
							</a>
						</li> 
						<li class="mui-table-view-cell mui-media">
							<a href="javascript:;">
								<img class="mui-media-object mui-pull-left" src="../../images/front/example5.jpg">
								<div class="mui-media-body">
									<div class="mui-ellipsis-2 color-brave">2018年全国U17青少年女子篮球决赛在青完美收官</div>
								</div>
								<div class="meta-info">
									2018-05-04
								</div>
							</a>
						</li> -->
			        </div>
			    </div>
	       	</div>
	       	
	       	<!--<div class="bg-white" style="border-top: 1px solid #EEEEEE;" id="voluntaryReportDivId">
	       		<a>
	       			<span style="font-size: 18px;position: absolute;color: white;margin: 30px 0px 0px 20px">今天锻炼人数<strong style="color:white;font-size:22px;" id="voluntaryReportCountSpanId">360</strong>人</span>
	       			<img style="height: 150px;" class="report" src="../../images/front/example4.png"/>
	       		</a>
	       	</div>-->
	       	<div id='study' class="mui-menu setmar">
	       		<div class="mui-menu-header">
	       			<span class="font-big borLeft">学习中心</span>
	       			<a class="more" style='color: black' id="toXuexiyuandiMoreHtml">
	       				查看全部
	       				<span class='mui-icon mui-icon-arrowright' style="font-size: 16px;line-height: 21px;"></span></a>
	       		</div>
	       		<div class="mui-row" style="margin-top: 8px;">
			    	<div class="mui-col-xs-12 setmediaIMg" id="xuexiyuandiUlId">
			    		<!--<ul class="mui-table-view" >
                            <li class="mui-table-view-cell mui-media">
								<a href="javascript:void;" class="mui-navigate-right" onclick="toFileDetailHtml">
									<img class="mui-media-object mui-pull-left" src="../../images/pages/fvideo.png">
									<div class="mui-media-body mui-ellipsis" style="margin-top:3px;">
										【视频教学】网球技术辅导
									</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media">
								<a href="javascript:void;" class="mui-navigate-right">
									<img class="mui-media-object mui-pull-left" src="../../images/pages/fpdf.png">
									<div class="mui-media-body mui-ellipsis" style="margin-top:3px;">
										【培训课件】健身气功培训
									</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media">
								<a href="javascript:void;" class="mui-navigate-right">
									<img class="mui-media-object mui-pull-left" src="../../images/pages/fimg.png">
									<div class="mui-media-body mui-ellipsis" style="margin-top:3px;">
										【视频教学】羽毛球技术辅导
									</div>
								</a>
							</li>
						</ul>-->
			        </div>
			    </div>
	       	</div>
	        <%-- <div class="mui-padded-set bg-white ovh" style="margin-top:10px;padding-top:10px">
	       		<a class="imgcol" style="padding-right:5px;" id="toJichangshujuMoreHtml"><img src="${staticURL}/images/front/example1.png"/></a>
	       		<a class="imgcol" style="padding-left:5px;" id="toNiwenwodaMoreHtml"><img src="${staticURL}/images/front/example3.png"/></a>
	       	</div> --%>
	       
		</div>
		<script src="${staticURL}/js/login.js?v=1.1.4"></script>
		<script type="text/javascript">
			mui.init({ 
				swipeBack:true
			});
			var count = 0;
			//var directLogin = '${directLogin}';
			mui.ready(function(){
				app.zsbLogin(function(err){
					if (err) {
						mui.toast(err);
						return;
					}
				});
				/* if (directLogin == 1) {
					constants.setLoginStatus(0);
					autoLogin ();
				} */
		   	 	//加载轮播图
		   	 	loadBannerData();
		   	 	//查询自愿报告--有效报告数
		   	 	//searchVoluntaryReportCount();
		   	 	// 加载通知公告
		   	 	loadNoticeData();
		   	 	// 加载学习园地
		   	 	loadXuexiyuandiList();
//		   	 	$("body, html").scrollTop(500);
//		   	 	var self = plus.webview.currentWebview();
//		   	 	if(self.loginStatus == 0){
//			    	constants.setLoginStatus(0);
//			    }
			});
			
			//自动登录
		 	function autoLogin () {
				var settings = constants.getSettings();
				var account = settings.account;
				var password = settings.password;
				if (account == null || password == null) {
					return;
				}
				var loginInfo = {
					account: account, 
					password: password
				}; 
				app.zsbLogin(function(err) {
					if (err) {
						mui.toast(err);
						return;
					}
				});
				
			}

			/**
			 * 加载轮播图数据
			 */
			function loadBannerData(){
				var params = {search_EQ_moduleName:"banner"};
				topUtil.web_query('/mobile/information/info/bannerList',params,function (data) {
					if (typeof data == "string") {
	                	data = JSON.parse(data);
		            }
					var str = "";
					var indicator = "";
					var firstStr = "";
					var lastStr = "";
					mui.each(data,function (index,item) {
						var img =  item.headImage;
						img = dynamicURL + "/mobile/information/info/showImage?uuid="+ item.uuid;
						str += '<div  class="mui-slider-item" uuid="'+item.uuid+'">';
						str += '	<a href="#">';
						str += '		<img src="'+img+'">';
						str += '	</a> ';
						str += '	<div class="subtitle"> ';
				        str += '        <h6><a>'+item.title+'</a></h6>';
				        str += '    </div>';
						str += '</div>';
						if(index == 0){
							indicator += '<div class="mui-indicator mui-active"></div>';
							// 第一张图片
							firstStr += '<div class="mui-slider-item mui-slider-item-duplicate" onclick=toDetail("'+item.uuid+'")>';
							firstStr += '	<a href="#">';
							firstStr += '		<img src="'+img+'">';
							firstStr += '	</a> ';
							firstStr += '	<div class="subtitle"> ';
					        firstStr += '        <h6><a>'+item.title+'</a></h6>';
					        firstStr += '    </div>';
							firstStr += '</div>';
						}else{
							indicator += '<div class="mui-indicator"></div>';
						}
						
						if(index == data.length - 1){
							// 最后一张图片
							lastStr += '<div class="mui-slider-item mui-slider-item-duplicate" onclick=toDetail("'+item.uuid+'")>';
							lastStr += '	<a href="#">';
							lastStr += '		<img src="'+img+'">';
							lastStr += '	</a> ';
							lastStr += '	<div class="subtitle"> ';
					        lastStr += '        <h6><a>'+item.title+'</a></h6>';
					        lastStr += '    </div>';
							lastStr += '</div>';
						}
					});
					str = lastStr+ str + firstStr;
					$('#sliderContent').html(str); 
					$('#sliderIndicator').html(indicator); 
					mui("#slider").slider({
						interval: 3000
					});
				})
			}
			mui("#slider").slider({
				interval: 3000
			});
			
			/**
			* 加载通知公告(体育赛事)
			*/
			function loadNoticeData(){
				var params = {search_EQ_moduleName:"events"};
				
			   topUtil.web_query('/mobile/information/info/bannerList',params,
					function (data){
						if (typeof data == "string") {
							data = JSON.parse(data);
						}
						var str = "";
						mui.each(data,function (index,item) {
							var date = new Date(item.gmtCreate);
							var str2 = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
							str += '<li class="mui-table-view-cell mui-media" uuid="'+item.uuid+'">';
							str += '	<a href="javascript:;">';
							str += '		<img class="mui-media-object mui-pull-left" src="'+dynamicURL+'/mobile/information/info/showImage?uuid='+item.uuid+'">';
							str += '		<div class="mui-media-body">';
							str += '			<div class="mui-ellipsis-2 color-brave">'+item.title+'</div>';
							str += '		</div>';
							str += '		<div class="meta-info">'+str2+'</div>';
							str += '	</a>';
							str += '</li>';
						});
						$('#tongzhigonggaoDivId').html(str);
					}
				); 
			}
			/**
			 * 加载学习园地
			 */
			function loadXuexiyuandiList(){
				var params = {order:"desc",sort:'id'};
				
				topUtil.web_query('/mobile/video/main/list',params,
						function (data){
							if (typeof data == "string") {
								data = JSON.parse(data);
							}
							var str = "";
							mui.each(data.rows,function (index,item) {
								if (index < 3) {
									str += '<li class="mui-table-view-cell mui-media" uuid="'+item.uuid+'" >';
									str += '	<a href="javascript:void;">';
										str += '		<img class="mui-media-object mui-pull-left" src="'+dynamicURL+'/mobile/video/main/showVideoImage?uuid='+item.uuid+'">';
										str += '		<div class="mui-media-body mui-ellipsis" style="margin-top:3px;">';
										str += '			'+item.title;
									str += '		</div>';
									str += '	</a>';
									str += '</li>';
								}
							});
							$('#xuexiyuandiUlId').html(str);
						}
					);
			}
			/**
			 * 前台通知公告查看详情页面（体育赛事）
			 * @param {Object} uuid
			 */
			mui("#tongzhigonggaoDivId").on('tap',' li',function(){
				var uuid = $(this).attr('uuid');
				mui.openWindow({
					url: '${dynamicURL}/mobile/information/info/toDetail?uuid='+uuid, 
			    	id : 'events_detail.html',
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
			/**
			 * 轮播图跳转详情页面
			 */
			mui("#slider").on('tap','.mui-slider-item',function(){
				var uuid = $(this).attr('uuid');
				mui.openWindow({
					url: '${dynamicURL}/mobile/information/info/toDetail?uuid='+uuid, 
			    	id : 'events_detail.html',
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
			/**
			 * 学习园地---跳转详情页面
			 */
			mui("#xuexiyuandiUlId").on('tap','li',function(){
				var uuid = $(this).attr("uuid");
				mui.openWindow({
					url: '${dynamicURL}/mobile/video/main/toVideoDetail?uuid='+uuid, 
	    			id : 'video_detail.html',
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
			/**
			 * 跳转，体育赛事更多页面
			 */
			document.getElementById("toTongzhigonggaoMoreHtml").addEventListener('tap',function(){
				mui.openWindow({
					url: '${dynamicURL}/mobile/events/toEvents', 
			    	id : 'events_more.html',
					show:{
						autoShow:true,//页面loaded事件发生后自动显示，默认为true
						aniShow:"slide-in-right",
						duration:'250'
					},
					waiting:{
						autoShow:false,//自动显示等待框，默认为true
					}
				});
			},false);
			/**
			 * 跳转，学习园地更多页面
			 */
			document.getElementById("toXuexiyuandiMoreHtml").addEventListener('tap',function(){
				mui.openWindow({
					url: '${dynamicURL}/mobile/video/main/toVideo', 
			    	id : 'video_more.html',
					show:{
						autoShow:true,//页面loaded事件发生后自动显示，默认为true
						aniShow:"slide-in-right",
						duration:'250'
					},
					waiting:{
						autoShow:false,//自动显示等待框，默认为true
					}
				});
			},false);
			/**
			 * 十大要素
			 */
			mui("#mainParts").on('tap','.menu',function(){
				var openStatus = $(this).attr('status');
				var url = $(this).attr('id');
				/* if(constants.getLoginStatus()==0 && openStatus==0){
					constants.toLoginPage('../../login.html','../../login-locker.html');
					return;
				} */
				if(url){
					if ($(this).attr('name')=="point"){
						//constants.toLoginPage();
						mui.toast('请返回在市北登录后使用该功能！');
						return;
					}else {
						var id = url;
						mui.openWindow(id, id,{
							show:{
								autoShow:true,//页面loaded事件发生后自动显示，默认为true
								aniShow:"slide-in-right",
								duration:'250'
							},
							waiting:{
								autoShow:false//自动显示等待框，默认为true
							}
						});
					} 
				}else {
					mui.toast("正在开发，敬请期待！");
				}
			});
		</script>
</body>
</html>