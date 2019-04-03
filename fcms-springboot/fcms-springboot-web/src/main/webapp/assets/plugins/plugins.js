$(function(){
	$("[data-options*='required:true']").parent("td").prev().prepend("<span class=\"red\">*</span>");
});
/**
 * 解决jQuery easyui 1.4.3 combotree 显示字段undefined问题
 * 将显示名称列修改为 nameField属性
 * @author yty
 * @date 2016-5-6 11:39:23
 */
$.fn.combotree.defaults.loadFilter = function(data, parent) {
    var opt = $(this).data().tree.options;
    var n = opt.nameField;
    if(n){
		for (var i = 0, l = data.length; i < l; i++) {
        	data[i]['text'] = data[i][n];
        	data[i].children=function(r,n){
	    		if(r){
		    		for (var a = 0, b = r.length; a < b; a++) {
		    			r[a]['text'] = r[a][n];
			            if(r[a].children && r[a].children.length){
			            	r[a].children=arguments.callee(r[a].children,n);
			            }
		    		}
	    		}
	    		return r;
	    	}(data[i].children,n);
	    }
    }
    return data;
};
(function($){
	$.numz=function(t,l){
		var tg=$(t);
		var ov=$(t).val();
		tg.blur(function(){
			l=l||0;
			var exp=eval("/^[0-9]*\\.?([0-9]){0,"+l+"}$/");
			var v=tg.val();
			if( !exp.test(v) ){
				tg.val(exp.test(ov)?ov:0);
			}
		});
	}
})($);
$.extend($.fn.validatebox.defaults.rules, {    
    numz: {    
        validator: function(value){    
            return !isNaN(value);    
        },    
        message: '只能输入整数！'   
    }    
}); 
