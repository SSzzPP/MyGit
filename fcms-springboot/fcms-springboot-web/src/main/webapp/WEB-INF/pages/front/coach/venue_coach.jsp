<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- meta -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<!--为了让 IE 浏览器运行最新的渲染模式，建议将此 meta 标签加入到你页面的 head 中-->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- 为了让浏览器运行高速模式下，建议将此 meta 标签加入到你页面的 head 中-->
	<meta name="renderer" content="webkit">
	<!--为了确保适当的绘制和触屏缩放，需要在 之中添加viewport元数据标签-->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<!-- 分页用JS/CSS -->
	<link href="${staticURL}/style/css/pagination.css" rel="stylesheet">
	<script type="text/javascript" src="${staticURL}/js/jquery.pagination.js"></script>
	
	<title>市北区体育局业务管理系统</title>
	<style type="text/css">
		.shop-all-list li {
		    padding: 20px 15px 38px 150px;
		}
		.pic img{
			width:90px!important;
			height:113px!important;
		}
		#venueList{
			overflow:hidden;
		}
		#venueList li{
			width:50%;
			float:left;
			cursor:pointer;
		}
	</style>
</head>
<body>
	<div class="container">
		<jsp:include page="../header.jsp" />
		<!-- <div class="line margin-big-top">
			<div class="navigation">
				<div class="nav-category J_filter_category">
					<h4>分类:</h4>
					<a href="" class="def " data-cat-id="0" data-click-name="select_cate_all_click"><span>不限</span></a>
					<div class="nc-contain">
						<div class="con">
							<div id="venueType" class="nc-items">
							   
							</div>
						</div>
					</div>
				</div>
				<div class="nav-category nav-mytabs J_filter_region">
					<h4>地点:</h4>
					<a href="" class="def cur"><span>不限</span></a>
					<div class="nc-contain">
						<div id="J_nav_tabs" class="tabs">
							<a href="javascript:void(0)" data-tab="bussi-nav" class="cur"><span class="tit">热门商区</span></a>
							<a href="javascript:void(0)" data-tab="region-nav" class=""><span class="tit">行政区</span></a>
							<a href="javascript:void(0)" data-tab="metro-nav" class=""><span class="tit">地铁线</span></a>
						</div>
						<div id="J_nt_items" class="con">
							<div class="tabCol nc-items" id="bussi-nav">
							
							</div>
							<div id="region-nav" class="tabCol nc-items Hide">
							
							</div>
							<div id="metro-nav" class="tabCol nc-items Hide">
								<a href="" data-cat-id="82214" data-click-name="select_reg_metro_click" data-click-title="3号线"><span>3号线</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> -->
		<div class="line-big min-height margin-big-top">
			<div class="xs12">
				<div class="con-border bg-white">
					<div class="shop-list J_shop-list shop-all-list" id="all-shop">
						<ul id="venueList">
						
						</ul>
					</div>
				</div>
				<div id="Pagination" class="pagination" style="margin-top:50px;"></div>
				<!-- <div class="page">
					<a href="" data-ga-page="1" class="prev" title="上一页">上一页</a>
					<a href="" data-ga-page="1" class="PageLink" title="1">1</a>
					<a class="cur">2</a>
					<a href="" data-ga-page="3" class="PageLink" title="3">3</a>
					<a href="" data-ga-page="4" class="PageLink" title="4">4</a>
					<a href="" data-ga-page="5" class="PageLink" title="5">5</a>
					<a href="" data-ga-page="6" class="PageLink" title="6">6</a>
					<a href="" data-ga-page="7" class="PageLink" title="7">7</a>
					<a href="" data-ga-page="8" class="PageLink" title="8">8</a>
					<a href="" data-ga-page="9" class="PageLink" title="9">9</a>
					<span class="PageMore">...</span>
					<a href="" data-ga-page="39" class="PageLink" title="39">39</a>
					<a href="" data-ga-page="3" class="next" title="下一页">下一页</a>
				</div> -->
			</div>
			<div class="xs3">
				<div class="aside">
					<!-- <div class="J_mkt-group-2"></div>
					<div class="J_aside-qrcode">
						<a href="">
							<div class="qrcode-aside-left">
								<p><span class="tag1">券</span><span>专享优惠</span></p>
								<p><span class="tag1 discount">惠</span><span>手机特价</span></p>
							</div>
							<div class="qrcode-aside-right"></div>
						</a>
					</div> -->
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
	<script>
	var typeId=1;
	/* 分页用的参数 */
    var pageSize = 10;
    var page = "";
	$(function(){
		loadVenueCoach(typeId,0);
	})
	function loadVenueCoach(typeId,pageNum){
		var params = {
			'page':pageNum+1,
			'rows':pageSize,
			search_EQ_type:1,
			search_EQ_typeId:typeId
		};
		$.submit({
			url: dynamicURL+"/front/user/view/list",
			data:params,
			success: function(result){
				$("#venueList").children().remove();
				if(result.rows.length>0){
						var str= '';
						$.each(result.rows,function(index,value){
							str += '<li onclick="details('+value.id+')">' +
										'<div class="pic">' +
											'<a href="javascript:void(0)" onclick="details('+value.id+')">'+
												'<img src="${dynamicURL}/front/user/view/showImg?uuid='+value.uuid+'"/>' +
											'</a>' +
										'</div>' +
										'<div class="txt1">' +
											'<div class="tit">' +
												'<h4>' + value.name + '</h4>' +
											'</div>' +
											'<div class="comment">' +
												'<span>教练性别：</span><a href=""><span>' + (value.sex == 0 ? '男' : '女') + '</span></a>' +
											'</div>' +
											'<div class="comment">' +
												'<span>联系电话：</span><a href=""><span>' + (value.mobile == null ? '暂未设置' : value.mobile) + '</span></a>'+
											'</div>'+
											'<div class="comment">' +
												'<span>所属场馆：</span><a href=""><span>' + (value.venueName == null ? '暂未设置' : value.venueName) + '</span></a>' +
											'</div>' +
											'<div class="comment">' +
												'<span>执教时间 ：</span><a href=""><span>' + (value.teachTimeStr == null ? '暂未设置' : value.teachTimeStr) + '</span></a>' +
											'</div>' +
										'</div>' +
									'</li>';
					});
					$("#venueList").append(str);
					/* 加载分页插件 */
			    	var total = result.total;
			    	if($("#Pagination").html()=="" && result.rows!=0){
						 $("#Pagination").pagination(total, {
								num_edge_entries: 1, //边缘页数
								num_display_entries: 4, //主体页数
								callback: pageselectCallback,//分页的回调方法
								items_per_page: pageSize, //每页显示的条数
								prev_text: "前一页",
								next_text: "后一页"
						 });  
					}
				}
			}
		});
	}
	function details(id){
    	window.location.href='${dynamicURL}/front/coachDetails?id='+id;
	}
	//分页的回调
    function pageselectCallback(page_index, jq){
        $("#Pagination").find(":first").attr("style","margin-left:1%;");
        text = "-";
        page = page_index;
        loadVenueCoach(typeId,page_index);
        return false;
    }
	</script>
</body>
</html>


