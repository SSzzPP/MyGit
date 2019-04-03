/**
 * 更新分享服务
 */
function updateSerivces(){
	plus.share.getServices(function(s){
		shares={};
		for(var i in s){
			var t=s[i];
			shares[t.id]=t;
		}
	}, function(e){
		mui.toast('获取分享服务列表失败：'+e.message);
	});
}

/**
 * 调用系统分享
  */
function shareSystem(content){
	var msg={content:content};
	plus.share.sendWithSystem?plus.share.sendWithSystem(msg, function(){
		console.log('Success');
	}, function(e){
		console.log('Failed: '+JSON.stringify(e));
	}):shareSystemNativeJS();
}
function shareSystemNativeJS() {
	if(plus.os.name!=='Android'){
		plus.nativeUI.alert('此平台暂不支持系统分享功能!');
		return;
	}
	var intent=new Intent(Intent.ACTION_SEND);
//			if(pic&&pic.realUrl){
//				var p = '';
//				p = pic.realUrl;
//				if(p.substr(0,7)==='file://'){
//					p=p.substr(7);
//				}else if(p.sub(0)!=='/'){
//					p=plus.io.convertLocalFileSystemURL(p);
//				}
//			}
//	var f = new File(p);
//	var uri = Uri.fromFile(f);
//	if(f.exists()&&f.isFile()){
//		console.log('image/*');
//		intent.setType('image/*');
//		intent.putExtra(Intent.EXTRA_STREAM,uri);
//	}else{
//		console.log('text/plain');
//		intent.setType('text/plain');
//	}
	intent.setType('text/plain');
	intent.putExtra(Intent.EXTRA_SUBJECT,'乔包');
	intent.putExtra(Intent.EXTRA_TEXT,sharecontent.value);
	intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
	main.startActivity(Intent.createChooser(intent,'账户信息'));
}
/**
 * html2canvas截图
 * @param {Object} html2Canvas
 * @param {Object} dom
 * @param {Object} fileName
 */
function saveDomImage (html2Canvas, dom, fileName) {  //使用之前要引入 html2Canvas.js
    if(mui.os.plus){
        if (typeof html2Canvas == null)
            throw Error("html2Canvas is not defined");
        if (dom == null)
            throw Error("saveDomImage param : dom is null");
        if (fileName == null || fileName == "")
            fileName = "untitled.png";

        var getPixelRatio = function(context) {
            var backingStore = context.backingStorePixelRatio ||
                context.webkitBackingStorePixelRatio || 1;
            return (window.devicePixelRatio || 1) / backingStore;
        };

        var _canvas = document.createElement('canvas');
		var ratio=3;

        var w = dom.width;
        var h = dom.height;

        _canvas.width = w *　ratio;
        _canvas.height = h *　ratio;
        _canvas.style.width = w *　ratio + 'px';
        _canvas.style.height = h　*　ratio + "px";

        var ctx = _canvas.getContext('2d');
		// 【重要】关闭抗锯齿
//      ctx.mozImageSmoothingEnabled = false;
//      ctx.webkitImageSmoothingEnabled = false;
//      ctx.msImageSmoothingEnabled = false;
//      ctx.imageSmoothingEnabled = false;
//      var ratio = getPixelRatio(ctx);
        ctx.scale(ratio,ratio);


        html2Canvas(dom, {
            allowTaint:true,
            logging: false,
            profile: true,
            useCROS: true,
            canvas : _canvas,
            onrendered: function (canvas) {
                var dataUrl = canvas.toDataURL();
                var b = new plus.nativeObj.Bitmap('bitblmap');
                b.loadBase64Data(dataUrl, function () {
                    b.save("_doc/" + fileName, {overwrite: true,quality:100}, function (object) {
                        plus.gallery.save("_doc/" + fileName, function () {
                            mui.toast("图片已保存到相册");
                        }, function () {
                            mui.toast("图片保存失败");
                        });
                    }, function () {
                        mui.toast("图片保存失败");
                    });
                }, function () {
                    mui.toast("图片保存失败");
                });
            }
        });
    }
}