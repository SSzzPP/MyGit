/*!
 * ======================================================
 * FeedBack Template For MUI (http://dev.dcloud.net.cn/mui)
 * =======================================================
 * @version:1.0.0
 * @author:cuihongbao@dcloud.io
 */
(function() {
	var index = 1;
	var size = null;
	var imageIndexIdNum = 0;
	var feedback = {
		url: '',
		imageList: document.getElementById('image-list'),
		maximum:9
	};
	feedback.files = [];
	feedback.uploader = null;  
	feedback.deviceInfo = null; 
	var placeholder;
	var up;
	var fileInput;
	mui.plusReady(function() {
		//var sessionId = constants.getSettings().sessionId;
		//设备信息，无需修改
		feedback.deviceInfo = {
			appid: plus.runtime.appid, 
			imei: plus.device.imei, //设备标识
			images: feedback.files, //图片文件
			p: mui.os.android ? 'a' : 'i', //平台类型，i表示iOS平台，a表示Android平台。
			md: plus.device.model, //设备型号
			app_version: plus.runtime.version,
			plus_version: plus.runtime.innerVersion, //基座版本号
			os:  mui.os.version,
			net: ''+plus.networkinfo.getCurrentType()
		}
		mui.feedback = feedback;
	});
	/**
	 *提交成功之后，恢复表单项 
	 */
	feedback.clearForm = function() {
		feedback.imageList.innerHTML = '';
		feedback.newPlaceholder();
		feedback.files = [];
		index = 0;
		size = 0;
		imageIndexIdNum = 0;
		//清除所有星标
		mui('.icons i').each(function (index,element) {
			if (element.classList.contains('mui-icon-star-filled')) {
				element.classList.add('mui-icon-star')
	  			element.classList.remove('mui-icon-star-filled')
			}
		})
	};
	feedback.getFileInputArray = function() {
		return [].slice.call(feedback.imageList.querySelectorAll('.file'));
	};
	feedback.addFile = function(path) {
		feedback.files.push({name:"images"+index,path:path,id:"img-"+index});
		index++;
	};
	/**
	 * 初始化图片域占位
	 */
	feedback.newPlaceholder = function(options) {
		mui.extend(feedback, options, true);
		var fileInputArray = feedback.getFileInputArray();
		if (fileInputArray &&
			fileInputArray.length > 0 &&
			fileInputArray[fileInputArray.length - 1].parentNode.classList.contains('space')) {
			return;
		};
		imageIndexIdNum++;
		placeholder = document.createElement('div');
		placeholder.setAttribute('class', 'image-item space');
		placeholder.setAttribute('id', 'image-item-' + imageIndexIdNum);
		up = document.createElement("div");
		up.setAttribute('class','image-up')
		//删除图片
		var closeButton = document.createElement('div');
		closeButton.setAttribute('class', 'image-close');
		closeButton.innerHTML = 'X';
		closeButton.id = "img-"+index;
		//小X的点击事件
		closeButton.addEventListener('tap', function(event) {
			setTimeout(function() {
				for(var temp=0;temp<feedback.files.length;temp++){
					if(feedback.files[temp].id==closeButton.id){
						feedback.files.splice(temp,1);
					}
				}
				var i = (closeButton.id).substr(-1);
				feedback.imageList.removeChild(document.getElementById("image-item-"+i));
			}, 0);
			return false;
		}, false);
		
		//
		fileInput = document.createElement('div');
		fileInput.setAttribute('class', 'file');
		//fileInput.setAttribute('id', 'image-' + imageIndexIdNum);
		fileInput.addEventListener('tap', function(event) {
			var self = this;
			//选取图片的来源，拍照和相册
			if (mui.os.plus) {
		        var buttonTit = [{
		            title: "拍照"
		        }, {
		            title: "从手机相册选择"
		        }];
	        
		        plus.nativeUI.actionSheet({
		            title: "上传图片",
		            cancel: "取消",
		            buttons: buttonTit
		        }, function(b) { /*actionSheet 按钮点击事件*/
		            switch (b.index) {
		                case 0:
		                    break;
		                case 1:
		                    getImage(); /*拍照*/
		                    break;
		                case 2:
		                    galleryImg();/*打开相册*/
		                    break;
		                default:
		                    break;
		            }
		        })
	    	} 
		}, false);
		placeholder.appendChild(closeButton);
		placeholder.appendChild(up);
		placeholder.appendChild(fileInput);
		feedback.imageList.appendChild(placeholder);
	};
	
	feedback.send = function(params,afterFun) {
		var content = mui.extend({}, feedback.deviceInfo,{images: feedback.files}, params);
		console.log(content);
		feedback.uploader = plus.uploader.createUpload(constants.getServerPath() + feedback.url, {
			method: 'POST'
		}, function(upload, status) {
//			plus.nativeUI.closeWaiting()
			console.log("upload cb:"+upload.responseText);
			if(status==200){
				var data = JSON.parse(upload.responseText);
				console.log(data.success);
				//上传成功，重置表单
				if (data.success == true) {
//					mui.toast('反馈成功~')
					console.log("upload success");
//					feedback.clearForm();
					afterFun();
					mui.back();
				}else{
					plus.nativeUI.alert(data.msg);
				}
			}else{
				console.log("upload fail");
			}
			
		});
		feedback.uploader.setRequestHeader("sessionId", constants.getSettings().sessionId);
		//添加上传数据
		mui.each(content, function(index, element) {
			if (index !== 'images') {
				console.log("addData:"+index+","+element);
//				console.log(index);
				feedback.uploader.addData(index, element)
			} 
		});
		//添加上传文件
		mui.each(feedback.files, function(index, element) {
			var f = feedback.files[index];
			console.log("addFile:"+JSON.stringify(f));
			feedback.uploader.addFile(f.path, {
				key: f.name
			});
		});
		//开始上传任务
		feedback.uploader.start();
		/*mui.alert("新建成功，点击确定关闭","社区圈","确定",function () {
			feedback.clearForm();
			aftersave();
			mui.back();
		});*/
//		plus.nativeUI.showWaiting();
	};
	function aftersave(){
	    //获得列表界面的webview  
	    var list = plus.webview.getWebviewById('card.html');  
	    //触发列表界面的自定义事件（fncOne）,从而进行数据刷新  
	    mui.fire(list,'reload');
	    //返回true，继续页面关闭逻辑  
	    return true;  
	}
  	//选择快捷输入
	mui('.mui-popover').on('tap','li',function(e){
	  document.getElementById("question").value = document.getElementById("question").value + this.children[0].innerHTML;
	  mui('.mui-popover').popover('toggle')
	}) 
	//图片压缩
	function compressImage(fileSrc){
		//var self = document.getElementById(id);
		var name = fileSrc.substr(fileSrc.lastIndexOf('/') + 1);
			
		plus.zip.compressImage({
			src: fileSrc,
			dst: '_doc/' + name,
			overwrite: true,
			quality: 50
		}, function(zip) {
			size += zip.size  
			console.log("filesize:"+zip.size+",totalsize:"+size);
			if (size > (10*1024*1024)) {
				return mui.toast('文件超大,请重新选择~');
			}
			/*if (!self.parentNode.classList.contains('space')) { //已有图片
				feedback.files.splice(index-1,1,{name:"images"+index,path:fileSrc});
			} else {*/ //加号
				placeholder.classList.remove('space');
				feedback.addFile(zip.target);
				fileInput.setAttribute('id', 'image-' + imageIndexIdNum);
			/*}*/
			up.classList.remove('image-up');
			placeholder.style.backgroundImage = 'url(' + zip.target + ')';
			feedback.newPlaceholder();
		}, function(zipe) {
			mui.toast('压缩失败！')
		});
	}
	
	// 拍照获取图片
	function getImage() {
	    var c = plus.camera.getCamera();
	    c.captureImage(function(e) {
	        plus.io.resolveLocalFileSystemURL(e, function(entry) {
	        	var imgSrc = entry.toLocalURL() + "?version=" + new Date().getTime(); //拿到图片路径
	            compressImage(imgSrc);
	        }, function(e) {
	            console.log("读取拍照文件错误：" + e.message);
	        });
	    }, function(s) {
	        console.log("error" + s);
	    }, {
	        filename: "_doc/camera/"
	    })
	}
	
	// 从相册中选择图片 
	function galleryImg(){
		// 从相册中选择图片
	    plus.gallery.pick( function(e){
	    	for(var i in e.files){
		    	var fileSrc = e.files[i];
		    	compressImage(fileSrc);
	    	}
	    }, function ( e ) {
	    	console.log( "取消选择图片" );
	    },{
	    	filter: "image",
	    	multiple: true,
	    	maximum: feedback.maximum-feedback.files.length,
	    	system: false,
	    	onmaxed: function() {
	    		plus.nativeUI.alert('最多只能选择'+(feedback.maximum-feedback.files.length)+'张图片');
	    	}
	    });
	}
})();
