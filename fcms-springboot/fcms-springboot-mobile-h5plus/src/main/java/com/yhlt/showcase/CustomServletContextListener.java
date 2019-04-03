package com.yhlt.showcase;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.corundumstudio.socketio.SocketIOServer;
import com.yhlt.showcase.base.properties.EnvProperties;

@WebListener
public class CustomServletContextListener implements ServletContextListener {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private SocketIOServer socketIoServer;
	
	@Override
	public void contextDestroyed(ServletContextEvent servletContextEvent) {
		socketIoServer.stop();
		logger.info("ServletContext销毁！");
	}

	@Autowired
	private EnvProperties envProperties;
	
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
    	ServletContext servletContext = servletContextEvent.getServletContext();
    	// war包形式部署到tomcat中运行时必须调用
		WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext).getAutowireCapableBeanFactory().autowireBean(this);
		logger.info("ServletContext初始化！");
		logger.info("系统参数初始化中....");
		System.setProperty("user.timezone", "Etc/GMT-8");
		servletContext.setAttribute("appUrl", envProperties.getAppUrl());
		servletContext.setAttribute("staticURL", envProperties.getServerStatic());
		servletContext.setAttribute("dynamicURL", envProperties.getServerDynamic());
		// jquery
		servletContext.setAttribute("easyUIVersion", envProperties.getEasyuiVersion());
		servletContext.setAttribute("easyUITheme", envProperties.getEasyuiTheme());
		// sms
		servletContext.setAttribute("smsEnable", envProperties.getSmsEnable());
    }

}