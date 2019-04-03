package com.yhlt.showcase.base.properties;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

@Component
@Configuration
@ConfigurationProperties(prefix = "spring.custom", ignoreUnknownFields = false)
public class CustomProperties {

	private Long redisTimeToLive;

	public Long getRedisTimeToLive() {
		return redisTimeToLive;
	}

	public void setRedisTimeToLive(Long redisTimeToLive) {
		this.redisTimeToLive = redisTimeToLive;
	}

}