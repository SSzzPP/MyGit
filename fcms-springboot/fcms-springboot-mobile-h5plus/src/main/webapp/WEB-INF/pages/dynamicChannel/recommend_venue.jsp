<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<jsp:include page="dynamic_channel_index.jsp" flush="true">
		<jsp:param name="recommend_venue" value="mui-active"/>
	</jsp:include>
		<meta charset="utf-8">
		<title>Hello MUI</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<style>
			.list li img{
				width:94px;
				height:94px;
				border-radius:5px;
				margin:5px;
			}
			.siteInfo{
				flex:1;
				padding:5px;
			}
			.siteName{
				color:#43474d;
				font-size:16px;
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
		<div class="mui-content">
			<div class="mui-slider mui-fullscreen" style="top:82px;overflow:auto;">
				<div class="mui-scroll" id="pullRefresh">
					<!--<ul id="informationList" class="mui-table-view list"></ul>-->
					<ul id="venueList" class="mui-table-view list">
						
					</ul>
					<div class="mui-text-center" style="padding:15px;">
							<a id="refresh" href="javascript:void(0)">
								<span class="mui-icon iconfont icon-shuaxin"></span>
								<span>换一批</span>
							</a>
					</div>
				</div>
				
			</div>
		</div>
		<script>
		var pageRows = 4;
		var pageNum = 1;
		mui.init();
		mui.ready(function() {
	   	 	loadVenue(pageRows,pageNum);
		})		
		/*加载场馆*/
		function loadVenue(pageRows,pageNum){
			
			var params = {
				rows:pageRows,
				page:pageNum,
				sort:'id',
				order:'asc',
				search_EQ_typeId:1
			};
        	topUtil.web_query("/mobile/venue/view/list",params,
				function (data) {
					if (typeof data == "string") {
		               data = JSON.parse(data);
		            }
					var str = "";
					if(data.total != 0&&data.rows.length !=0) {
						$("#venueList").empty();
						mui.each(data.rows,function (index,item) {
							if (item.businessHours==null){
								item.businessHours = '暂未设置'
							}
							str += '<li class="mui-table-view-cell" id="'+item.id+'">';
							str += '	<img src="'+dynamicURL+'/mobile/venue/view/showImg?uuid='+item.mainImageUuid+'"/>';
							str += '	<div class="siteInfo">';						
							str += '		<div class="siteName">'+item.name+'</div>';
							str += '		<div class="con">电话：<span>'+(item.tel == null ? '暂未设置' : item.tel)+'</span></div>';
							str += '		<div class="con">营业时间：<span>'+(item.businessHours == null ? '暂未设置' : item.businessHours)+'</span></div>';
							str += '		<div class="con">地址：<span>'+(item.location == null ? '暂未设置' : item.location)+'</span></div>';
							str += '	</div>';
							str += '</li>';
						});
						$('#venueList').append(str);
						toDetail();
					}else{
						mui.toast('没有更多数据了',{duration:'short'});
					}
				});
			}
			function toDetail () {
				$("#venueList li").on('tap',function() {
					var venueId = $(this).attr("id");
					mui.openWindow({
					    url: dynamicURL+'mobile/venue/view/toVenueDetail?venueId='+venueId, 
					    id : 'mobile/venue/view',
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
			$("#refresh").on('tap',function(){
				pageNum +=1;
				loadVenue(pageRows,pageNum);
			});
		</script>
	</body>

</html>