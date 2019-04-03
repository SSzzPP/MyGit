<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>

<body>
    <div class="container">
        <jsp:include page="../header.jsp" />
<%-- 		<div class="line-big margin-big-top">
	        <div class="xs12">
	            <ul class="bread">
	                <li>当前位置：</li>
	                <li><a href="#">${title }</a></li>
	            </ul>
	        </div>
	    </div>
 --%>	
	    <div class="line-big margin-big-top">
	        <div class="xs12">
	            <div class="col col-border-top">
	                <div class="col-head">
	                    <span>${title }</span>
	                </div>
	                <div class="col-body">
	                    <ul id="info">
	                        <!-- <li>
	                            <p class="link title">
	                                <a class="articleid" href="javascript:void(0)" onclick="window.location.href='venueInfoDetails.html'">市北健身中心举办健身知识竞赛</a>
	                            </p>
	                            <p class="time"><span class="wp-new-ar-pro-time">2018-06-16</span></p>
	                        </li>
	                        <li>
	                            <p class="link title">
	                                <a class="articleid" href="">暂未发布消息</a>
	                            </p>
	                            <p class="time"><span class="wp-new-ar-pro-time">2018-06-16</span></p>
	                        </li>
	                        <li>
	                            <p class="link title">
	                                <a class="articleid" href="">暂未发布消息</a>
	                            </p>
	                            <p class="time"><span class="wp-new-ar-pro-time">2018-06-16</span></p>
	                        </li>
	                        <li>
	                            <p class="link title">
	                                <a class="articleid" href="">暂未发布消息</a>
	                            </p>
	                            <p class="time"><span class="wp-new-ar-pro-time">2018-06-16</span></p>
	                        </li>
	                        <li>
	                            <p class="link title">
	                                <a class="articleid" href="">暂未发布消息</a>
	                            </p>
	                            <p class="time"><span class="wp-new-ar-pro-time">2018-06-16</span></p>
	                        </li> -->
	                    </ul>
	                </div>
	            </div>
	            <div id="Pagination" class="pagination" style="margin-top:50px;"></div>
	        </div>
	    </div>
	
	</div>
	<jsp:include page="../footer.jsp" />
	<script>
		/* $(function(){
		    $(".scroll").myScroll({
		        speed:40, //数值越大，速度越慢
		        rowHeight:265
		    });
		}) */
		var type = "${type}";
		/* 分页用的参数 */
	    var pageSize = 10;
	    var page = "";
		initInfo(0);
		function initInfo(pageNum){
			var params = {
				'page':pageNum+1,
				'rows':pageSize
			};
			var url = '';
			if(type != "" && type == 1){
				params.order = 'desc';
				params.search_EQ_type = 1
				/* url = '${dynamicURL}/front/information/info/list?order=desc&search_EQ_type=1'; */
				url = '${dynamicURL}/front/information/info/list';
			}else if("${moduleName != null}"){
				params.order = 'desc';
				params.search_EQ_moduleName = "${moduleName}";
				url += '${dynamicURL}/front/information/info/listByModule';
				/* url += '${dynamicURL}/front/information/info/listByModule?order=desc&search_EQ_moduleName='+"${moduleName}"; */
			}
			$.ajax({
				url:url,
				data:params,
				type:"post",
				dataType:"json",
				success:function(result){
					if(result){
						$("#info").children().remove();
						$.each(result.rows,function(i,v){
							var str = '<li onclick="details('+v.id+')">'+
										'<p class="link title">'+
											'<a class="articleid">'+v.title+'</a>'+
										'</p>'+
										'<p class="time"><span class="wp-new-ar-pro-time">'+getTimeWithoutHMS(v.gmtCreate)+'</span></p>'+
									'</li>';
							$("#info").append(str);
							
						});
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
				},
				error:function(){}
			});
		}
		function details(id){
			window.location.href='${dynamicURL}/front/toInformationDetails?id='+id;
		}
		//分页的回调
		function pageselectCallback(page_index, jq){
			$("#Pagination").find(":first").attr("style","margin-left:1%;");
			text = "-";
			page = page_index;
			initInfo(page_index);
			return false;
		}
		//去除时间格式里的时分秒
		function getTimeWithoutHMS(value){
			value=value.substr(0,value.indexOf(" "));
			var str = Date.parse(value);
			if(!Boolean(str)){
				return "";
			}
			var date = new Date(str);
			return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+(date.getDate());
		}
	</script>
</body>
</html>


