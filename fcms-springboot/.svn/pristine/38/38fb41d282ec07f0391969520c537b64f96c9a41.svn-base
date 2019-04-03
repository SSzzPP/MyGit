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
        <div class="line margin-big-top">
            <div class="navigation">
                <div class="nav-category J_filter_category">
                    <h4>街道:</h4>
                    <a href="" class="def " data-cat-id="0" data-click-name="select_cate_all_click"><span>不限</span></a>
                    <div class="nc-contain">
                        <div class="con">
                            <div id="street" class="nc-items">
                               
                            </div>
                        </div>
                    </div>
                </div>
              
            </div>
        </div>
        <div class="line-big min-height margin-big-top">
            <div class="xs9">
                <div class="con-border">
                    <!-- <div class="filter-box J_filter_box">
                        <div class="filt-service">
                            <ul>
                                <li><a href="">智能</a><em class="sep">|</em></li>
                                <li><a href="">好评<i class="icon-arr-down"></i></a><em class="sep">|</em></li>
                                <li><a href="">人气<i class="icon-arr-down"></i></a><em class="sep">|</em></li>
                                <li><a href="">总分<i class="icon-arr-down"></i></a><em class="sep">|</em></li>
                                <li class="fs-slt">
                                    <a href="">其他排序<i class="icon-arr-extend"></i></a>
                                    <em class="sep">|</em>
                                    <div class="slt-list">
                                        <span class="tit">其他排序<i class="icon-arr-packup"></i></span>
                                        <a href="">点评最多</a>
                                    </div>
                                </li>

                                <li class="fs-slt">
                                    <a href="#" class="fs-price-tit "><span class="avgprice"> 人均<i class="icon-arr-extend"></i></span></a>
                                    <div class="slt-list per-capita">
                                        <span class="tit">人均<i class="icon-arr-packup"></i></span>

                                        <a href="">人均最高</a>
                                        <a href="">人均最低</a>

                                        <div class="ipt-price J_bar-range">
                                            <span class="i-box"><span class="icon">¥</span><input class="J_range-min" type="text" value=""></span>
                                            <span>-</span>
                                            <span class="i-box"><span class="icon">¥</span><input class="J_range-max" type="text" value=""></span>
                                            <div class="btn-box">
                                                <a href="javascript:void(0);" class="confirm J_range-btn">确定</a>
                                                <a href="javascript:void(0);" class="reset J_range-reset">重置</a>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        service end
                        <a href="" rel="nofollow" target="_blank" class="map"><i class="icon-map"></i></a>
                    </div> -->
                    <div class="shop-list J_shop-list shop-all-list" id="all-shop">
                        <ul id="pubEquipList">
                           
                            
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
                    </div>
                </div> -->
            </div>
        </div>
    </div>
    <jsp:include page="../footer.jsp" />
    <script>
    	var street=null;
    	/* 分页用的参数 */
	    var pageSize = 10;
	    var page = "";
        $(function(){
            loadStreet();
            
            loadEquip(street,0);
            
        })
        function loadStreet(){
        	$.submit({
				url: dynamicURL+"/front/dict/list?search_EQ_type=STREET_NAME",
				success: function(result){
				    if(result.rows.length>0){
				    	var str= '';
				    	$.each(result.rows,function(index,value){
				    		str+=' <a onclick="loadEquip('+value.id+',0)" data-cat-id="'+value.id+'" data-click-name="select_reg_hot_click" data-click-title="'+value.name+'"><span>'+value.name+'</span></a>';
				    	});
				    	$("#street").append(str);
				    }
				}
			})
        } 
      
        function loadEquip(street,pageNum){
			var params = {
				'page':pageNum+1,
				'rows':pageSize,
				sort:'sortNumber',
				order:'desc',
				search_EQ_publicFlag:1
			};
			
			if(street) {
				params.search_EQ_streetId = street;
			}
        	$.submit({
				url: dynamicURL+"/front/venue/equipment/type/list",
				data:params,
				success: function(result){
					$("#pubEquipList").children().remove();
					console.log(result);
				    if(result.rows.length>0){
				    	var str= '';
				    	$.each(result.rows,function(index,value){
				    		var imgUuid = null;
							if(value.mainImgUuids){
								var arr = value.mainImgUuids.split(',');
								imgUuid = arr[0];
							}
							str+='<li onclick="pubEquipDetails('+value.id+')">';
				    		 str+='<div class="pic">';
				    		 str+=' <a href="javascript:void(0)">';
				    		 str += '	<img src="'+dynamicURL+'/front/venue/equipment/type/showImg?uuid='+imgUuid+'"/>';
				    		 str+='   </a>';
				    		 str+='</div>';
				    		 str+='<div class="txt1">';
				    		 str+='<div class="tit">';
				    		// str+='       <a href="javascript:void(0)">';
				    		 str+='           <h4>'+value.name+'</h4>';
				    		// str+='        </a>';
				    		 str+=' </div>      <div class="comment">';
				    		 str+='<span name="starBox">'+value.venueName+'</span>';
			    			 /* str+='    <a class="review-num">';
			    			 str+='         <b>98</b>';
			    			 str+='条点评</a>'; */
			    			 str+=' <em class="sep">|</em>';
			    			 str+=' <a class="mean-price">'+value.num+'个</a>';
			    			 str+='</div>';
			    			 str+=' <div class="tag-addr">';
			    			 str+='<a href=""><span>'+value.name+'</span></a>';
			    			 str+='<em class="sep">|</em>';
			    			 str+='      <a href=""><span>全天开放</span></a>';
			    			 str+='<em class="sep">|</em>';
			    			 str+=' <span class="addr">'+value.modeName+'</span>';
			    			 str+='  </div>';
			    			 str+='</div>';
			    			 /* str+='<div class="svr-info">';
			    			 str+=' <a>';
			    			 str+='     <span class="tit">团购：</span>仅售980元，价值1480元健身15次卡';
			    			 str+='</a>';
			    			 str+='</div>'; */
			    			 /* str+='<div class="operate J_operate">';
			    			 str+='<a target="_blank" href="" class="o-remark"><i></i><span>写点评</span></a>';
			    			 str+='  <span class="line1">|</span>';
			    			 str+=' <a href="" class="o-favor J_o-favor"><i></i><span>收藏</span></a>';
			    			 str+='<span class="line1">|</span>';
			    			 str+='<a href="" data-region="'+value.location+'" data-info="'+value.name+'" class="o-map J_o-map">地图</a>';
			    			 str+='<span class="line1">|</span>';
			    			 str+='<a href="" class="o-nearby J_o-nearby">附近</a>';
			    			 str+='</div>'; */
			    			 str+='</li>';
				    	});
				    	$("#pubEquipList").append(str);
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
        function pubEquipDetails(id){
        	window.location.href='${dynamicURL}/front/toVenueEquipmentDetails?id='+id;
        }
        function formatStar(starLevel){
    		var star = starLevel*10;
    		starClass="sml-rank-stars sml-str"+star;
    		return starClass;
    	}
        function ifNull(str){
        	if(str==null||str==''){
        		return'暂未设置';
        	}else{
        		return str;
        	}
        }
      //分页的回调
       function pageselectCallback(page_index, jq){
           $("#Pagination").find(":first").attr("style","margin-left:1%;");
           text = "-";
           page = page_index;
           loadEquip(street,page_index);
           return false;
       }
    </script>
</body>
</html>


