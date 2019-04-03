package com.yhlt.showcase.base.dao;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * DAO 基类
 * 
 * @param <T>
 * @author xunxun
 * @date 2015-2-2 下午2:19:34
 */
@NoRepositoryBean
public interface BaseDao<T> extends PagingAndSortingRepository<T, Long>,
		JpaSpecificationExecutor<T> {

}
