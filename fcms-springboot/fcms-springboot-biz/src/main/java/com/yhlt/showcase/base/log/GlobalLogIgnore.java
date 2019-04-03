package com.yhlt.showcase.base.log;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/**
 * 业务方法日志注解-跳过全局日志拦截<br>
 * 
 * 在Controller类的方法上增加@GlobalLogIgnore
 * 
 * @author wangyoutao
 * @date 2018-05-08 14:17:14
 */
@Documented
@Retention(RetentionPolicy.RUNTIME)
public @interface GlobalLogIgnore {
	
}