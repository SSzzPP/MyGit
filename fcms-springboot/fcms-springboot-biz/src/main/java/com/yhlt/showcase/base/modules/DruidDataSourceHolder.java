package com.yhlt.showcase.base.modules;

import com.alibaba.druid.pool.DruidDataSource;

/**
 * 以静态变量保存DruidDataSource, 可在任何代码任何地方任何时候取出DruidDataSource.
 * 
 * @author wangyoutao
 * @date 2018-07-13 下午3:51:40
 */
public class DruidDataSourceHolder {

	private static DruidDataSource druidDataSource  = null;

	/**
	 * 取得存储在静态变量中的DruidDataSource.
	 */
	public static DruidDataSource getDruidDataSource() {
		return druidDataSource;
	}


	/**
	 * 实现ApplicationContextAware接口, 注入Context到静态变量中.
	 */
	public static void setDruidDataSource(DruidDataSource druidDataSource) {
		DruidDataSourceHolder.druidDataSource = druidDataSource;
	}

}