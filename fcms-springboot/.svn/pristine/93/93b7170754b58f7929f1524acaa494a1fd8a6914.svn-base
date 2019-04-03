/** layuiAdmin.std-v1.0.0 LPPL License By http://www.layui.com/admin/ */
;
layui.define(function(e) {
    var common = (layui.$, layui.layer, layui.laytpl, layui.setter, layui.view, layui.admin);
    var common_functions = {
		logout : function() {
	    	$.submit({
	    		url:dynamicURL + "login/logout",
				success: function(data) {
					if(data.success){
						 common.exit(function() {
		                	layui.data('loginUser', {
		            		    key: 'sessionId'
		            		    ,remove: true
		            		});
		                    location.href = dynamicURL + "login"
			              })
					}
	               
	            }
	    	})
		},
		venueLogout : function() {
	    	$.submit({
	    		url:dynamicURL + "login/venueLogout",
				success: function(data) {
					if(data.success){
						 common.exit(function() {
		                	layui.data('loginUser', {
		            		    key: 'sessionId'
		            		    ,remove: true
		            		});
		                    location.href = dynamicURL + "login/venue"
			              })
					}
	               
	            }
	    	})
		}
    }
    common.events.logout = function() {
    	common_functions.logout();
//        common.req({
//            url: dynamicURL + "json/user/logout.js",
//            type: "get",
//            data: {},
//            done: function(e) {
//                common.exit(function() {
//                    location.href = "${dynamicURL}/login/logout"
//                })
//            }
//        })
    },
    common.events.venueLogout = function() {
    	common_functions.venueLogout();
//        common.req({
//            url: dynamicURL + "json/user/logout.js",
//            type: "get",
//            data: {},
//            done: function(e) {
//                common.exit(function() {
//                    location.href = "${dynamicURL}/login/logout"
//                })
//            }
//        })
    },
    e("common", common_functions)
});