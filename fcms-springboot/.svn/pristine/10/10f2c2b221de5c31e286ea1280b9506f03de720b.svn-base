<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
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
</head>
<body>
    <div class="container">
    
		<jsp:include page="header.jsp" />

        <div class="line-big margin-big-top">
            <div class="xs8">
            	<div id="lunboDiv" class="slider-carousel index_focus"> 
            	
               	</div>
            </div>
            <div class="xs4">
                <div class="col" style="height:300px;">
                    <div class="col-head">
                        <span>系统资讯</span>
                        <span><a onclick="window.location.href='${dynamicURL}/front/information?moduleName=banner'">MORE</a></span>
                    </div>
                    <div class="col-body" style="height:250px;">
                        <ul id="banner">
                        
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="line-big margin-big-top">
            <div class="xs4">
                <div class="col col-border-top">
                    <div class="col-head">
                        <!-- <span>政策文件</span> -->
                        <span>赛事资讯</span>
                        <span><a onclick="window.location.href='${dynamicURL}/front/information?moduleName=events'">MORE</a></span>
                    </div>
                    <div class="col-body">
                        <ul id="events">
                        
                        </ul>
                    </div>
                </div>
            </div>
            <div class="xs4">
                <div class="col col-border-top">
                    <div class="col-head">
                        <span>法律法规</span>
                        <span><a onclick="window.location.href='${dynamicURL}/front/information?moduleName=regulation'">MORE</a></span>
                    </div>
                    <div class="col-body">
                        <ul id="regulation">
                        
                        </ul>
                    </div>
                </div>
            </div>
            <div class="xs4">
                <div class="col col-border-top">
                    <div class="col-head">
                        <span>服务指南</span>
                    </div>
                    <div class="col-body">
                       <%--  <div class="teb-menu teb-border">
                            <a href="">
                                <img src="${staticURL}/images/01.png" alt=""/>
                                <span>健身知识</span>
                            </a>
                        </div>
                        <div class="teb-menu teb-border">
                            <a href="">
                                <img src="${staticURL}/images/02.png" alt=""/>
                                <span>预约咨询</span>
                            </a>
                        </div>
                        <div class="teb-menu teb-border">
                            <a href="">
                                <img src="${staticURL}/images/03.png" alt=""/>
                                <span>健身指南</span>
                            </a>
                        </div>
                        <div class="teb-menu">
                            <a href="">
                                <img src="${staticURL}/images/04.png" alt=""/>
                                <span>场馆荣誉</span>
                            </a>
                        </div>
                        <div class="teb-menu">
                            <a href="javascript:void(0)" onclick="window.location.href='${dynamicURL}/front/userMap'">
                                <img src="${staticURL}/images/05.png" alt=""/>
                                <span>场馆分布</span>
                            </a>
                        </div>
                        <div class="teb-menu">
                            <a href="">
                                <img src="${staticURL}/images/06.png" alt=""/>
                                <span>健身数据</span>
                            </a>
                        </div> --%>
                        <div class="teb-menu">
                            <a href="javascript:void(0)" onclick="window.location.href='${dynamicURL}/front/pubEquipment'">
                                <img src="${staticURL}/images/04.png" alt=""/>
                                <span>健身路径</span>
                            </a>
                        </div>
                        <div class="teb-menu">
                            <a href="javascript:void(0)" onclick="window.location.href='${dynamicURL}/front/userMap'">
                                <img src="${staticURL}/images/05.png" alt=""/>
                                <span>场馆分布</span>
                            </a>
                        </div>
                        <div class="teb-menu">
                            <a href="javascript:void(0)" onclick="checkLogin('front/survey')">
                                <img src="${staticURL}/images/06.png" alt=""/>
                                <span>调查问卷</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="line-big margin-big-top">
            <div class="xs12">
                <div class="col col-border-top" style="height: 245px;">
                    <div class="col-head">
                        <span>健身场馆</span>
                        <span><a href="javascript:void(0)" onclick="window.location.href='${dynamicURL}/front/venue'">MORE</a></span>
                    </div>
                    <div class="col-body">
                        <div class="scroll">
                            <ul class="featureUL" style="width: 2660px;" id="venueInfo">
                            
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
		<div class="line-big margin-big-top">
            <div class="xs12">
                <div class="col col-border-top" style="height: 245px;">
                    <div class="col-head">
                        <span>健身路径</span>
                        <span><a href="javascript:void(0)" onclick="window.location.href='${dynamicURL}/front/pubEquipment'">MORE</a></span>
                    </div>
                    <div class="col-body">
                        <div class="scroll">
                            <ul class="featureUL" style="width: 2660px;" id="venuePublic">
                            
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- <div class="line-big margin-big-top">
            <div class="xs4">
                <div class="col col-border-top">
                    <div class="col-head">
                        <span>监管信息</span>
                        <span><a href="">MORE</a></span>
                    </div>
                    <div class="col-body">
                        <ul>
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
                            </li>
                            <li>
                                <p class="link title">
                                    <a class="articleid" href="">暂未发布消息</a>
                                </p>
                                <p class="time"><span class="wp-new-ar-pro-time">2018-06-16</span></p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="xs4">
                <div class="col col-border-top">
                    <div class="col-head">
                        <span>健身大数据</span>
                        <span><a href="">MORE</a></span>
                    </div>
                    <div class="col-body">
                        <ul>
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
                            </li>
                            <li>
                                <p class="link title">
                                    <a class="articleid" href="">暂未发布消息</a>
                                </p>
                                <p class="time"><span class="wp-new-ar-pro-time">2018-06-16</span></p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="xs4">
                <div class="col col-border-top">
                    <div class="col-head">
                        <span>系统资讯</span>
                        <span><a href="">MORE</a></span>
                    </div>
                    <div class="col-body">
                        <ul>
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
                            </li>
                            <li>
                                <p class="link title">
                                    <a class="articleid" href="">暂未发布消息</a>
                                </p>
                                <p class="time"><span class="wp-new-ar-pro-time">2018-06-16</span></p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div> -->

        <%-- <div class="line-big margin-big-top">
            <div class="xs12">
                <div class="col col-border-top" style="height:245px;">
                    <div class="col-head">
                        <span>教练介绍</span>
                        <span><a href="">MORE</a></span>
                    </div>
                    <div class="col-body">
                        <div class="scroll">
                            <ul class="featureUL" style="width: 2660px;">
                                <li class="featureBox">
                                    <div class="box">
                                        <div class="imgcol">
                                            <a href="">
                                                <img src="${staticURL}/images/site/PT_EF24322291EF595.jpg">
                                            </a>
                                        </div>
                                        <div class="imgtitle" onclick="window.location.href=''">中联户外足球场</div>
                                    </div>
                                </li>
                                <li class="featureBox">
                                    <div class="box">
                                        <div class="imgcol">
                                            <a href="">
                                                <img src="${staticURL}/images/site/PT_ET16602840ET620.jpg">
                                            </a>
                                        </div>
                                        <div class="imgtitle" onclick="window.location.href=''">中联壁球馆</div>
                                    </div>
                                </li>
                                <li class="featureBox">
                                    <div class="box">
                                        <div class="imgcol">
                                            <a href="">
                                                <img src="${staticURL}/images/site/PT_ET16401870ET277.jpg">
                                            </a>
                                        </div>
                                        <div class="imgtitle" onclick="window.location.href=''">中联乒乓球馆</div>
                                    </div>
                                </li>
                                <li class="featureBox">
                                    <div class="box">
                                        <div class="imgcol">
                                            <a href="">
                                                <img src="${staticURL}/images/site/PT_ET16300870ET655.jpg">
                                            </a>
                                        </div>
                                        <div class="imgtitle" onclick="window.location.href=''">中联羽毛球馆</div>
                                    </div>
                                </li>
                                <li class="featureBox">
                                    <div class="box">
                                        <div class="imgcol">
                                            <a href="">
                                                <img src="${staticURL}/images/site/PT_ET06902810ET132.jpg">
                                            </a>
                                        </div>
                                        <div class="imgtitle" onclick="window.location.href=''">中联游泳馆</div>
                                    </div>
                                </li>
                                <li class="featureBox">
                                    <div class="box">
                                        <div class="imgcol">
                                            <a href="">
                                                <img src="${staticURL}/images/site/PT_ET06700850ET976.jpg">
                                            </a>
                                        </div>
                                        <div class="imgtitle" onclick="window.location.href=''">市北健身中心</div>
                                    </div>
                                </li>
                                <li class="featureBox">
                                    <div class="box">
                                        <div class="imgcol">
                                            <a href="">
                                                <img src="${staticURL}/images/site/PT_EF17322121EE716.jpg">
                                            </a>
                                        </div>
                                        <div class="imgtitle" onclick="window.location.href=''">中联运动公园</div>
                                    </div>
                                </li>
                                <li class="featureBox">
                                    <div class="box">
                                        <div class="imgcol">
                                            <a href="">
                                                <img src="${staticURL}/images/site/PT_EF37323181EE699.jpg">
                                            </a>
                                        </div>
                                        <div class="imgtitle" onclick="window.location.href=''">杰克台球俱乐部</div>
                                    </div>
                                </li>
                                <li class="featureBox">
                                    <div class="box">
                                        <div class="imgcol">
                                            <a href="">
                                                <img src="${staticURL}/images/site/PT_ET28221370EX720.jpg">
                                            </a>
                                        </div>
                                        <div class="imgtitle" onclick="window.location.href=''">青岛市漫城台球俱乐部</div>
                                    </div>
                                </li>
                                <li class="featureBox">
                                    <div class="box">
                                        <div class="imgcol">
                                            <a href="">
                                                <img src="${staticURL}/images/site/PT_EF47325121EE845.jpg">
                                            </a>
                                        </div>
                                        <div class="imgtitle" onclick="window.location.href=''">青岛市博克名流台球俱乐部</div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div> --%>
    </div>
    <jsp:include page="footer.jsp" />
    <script src='${staticURL}/js/scroll.js'></script>
    <script>
        $(function(){
            $(".scroll").myScroll({
                speed:40, //数值越大，速度越慢
                rowHeight:265
            });
        });
        banner();
        events();
        regulation();
		venueInfo();
		venuePublic();
		/* 通知公告*/
        function banner(){
        	$.ajax({
				url:'${dynamicURL}/front/information/info/listByModule?rows=5&order=desc&search_EQ_moduleName=banner',
				type:"post",
				dataType:"json",
				success:function(result){
					if(result){
						$.each(result.rows,function(i,v){
							var str = '<li onclick="details('+v.id+')">'+
										'<p class="link title">'+
											'<a class="articleid">'+getStr(v.title,15)+'</a>'+
										'</p>'+
										'<p class="time"><span class="wp-new-ar-pro-time">'+getTimeWithoutHMS(v.gmtCreate)+'</span></p>'+
									'</li>';
							$("#banner").append(str);
						});
					}
				},
				error:function(){}
			});
		}
        /* 体育赛事*/
        function events(){
        	$.ajax({
				url:'${dynamicURL}/front/information/info/listByModule?rows=5&order=desc&search_EQ_moduleName=events',
				type:"post",
				dataType:"json",
				success:function(result){
					if(result){
						$.each(result.rows,function(i,v){
							var str = '<li onclick="details('+v.id+')">'+
										'<p class="link title">'+
											'<a class="articleid">'+getStr(v.title,15)+'</a>'+
										'</p>'+
										'<p class="time"><span class="wp-new-ar-pro-time">'+getTimeWithoutHMS(v.gmtCreate)+'</span></p>'+
									'</li>';
							$("#events").append(str);
						});
					}
				},
				error:function(){}
			});
		}
		/* 法律法规*/
        function regulation(){
        	$.ajax({
				url:'${dynamicURL}/front/information/info/listByModule?rows=5&order=desc&search_EQ_moduleName=regulation',
				type:"post",
				dataType:"json",
				success:function(result){
					if(result){
						$.each(result.rows,function(i,v){
							var str = '<li onclick="details('+v.id+')">'+
										'<p class="link title">'+
											'<a class="articleid">'+getStr(v.title,15)+'</a>'+
										'</p>'+
										'<p class="time"><span class="wp-new-ar-pro-time">'+getTimeWithoutHMS(v.gmtCreate)+'</span></p>'+
									'</li>';
							$("#regulation").append(str);
						});
					}
				},
				error:function(){}
			});
		}
        /* 场馆介绍 */
        function venueInfo(){
        	$.ajax({
				url:'${dynamicURL}/front/venue/info/searchWithPic',
				type:"post",
				dataType:"json",
				success:function(result){
					if(result.length){
						var sliderStr ='';
						$.each(result,function(i,v){
							if(v.mainImageUuid != "" && v.mainImageUuid != null){
								var filePath = '${dynamicURL}/front/venue/info/venueImg?uuid='+v.mainImageUuid;
								if(i<=4){
									//首页图片轮播
									sliderStr+='<div class="item" onclick="venueDetails('+v.id+')">';
									sliderStr+=		'<div class="pannel-image"><a><img src="${dynamicURL}/front/venue/view/showImg?uuid='+v.mainImageUuid+'"></a></div>';
									sliderStr+=		'<div class="titBg">&#160;</div>';
									sliderStr+=		'<div class="subtitle">';
									sliderStr+=			'<h6><a>'+v.name+'</a></h6>';
									sliderStr+=		'</div>';
									sliderStr+='</div>';
								}
						    	var venueInfoStr = '<li class="featureBox" onclick="venueDetails('+v.id+')">'+
						                                '<div class="box">'+
							                                '<div class="imgcol">'+
							                                        '<img src="'+filePath+'">'+
							                                '</div>'+
							                                '<div class="imgtitle" >'+v.name+'</div>'+
							                            '</div>'+
							                        '</li>';
								$("#venueInfo").append(venueInfoStr);
							}
						});
						$("#lunboDiv").append(sliderStr);
						initSlide();
					}
				},
				error:function(){}
			});
		}
        
        /* 健身路径 */
        function venuePublic(){
        	$.ajax({
				url:'${dynamicURL}/front/venue/equipment/type/searchWithPic',
				type:"post",
				dataType:"json",
				success:function(result){
					if(result.length){
						$.each(result,function(i,v){
							if(v.mainImageUuid != "" && v.mainImageUuid != null){
						    	var filePath = '${dynamicURL}/front/venue/equipment/type/showImg?uuid='+v.mainImageUuid;
						    	var venuePublicStr = '<li class="featureBox" onclick="pubEquipDetails('+v.id+')">'+
						                                '<div class="box">'+
							                                '<div class="imgcol" >'+
							                                        '<img src="'+filePath+'">'+
							                                '</div>'+
							                                '<div class="imgtitle">'+v.name+'</div>'+
							                            '</div>'+
							                        '</li>';
								$("#venuePublic").append(venuePublicStr);
							}
						});
					}
				},
				error:function(){}
			});
		}
		//截取字符串
		function getStr(str,num){
			if(str.length>num){
				return str.substr(0,num)+"···";
			}else{
				return str;
			}
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
        function venueDetails(venueId){
        	window.location.href='${dynamicURL}/front/toVenueDetails?venueId='+venueId;
        }
        function pubEquipDetails(equipmentId){
        	window.location.href='${dynamicURL}/front/toEquipmentDetails?equipmentId='+equipmentId;
        }
        function details(id){
        	window.location.href='${dynamicURL}/front/toInformationDetails?id='+id;
		}
    </script>
</body>
</html>

