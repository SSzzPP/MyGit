package com.yhlt.showcase;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.server.ServletWebServerFactory;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.orm.jpa.support.OpenEntityManagerInViewFilter;

import com.corundumstudio.socketio.Configuration;
import com.corundumstudio.socketio.SocketIOServer;
import com.corundumstudio.socketio.annotation.SpringAnnotationScanner;

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

	@Value("${wss.server.host}")
    private String host;
    @Value("${wss.server.port}")
    private Integer port;
    @Value("${app.server.port}")
    private Integer appPort;

	@Bean
	public SocketIOServer socketIOServer() {
		Configuration config = new Configuration();
        config.setHostname(host);
        config.setPort(port);
        
        return new SocketIOServer(config);
	}
 
	@Bean
	public SpringAnnotationScanner springAnnotationScanner(SocketIOServer socketServer) {
		return new SpringAnnotationScanner(socketServer);
	}
	
	@Bean
	public OpenEntityManagerInViewFilter openEntityManagerInViewFilter() {
		return new OpenEntityManagerInViewFilter();
	}

    @Bean
    public ServletWebServerFactory servletContainer() {
        TomcatServletWebServerFactory tomcat = new TomcatServletWebServerFactory();
        tomcat.setPort(appPort);
        return tomcat;
    }

}