package com.yhlt.showcase.base.security;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * controller后台方法安全验证注解<br>
 * 
 * 在controller类上增加@AccessRequired(authorization = "xxxx")<br>
 * 
 * 在controller类方法上增加@AccessRequired(authorization = "管理员")<br>
 * 
 * 权限验证方法将两个authorization通过'_'连接进行比对
 * 
 * @author admin
 * 
 */
@Target({ ElementType.METHOD, ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface AccessRequired {
	/**
	 * Controller类和方法上<br>
	 * 对应Resources中资源备注信息
	 * 
	 * @return
	 */
	public String value() default "";
}