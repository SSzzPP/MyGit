//2.Draggable（拖动）
(function ($) {
    /*--绑定window resize 事件，来实现 fit = true--*/
    var TO = false;
    var resized = true;

    $(window).unbind(".panel").bind("resize.panel", function () {
        if (!resized) {
            return;
        }
        if (TO !== false) {
            clearTimeout(TO);
        }
        TO = setTimeout(function () {
            resized = false;
            var layout = $("body.layout");
            if (layout.length) {
                layout.layout("resize");
            } else {
                //原来只处理body直接子元素
                $("body").children("div.panel,div.accordion,div.tabs-container,div.layout").triggerHandler("_resize");
                //扩展如下元素
                $("body div.layout-custom-resize,body div.panel-custom-resize,div.tabs-custom-resize").triggerHandler("_resize");
                $("body table.datagrid-custom-resize").each(function(){
                    $(this).parents("div.panel.datagrid").triggerHandler("_resize");
                })
            }
            resized = true;
            TO = false;
        }, 200);
    });
    /*--重写 $.fn._fit 函数--*/
    $.fn._fit =	function (_f){
        _f=_f==undefined?true:_f;
        var t=this[0];
        var p=(t.tagName=="BODY"?t:this.parent()[0]);
        /*------tjs-------------*/
        var data = $.data(t) ;
        //如果 this 是datagrid 的外层panel,panel 的 data 里不含 datagrid的属性（custom_fit,custom_height,custom_width .....）
        //因此要取 datagrid的data数据，
        if(this.hasClass("panel")&&this.hasClass("datagrid")){
            var tt = this.find(".datagrid-custom-resize");
            if(tt.size()>0){
                data = $.data(tt[0]);
                data = $.extend( {},data.datagrid);
            }
        }else{
            data = $.extend( {},data.panel,data.layout,data.tabs);
        }
        if(data.options){
            var opt = data.options;
            if(opt.custom_fit){
                var parents = this.parents();
                for(var i=0;i<parents.size();i++){
                    if($(parents[i]).hasClass("panel-body") || $(parents[i]).hasClass("modal-body") || $(parents[i]).hasClass("box-body")){
                        p = parents[i];
                        break;
                    }
                }
                if(!$(p).hasClass("panel-body") && !$(p).hasClass("modal-body") && !$(p).hasClass("box-body")){
                    p = $("body")[0];
                }
                //先加上计算
                $(p).addClass("panel-noscroll");
                if(p.tagName=="BODY"){
                    $("html").addClass("panel-fit");
                }
            }
        }
        /*------tjs end-------------*/
        var _10=p.fcount||0;
        if(_f){
            if(!t.fitted){
                t.fitted=true;
                p.fcount=_10+1;
                $(p).addClass("panel-noscroll");
                if(p.tagName=="BODY"){
                    $("html").addClass("panel-fit");
                }
            }
        }else{
            if(t.fitted){
                t.fitted=false;
                p.fcount=_10-1;
                if(p.fcount==0){
                    $(p).removeClass("panel-noscroll");
                    if(p.tagName=="BODY"){
                        $("html").removeClass("panel-fit");
                    }
                }
            }
        }
        /*------tjs-------------*/
        var w= $(p).width(),h= $(p).height();

        if(data.options){
            var opt = data.options;
            var margin_padding_width = 0;
            var margin_padding_height = 0;
            if(opt.custom_fit){
                //var custom_fit_to = opt.custom_fit_to?opt.custom_fit_to:"body";
                //custom_fit_to = $(custom_fit_to).size()>0?$(custom_fit_to)[0]:$("body")[0];
                var parents = this.parents();
                for(var i=0;i<parents.size();i++){
                    var the = parents[i];
                    if(the.tagName!="BODY" && the.tagName!="HTML" && the!=p){
                        var _h = $(the).outerHeight(true) - $(the).height();
                        var _w = $(the).outerWidth(true) - $(the).width();
                        margin_padding_height = margin_padding_height + _h;
                        margin_padding_width = margin_padding_width + _w;
                    }else{
                        break;
                    }
                }

            }
            if(opt.custom_width){
                margin_padding_width = margin_padding_width + parseInt(opt.custom_width);
            }
            if(opt.custom_height){
                margin_padding_height = margin_padding_height + parseInt(opt.custom_height);
            }
            if(opt.custom_heighter){
                $(opt.custom_heighter).each(function(){
                    margin_padding_height = margin_padding_height + $(this).outerHeight(true);
                });
            }
            w = w - margin_padding_width;
            h = h - margin_padding_height;
            
            if(opt.fix_height && opt.fix_height>0){
            	h = opt.fix_height;
            	$(p).removeClass("panel-noscroll");
                if(p.tagName=="BODY"){
                    $("html").removeClass("panel-fit");
                }
            }else if(opt.min_height && opt.min_height>h){
                h = opt.min_height;
                $(p).removeClass("panel-noscroll");
                if(p.tagName=="BODY"){
                    $("html").removeClass("panel-fit");
                }
                w = w - 15
            }
            if(opt.min_width && opt.min_width>w){
                w = opt.min_width;
                //$(p).removeClass("panel-noscroll");
            }
        }

        return {width:w,height:h};
        /*------tjs end-------------*/
        //return {width:$(p).width(),height:$(p).height()};
    }
})(jQuery);
(function($) {
    $.extend({
        format : function(str, step, splitor) {
            var strEnd = "";
            var strStart="";
            str = str?str:"";
            str = str.toString();
            if(str.indexOf(".")>-1){
                strStart = str.substring(0,str.indexOf("."));
                strEnd = str.substring(str.indexOf("."), str.length);
                str = strStart;
            }
            var len = str.length;

            if(len > step) {
                var l1 = len%step,
                    l2 = parseInt(len/step),
                    arr = [],
                    first = str.substr(0, l1);
                if(first != '') {
                    arr.push(first);
                };
                for(var i=0; i<l2 ; i++) {
                    arr.push(str.substr(l1 + i*step, step));
                };
                str = arr.join(splitor);
            };
            return str+strEnd;
        }
    });
})(jQuery);
