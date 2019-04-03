<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/style_script.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>我的信息</title>
<style>
			.mui-content{
				background-color: #fff;
				min-height: 100%;
			}
			.mui-input-row {
				height:60px;
				padding:10px 0;
			}
			.mui-input-row:after{
				position: absolute;
			    right: 0;
			    bottom: 0;
			    left: 15px;
			    height: 1px;
			    content: '';
			    -webkit-transform: scaleY(.5);
			    transform: scaleY(.5);
			    background-color: #c8c7cc;
			}
			.mui-input-row label {
				width: 31%;
				font-size:16px;
			}
			.mui-input-row label~input,
			.mui-input-row label~select{
				width: 69%;
				font-size:16px;
				text-align: right;
			}
			.mui-input-row label~select{
				direction: rtl;
				padding-right:15px;
			}
			.mui-input-row .button{
				width: 69%;
				height:40px;
				border: 0;
				padding:12px 0;
				padding-right:15px;
				font-size:16px;
				color:#000;
				text-align: right;
			}
			.mui-input-row .button:enabled:active{
				color:#aaa;
				background-color:#fff;
			}
			img.imgcard{
				height:40px;
				width:110px;
				margin-left:15px;
			}
			.mui-btn {
				padding: 10px;
			}
			p{
				margin-bottom:0;
			}
			.mui-input-row .mui-input-clear~.mui-icon-clear{
				top:20px;
			}
			#liker{
				width: 69%;
				height:40px;
			    font-size: 16px;
			    text-align: right;
			    float: right;
			    overflow:auto;
			    white-space:nowrap;
			}
			.topBtn{
				color: #0099CC;
				display: inline-block;
				height:30px;
				line-height: 30px;
				width:100px;
				margin:5px 4px;
				border:1px solid #0099CC;
				border-radius:5px;
				text-align: center;
			}
			.layui-upload-file {
			    display: none!important;
			    opacity: .01;
			    filter: Alpha(opacity=1);
			}
		</style>
</head>
<body>
<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">用户信息</h1>
		</header>
		<div class="mui-content">
			<form action="javascript:void(0)">
				<div class="mui-input-row">
					<label>头像</label>
					<div class="col">
						<div class="imgcol"><img id="idCardImage" src="${staticURL}/images/front/user1.png"/></div>
					</div>
				</div>
				<div class="mui-input-row">
					<label>昵称</label>
					<input id='realName' type="text" class="" placeholder="请输入昵称" maxlength="18">
				</div>
				<div class="mui-input-row">
					<label>性别</label>
					<select id='sex'>
						<option value="0" id="man">男</option>
						<option value="1" id="manen">女</option>
					</select>
				</div>
				<div class="mui-input-row">
					<label>出生日期</label>
					<button id='birthdayDate' data-options='{"type":"date"}' class="button">请选择生日</button>
				</div>
				<div class="mui-input-row">
					<label>手机号码</label>
					<input id='mobile' type="number" class="" placeholder="请输入手机号" maxlength="18">
				</div>
				
				<div class="mui-input-row">
					<label>邮箱</label>
					<input id='email' type="email" class="" placeholder="请输入邮箱号">
				</div>
				
				<div class="mui-input-row" style="padding-right:10px;">
					<label id="likerOrGood">运动爱好</label>
					<div id="liker"><div class="topBtn">未选择</div></div>
				</div>
				
				<div class="mui-input-row">
					<label>个性签名</label>
					<input id='experience' type="text" class="" placeholder="请输入个性签名">
				</div>
				<div class="mui-content-padded">
					<button id='submit' class="mui-btn mui-btn-block mui-btn-self">保存</button>
				</div>
			</form>
		</div>
		
		<script>
			mui.init({
				swipeBack:true //启用右滑关闭功能
			});  
			mui.ready(function(){
			    //关闭等待框 
			 //   plus.nativeUI.closeWaiting();
			    
			    userInfo();
			    userLike();
			}); 
			var titleofLast = '多运动爱好';
			var uuid = constants.getSettings().uuid;
			//var serverPath = window.constants.getServerPath();
			/**
			 * 选择生日
			 */
			var optionsJson1 = document.getElementById("birthdayDate").getAttribute('data-options') || '{}';
			var options1 = JSON.parse(optionsJson1);
			options1.beginYear='1900';
			options1.beginMonth='01';
			options1.beginDay='01';
				
			var picker1 = new mui.DtPicker(options1);
			document.getElementById('birthdayDate').addEventListener('tap',function () {
				picker1.show(function(rs) {
					$('#birthdayDate').html(rs.text);
					//picker1.dispose();
				});
			}, false);

			
			document.getElementById('submit').addEventListener('tap',_.debounce(function () {
				$(this).attr('disabled',true);
				$(this).html("保存中...");
				
		        var param = {};
		        param.name = $("#realName").val();
		        param.sex = $("#sex").val();
		        param.birthday = $("#birthdayDate").html();
		        param.mobile = $("#mobile").val();
		        param.email = $("#email").val();
		        param.uuid = uuid;
		        param.experience = $("#experience").val();
		        if (dataUtil.isPoneAvailable(param.mobile)) {
		        	mui.toast('请输入正确手机号');
		        	$(this).attr('disabled',false);
	        		$(this).html("保存");
		        } else  if (param.experience.length > 50) {
		        	mui.toast('个性签名最多可输入50个字符');
		        	$(this).attr('disabled',false);
	        		$(this).html("保存");
		        } else {
		        	 topUtil.web_query("/mobile/venue/user/saveUserInfo",param,function(data){
				        	if (typeof data == "string") {
				                data = JSON.parse(data);
				            }
				        	if(data.success){
				        		var settings = constants.getSettings();
								settings.loginUser = $('#realName').val();;
								constants.setSettingsExtend(settings);
								mui.alert(data.msg,'提示',function(){
									mui.back();
								});
				        	}else{
				        		mui.toast(data.msg);
				        		$(this).attr('disabled',false);
				        		$(this).html("保存");
				        	}
						});
		        }
			},waitTime,true));
			
			layui.config({
				base: '${staticURL}/js/' //静态资源所在路径
			}).use('upload',function(){
				var $ = layui.jquery,
					upload = layui.upload;
				//上传封面预览
				var uploadInst = upload.render({
					elem: '#idCardImage',
					url: dynamicURL + 'mobile/venue/user/saveImgUrl',
					headers: {sessionId: constants.getSettings().sessionId},
					data:{
						uuid:uuid
					},
					multiple: false, //是否多文件上传
					auto: true, //是否自动上传
					//bindAction: '#submit',
					accept: 'images', //允许上传的文件类型
					number:1,//允许上文件数量
					choose: function(obj) {
						var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
						//预读本地文件示例，不支持ie8
						obj.preview(function(index, file, result) {
							var str=$(['<img id="idCardImage" src="'+result+' "><div id="image-item-'+index+'" class="image-item" style="background-image:url('+result+')">'].join(''));
							$('.imgcol').html(str);
						});
						/* var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
						//预读本地文件示例，不支持ie8
						obj.preview(function(index, file, result) {
							var str=$(['<div id="image-item-'+index+'" class="image-item" style="background-image:url('+result+')"><div class="image-close">X</div></div>'].join(''));
							str.find(".image-close").on("click",function(){
								 delete files[index]; //删除对应的文件
								 str.remove();
								 uploadInst.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
							})
							$('#idCardImage').before(str);
						}); */
					},
					done: function(data,index) {
						if(data.success) {
							layer.msg('上传成功');
							mui.openWindow({ 
								url: '${dynamicURL}/mobile/venue/user/toMyInfo', 
								id : 'mobile/venue/user/toMyInfo',
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
							layer.alert(data.msg, {
								icon: 0
							});
						}
					},
					error: function(res) {
						mui.alert(res.msg);
					}
				});
			})
			
			//新增按钮
	/* 		document.getElementById('idCardImage').addEventListener('tap', function() {
				toUpload();
			});
			
			var files = [];
			var imageIndex = 0;
			// 跳转到上传图片界面
		    function toUpload(){
		    	var imageIndex = 1;
		    	
				//上传图片
				//var serverPath = window.constants.getServerPath();
					
		    	var btnArray = [{
					title: "拍照"
				}, {
					title: "从相册选择"
				}];
				plus.nativeUI.actionSheet({
					title: "选择身份证照片",
					cancel: "取消",
					buttons: btnArray
				}, function(e) {
					var index = e.index;
					switch (index) {
						case 0:
							break;
						case 1:
	//						takePhoto();// 拍照
							var cmr = plus.camera.getCamera();
							cmr.captureImage(function(path) {
								var filePath = 	"file://" + plus.io.convertLocalFileSystemURL(path);
								compressImage(filePath,function(){
									selectAndSend(dynamicURL+"mobile/venue/user/saveImgUrl",{images: files,uuid:uuid}); 
								});
							}, function(err) {});
							break;
					 	case 2:
							plus.gallery.pick(function(e) {
								for(var i in e.files){
							    	compressImage(e.files[i],function(imageIndex){
							    		if(imageIndex == e.files.length){
							    			selectAndSend(dynamicURL+"mobile/venue/user/saveImgUrl",{images: files,uuid:uuid}); 
							    		}
							    	});
						    	}
							}, function(err) {}, {filter:"image",multiple:true,maximum:1,system:false,onmaxed:function(){
								plus.nativeUI.alert('最多只能选择1张图片');
						    }});
						    break;
					}
					//uploadImages.clearForm();
				});
	//	    	
		    }
		    
		   	function compressImage(path,successCB){
				var name = path.substr(path.lastIndexOf('/') + 1);
				plus.zip.compressImage({
					src: path,
					dst: '_doc/' + name,
					overwrite: true,
					quality: 50,
					width:'1024px'
				}, function(zip) {
					files.push({name:"images"+imageIndex,path:zip.target});
					imageIndex++;
					console.log("compressImage-files"+files[0].path);
					successCB(imageIndex);
				}, function(zipe) {
					mui.toast('压缩失败！')
				});
			}
		   	
		   	function selectAndSend(urlStr,content) {
				var uploader = plus.uploader.createUpload(urlStr, {
					method: 'POST'
				}, function(upload, status) {
					plus.nativeUI.closeWaiting();
					files = [];
					imageIndex=0;
					if(status==200){
						var data = JSON.parse(upload.responseText);
						//上传成功，重置表单
						if (data.success) {
							mui.alert("上传成功","照片上传","确定",function () {});
						}else{
							mui.alert(data.errorMsg+"上传失败","照片上传","确定",function () {});
						}
					}else{
						mui.alert("上传失败","照片上传","确定",function () {});
					}
					
				});
				uploader.setRequestHeader("sessionId", constants.getSettings().sessionId);
				//添加上传数据
				mui.each(content, function(index, element) {
					console.log(index);
					if (index !== 'images') {
						console.log("addData:"+index+","+element);
						uploader.addData(index, element)
					}
				});
				// console.log("selectAndSend-files"+files.toString());
				// console.log("content.images"+content.images);
				mui.each(content.images, function(index, element) {
					var f = content.images[index];
					console.log("addFile:"+JSON.stringify(f));
					uploader.addFile(f.path, {key: f.name});
					$("#idCardImage").attr('src',f.path); 
				});
				//开始上传任务
				uploader.start();
				plus.nativeUI.showWaiting('上传中...');
			}; */
			
			$('#liker').on('touchmove', function(e){
				 e.stopPropagation()
			});
			
			/* $('#liker').on('tap',function () {
				mui.openWindow({ 
				    url: dynamicURL+'mobile/venue/user/toMovementLike?titleofLast='+titleofLast, 
				    id : 'mobile/venue/user/toMovementLike',
				    show:{
				      autoShow:true,//页面loaded事件发生后自动显示，默认为true
				      aniShow:"slide-in-bottom",
				      duration:'250'
				    },
					waiting:{
				      autoShow:false,//自动显示等待框，默认为true
					}
		  		});
			}); */
			
			function userInfo() {
				topUtil.web_query('/mobile/venue/user/userInfo', {uuid:uuid}, function (data) {
					if (typeof data == "string") {
		                data = JSON.parse(data);
		            }
					if(data.success) {
						if (data.obj.imgUrl)
							$('#idCardImage').attr('src', dynamicURL + 'mobile/venue/user/userHeadImg?uuid='+uuid);
						if (data.obj.name)
							$('#realName').attr('value',data.obj.name);
						if (data.obj.mobile)
							$('#mobile').attr('value',data.obj.mobile);
						if (data.obj.email)
							$('#email').attr('value',data.obj.email);
						if (data.obj.birthday)
							$("#birthdayDate").html(data.obj.birthday);
						if (data.obj.sex) {
							if(data.obj.sex == 0) {
								 document.getElementById("man").setAttribute("selected", "selected");
							}else if(data.obj.sex == 1) {
								 document.getElementById("manen").setAttribute("selected", "selected");
							}
						}
						if (data.obj.experience) 
							$('#experience').attr('value',data.obj.experience);
						if(1 == data.obj.type)
							$("#likerOrGood").html("擅长项目");titleofLast = "擅长项目";
					}
				})
			}
		/* 	window.addEventListener("reload", function(e) {
				plus.webview.currentWebview().reload();
			}); */
			
			function userLike () {
				topUtil.web_query('/mobile/venue/user/likeList', {}, function (data) {
					if (typeof data == "string") {
		                data = JSON.parse(data);
		            }
					if (data) {
						var str = '';
						mui.each(data,function (index, item) {
							str += '<div class="topBtn">'+item.likeName+'</div>';
						});
						if (str) {
							$('#liker').html(str);
						}
					}
				});
			}
			
			document.getElementById('liker').addEventListener('tap',function () {
				mui.openWindow({ 
				    url: dynamicURL+'mobile/venue/user/toMovementLike?titleofLast='+titleofLast, 
				    id : 'mobile/venue/user/toMovementLike',
				    show:{
				      autoShow:true,//页面loaded事件发生后自动显示，默认为true
				      aniShow:"slide-in-bottom",
				      duration:'250'
				    },
					waiting:{
				      autoShow:false,//自动显示等待框，默认为true
					}
		  		});
			});	
		</script>
</body>
</html>