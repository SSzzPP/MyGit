package com.itman.xw.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author SSzzPP
 *	用来返回json数据 等同于@Controller 加 @ResponseBody
 */
@RestController
public class HelloWorldSpringBoot {
	@RequestMapping(value="/hello",method=RequestMethod.GET)
	public String index(){
		return "上海自来水来自海上";
	}
}
