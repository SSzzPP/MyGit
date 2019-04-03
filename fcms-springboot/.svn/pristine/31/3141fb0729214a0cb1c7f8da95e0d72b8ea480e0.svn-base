<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--场馆评价页面  -->
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>发表评价</title>
	</head>
	<style>
		.mui-btn-my, .mui-btn-my {
		    color: #fff;
		    border: 1px solid #1799c5;
		    background-color: #1799c5;
		}
		.mui-btn-my:enabled:active{
			color: #fff;
		    border: 1px solid #1799c5;
		    background-color: #1799c5;
		}
		.set-btn{
			height:50px;
			width:90%;
			font-size:16px;
		}
		.mui-icon-star-filled{
			color: sandybrown;
		}
		textarea{
			border:0;
			border-radius:none;
			font-size:14px;
		}
		.setmar{
			margin-top:10px;
		}
		.mui-inline{
			font-size:14px;
			line-height:24px;
		}
	</style>
	<body>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">发表评价</h1>
		</header>
		<div class="mui-content">
			<form action="javascript:void(0)">
				<div class="mui-input-row setmar">
					<textarea id="vealuate" name="vealuate" type="text" rows="6" class="mui-input-text mui-text-left" placeholder="请详细描述你的问题和意见..."></textarea>
				</div>
				<div class="mui-content-padded">
					<div class="mui-inline">专业程度：</div>
					<div class="icons environment-icon mui-inline" style="margin-left: 6px;">
						<i data-index="1" class="mui-icon mui-icon-star"></i>
						<i data-index="2" class="mui-icon mui-icon-star"></i>
						<i data-index="3" class="mui-icon mui-icon-star"></i>
						<i data-index="4" class="mui-icon mui-icon-star"></i>
						<i data-index="5" class="mui-icon mui-icon-star"></i>
					</div>
				</div><br />
				<div class="mui-content-padded">
					<div class="mui-inline">指导时长：</div>
					<div class="icons mui-inline" style="margin-left: 6px;">
						<i data-index="1" class="mui-icon mui-icon-star"></i>
						<i data-index="2" class="mui-icon mui-icon-star"></i>
						<i data-index="3" class="mui-icon mui-icon-star"></i>
						<i data-index="4" class="mui-icon mui-icon-star"></i>
						<i data-index="5" class="mui-icon mui-icon-star"></i>
					</div>
				</div><br />
				<div class="mui-button-row" onclick='send()'>
		        	<button type="button" class="mui-btn mui-btn-my set-btn"  id="submit">发送</button>
		        </div>
	        </form>
		</div>
		<script type="text/javascript">
			var orderUuid = '${orderUuid}';
			var starIndex = 0;
			var teachTimeIndex = 0;
			mui.init({
				swipeBack:true //启用右滑关闭功能
			});  
			mui.ready(function(){
			    //关闭等待框 
			    //plus.nativeUI.closeWaiting();
			    //orderUuid = plus.webview.currentWebview().orderUuid;
			}); 
			 //专业程度评分点亮星星
			mui('.icons').on('tap','i',function(){
			  	var index = parseInt(this.getAttribute("data-index"));
			  	var parent = this.parentNode;
			  	var children = parent.children;
			  	if(this.classList.contains("mui-icon-star")){
			  		for(var i=0;i<index;i++){
		  				children[i].classList.remove('mui-icon-star');
		  				children[i].classList.add('mui-icon-star-filled');
			  		}
			  	}else{
			  		for (var i = index; i < 5; i++) {
			  			children[i].classList.add('mui-icon-star')
			  			children[i].classList.remove('mui-icon-star-filled')
			  		}
			  	}
			  	starIndex = index;
			});
			mui('.environment-icon').on('tap','i',function(){
			  	var index = parseInt(this.getAttribute("data-index"));
			  	var parent = this.parentNode;
			  	var children = parent.children;
			  	if(this.classList.contains("mui-icon-star")){
			  		for(var i=0;i<index;i++){
		  				children[i].classList.remove('mui-icon-star');
		  				children[i].classList.add('mui-icon-star-filled');
			  		}
			  	}else{
			  		for (var i = index; i < 5; i++) {
			  			children[i].classList.add('mui-icon-star')
			  			children[i].classList.remove('mui-icon-star-filled')
			  		}
			  	}
			  	teachTimeIndex = index;
			});
			/*提交评价*/
			function send(){
				var param = {};
		        param.vealuate = document.getElementById('vealuate').value;
		        if(param.vealuate == '') {
					return mui.toast('信息填写不符合规范');
				}
				if( param.vealuate.length > 200) {
					return mui.toast('信息超长,请重新填写~');
				}
				var btnArray = ['否', '是'];
				mui.confirm('确定提交评价？',"", btnArray, _.debounce(function(e) {
					if(e.index==1){
	        			$('#submit').html("正在提交...");
						$('#submit').attr('disabled',true);
						 param.orderUuid = orderUuid;
					        param.starLevel = starIndex;
					        param.teachTime = teachTimeIndex;
					        topUtil.web_query("/mobile/vealuate/user/saveVealuate",param,function(data){
					        	if(data.success){
					        		mui.alert('评价成功',function(){
					        			$('#submit').html("已评价");
										mui.back();
									});
					        	}else{
					        		$('#submit').html("发送");
									$('#submit').attr('disabled',false);
					        		mui.toast(data.msg);
					        	}
							});
					}
		       
				},waitTime,true))
			}
		</script>
	</body>
</html>