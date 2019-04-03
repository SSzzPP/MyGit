package com.yhlt.showcase.base.modules;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.jpa.domain.Specification;

import com.google.common.collect.Lists;

public class DynamicSpecifications {
	private static SimpleDateFormat dateTimeFormat = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");
	private static SimpleDateFormat dateFormat = new SimpleDateFormat(
			"yyyy-MM-dd");

	private static final String NO_CONDITIONGROUP = "NO_CONDITIONGROUP";

	public static <T> Specification<T> bySearchFilterBak(
			final Collection<SearchFilter> filters, final Class<T> entityClazz) {
		return new Specification<T>() {
			@SuppressWarnings({ "rawtypes", "unchecked" })
			@Override
			public Predicate toPredicate(Root<T> root, CriteriaQuery<?> query,
					CriteriaBuilder builder) {
				if (Collections3.isNotEmpty(filters)) {
					List<Predicate> predicates = Lists.newArrayList();
					for (SearchFilter filter : filters) {
						// nested path translate, 如Task的名为"user.name"的filedName,
						// 转换为Task.user.name属性
						String[] names = StringUtils.split(filter.fieldName,
								".");
						Path expression = root.get(names[0]);
						for (int i = 1; i < names.length; i++) {
							expression = expression.get(names[i]);
						}
						// 值类型转换
						convertValue(filter, expression);
						// logic operator
						switch (filter.operator) {
						case EQ:
							predicates.add(builder.equal(expression,
									filter.value));
							break;
						case LIKE:
							predicates.add(builder.like(expression, "%"
									+ filter.value + "%"));
							break;
						case GT:
							predicates.add(builder.greaterThan(expression,
									(Comparable) filter.value));
							break;
						case LT:
							predicates.add(builder.lessThan(expression,
									(Comparable) filter.value));
							break;
						case GTE:
							predicates.add(builder.greaterThanOrEqualTo(
									expression, (Comparable) filter.value));
							break;
						case LTE:
							predicates.add(builder.lessThanOrEqualTo(
									expression, (Comparable) filter.value));
							break;
						case NEQ:
							predicates.add(builder.notEqual(expression,
									filter.value));
							break;
						case IN:
							predicates.add(expression.in(filter.value));
							break;
						case NOTIN:
							predicates.add(builder.not(expression
									.in(filter.value)));
							break;
						case ISNULL:
							predicates.add(expression.isNull());
							break;
						case ISNOTNULL:
							predicates.add(expression.isNotNull());
							break;
						}
					}
					// 将所有条件用 and 联合起来
					if (!predicates.isEmpty()) {
						return builder.and(predicates
								.toArray(new Predicate[predicates.size()]));
					}
				}
				return builder.conjunction();
			}
		};
	}

	/**
	 * 混合查询,根据SearchFilter.conditionGroup进行条件分组，并用or连接
	 * 
	 * @param filters
	 * @param entityClazz
	 * @return
	 */
	public static <T> Specification<T> bySearchFilter(
			final Collection<SearchFilter> filters, final Class<T> entityClazz) {
		return new Specification<T>() {
			@SuppressWarnings({ "rawtypes", "unchecked" })
			@Override
			public Predicate toPredicate(Root<T> root, CriteriaQuery<?> query,
					CriteriaBuilder builder) {
				if (Collections3.isNotEmpty(filters)) {
					List<Predicate> predicatesAndList = Lists.newArrayList();
					List<Predicate> predicatesOrList = Lists.newArrayList();
					// 条件分组Map
					Map<String, List<SearchFilter>> conditionMap = new LinkedHashMap<String, List<SearchFilter>>();
					for (SearchFilter filter : filters) {
						// 条件分组KEY不能为空
						if (StringUtils.isNotBlank(filter.conditionGroup)) {
							if (conditionMap.containsKey(filter.conditionGroup)) {
								conditionMap.get(filter.conditionGroup).add(
										filter);
							} else {
								List<SearchFilter> temp = new ArrayList<SearchFilter>();
								temp.add(filter);
								conditionMap.put(filter.conditionGroup, temp);
							}
						} else {
							if (conditionMap.containsKey(NO_CONDITIONGROUP)) {
								conditionMap.get(NO_CONDITIONGROUP).add(filter);
							} else {
								// 如果分组条件KEY为空,则全部按照and进行条件拼接
								List<SearchFilter> temp = new ArrayList<SearchFilter>();
								temp.add(filter);
								conditionMap.put(NO_CONDITIONGROUP, temp);
							}
						}
					}

					for (String conditionKey : conditionMap.keySet()) {
						List<Predicate> predicates = Lists.newArrayList();
						for (SearchFilter filter : conditionMap
								.get(conditionKey)) {
							// nested path translate,
							// 如Task的名为"user.name"的filedName,
							// 转换为Task.user.name属性
							String[] names = StringUtils.split(
									filter.fieldName, ".");
							Path expression = root.get(names[0]);
							for (int i = 1; i < names.length; i++) {
								expression = expression.get(names[i]);
							}
							// 值类型转换
							convertValue(filter, expression);
							// logic operator
							switch (filter.operator) {
							case EQ:
								predicates.add(builder.equal(expression,
										filter.value));
								break;
							case LIKE:
								predicates.add(builder.like(expression, "%"
										+ filter.value + "%"));
								break;
							case GT:
								predicates.add(builder.greaterThan(expression,
										(Comparable) filter.value));
								break;
							case LT:
								predicates.add(builder.lessThan(expression,
										(Comparable) filter.value));
								break;
							case GTE:
								predicates.add(builder.greaterThanOrEqualTo(
										expression, (Comparable) filter.value));
								break;
							case LTE:
								predicates.add(builder.lessThanOrEqualTo(
										expression, (Comparable) filter.value));
								break;
							case NEQ:
								predicates.add(builder.notEqual(expression,
										filter.value));
								break;
							case IN:
								predicates.add(expression.in(filter.value));
								break;
							case NOTIN:
								predicates.add(builder.not(expression
										.in((Collection)filter.value)));
								break;
							case ISNULL:
								predicates.add(expression.isNull());
								break;
							case ISNOTNULL:
								predicates.add(expression.isNotNull());
								break;
							}
						}
						// 将条件用 and 联合起来,并加入predicatesList集合
						if (!predicates.isEmpty()) {
							if (conditionKey.equals(NO_CONDITIONGROUP)) {
								predicatesAndList.add(builder.and(predicates
										.toArray(new Predicate[predicates
												.size()])));
							} else {
								predicatesOrList.add(builder.and(predicates
										.toArray(new Predicate[predicates
												.size()])));
							}
						}
					}
					// 返回组合条件
					Predicate result = null;
					// 与条件
					if (!predicatesAndList.isEmpty()) {
						result = builder
								.and(predicatesAndList
										.toArray(new Predicate[predicatesAndList
												.size()]));
					}
					// 或条件
					if (!predicatesOrList.isEmpty()) {
						if (result != null) {
							result = builder
									.and(result,
											builder.or(predicatesOrList
													.toArray(new Predicate[predicatesOrList
															.size()])));
						} else {
							result = builder.or(predicatesOrList
									.toArray(new Predicate[predicatesOrList
											.size()]));
						}
					}
					return result;
				}
				return builder.conjunction();
			}
		};
	}

	public static <T> Specification<T> bySearchGroup(
			final Collection<SearchFilter> filters, final Class<T> entityClazz) {
		return new Specification<T>() {
			@SuppressWarnings({ "rawtypes" })
			@Override
			public Predicate toPredicate(Root<T> root, CriteriaQuery<?> query,
					CriteriaBuilder builder) {
				if (Collections3.isNotEmpty(filters)) {
					for (SearchFilter filter : filters) {
						// nested path translate, 如Task的名为"user.name"的filedName,
						// 转换为Task.user.name属性
						String[] names = StringUtils.split(filter.fieldName,
								".");
						Path expression = root.get(names[0]);
						for (int i = 1; i < names.length; i++) {
							expression = expression.get(names[i]);
							query.groupBy(expression);
						}
					}
				}
				return query.getGroupRestriction();
			}
		};
	}

	/**
	 * 根据expression属性类型，进行value转换
	 * 
	 * @param filter
	 * @param expression
	 */
	private static void convertValue(SearchFilter filter, @SuppressWarnings("rawtypes") Path expression) {
		// Date类型转换
		if (expression.getJavaType().equals(Date.class)
				&& !(filter.value instanceof Date)) {
			try {
				filter.value = dateTimeFormat.parse(filter.value.toString());
			} catch (Exception e) {
				try {
					filter.value = dateFormat.parse(filter.value.toString());
				} catch (Exception e2) {
				}
			}
		} else
		// Long类型转换
		if (expression.getJavaType().equals(Long.class)
				&& !(filter.value instanceof Long)
				&& !(filter.value instanceof List)
				&& !(filter.value instanceof Set)) {
			filter.value = Long.parseLong(filter.value.toString());
		} else
		// int类型转换
		if (expression.getJavaType().equals(Integer.class)
				&& !(filter.value instanceof Integer)
				&& !(filter.value instanceof List)
				&& !(filter.value instanceof Set)) {
			filter.value = Integer.parseInt(filter.value.toString());
		} else
		// id属性转long
		if (expression.getJavaType().equals(Serializable.class)
				&& !(filter.value instanceof Long)
				&& !(filter.value instanceof List)
				&& !(filter.value instanceof Set)) {
			filter.value = Long.parseLong(filter.value.toString());
		}
	}
}
