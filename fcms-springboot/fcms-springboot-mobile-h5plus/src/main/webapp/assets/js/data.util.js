/**
 * 数据工具js
 */
(function($, owner) {
	/**
	 * 过滤转意字符和特殊字符
	 */
	owner.clStr=function(s){  
			    // 去掉转义字符    
			    s = s.replace(/[\'\"\\\/\b\f\n\r\t]/g, '');    
			    // 去掉特殊字符    
			    s = s.replace(/[\-\_\,\!\|\~\`\(\)\#\$\%\^\&\*\{\}\:\;\"\L\<\>\?]/g, '');    
			    return s;    
	}
	/**
	 * 验证手机号
	 */
	owner.isPoneAvailable = function(str){
		var myreg=/^[1][0-9]{10}$/;
        if (myreg.test(str)) {
            return false;
        } else {
            return true;
        }
	}
	
}(mui,window.dataUtil = {}));

