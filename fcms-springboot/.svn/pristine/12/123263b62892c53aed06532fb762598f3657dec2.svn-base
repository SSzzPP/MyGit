
package com.yhlt.showcase.blockchain.utils;

import java.util.List;


/**
 * @author stone
 */
public class ParameterUtil {

	public static void isNotNullOrEmpty(String name, String string) throws Exception {
		if (string != null) {
			if (string.isEmpty()) {
				throw new Exception(name+" "+"is null or empty.");
			}
		} else {
			throw new Exception(name+" "+ "is null or empty.");
		}
	}

	public static void isNotNull(String name, Object object) throws Exception {
		if (object == null) {
			throw new Exception(name+" "+ "is null or empty.");
		}
	}

	public static void isNotNullOrEmpty(String name, Object[] array) throws Exception {
		if (array != null) {
			if (array.length <= 0) {
				throw new Exception(name+" "+ "size is 0.");
			}
		} else {
			throw new Exception(name+" "+ "is null.");
		}
	}

	public static void isNotNullOrEmpty(String name, List<Object> list) throws Exception {
		if (list != null) {
			if (list.size() <= 0) {
				throw new Exception(name+" "+ "size is 0.");
			}
		} else {
			throw new Exception(name+" "+ "is null.");
		}
	}

	public static boolean isArrayNotNullOrEmpty(Object[] array) {
		if (array == null || array.length <= 0) {
			return false;
		}
		return true;
	}

	public static void arrayNotContainNullOrEmptyValues(String name, Object[] array) throws Exception {
		for (Object object : array) {
			if (object == null) {
				throw new Exception(name+" "+ "array contain null value.");
			} else if (object.getClass() == String.class) {
				if (((String) object).isEmpty()) {
					throw new Exception(name+" "+ "array contain empty string.");
				}
			}
		}
	}

	public static void floatArrayContainNullOrNegativeValue(String name, float[] array) throws Exception {
		for (float f : array) {
			if (f < 0) {
				throw new Exception(name+" "+ "array contain negative value.");
			} else if (f == 0) {
				throw new Exception(name+" "+ "array contain null values.");
			}
		}
	}

	public static void intArrayContainNullOrNegativeValue(String name, int[] array) throws Exception {
		for (int i : array) {
			if (i < 0) {
				throw new Exception(name+" "+ "array contain negative value.");
			} else if (i == 0) {
				throw new Exception(name+" "+ "array contain null values.");
			}
		}
	}

	public static void valueIsNotNegative(String name, int value) throws Exception {
		if (value < 0) {
			throw new Exception(name+" "+ "is negative.");
		}
	}

	public static void valueIsNotNegative(String name, float value) throws Exception {
		if (value < 0) {
			throw new Exception(name+" "+ "is negative.");
		}
	}

	public static void valueIsNotNegative(String name, double value) throws Exception {
		if (value < 0) {
			throw new Exception(name+" "+ "is negative.");
		}
	}
	/**
	 * 是否大于0
	 * @param name
	 * @param value
	 * @throws Exception
	 */
	public static void valueIsPositive(String name, int value) throws Exception {
		if (value < 0) {
			throw new Exception(name+" "+ "is negative.");
		} else if (value == 0) {
			throw new Exception(name+" "+ "is null.");
		}
	}
	/**
	 * 是否大于0
	 * @param name
	 * @param value
	 * @throws Exception
	 */
	public static void valueIsPositive(String name, float value) throws Exception {
		if (value < 0) {
			throw new Exception(name+" "+ "is negative.");
		} else if (value == 0) {
			throw new Exception(name+" "+ "is null.");
		}
	}
	/**
	 * 是否是正值
	 * @param name
	 * @param value
	 * @throws Exception
	 */
	public static void valueIsPositive(String name, double value) throws Exception {
		if (value < 0) {
			throw new Exception(name+" "+ "is negative.");
		} else if (value == 0) {
			throw new Exception(name+" "+ "is null.");
		}
	}
}
