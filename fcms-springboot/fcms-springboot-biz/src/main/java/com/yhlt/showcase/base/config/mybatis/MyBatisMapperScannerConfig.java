package com.yhlt.showcase.base.config.mybatis;

import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.context.EnvironmentAware;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

import com.yhlt.showcase.base.repository.MyBatisRepository;
import com.yhlt.showcase.base.repository.MySqlBatisRepositoryMpss;

/**
 * MyBatis扫描接口
 * 
 * @author wangyoutao
 * @since 2018-07-06 09:46
 */
@Configuration
//TODO 注意，由于MapperScannerConfigurer执行的比较早，所以必须有下面的注解
@AutoConfigureAfter(MyBatisCommonConfig.class)
public class MyBatisMapperScannerConfig implements EnvironmentAware {
	
	 @Autowired
	 private Environment env;

    @Bean
    public MapperScannerConfigurer mapperScannerConfigurer() {
        MapperScannerConfigurer mapperScannerConfigurer = new MapperScannerConfigurer();
        mapperScannerConfigurer.setSqlSessionFactoryBeanName("sqlSessionFactory");
//        mapperScannerConfigurer.setBasePackage("com.yhlt.showcase");
        mapperScannerConfigurer.setBasePackage(env.getProperty("mybatis.type-aliases-package"));
        // TODO 未实现Mybatis多数据源配置
        mapperScannerConfigurer.setAnnotationClass(MyBatisRepository.class);
        return mapperScannerConfigurer;
    }
    
    /**
     * test
     * @return
     */
    @Bean
    public MapperScannerConfigurer mapperScannerConfigurerMpss() {
        MapperScannerConfigurer mapperScannerConfigurer = new MapperScannerConfigurer();
        mapperScannerConfigurer.setSqlSessionFactoryBeanName("sqlSessionFactoryMpss");
//        mapperScannerConfigurer.setBasePackage("com.yhlt.showcase");
        mapperScannerConfigurer.setBasePackage(env.getProperty("mybatis.type-aliases-package.Mpss"));
        // TODO 未实现Mybatis多数据源配置
        mapperScannerConfigurer.setAnnotationClass(MySqlBatisRepositoryMpss.class);
        return mapperScannerConfigurer;
    }

	@Override
	public void setEnvironment(Environment env) {
		this.env = env;
	}

}