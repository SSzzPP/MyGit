/*!
 * ======================================================
 * FeedBack Template For MUI (http://dev.dcloud.net.cn/mui)
 * =======================================================
 * @version:1.0.0
 * @author:cuihongbao@dcloud.io
 */

(function(mui,owner) {
	var index = 1;
	var size = null;
	var imageIndexIdNum = 0;
	var starIndex = 0;
	
	owner.imageList = document.getElementById('image-list');
	owner.submitBtn = document.getElementById('submit');
	
	owner.initUploadImages = function(){
		owner.newPlaceholder();
	}
	
	owner.urlStr = '#';

	owner.files = [];
	owner.uploader = null;  
	owner.deviceInfo = null; 
	mui.plusReady(function() {
		//设备信息，无需修改
		owner.deviceInfo = {
			appid: plus.runtime.appid, 
			imei: plus.device.imei, //设备标识
			images: owner.files, //图片文件
			p: mui.os.android ? 'a' : 'i', //平台类型，i表示iOS平台，a表示Android平台。
			md: plus.device.model, //设备型号
			app_version: plus.runtime.version,
			plus_version: plus.runtime.innerVersion, //基座版本号
			os:  mui.os.version,
			net: ''+plus.networkinfo.getCurrentType()
		}
	});
	/**
	 *提交成功之后，恢复表单项 
	 */
	owner.clearForm = function() {
//		feedback.question.value = '';
//		feedback.contact.value = '';
		owner.imageList.innerHTML = '';
		owner.newPlaceholder();
		owner.files = [];
		index = 0;
		size = 0;
		imageIndexIdNum = 0;
		starIndex = 0;
	};
	owner.getFileInputArray = function() {
		return [].slice.call(owner.imageList.querySelectorAll('.file'));
	};
	owner.addFile = function(path) {
		owner.files.push({name:"images"+index,path:path});
		index++;
	};
	/**
	 * 初始化图片域占位
	 */
	owner.newPlaceholder = function() {
		var fileInputArray = owner.getFileInputArray();
		if (fileInputArray &&
			fileInputArray.length > 0 &&
			fileInputArray[fileInputArray.length - 1].parentNode.classList.contains('space')) {
			return;
		};
		imageIndexIdNum++;
		var placeholder = document.createElement('div');
		placeholder.setAttribute('class', 'image-item space');
		var up = document.createElement("div");
		up.setAttribute('class','image-up')
		//删除图片
		var closeButton = document.createElement('div');
		closeButton.setAttribute('class', 'image-close');
		closeButton.innerHTML = 'X';
		//小X的点击事件
		closeButton.addEventListener('tap', function(event) {
			setTimeout(function() {
				owner.imageList.removeChild(placeholder);
			}, 0);
			return false;
		}, false);
		
		//
		var fileInput = document.createElement('div');
		fileInput.setAttribute('class', 'file');
		fileInput.setAttribute('id', 'image-' + imageIndexIdNum);
		fileInput.addEventListener('tap', function(event) {
			var self = this;
			var index = (this.id).substr(-1);
			
			var btnArray = [{
				title: "拍照"
			}, {
				title: "从相册选择"
			}];
			plus.nativeUI.actionSheet({
				title: "选择照片",
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
							owner.compressImage(up,placeholder,self,path);
						}, function(err) {});
						break;
					case 2:
//						openPhotoAlbum();
						plus.gallery.pick(function(path) {
							owner.compressImage(up,placeholder,self,path);
						}, function(err) {}, null);
						break;
				}
			});
		}, false);
		placeholder.appendChild(closeButton);
		placeholder.appendChild(up);
		placeholder.appendChild(fileInput);
		owner.imageList.appendChild(placeholder);
	};
	owner.compressImage = function(up,placeholder,self,path){
		var name = path.substr(path.lastIndexOf('/') + 1);
		plus.zip.compressImage({
			src: path,
			dst: '_doc/' + name,
			overwrite: true,
			quality: 50,
			width:'1024px'
		}, function(zip) {
			size += zip.size  
			console.log("filesize:"+zip.size+",totalsize:"+size);
			if (size > (10*1024*1024)) {
				return mui.toast('文件超大,请重新选择~');
			}
			if (!self.parentNode.classList.contains('space')) { //已有图片
				owner.files.splice(index-1,1,{name:"images"+index,path:path});
			} else { //加号
				placeholder.classList.remove('space');
				owner.addFile(zip.target);
				owner.newPlaceholder();
			}
			up.classList.remove('image-up');
			placeholder.style.backgroundImage = 'url(' + zip.target + ')';
		}, function(zipe) {
			mui.toast('压缩失败！')
		});
	}
	

	owner.send = function(content) {
		owner.uploader = plus.uploader.createUpload(owner.urlStr, {
			method: 'POST'
		}, function(upload, status) {
			plus.nativeUI.closeWaiting()
			if(status==200){
				var data = JSON.parse(upload.responseText);
				//上传成功，重置表单
				if (data.success) {
					mui.alert("上传成功","图片上传","确定",function () {
						owner.clearForm();
						mui.back();
					});
				}else{
					mui.alert(data.errorMsg+"上传失败","图片上传","确定",function () {
					});
				}
				
			}else{
				mui.alert("上传失败","图片上传","确定",function () {});
			}
			
		});
		//添加上传数据
		mui.each(content, function(index, element) {
			if (index !== 'images') {
				console.log("addData:"+index+","+element);
//				console.log(index);
				owner.uploader.addData(index, element)
			} 
		});
		//添加上传文件
		mui.each(owner.files, function(index, element) {
			var f = owner.files[index];
			console.log("addFile:"+JSON.stringify(f));
			owner.uploader.addFile(f.path, {
//				key: "images"
				key: f.name
			});
		});
		//开始上传任务
		owner.uploader.start();
		plus.nativeUI.showWaiting();
	};
	
	
}(mui, window.uploadImages = {}));