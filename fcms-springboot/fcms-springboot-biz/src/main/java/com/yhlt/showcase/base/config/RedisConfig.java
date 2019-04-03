package com.yhlt.showcase.base.config;

import java.time.Duration;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CachingConfigurerSupport;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.cache.RedisCacheWriter;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializationContext;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yhlt.showcase.base.properties.CustomProperties;

/**
 * Redis缓存配置类
 * 
 * @author szekinwin
 * 
 */
@Configuration
@EnableCaching
public class RedisConfig extends CachingConfigurerSupport {
	
	@Autowired
	private CustomProperties customProperties;

	// 自定义缓存key生成策略
	// @Bean
	// public KeyGenerator keyGenerator() {
	// return new KeyGenerator(){
	// @Override
	// public Object generate(Object target, java.lang.reflect.Method method,
	// Object... params) {
	// StringBuffer sb = new StringBuffer();
	// sb.append(target.getClass().getName());
	// sb.append(method.getName());
	// for(Object obj:params){
	// sb.append(obj.toString());
	// }
	// return sb.toString();
	// }
	// };
	// }
	
	
	// 缓存管理器 1.x版本支持
//	@Bean
//	public CacheManager cacheManager(
//			@SuppressWarnings("rawtypes") RedisTemplate redisTemplate) {
//		RedisCacheManager cacheManager = new RedisCacheManager();
//		// 设置缓存过期时间
//		cacheManager.setUsePrefix(true);
//		cacheManager.setDefaultExpiration(7200);
//		return cacheManager;
//	}
//	@Bean
//	public RedisTemplate<String, String> redisTemplate(
//			RedisConnectionFactory factory) {
//		StringRedisTemplate template = new StringRedisTemplate(factory);
//		setSerializer(template);// 设置序列化工具
//		template.afterPropertiesSet();
//		return template;
//	}
	
	@Bean
	CacheManager cacheManager(RedisConnectionFactory connectionFactory) {
	    //初始化一个RedisCacheWriter
	    RedisCacheWriter redisCacheWriter = RedisCacheWriter.nonLockingRedisCacheWriter(connectionFactory);
	    
	    //user信息缓存配置
	    RedisCacheConfiguration userCache = defaultCacheConfig("user:");
	    //token信息缓存配置
	    RedisCacheConfiguration tokenCache = defaultCacheConfig("token:");
	    
	    Map<String, RedisCacheConfiguration> redisCacheConfigurationMap = new HashMap<>();
	    redisCacheConfigurationMap.put("user", userCache);
	    redisCacheConfigurationMap.put("token", tokenCache);
	    
	    RedisCacheConfiguration defaultCacheConfig = defaultCacheConfig("base:");
	  
	    // 初始化RedisCacheManager
	    RedisCacheManager redisCacheManager = new RedisCacheManager(redisCacheWriter, defaultCacheConfig, redisCacheConfigurationMap);
	    return redisCacheManager;
	}
	
    /**
     * RedisTemplate配置
     *
     * @return
     */
    @Bean
    public RedisTemplate<String, Object> redisTemplate(RedisConnectionFactory connectionFactory) {
    	//设置序列化
        RedisSerializer<Object> jackson2JsonRedisSerializer = jackson2JsonRedisSerializer();
        //配置redisTemplate
        RedisTemplate<String, Object> redisTemplate = new RedisTemplate<String, Object>();
        redisTemplate.setConnectionFactory(connectionFactory);
        RedisSerializer<String> stringSerializer = new StringRedisSerializer();
        redisTemplate.setKeySerializer(stringSerializer);//key序列化
        redisTemplate.setValueSerializer(jackson2JsonRedisSerializer);//value序列化
        redisTemplate.setHashKeySerializer(stringSerializer);//Hash key序列化
        redisTemplate.setHashValueSerializer(jackson2JsonRedisSerializer);//Hash value序列化
        redisTemplate.afterPropertiesSet();
        return redisTemplate;
    }

    private RedisSerializer<Object> jackson2JsonRedisSerializer(){
	    // 设置CacheManager的值序列化方式为JdkSerializationRedisSerializer,但其实RedisCacheConfiguration默认就是使用StringRedisSerializer序列化key，JdkSerializationRedisSerializer序列化value,所以以下注释代码为默认实现
		// ClassLoader loader = this.getClass().getClassLoader();
		// JdkSerializationRedisSerializer jdkSerializer = new JdkSerializationRedisSerializer(loader);
		
		Jackson2JsonRedisSerializer<Object> jackson2JsonRedisSerializer = new Jackson2JsonRedisSerializer<Object>(Object.class);
		ObjectMapper om = new ObjectMapper();
		om.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
		om.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);
		jackson2JsonRedisSerializer.setObjectMapper(om);
		return jackson2JsonRedisSerializer;
    }

	private RedisCacheConfiguration defaultCacheConfig(String prefix) {
		RedisSerializer<Object> jackson2JsonRedisSerializer = jackson2JsonRedisSerializer();
	   
		RedisSerializationContext.SerializationPair<Object> pair = RedisSerializationContext.SerializationPair.fromSerializer(jackson2JsonRedisSerializer);
		// 禁止缓存空值，开启有助于防止大量无效查询 .disableCachingNullValues()
		return RedisCacheConfiguration.defaultCacheConfig().entryTtl(Duration.ofSeconds(customProperties.getRedisTimeToLive())).prefixKeysWith(prefix).serializeValuesWith(pair);
	}
	
}