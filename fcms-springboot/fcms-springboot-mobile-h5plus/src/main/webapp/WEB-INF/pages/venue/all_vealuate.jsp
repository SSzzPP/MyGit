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
			.bt {
				border-bottom: 1px solid #e6e6e6;
				padding-bottom: 5px;
			}	
			.setmar {
    			margin-top: 0px;
			}
	</style>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">全部评论</h1>
	</header>
	
	<div class="mui-content">
		<div class="mui-menu setmar ">
			<div class="mui-row">
					<div class="mui-col-xs-12">
						<div class="infoData" id="vealuate">
						</div>
					</div>
			</div>
		</div>
	</div>
	
	<script>
	var vealuateType='${vealuateType}'
	var venueId = '${venueId}';
	var coachId = '${coachId}';
	mui.init({
		swipeBack: false //关闭右滑关闭功能
	});
	mui.ready(function(){
		vealuateList(venueId,coachId,vealuateType);
	});
	function vealuateList (venueId,coachId,vealuateType) {
		var params = {};
		params.sort = 'gmtCreate';
		params.order = 'desc';
		var url='';
		if(vealuateType==1){
			params.search_EQ_venueId = venueId;
			url='/mobile/venue/vealuate/list'
		}
		if(vealuateType==2){
			params.search_EQ_userId = coachId;
			url='/mobile/vealuate/user/list'
		}
		topUtil.web_query(url, params, function (data) {
			if (typeof data == "string") {
               data = JSON.parse(data);
          }
			if (data.rows) {
				var str = '';
				mui.each(data.rows,function (index, item) {
					str += '<div class="news bt"><div class="news-header"><img src="'+dynamicURL+'mobile/venue/user/userHeadImg?uuid='+item.uuid+'" alt="">';
					str += '<span class="imgrcol" style="margin-top:10px"><span class="username">'+item.userName+'</span>';
					var star = item.starLevel*10
					str += '<span class="mid-rank-stars mid-str'+star+'"></span>';
					str += '</span></div><div class="news-body"><div class="newsText">'+item.content+'</div></div>';
					str += '<div class="news-footer"><span>'+item.timeWrapper+'</span></div></div>';
				});
				$("#vealuate").append(str);
			}
		});
	}
	</script>
</body>
</html>