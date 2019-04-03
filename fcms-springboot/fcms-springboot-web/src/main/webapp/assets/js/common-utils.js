/*
 * @auth yty
 * 2018-07-18 wyt 修改
 * 常用集成工具
 */
(function() {
    var intName = "保存";
    var cou = 0;
    $.extend({
        submit: function(options) {
            if (!options || !options.url) {
                throw new Error("缺少URL参数!");
            }
            if (options.formTg && options.data) {
                throw new Error("formTg和data 2选1!");
            }
			var settings = {
		       url        : null,  
		       method     : "post",
		       successMsg : "操作成功！",
		       formTg     : null,
		       data       : {},
		       butObj     : null,
		       success    : null,
		       error      : null,
			};
            if (settings.butObj != null && typeof(settings.butObj) != "undefined") {
                settings.butObj.text(intName);
                settings.butObj.attr('id', 'a_can_click');
            }
            $.extend(settings, options);
//            var params = options.formTg ? options.formTg.serialize() : options.data;
            var params = options.formTg ? new FormData(options.formTg[0]) : options.data;
            var contentFlag = options.formTg ? false : "application/x-www-form-urlencoded";
            var processFlag = options.formTg ? false : true;
            
            //新增防重复提交dl
            if (settings.butObj != null && typeof(settings.butObj) != "undefined") {
                if (settings.butObj.text() != "" && settings.butObj.text() != null) {
                    if (cou == 0) {
                        intName = settings.butObj.text();
                    }
                    cou += 1;
                }
                settings.butObj.text("保存中请稍候..");
                if ("a_not_click" == settings.butObj.attr("id")) {
                    return;
                }		    		
                settings.butObj.attr('id','a_not_click');
            }

            $.ajax({
                url: settings.url,
                type: settings.method,
                contentType: contentFlag,
                processData: processFlag,
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("sessionId", layui.data("loginUser", "sessionId"));
                },
                data: params,
                success: function(res) {
                    if ("function" == typeof(settings.success)) {
                    	if(settings.butObj) {
                    		settings.butObj.text(intName);
                            settings.butObj.attr('id', 'a_can_click');
                    	}
                        settings.success(res);
                        return;
                    }
                    // 实现公共逻辑
                },
                error: function(res) {
                    if ("function" == typeof(settings.error)) {
                        settings.error(res);
                        return;
                    }
                    // 实现公共逻辑
                }
            });

        }
    });
})($);