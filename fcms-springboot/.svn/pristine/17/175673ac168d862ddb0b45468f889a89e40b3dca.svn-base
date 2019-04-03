package com.yhlt.showcase;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.server.ServletWebServerFactory;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.orm.jpa.support.OpenEntityManagerInViewFilter;

import com.opensymphony.sitemesh.webapp.SiteMeshFilter;

@SpringBootApplication
@ServletComponentScan
@ComponentScan(basePackages = "com.yhlt.showcase")
public class MainApplication extends SpringBootServletInitializer {
	
	private static Logger logger = LoggerFactory.getLogger(MainApplication.class);

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(MainApplication.class);
	}

	public static void main(String[] args) throws Exception {
		SpringApplication.run(MainApplication.class, args);
		logger.info("Started Application is successed !");
	}
	
	@Bean
	@SuppressWarnings({ "rawtypes", "unchecked" })
    public FilterRegistrationBean  filterRegistrationBean() {
		FilterRegistrationBean registrationBean = new FilterRegistrationBean();
		registrationBean.setFilter(new SiteMeshFilter());
		List<String> urlPatterns = new ArrayList<String>();
	    urlPatterns.add("/*");
	    registrationBean.setUrlPatterns(urlPatterns);
	    return registrationBean;
    }

	@Bean
	public OpenEntityManagerInViewFilter openEntityManagerInViewFilter() {
		return new OpenEntityManagerInViewFilter();
	}

    @Value("${web.server.port}")
    private Integer appPort;
    
    @Bean
    public ServletWebServerFactory servletContainer() {
        TomcatServletWebServerFactory tomcat = new TomcatServletWebServerFactory();
        tomcat.setPort(appPort);
        return tomcat;
    }

}