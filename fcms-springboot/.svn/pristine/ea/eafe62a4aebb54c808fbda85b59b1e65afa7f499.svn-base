<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <style>
    	.circle-type{
    		height:80px;
    		background: #5eafff;
    		color:#fff;
    		font-size:30px;
    		text-align:center;
    		line-height:80px;
    	}
    	.circle-name{
    		padding:10px;
    		text-align:center;
    		border-bottom:1px solid #ddd;
    		cursor:pointer;
    	}
    	.circle-name.selected{
    		color:#5eafff;
    	}
    	.circle-name span:first-child{
    		display:block;
    		font-size:16px;
    		margin-bottom:4px;
    	}
    	.noDataContent{
			font-size:16px;
			color:#999;
			padding-top: 15%;
			padding-left: 28%;
		}
		.layui-form-label{
			width: 90px;
		}
    </style>
</head>

<body>
    <div class="container">
        <jsp:include page="../header.jsp" />	
	    <div class="line-big margin-big-top">
	    	<div class='xs3'>
	    		<div class='bg-white'>
		    		<div class='circle-type'>
		    			<span>圈子类型</span>
		    		</div>
		    		<c:forEach items="${items}" var="item" varStatus="status">
		    			<c:if test="${status.index==0}">
		    				<div class='circle-name selected' onclick="showItem(${item.id})" name="item1" data-id="${item.id }" data-name="${item.name }">
		    					<span>${item.name }</span>
		    					<span class='color-grave'>${item.remarks }</span>
		    				</div>
		    			</c:if>
		    			<c:if test="${status.index!=0}">
		    				<div class='circle-name' onclick="showItem(${item.id})"  data-id="${item.id }" data-name="${item.name }">
		    					<span>${item.name }</span>
		    					<span class='color-grave'>${item.remarks }</span>
		    				</div>
		    			</c:if>
		    		</c:forEach>
		    		<!-- <div class='circle-name selected'>
		    			<span>徒步登山</span>
		    			<span class='color-grave'>征服世界，瞰脚下世界</span>
		    		</div>
		    		<div class='circle-name'>
		    			<span>骑行</span>
		    			<span class='color-grave'>远离狭隘的生活</span>
		    		</div>
		    		<div class='circle-name'>
		    			<span>马拉松长跑</span>
		    			<span class='color-grave'>让我们动起来</span>
		    		</div> -->
	    		</div>
	    	</div>
	        <div class="xs9">
	        	<div class='pad bg-white invite-header'>
	        		<div class='invite-header-name'>邀请列表</div>
	        		<div class='invite-header-btn'>
	        			<button  class="button bg-sub" id="addRelease"  >发布邀请</button>
	        		</div>
	        	</div>
	            <div id="activitys" class='bg-white'>
		    	<%-- 	<div class='invite'>
		    			<div class='invite-top'>
		    				<img alt="" src="${staticURL}/images/logo.jpg">
		    				<div class='invite-user-account'>18353626973</div>
		    			</div>
		    			<div class='invite-info'>
		    				<div class='invite-headline'>
		    					测试测试
		    				</div>
		    				<div class='line-big'>
		    					<div class='xs6'>
		    						<div class='invite-text'>
		    							<div class='paddtb'>要求成员：<span>限美女（6人）</span></div>
		    							<div class='paddtb'>费用类型：<span>AA</span></div>
		    							<div class='paddtb'>集合地点：<span>火车站</span></div>
		    							<div class='paddtb'>邀请说明：<span>哈哈哈</span></div>
		    						</div>
		    					</div>
		    					<div class='xs6'>
		    						<div class='invite-text'>
		    							<div class='paddtb'>联系方式：<span>123456789</span></div>
		    							<div class='paddtb'>活动时间：<span>2018-08-30 14:15</span></div>
		    							<div class='paddtb'>报名截止时间：<span>2018-09-30 14:15</span></div>
		    						</div>
		    					</div>
		    				</div>
		    				<div class='invite-time'>
		    					<span style='height:34px;line-height:34px;'>2018-09-26</span>
		    					<button class="button bg-sub flr mybtn">报名</button>
		    				</div>
		    			</div>
		    		</div> --%>
	    		</div>
	        </div>
	    </div>
		
	</div>
	<jsp:include page="../footer.jsp" />
	<script>
		$(function(){
			layui.use('layer', function(){
				  var layer = layui.layer;
				 
				});
			var firstItemId=$("div[name='item1']").attr("data-id");
			showItem(firstItemId);
		})
		function showItem(id){
			$("#addRelease").attr("data-itemId",id);
			$("#addRelease").attr("data-itemName",$("div[data-id="+id+"]").attr('data-name'));
			$("#activitys").children().remove();
			$(".circle-name").removeClass("selected");
			$("div[data-id="+id+"]").addClass("selected");
			var param ={};
			param.search_EQ_itemId=id;
			$.submit({
				url:dynamicURL+"front/activity/main/list",
				data:param,
				success:function(data){
					if(data.total>0){
						var arr = null;
						if(data.follow){
							arr=data.follow;
						}
						$.each(data.rows,function(i,v){
							var str ='<div class="invite">'+
			    			'<div class="invite-top">'+
			    				'<img style="height:50px;width:50px" src="${dynamicURL}/front/venue/user/userHeadImg?uuid='+v.uuid+'">'+
			    				'<div class="invite-user-account">'+v.userName+'</div>'+
			    			'</div>'+
			    			'<div class="invite-info">'+
			    				'<div class="invite-headline">'+
			    					v.title+
			    				'</div>'+
			    				'<div class="line-big">'+
			    					'<div class="xs6">'+
			    						'<div class="invite-text">'+
			    							'<div class="paddtb">要求成员：<span>'+v.member+'（'+v.peopleNum+'人）</span></div>'+
			    							'<div class="paddtb">费用类型：<span>'+v.costType+'</span></div>'+
			    							'<div class="paddtb">集合地点：<span>'+v.location+'</span></div>'+
			    							'<div class="paddtb">邀请说明：<span>'+v.instructions+'</span></div>'+
			    						'</div>'+
			    					'</div>'+
			    					'<div class="xs6">'+
			    						'<div class="invite-text">'+
			    							'<div class="paddtb">联系方式：<span>'+v.tel+'</span></div>'+
			    							'<div class="paddtb">活动时间：<span>'+v.activityTime+'</span></div>'+
			    							'<div class="paddtb">报名截止时间：<span>'+v.stopTime+'</span></div>'+
			    						'</div>'+
			    					'</div>'+
			    				'</div>'+
			    				'<div class="invite-time">';
			    					'<span style="height:34px;line-height:34px;">'+v.timeWrapper+'</span>';
			    				str += '<button data-id="'+v.id+'" data-value="'+v.itemId+'" class="button bg-sub signBtn">查看报名列表</button>';
			    				if (v.isMain) {
									str += '<button id="'+v.id+'" data-value="'+v.itemId+'" class="button bg-sub flr mybtn">撤销邀请</button>';
								} else {
									//判断是否已有报名人员
									if (v.signNum) {
										if (arr) {
											var flag = false;
											$.each(arr,function (ind,ite) {
												if (ite == v.id) {
													flag = true;
												}
											});
										}
										if (flag) {
											str += '<button id="'+v.id+'" data-value="'+v.itemId+'" class="button bg-sub flr mybtn" >撤销报名</button>';
										} else {
											str += '<button id="'+v.id+'" data-value="'+v.itemId+'" class="button bg-sub flr mybtn" >报名</button>';
										}
										
									} else {
										str += '<button id="'+v.id+'" data-value="'+v.itemId+'" class="button bg-sub flr mybtn" disabled="disabled">报名</button>';
									}
								}
			    			str+=	'</div>'+	
			    				'</div>'+
			    			'</div>';
			    		$("#activitys").append(str);
						});
					}else{
						var str='<div class="noDataContent"><p>该项目暂无结伴运动信息<p></div>';
						$("#activitys").append(str);
					}
				}
				
			});
		}
		
		$(document).on('click','#addRelease',function () {
			var now = new Date();
			var itemId=$("#addRelease").attr("data-itemId");
			var itemName=$("#addRelease").attr("data-itemName");
			parent._layer({
		        url: '${dynamicURL}/front/activity/main/toAdd?itemId='+itemId+'&itemName='+itemName,
		        title: "发布邀请",
		        width:'700px',
		        height:'600px',
		        btn: ['保存', '取消']
		    },
		    {
		        yes: function(index, layero) {
		        	var bObj = layero.find("a.layui-layer-btn0");
		            var frm = parent.$("#layui-layer-iframe" + parent.ixs["发布邀请"]).contents().find("form.addForm");
		            var formdata = new FormData(frm[0]);
		            //var itemId = formdata.get('itemId');
		            var peopleNum = formdata.get('peopleNum');
		            var location = formdata.get('location');
		            var title = formdata.get('title');
		            var tel = formdata.get('tel');
		            var title = formdata.get('title');
		            var acvitityTime = formdata.get('acvitityTime');
		            var stopTime = formdata.get('stopTime');
		            //验证人数
		            if(peopleNum ==''||peopleNum<=0){
		            	layer.alert("请输入正确的人数！",{icon:2});
		            	return false;
		            }
		            if(location ==''||location==null){
		            	layer.alert("请输入正确的地点！",{icon:2});
		            	return false;
		            }
		            if(title ==''||title==null){
		            	layer.alert("请输入标题！",{icon:2});
		            	return false;
		            }
		            if(tel==''||tel==null||isNaN(tel)||tel.length!=11){
		            	layer.alert("请输入手机号码！",{icon:2});
		            	return false;
		            }
		            if(dateCompare(acvitityTime,stopTime)){
		            	layer.alert("报名截止时间要早于活动开始时间",{icon:2});
		            	return false;
		            }
		            if(dateCompare(stopTime,now.toString())){
		            	layer.alert("报名截止时间要晚于当前时间",{icon:2});
		            	return false;
		            }
		            $.submit({
			            url: "${dynamicURL}/front/activity/main/saveActivityMain",
			            formTg : frm,
			            butObj : bObj,
			            success : function(res){
			            	if(res.success){
				            	layer.alert('保存成功！', {icon: 1});
				            	parent.layer.close(parent.parent.ixs["发布邀请"]);
				            	showItem(itemId);
			            	}else{
			            		parent.layer.alert(res.msg, {icon: 0});
			            	}
			            },
			            error : function(){
			            	layer.alert('出错啦！', {icon: 0});
			            }
		           	});
		            
		        },
		        btn2: function(index, layero) {
		        	parent.layer.close(parent.parent.ixs["发布邀请"]);
		        }
		    }); 
		});
		$(document).on('click','.signBtn',function(){
			var mainId = $(this).attr("data-id");
			parent._layer({
		        url: '${dynamicURL}/front/activity/main/toSignUsersList?mainId='+mainId,
		        title: "报名列表",
		        width:'700px',
		        height:'600px',
		        btn: ['关闭']
		    },
		    {
		        btn2: function(index, layero) {
		        	parent.layer.close(parent.parent.ixs["报名列表"]);
		        }
		    }); 
		});
		$(document).on('click','.mybtn',function () {
				var itemId = $(this).attr("data-value");
				var mainId = $(this).attr("id");
				var params = {
						itemId:itemId,
						mainId:mainId
					};
				var sign = $(this).html();
				if (sign == '报名') {
					$.submit({
						url:dynamicURL+'front/activity/user/addMainUser',
						data:params,
						success:function(data){
							if (data.success) {
								$('#'+mainId).html('撤销报名');
							}else{
								layer.alert(data.msg, {icon: 2});
							}
						}
					});
				} else if (sign == '撤销报名') {
					$.submit({
						url:dynamicURL+'front/activity/user/deleteMainUser',
						data:params,
						success:function(data){
							if (data.success) {
								$('#'+mainId).html('报名');
							}else{
								layer.alert(data.msg, {icon: 2});
							}
						}
					});
				} else if (sign == "撤销邀请") {
					$.submit({
						url:dynamicURL+'front/activity/main/deleteActivityMain',
						data:params,
						success:function(data){
							if (data.success) {
								showItem(itemId);
							}else{
								layer.alert(data.msg, {icon: 2});
							}
						}
					});
				}
		});
		//第一个时间早返回true
		function dateCompare(dataStr1,dataStr2) {
			   var sDate = new Date(dataStr1.replace("//-/g", "//"));
			   var eDate = new Date(dataStr2.replace("//-/g", "//"));
			   if(sDate > eDate){
			     return false;
			   }
			    return true;
		}
	</script>
</body>
</html>