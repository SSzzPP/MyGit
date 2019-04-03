/**
 * 判断是否为地址,用于二维码扫描
 * @param {Object} str
 */
function IsAddress(str){
	var reg=/^([a-zA-Z0-9]){30,40}$/;
    return reg.test(str);
}
/**
 * 判断是否为收款二维码格式
 * 校验地址是否为YQT:xxxxx?amount=xx&label=xxx&message=xxx格式 
 * @param {Object} str
 */
function IsCollectionAddress(str) {
//	var str = "YQF:1HUTan6oArh22z9mTuJskN9qQvYJ7CeThF?amount=10&label=中文测试&message=中文1212rgrgregre";
    var reg=/^(\w+)+:([a-zA-Z0-9]{30,40})+\?amount=(\d+(\.\d+)?)/;
    return reg.test(str);
}

/**
 * 获取收款地址正则分组数据
 * @param {Object} str
 */
function GetCollectionAddrInfo(str) {
    var reg=/^(\w+)+:([a-zA-Z0-9]{30,40})+\?amount=(\d+(\.\d+)?)/;
    reg.test(str);
    return [RegExp.$1,RegExp.$2,RegExp.$3,GetParameter(str,"label"),GetParameter(str,"message")];
}

function GetParameter(str,name){  
	var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");  
	var r = str.match(reg);  
	if(r!=null)return decodeURI(r[2]); return null;  
} 
/**
 * 国际化
 * @param {Object} pageCallBack
 */
function loadProperties(pageCallBack) {
	var lang = constants.getLanguage();
    jQuery.i18n.properties({//加载资浏览器语言对应的资源文件
        name : 'yqemu', //资源文件名称
        path : staticURL+'i18n/', //资源文件路径
        mode : 'map', //用Map的方式使用资源文件中的值
        language : lang,
        callback : function() {//加载成功后设置显示内容
            pageCallBack();
        }
    });
}

/**
 * 国际化
 * @param {Object} pageCallBack
 */
function loadProperties2(pageCallBack) {
	var lang = constants.getLanguage();
    jQuery.i18n.properties({//加载资浏览器语言对应的资源文件
        name : 'yqemu', //资源文件名称
        path : '../../i18n/', //资源文件路径
        mode : 'map', //用Map的方式使用资源文件中的值
        language : lang,
        callback : function() {//加载成功后设置显示内容
            pageCallBack();
        }
    });
}
/**
 * 复制到剪贴板
 * @param {Object} data
 */
function copyDataToClipboard(data) {
	if(mui.os.ios) {
		var UIPasteboard = plus.ios.importClass("UIPasteboard");
		var generalPasteboard = UIPasteboard.generalPasteboard();
		// 设置/获取文本内容:
		generalPasteboard.setValueforPasteboardType(data, "public.utf8-plain-text");
		var value = generalPasteboard.valueForPasteboardType("public.utf8-plain-text");
		plus.device.vibrate( 500 );
		mui.toast(getI18NContent("yqemu_dialog_copy_success"));
	} else if(mui.os.android) {
		var Context = plus.android.importClass("android.content.Context");
		var main = plus.android.runtimeMainActivity();
		var clip = main.getSystemService(Context.CLIPBOARD_SERVICE);
		plus.android.invoke(clip, "setText", data);
		plus.device.vibrate( 500 );
		mui.toast(getI18NContent("yqemu_dialog_copy_success"));
	}
}
/**
 * 初始化国际化
 */
function initI18N(){
	try{
		loadProperties(function(){
			$('.i18n').each(function() {
//				console.log($(this).attr("key"));
		        $(this).html($.i18n.prop($(this).attr("key")));
		    });
		});
	}catch(e){
		loadProperties2(function(){
			$('.i18n').each(function() {
//				console.log($(this).attr("key"));
		        $(this).html($.i18n.prop($(this).attr("key")));
		    });
		});
	}
}

function getI18NContent(){
//	console.log(arguments[0]);
	try{
		return $.i18n.prop(arguments[0],$(arguments).splice(1,arguments.length));
	}catch(e){
		initI18N();
		return $.i18n.prop(arguments[0],$(arguments).splice(1,arguments.length));
	}
}
