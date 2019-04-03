<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="feedback">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>消费投诉</title>
		<link rel="stylesheet" type="text/css" href="${staticURL}/css/feedback.css" />
	</head>
	<style>
		input[type='submit'], .mui-btn-my, .mui-btn-my {
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
		.layui-upload-file {
		    display: none!important;
		    opacity: .01;
		    filter: Alpha(opacity=1);
		}
		.mui-content-padded{
			margin:10px!important;
			padding:0px!important;
		}
	</style>
	<body>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">消费投诉</h1>
		</header>
		<div class="mui-content">
			<div class="mui-content-padded">
				<div class="mui-inline">投诉内容</div>
			</div>
			<div class="row mui-input-row">
				<textarea id="content" name="content" type="text" rows="6" class="mui-input-text mui-text-left" placeholder="输入发送内容"></textarea>
			</div>
			<p>图片证据(选填,选择您想要的图片,总大小10M以下)</p>
			<div id='image-list' class="row image-list">
				<div class="image-item space" id="uploadImg">
					<div class="image-close">X</div>
					<div class="image-up"></div>
					<div class="file"></div>
				</div>
			</div>
			<div class="mui-button-row">
	        	<button type="button" class="mui-btn mui-btn-my set-btn" id="submit">发送</button>
	        </div>
		</div>
		<script type="text/javascript">
			var orderUuid='${orderUuid}';
			mui.init();
			layui.config({
				base: '${staticURL}/js/' //静态资源所在路径
			}).use('upload',function(){
				var $ = layui.jquery,
					upload = layui.upload;
				//上传封面预览
				var uploadInst = upload.render({
					elem: '#uploadImg',
					url: dynamicURL + '/mobile/complaint/saveInfo',
					headers: {sessionId: constants.getSettings().sessionId},
					data:{
						content: function(){
						    return $('#content').val();
						},
						orderUuid:function(){
						    return orderUuid;
						}
					},
					multiple: true, //是否多文件上传
					auto: false, //是否自动上传
					bindAction: '#submit',
					accept: 'images', //允许上传的文件类型
					number:9,//允许上文件数量
					choose: function(obj) {
						var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
						//预读本地文件示例，不支持ie8
						obj.preview(function(index, file, result) {
							var str=$(['<div id="image-item-'+index+'" class="image-item" style="background-image:url('+result+')"><div class="image-close">X</div></div>'].join(''));
							str.find(".image-close").on("click",function(){
								 delete files[index]; //删除对应的文件
								 str.remove();
								 uploadInst.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
							})
							$('#uploadImg').before(str);
						});
					},
					done: function(data,index) {
						if(data.success) {
							mui.toast('上传成功');
							mui.openWindow({ 
								url: '${dynamicURL}/mobile/order/toCommonOrderDetail?uuid='+orderUuid+"&orderType=1", 
								id : 'mobile/order/toCommonOrderDetail',
								show:{
									autoShow:true,//页面loaded事件发生后自动显示，默认为true
									aniShow:"slide-in-right",
									duration:'250'
								},
								waiting:{
									autoShow:false,//自动显示等待框，默认为true
								}
							});
						} else {
							mui.toast(data.msg);
						}
					},
					error: function(res) {
						mui.alert(res.msg);
					}
				});
			})
			
			var content = document.getElementById('content');
			document.getElementById('submit').addEventListener('tap', function(event) {
				if(content.value == '') {
					return mui.toast('信息填写不符合规范');
				}
				if(content.value.length > 200) {
					return mui.toast('信息超长,请重新填写~');
				}
			}, false);
			//----------------------
			/* mui('.mui-scroll-wrapper').scroll();
			mui.plusReady(function(){
				var feedback = mui.feedback;
				feedback.newPlaceholder({url: '/mobile/complaint/saveInfo',maximum:3 });
				document.getElementById('submit').addEventListener('tap', function(event) {
					var content = document.getElementById('content');
					if (content.value == '') {
						return mui.toast('信息填写不符合规范');
					}
					if (content.value.length > 200) {
						return mui.toast('信息超长,请重新填写~')
					}
					//判断网络连接
					if(plus.networkinfo.getCurrentType()==plus.networkinfo.CONNECTION_NONE){
						return mui.toast("连接网络失败，请稍后再试");
					}
					feedback.send({
						content: content.value,
						orderUuid : plus.webview.currentWebview().orderUuid
					},function(){
						//获得列表界面的webview  
					    var list = plus.webview.getWebviewById('order_detail.html');  
					    //触发列表界面的自定义事件（fncOne）,从而进行数据刷新  
					    mui.fire(list,'afterComplaint');
						return true;
					}) 
				}, false);
			}); */
			//alert(document.getElementById('file').files[0]);
		</script>
	</body>

</html>