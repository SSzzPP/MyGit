<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    
    <title>市北区体育局业务管理系统</title>
    <style>
        .setheight{
            height:133px;
        }
        .info{
            background-color: #015293;
            padding:10px;
        }
        .peopleinfo{
            padding:30px 10px;
        }
        .people{
            color:#fff;
            font-size:20px;
            font-weight:bold;
        }
        .info p{
            color:#fff;
            margin-bottom:10px;
        }
        .imgbox{
            width:90px;
            height:113px;
            border-radius:5px;
        }
        .imgbox img{
            width:100%;
            height:inherit;
            border-radius:5px;
        }
        .baseinfo{
            background-color: #fff;
            padding:20px;
        }
        h1{
            /* color:#75b74b; */
            font-size:18px;
            font-weight:bold;
        }
        .baseinfo-box{
            margin:10px 0;
        }
        .baseinfo-box li{
            list-style:none;
            height:20px;
            line-height:20px;
        }
        .name{
            color:#999;
            font-size:12px;
        }
        .table tbody tr:nth-child(even) td  {
            background-color: #fff;
        }
        .top{
            height:50px;
            width:100%;
            line-height:50px;
            padding-left:10px;
            font-size:18px;
            font-weight: bold;
            /* color: #75b74b; */
            background:linear-gradient(to bottom, #fcfcfc 0%,#ebebeb 100%);
        }
        .table-responsive-y{
            border:1px solid #ddd;
        }
        th,.top {
            background:linear-gradient(to bottom, #fcfcfc 0%,#ebebeb 100%);
        }
        .layadmin-homepage-list-imgtxt .media-body .pad-btm .fontColor a {
			font-weight: 600;
			color: #337ab7
		}
		.layui-layer-dialog{
			top: 200px !important;
		}
    </style>
</head>

<body>
    <div class="container">
        <jsp:include page="../header.jsp" />
<div class="line-big margin-big-top min-height">
        <div class="xs3">
            <div class="xs12 padding" style="background-color: #e6e6e6;">
                <div class="info setheight">
                    <div class="imgbox float-left">
                        <img id="headImg" src="${dynamicURL}/front/venue/user/userHeadImg?uuid=${entity.uuid}">
                    </div>
                    <div class="peopleinfo float-left">
                        <p class="people">${entity.name}</p>
                        <p>
                        	<span><c:choose><c:when test="${!empty entity.sex && entity.sex == '0'}">男</c:when><c:otherwise>女</c:otherwise></c:choose></span>&nbsp;|&nbsp;
                        	<span><fmt:formatDate pattern="yyyy-MM-dd" value="${entity.birthday}" /></span>
                        </p>
                    </div>
                </div>
                <div class="baseinfo margin-top">
                    <h1>基本信息</h1>
                    <ul class="baseinfo-box">
                        <li class="name">场馆：</li>
                        <li>${entity.venueName}</li>
                    </ul>
                    <ul class="baseinfo-box">
                        <li class="name">手机号码：</li>
                        <li>${entity.mobile}</li>
                    </ul>
                    <ul class="baseinfo-box">
                        <li class="name">电子邮箱：</li>
                        <li>${entity.email}</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="xs9">
            <div class="table-responsive-y">
                <div class="top"><span>教练证书</span></div>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>名称</th>
                    </tr>
                    </thead>
                    <tbody id="venueCerificate">

                    </tbody>
                </table>
            </div>
            <div class="table-responsive-y margin-big-top">
                <div class="top"><span>课程情况</span></div>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th width="15%;" >名称</th>
                        <th width="15%;">收费标准</th>
                        <th width="55%;">描述</th>
                        <th width="15%">操作</th>
                    </tr>
                    </thead>
                    <tbody id="venueCourse">
                    
                    </tbody>
                </table>
            </div>
            <div class="table-responsive-y margin-big-top">
                <div class="top"><span>执教评价</span></div>
                <div class="layui-col-md12 layadmin-homepage-list-imgtxt message-content" id="venueVealuate">
					
				</div>
            </div>
        </div>
    </div>
	
	</div>
	<jsp:include page="../footer.jsp" />
	<script>
		getVenueCerificate();
		getVenueCourse();
		getVenueVealuate();
		//教练证书
		function getVenueCerificate(){
			$.ajax({
				url:'${dynamicURL}/front/venue/cerificate/list?search_EQ_userId=${entity.id}',
				type:"post",
				dataType:"json",
				success:function(result){
					if(result){
						$.each(result.rows,function(i,v){
							$("#venueCerificate").append(
								'<tr>' +
									'<td>' + v.name + '</td>' +
								'<tr>'
							);
						});
					}
				},
				error:function(){}
			});
		}
		//教练课程
		function getVenueCourse(){
			$.ajax({
				url:'${dynamicURL}/front/venue/course/list?search_EQ_userId=${entity.id}',
				type:"post",
				dataType:"json",
				success:function(result){
					if(result){
						$.each(result.rows,function(i,v){
							$("#venueCourse").append(
								'<tr>' +
									'<td>' + v.name + '</td>' +
									'<td>' + v.feeScale + '元</td>' +
									'<td>' + v.courseDescribe + '</td>' +
									'<td><button type="button" class="layui-btn layui-btn-sm layui-btn-normal" onclick="venueOrder('+v.id+')">预约</button></td>'+
								'</tr>'
							);
						});
					}
				},
				error:function(){}
			});
		}
		//教练评价
		function getVenueVealuate(){
			$.ajax({
				url:'${dynamicURL}/front/venue/vealuate/user/list?search_EQ_userId=${entity.id}',
				type:"post",
				dataType:"json",
				success:function(result){
					if(result==null){
						return;
					}
					if(result.rows.length<3){
						$('#moreInfo').attr('class','noData');
					}
					if(result.rows.length==0){
						if($('#vealuateBox .media-body').length==0){
							$('#moreInfo').attr('class','noData');
							$("#vealuateBox").append('<div class="noDataContent"><p>该场馆暂无评价信息<p></div>');
						}
						return;
					}	
					loadList(result.rows);
				},
				error:function(){}
			});
		}
		function loadList(data){
			var str = "";
			$(data).each(function(i,obj){
				var url="${dynamicURL}/front/venue/user/userHeadImg?uuid="+obj.uuid;
				str+='<div class="media-body">';
				str+='<a href="javascript:;" class="media-left" style="float: left;">';
				str+='<img src="'+url+'" ';
				str+='width="46px" height="46px">';
				str+='</a>';
				str+='<div class="pad-btm">';
				str+='<p class="fontColor">';	
				str+='<a href="javascript:;">'+obj.venueCourseName+'	'+obj.userName+'</a><span '
				str+='class="'+formatStar(obj.starLevel)+'" title="场馆服务" name="starBox"></span>';
				str+='</p>';
				str+='<p class="min-font">';	
				str+='<span class="layui-breadcrumb" lay-separator="-"'	;	
				str+='style="visibility: visible;"> <a href="javascript:;"'			
				str+='class="layui-icon layui-icon-cellphone" ></a><span';
				str+='lay-separator="">-</span> <a href="javascript:;">从移动</a><span ';		
				str+='lay-separator="">-</span> <a href="javascript:;">'+obj.gmtCreate+'</a>';		
				str+='</span> <span class="layui-icon layui-icon-down icon-right" data-veaId="'+obj.id+'"></span>';	
				str+='</p>';
				str+='</div>';
				str+='<p class="message-text">'+obj.content+'</p>';
				str+='<table class="layui-table" name ="aaaa">';
				str+='</table> ';
				str+='</div>';
			});
			$("#venueVealuate").append(str);
		}
		function formatStar(starLevel){
			var star = starLevel*10;
			starClass="sml-rank-stars sml-str"+star;
			return starClass;
		}
		function venueOrder(){
			layui.use('layer', function(){
				  var layer = layui.layer;
				  layer.alert('暂未开放');
				});
		}
	</script>
</body>
</html>


