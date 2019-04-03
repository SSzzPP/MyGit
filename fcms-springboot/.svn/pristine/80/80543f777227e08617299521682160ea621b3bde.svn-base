<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<link rel="stylesheet" href="${staticURL}/css/v2/siteDetails.css" />
<link rel="stylesheet" href="${staticURL}/css/iconfont.css" />
<title>场馆详情</title>
<style>
			#equipmentType .mui-control-content{
				display: none!important;
			}
			#equipmentType .mui-control-content.mui-active{
				display: inline-block!important;
			}
			.infoData {
				padding: 0 10px;
			}
			
			.bt {
				border-bottom: 1px solid #e6e6e6;
				padding-bottom: 5px;
			}
			
			.allComment {
				width: 100%;
				padding: 10px 0;
				text-align: center;
				color: #000;
				display: block;
				font-size: 14px;
			}
			.mui-slider .mui-slider-group .mui-slider-item{
				height:auto
			}
			.mui-slider .mui-slider-group .mui-slider-item img{
				height: 100%;
			}
			.spanColor{
			white-space:normal;
			color : #999!important;
			}
			.noEquip{
				display: none;
			}
		</style>
</head>
<body>
<header class="mui-bar mui-bar-nav">
			<div class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left " onclick="back(),plus.nativeUI.closeWaiting();"></div>
			<h1 id="title" class="mui-title"></h1>
		</header>
		<div class="mui-content">
			<div id="sliderImg" class="mui-slider" style="height: 200px;">
				<div class="mui-slider-group mui-slider-loop" id="sliderContent">
				</div>
				<div class="mui-slider-indicator" id="venueIndicator">
					<!-- <div class="mui-indicator mui-active"></div>
					<div class="mui-indicator"></div> -->
				</div>
			</div>
			<div class="siteInfo bort">
				<div class="venueName"></div>
				<div class="starsBox">
					<span class="mid-rank-stars mid-str40"></span>
					<span>4.0分</span>
				</div>
			</div>
			<div class="siteInfo bort">
				<div class="paddtop" >
					<span style="font-weight: bold;">营业时间:</span>
					<span id="businessHours"></span>
				</div>
			</div>
			
			<div class="siteInfo disflex bort">
				<div class="addBox">
					<span class="mui-icon iconfont icon-ditu1"></span>
					<span id="location"></span>
				</div>
				<!-- <div class="mobileBox">
					<span id="mobileBtn" class="mui-icon iconfont icon-dianhua"></span>
					<input id="mobile" value="" type="hidden" hidden="hidden" /> 
				</div> -->
			</div>
			<div class="siteInfo bort">
				<div class="paddtop">
					<span style="font-weight:bold;">交通方式:</span>
					<span id="transportation"></span>
					<span id="goMoreInfo" style="color: #1799C5;float:right;">[更多信息]</span>
					</div>
			</div>
			<div id="slider" class="mui-slider">
				<div id="sliderSegmentedControl" class="mui-scroll-wrapper mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
					<div id="itemTab" class="mui-scroll">
					</div>
				</div>
				<div class="mui-slider-group" id="equipmentType">
				</div>
			</div>
			
			<div class="mui-menu setmar" id="venueService">
				
			</div>
			<div class="mui-menu setmar">
				<div class="mui-menu-header">
					<span class="font-big" style="font-weight:bold;">教练信息</span>
				</div>
				<div class="mui-row" >
					<div class="mui-col-xs-12" >
						<div class="infoData" id="venueCoach"></div>
					</div>
				</div>
			</div>
			
			<div class="mui-menu setmar ">
	       		<div class="mui-menu-header ">
	       			<span class="font-big" style="font-weight:bold;">评价</span>
	       		</div>
	       		<div class="mui-row" style="margin-top:8px;">
					<div class="mui-col-xs-12">
						<div class="infoData" id="vealuate">
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<script>
		var venueId = '${venueId}';
		//var serverPath = window.constants.getServerPath();
		mui.init({
			swipeBack: false //关闭右滑关闭功能
		});
		mui.ready(function(){
			/*加载场馆信息*/
			detail(venueId);
			/*加载更多信息*/
			toMoreInfo(venueId);
			/*加载设施信息*/
			equipment(venueId);
			/*加载服务信息*/
			venueService(venueId);
			/*加载教练信息*/
			coach(venueId);
			
			vealuateList (venueId);
		});
		/*加载轮播场馆信息*/
		function detail(venueId) {
			topUtil.web_query("/mobile/venue/view/detail", {id:venueId}, function (data) {
				if (typeof data == "string") {
	               data = JSON.parse(data);
	           }
				if (data.success) {
					var pointStr='';//轮播图对应的点
					var str = '';
					if(data.obj.environmentImgUuids) {
						var arr = data.obj.environmentImgUuids.split(',');
						var first = '';
						var last = '';
						mui.each(arr,function(index,item) {
							pointStr +='<div class="mui-indicator"></div>';
							str += '<div class="mui-slider-item"><a href="#">';
							str += '<a href="#"><img src="'+dynamicURL+'mobile/venue/view/showImg?uuid='+item+'" /></a></div>';
							if(index == 0) {
								first += '<div class="mui-slider-item mui-slider-item-duplicate">';
								first += '<a href="#"><img src="'+dynamicURL+'mobile/venue/view/showImg?uuid='+item+'" /></a></div>';
							} 
							if(index == arr.length-1) {
								last += '<div class="mui-slider-item mui-slider-item-duplicate">';
								last += '<a href="#"><img src="'+dynamicURL+'mobile/venue/view/showImg?uuid='+item+'" /></a></div>';
							} 
						});
						str = last + str + first;
					}else{
						str += '<div class="mui-slider-item mui-slider-item-duplicate">';
						str += '<a href="#" style="padding:10px;"><img style="height:180px;" src="${staticURL}/images/front/notFound.jpg" /></a></div>';
						}
					$('#venueIndicator').html(pointStr);
					$('#sliderContent').html(str);
					mui("#sliderImg").slider({
						interval: 3000
					});
					$("#title").html(data.obj.name);
					$(".venueName").html(data.obj.name);
					$("#location").html(data.obj.location);
					$("#mobile").val(data.obj.tel);
					/*营业时间*/
					$("#businessHours").html(ifNull(data.obj.businessHours));
					/*交通方式*/
					$("#transportation").html(ifNull(data.obj.transportationMode));
					/*星级显示*/
					var starStr = '';
					if(data.obj.star) {
						var num = data.obj.star*10;
						starStr = '<span class="mid-rank-stars mid-str'+num+'"></span><span>'+data.obj.star+'.0分</span>';
					} else {
						starStr = '<span class="mid-rank-stars mid-str0"></span><span class="spanColor">暂未评定</span>';
					}
					$('.starsBox').html(starStr);
				}
				
			});
		}
		/*加载更多信息*/
		function toMoreInfo(venueId){
			$("#goMoreInfo").on('tap',function(){
				
				mui.openWindow({
					url: dynamicURL+'mobile/venue/view/toMoreInfo?venueId='+venueId,
					id : 'mobile/venue/view/toMoreInfo', 
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
		/*加载场馆服务函数*/
		function venueService (venueId){
			topUtil.web_query("/mobile/venue/view/detail", {id:venueId}, function (data) {
				if (typeof data == "string") {
	               data = JSON.parse(data);
	           }
	           if(data.success){
	           		var flag = false;
	           		var str='<div class="bt"><div class="siteInfo">';
	           		str +='<div><span style="font-weight:bold;">场馆服务</span></div>';
	           		str +='<div class="infoData">';
           			if(data.obj.equipmentLease != null){
           				var flag = true;
           				str +='<div class="con">器械租赁：<span>'+data.obj.equipmentLease+'</span></div>';
           			}
           			if(data.obj.equipmentMaintenance != null){
           				var flag = true;
           				str +='<div class="con">器械维护：<span>'+data.obj.equipmentMaintenance+'</span></div>';
           			}
           			if(data.obj.scouringBath != null){
           				var flag = true;
           				str +='<div class="con">洗浴设施：<span>'+data.obj.scouringBath+'</span></div>';
           			}
           			if(data.obj.saleArticle != null){
           				var flag = true;
           				str +='<div class="con">场馆卖品：<span>'+data.obj.saleArticle+'</span></div>';
           			}
           			if(data.obj.invoice != null){
           				var flag = true;
           				str +='<div class="con">发票服务：<span>'+data.obj.invoice+'</span></div>';
           			}
           			if(data.obj.otherServices != null){
           				var flag = true;
           				str +='<div class="con">其他服务：<span>'+data.obj.otherServices+'</span></div>';
           			}
           			if(!flag){
           				str = '<div class="bt"><div class="siteInfo">';
           				str +='<div><span style="font-weight:bold;">场馆服务:</span><span class="spanColor">暂无服务</span></div>';
           				str +='<div class="infoData">';
           			}
	           		str += '</div></div></div>';
	           		$("#venueService").html(str);
	           }
	           
	           
			});
		}
		/*为空则返回暂未设置*/
		function ifNull(object){
			if(object!=null){
				return '<span class="spanColor">'+object+'</span>';
			}else{
				return '<span class="spanColor">暂未设置</span>';
			}	
		}
		/*加载场地设施*/
		function equipmentInstall(floor,lighting,restingArea){
			var divStr = '<div class="bt"><div class="siteInfo"><div><span style="font-weight:bold;">场地设施</span></div>'
				divStr+='<div class="infoData">';
				
			var flag = false;//是否有设施
			var str = '';
			if (floor != null){
				flag = true;
				str += '<div class ="con">地板设施：<span>'+floor+'</span></div>';
				
			}
			if (lighting != null){
				flag = true;
				str += '<div class="con">灯光设施：<span>'+lighting+'</span></div>';
			}
			if (restingArea != null){
				flag = true;
				str += '<div class="con">休息设施：<span>'+restingArea+'</span></div>';
			}
			if(flag) {
				divStr+=str;
				divStr +='</div></div></div>';
				return divStr;
			}else{
				return str;
			}
			
		}
		/*场地图片显示函数*/
		function equipmentImg(imgUuids){
			var divStr = '';
			var divLast = '';
			var str = '';
			var first = '';
			var last = '' ;
			if(imgUuids){

				divStr += '<div class="book">';
				divStr += '<div name="sliderEquipImg" class="mui-slider" style="height: 200px;">';
				divStr += '<div class="mui-slider-group mui-slider-loop" id="sliderEquipContent">';
				divLast = '</div></div></div>';
				var arr = imgUuids.split(',');
				mui.each(arr,function(index,item) {

							var img = '';
							img = dynamicURL + "mobile/venue/equipment/showImg?uuid="+item;
							str += '<div class="mui-slider-item" uuid="'+item+'">';
							str += 		'<img src="'+img+'">';
							str += '</div>'
							if(index == 0) {
								first += '<div class="mui-slider-item mui-slider-item-duplicate">';
								first += 	'<img src="'+img+'">';
								first += '</div>';
							} 
							
							if(index == arr.length-1) {
								last += '<div class="mui-slider-item mui-slider-item-duplicate">';
								last += '<img src="'+img+'">';
								last += '</div>';
							} 
						});
				
			}
				str =divStr + last + str + first + divLast ;	
				return str;
		}
		/*加载场馆设施*/
		function equipment (venueId) {
			topUtil.web_query('/mobile/venue/equipment/venueEquipment', {venueId:venueId}, function(data) {
				if (typeof data == "string") {
	               data = JSON.parse(data);
	            }
				if(data.length>0) {
					var str = '';
					var classStr = '';
					mui.each(data, function (index, item) {
						if (index == 0) {
							str += '<a class="mui-control-item mui-active" href="#'+item.id+'">'+item.name+'</a>';
							classStr += '<div id="'+item.id+'" class="mui-slider-item mui-control-content mui-active">';
							classStr += '<div class="siteInfo"><div class="con"><span style="font-weight:bold;">开放时间：</span>'+ifNull(item.businessHours)+'<br><span style="font-weight:bold;">项目描述：</span>'+ifNull(item.description)+'</div></div>';
							classStr += equipmentImg(item.equipmentImgUuids);
							//classStr += orderDate(item.id);
							classStr += equipmentInstall(item.floor,item.lighting,item.restingArea);
							classStr += '</div>';
						}else {
							str += '<a class="mui-control-item" href="#'+item.id+'">'+item.name+'</a>';
							classStr += '<div id="'+item.id+'" class="mui-slider-item mui-control-content mui-active">';
							classStr += '<div class="siteInfo"><div class="con"><span style="font-weight:bold;">开放时间：</span>'+ifNull(item.businessHours)+'<br><span style="font-weight:bold;">项目描述：</span>'+ifNull(item.description)+'</div></div>';
							classStr += equipmentImg(item.equipmentImgUuids);
							//classStr += orderDate(item.id);
							classStr += equipmentInstall(item.floor,item.lighting,item.restingArea);
							classStr += '</div>';
						}
					});
					$("#itemTab").append(str);
					$('#equipmentType').append(classStr);
					//把根据 id 取标签改为根据 name 取  解决id重复从而图片不轮播的错误	
					mui("div[name='sliderEquipImg']").slider({
						interval: 3000
					});
					//equipmentTypeScroll();
				}else{
					$("#slider").attr('class','noEquip');
				}
			})
		}
		
		/*加载教练信息*/
		function coach (venueId) {
			topUtil.web_query('/mobile/venue/user/search', {search_EQ_venueId:venueId,search_EQ_type:1}, function(data) {
				if (typeof data == "string") {
	               data = JSON.parse(data);
	           	}
				var str = '';
				if (data) {
					mui.each(data, function(index,item) {
						str += '<div class="news bt"><li data-coach="'+item.uuid+'" data-user="'+item.id+'"><img class="headImg" src="'+item.imgUrl+'" alt="" /><div class="siteInfo">';
						str += '<div class="siteName">'+item.name+'</div><div class="con">电话：<span>'+item.mobile+'</span></div></div></li></div>';
					});
					$('#venueCoach').append(str);
					toCoach();
				}
			});
		}
		
		function toCoach () {
			$('#venueCoach li').on('tap', function () {
				var coachUuid = $(this).attr('data-coach');
				var userId = $(this).attr('data-user');
				mui.openWindow({
						    url: dynamicURL+'mobile/venue/view/toCoach?userId='+userId+'&coachUuid='+coachUuid,
						    id : 'mobile/venue/view/toCoach',
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
		
		function vealuateList (venueId) {
			var params = {};
			params.search_EQ_venueId = venueId;
			params.page = 1;
			params.rows = 3;
			params.sort = 'gmtCreate';
			params.order = 'desc';
			
			topUtil.web_query('/mobile/venue/vealuate/list', params, function (data) {
				if (typeof data == "string") {
	               data = JSON.parse(data);
	          }
				if (data.rows) {
					var str = '';
					mui.each(data.rows,function (index, item) {
						str += '<div class="news bt"><div class="news-header"><img src="'+item.userPhoto+'" alt="">';
						str += '<span class="imgrcol" style="margin-top:10px"><span class="username">'+item.userName+'</span>';
						var star = item.starLevel*10
						str += '<span class="mid-rank-stars mid-str'+star+'"></span>';
						str += '</span></div><div class="news-body"><div class="newsText">'+item.content+'</div></div>';
						str += '<div class="news-footer"><span>'+item.timeWrapper+'</span></div></div>';
					});
					if (data.total > 3) {
						var num = data.total;
						str += '<a class="allComment" onclick="allVealuate(venueId)">查看全部评论<span>('+num+')</span></a>';
					}
					$("#vealuate").append(str);
				}
			});
		}
		//查看全部评价
		function allVealuate(venueId){
			mui.openWindow({
			    url: dynamicURL+'mobile/venue/vealuate/toAllVenueVealuate?venueId='+venueId, 
			    id : 'mobile/venue/vealuate/toAllVenueVealuate',
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
		function order (id) {
			  if (constants.getLoginStatus() == 0) {
				 mui.toast('请返回在市北登录后使用该功能！');
				 //constants.toLoginPage();
			} else if (constants.getLoginStatus() == 1) { 
				mui.openWindow({
				    url: dynamicURL+'mobile/venue/view/toOrderInfo?venueId='+venueId+'&equipmentId='+id, 
				    id : 'mobile/venue/view/toOrderInfo',
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
		}
		//预约显示
		function orderDate(equipId){
			var today = GetDateStr(0);
			var  tomorrow = GetDateStr(1);
			var afterTomorrow = GetDateStr(2);
			var classStr = '<div class="bookCol">';
			classStr += '<div class="book"><div class="week">'+today.weekStr+'</div><div class="date">'+today.dateStr+'</div><div class="bookbtn" onclick="order('+equipId+')">预定</div></div>';
			classStr += '<div class="book"><div class="week">'+tomorrow.weekStr+'</div><div class="date">'+tomorrow.dateStr+'</div><div class="bookbtn" onclick="order('+equipId+')">预定</div></div>';
			classStr += '<div class="book"><div class="week">'+afterTomorrow.weekStr+'</div><div class="date">'+afterTomorrow.dateStr+'</div><div class="bookbtn" onclick="order('+equipId+')">预定</div></div>';
			classStr += '</div>';
			return classStr;
		}
		//日期操作  
		function GetDateStr(AddDayCount) {
			var day = {};
			var dd = new Date(); 
			dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期 
			var y = dd.getFullYear(); 
			var m = dd.getMonth()+1;//获取当前月份的日期 
			var d = dd.getDate();
			var week = dd.getDay();
			var weekStr = '';
			switch(week){
			case 0 : weekStr='周日';break;
			case 1 : weekStr='周一';break;
			case 2 : weekStr='周二';break;
			case 3 : weekStr='周三';break;
			case 4 : weekStr='周四';break;
			case 5 : weekStr='周五';break;
			case 6 : weekStr='周六';break;
			}
			day.weekStr = weekStr;
			var monthStr = m>9?m.toString():'0'+m;
			var dayStr = d>9?d.toString():'0'+d;
			var dateStr = monthStr+"月"+dayStr+"日";
			day.dateStr =dateStr;
			return day; 
		} 
		
      /*   document.getElementById('mobileBtn').addEventListener('tap',function () {
			var phone = $("#mobile").val();
		        callPhone(phone);
			},false); */
        
    /*     function callPhone(phone){
			if(phone == '' || phone == null){
				mui.toast('很抱歉，商家暂未设置电话',{duration:'short'});
				return false;
			}
			plus.device.dial(phone,true);
		} */
        </script>
</body>
</html>