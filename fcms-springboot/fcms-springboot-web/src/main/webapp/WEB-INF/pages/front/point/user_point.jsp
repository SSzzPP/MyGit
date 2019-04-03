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
                    	<!-- <p class="people">张小凡</p> -->
                        <p class="people">${entity.name}</p>
                        <p>
                        	<!-- <span>男</span>&nbsp;|&nbsp;
                        	<span>1995-01-03</span> -->
                        	<span><c:choose><c:when test="${!empty entity.sex && entity.sex == '0'}">男</c:when><c:otherwise>女</c:otherwise></c:choose></span>&nbsp;|&nbsp;
                        	<span><fmt:formatDate pattern="yyyy-MM-dd" value="${entity.birthday}" /></span> 
                        </p>
                    </div>
                </div>
                <div class="baseinfo margin-top">
                    <h1>基本信息</h1>
                    <ul class="baseinfo-box">
                        <li class="name">登录名</li>
                        <!-- <li>15066823128</li> -->
                        <li>${entity.loginName}</li> 
                    </ul>
                    <ul class="baseinfo-box">
                        <li class="name">手机号码：</li>
                        <!-- <li>1578383920-0</li> -->
                        <li>${entity.mobile}</li>
                    </ul>
                    <ul class="baseinfo-box">
                        <li class="name">电子邮箱：</li>
                        <!-- <li>4547478@qq.com</li> -->
                        <li>${entity.email}</li>
                    </ul>
                     <ul class="baseinfo-box">
                        <li class="name">个性签名：</li>
                        <!-- <li>我运动，我健康，我快乐</li> -->
                       	<li>${entity.experience}</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="xs9">
            <div class="table-responsive-y">
                <div class="top"><span>用户积分</span></div>
                <table class="table table-hover">
                    <thead>
                   
                    </thead>
                    <tbody id="venueCerificate">
						<tr>
							<td>积分余额<td>
							<td>${entity.blockChainTotal}积分</td>
						</tr>
						<tr>
							<td>钱包地址<td>
							<td>${entity.blockChainAddress}</td>
						</tr>
                    </tbody>
                </table>
            </div>
            <div class="table-responsive-y margin-big-top">
                <div class="top"><span>交易记录</span></div>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th width="14%;" >交易时间</th>
                        <th width="14%">确认时间</th>
                        <th width="13%;">交易标识</th>
                        <th width="13%;">交易区块</th>
                        <th width="13%">对方地址</th>
                        <th width="13%">交易数量</th>
                    </tr>
                    </thead>
                    <tbody id="tranList">
                    	
                    	<!-- <tr>
	                        <td colspan="6" style="text-align: center;">暂无记录</td>
                    	</tr> -->
                    </tbody>
                </table>
            </div>
            
        </div>
    </div>
	
	</div>
	<jsp:include page="../footer.jsp" />
	<script>
		$(function(){
			loadTranList();
		})
		function loadTranList(){
			$.submit({
				url:dynamicURL+'/front/wallet/getBlockChainDeals',
				success:function(data){
					var str='';
					
					if(data instanceof Array && data.length>0){
						console.log(11);
						$.each(data,function(index,value){
							str+='<tr>';
							str+=	'<td>'+value.timeStr+'</td>';
							str+=	'<td>'+value.blocktimeStr+'</td>';
							str+=	'<td>'+value.txid+'</td>';
	                        str+=	'<td>'+value.blockhash+'</td>';
	                        str+=	'<td>'+value.myaddresses[0]+'</td>';
	                        str+=	'<td>'+value.balanceAsset.qty+'</td>';
                    		str+='</tr>';
						});
					}else{
						str+='<tr><td colspan="6" style="text-align: center;">暂无记录</td></tr>';
					}
					console.log(str);
					$("#tranList").append(str);
				},
				error:function(){
					var str='<tr>'
                    +'<td colspan="6" style="text-align: center;">暂无记录</td>'+
                	'</tr>';
					$("#tranList").append(str);
				}
			});
		}
	</script>
</body>
</html>


