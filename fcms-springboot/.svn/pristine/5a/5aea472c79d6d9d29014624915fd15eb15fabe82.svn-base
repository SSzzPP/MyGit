package com.yhlt.showcase.base.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.env.Environment;
import org.springframework.http.MediaType;
import org.springframework.http.converter.ByteArrayHttpMessageConverter;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.view.InternalResourceView;

import com.yhlt.showcase.base.security.interceptor.FrontLoginContextInterceptor;
import com.yhlt.showcase.base.security.interceptor.LoginContextInterceptor;

/**
 * 继承WebMvcConfigurationSupport继承并重写addInterceptor方法用于添加配置拦截器
 * @author wangyoutao
 */
@Configuration
public class WebMvcConfig extends WebMvcConfigurationSupport {
	
	@Autowired
	private Environment env;
	
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //添加拦截器
    	registry.addInterceptor(new FrontLoginContextInterceptor()).
        addPathPatterns("/front/login/**",
        		"/front/userPoint",
        		"/front/activity/**",
        		"/front/survey/**",
        		"/front/wallet/**")
        .excludePathPatterns(
    		"/",
    		"/error/**",
    		"/assets/**",
    		"/login/**",
    		"/front/login/venueLoginWithCheckcode",
    		"/front/login/sendPictureCode",
    		"/admin/venue/info/venueImg",
    		"/admin/venue/user/userHeadImg",
    		"/admin/main/portal" 
        );
        registry.addInterceptor(new LoginContextInterceptor())
        .addPathPatterns("/**")
        .excludePathPatterns(
    		"/",
    		"/error/**",
    		"/assets/**",
    		"/login/**",
    		"/front/**",
    		"/admin/venue/info/venueImg",
    		"/admin/venue/user/userHeadImg",
    		"/admin/main/portal"
    		
        );
        
        super.addInterceptors(registry);
    }

    /**
     * SiteMesh装饰器
     * @return
     * 2018年7月19日下午12:37:20
     */
//	@Bean // jar包方式部署需要解开
//	@SuppressWarnings({ "unchecked", "rawtypes" })
//    public FilterRegistrationBean siteMeshFilter() {
//        FilterRegistrationBean fitler = new FilterRegistrationBean();
//        WebSiteMeshFilter siteMeshFilter = new WebSiteMeshFilter();
//        fitler.setFilter(siteMeshFilter);
//        return fitler;
//    }
    
    

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    @Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp(env.getProperty("spring.mvc.view.prefix"), env.getProperty("spring.mvc.view.suffix"));
		registry.enableContentNegotiation(new InternalResourceView());
	}

    @Override
	public void addViewControllers(ViewControllerRegistry registry) {
    	// 等同于配置 welcome-file-list
		registry.addViewController("/").setViewName("index");
		registry.setOrder(Ordered.HIGHEST_PRECEDENCE);
		super.addViewControllers(registry);
    } 

//    @Override
//    public void configureContentNegotiation(ContentNegotiationConfigurer configurer) {
//        configurer.favorPathExtension(true)
//                .ignoreAcceptHeader(true)
//                .parameterName("mediaType")
//                .defaultContentType(MediaType.TEXT_HTML)
//                .mediaType("html", MediaType.TEXT_HTML)
//                .mediaType("json", MediaType.APPLICATION_JSON_UTF8);
//    }
    
    @Override
    protected void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
    	List<MediaType> supportedMediaTypes = new ArrayList<>();
    	supportedMediaTypes.add(MediaType.APPLICATION_JSON);
    	
    	ByteArrayHttpMessageConverter converter1 = new ByteArrayHttpMessageConverter();
    	
    	StringHttpMessageConverter converter2 = new StringHttpMessageConverter();
    	converter2.setSupportedMediaTypes(supportedMediaTypes);

    	MappingJackson2HttpMessageConverter converter3 = new MappingJackson2HttpMessageConverter();
    	supportedMediaTypes = new ArrayList<>();
    	supportedMediaTypes.add(MediaType.APPLICATION_JSON);
    	supportedMediaTypes.add(new MediaType("application", "vnd.spring-boot.actuator.v2+json"));
    	converter3.setSupportedMediaTypes(supportedMediaTypes);
    	
    	converters.add(converter1);
    	converters.add(converter2);
    	converters.add(converter3);
    	
    	super.configureMessageConverters(converters);
    }

    @Bean(name = "multipartResolver")
    // 文件上传bean
    public CommonsMultipartResolver commonsMultipartResolver() {
        return new CommonsMultipartResolver();
    }
    
}