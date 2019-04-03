package com.yhlt.showcase.system.utils;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.Date;

import com.yhlt.showcase.base.util.DateUtil;

/**
 * 自动生成entity,dao,service
 * 
 * @author stone
 */
public class AutoCreateUtil {

	public static void main(String[] args) {
		// 首先更改author，然后检查数据库连接、用户名、密码
		AutoCreateUtil autoCreateUtil = new AutoCreateUtil("tc_system_user", "UserEntity", "user", "用户管理");
		try {
			autoCreateUtil.create();
			System.err.println("生成完毕，请刷新所在包！");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 作者
	 */
	private String author = "wyt";
	/**
	 * 表名
	 */
	private String tableName;
	/**
	 * 实体名
	 */
	private String entityName;
	/**
	 * 包名
	 */
	private String packageName = "";
	/**
	 * 服务名称
	 */
	private String serviceName = "";
	/**
	 * 路径
	 */
	private String path = "/src/main/java/com/yhlt/showcase/";
	/**
	 * 数据库连接
	 */
	private String url = "jdbc:mysql://192.168.0.201/fcms?useUnicode=true&amp;characterEncoding=UTF-8";
	/**
	 * "root"
	 */
	private String name = "root";
	/**
	 * 密码
	 */
	private String password = "root";
	/**
	 * "com.mysql.jdbc.Driver"
	 */
	private String driver = "com.mysql.jdbc.Driver";
	/**
	 * 列名数组
	 */
	private String[] colnames;
	/**
	 * 列类型数组
	 */
	private String[] colTypes;
	/**
	 * 列名大小数组
	 */
	private int[] colSizes;
	/**
	 * 列备注
	 */
	private String[] colCommnets;
	/**
	 * 是否需要导入包java.util.*
	 */
	private boolean f_util = false;
	/**
	 * 是否需要导入包java.sql.*
	 */
	private boolean f_sql = false;
	/**
	 * 无需生成set get方法的数组 默认为baseentity的属性
	 */
	private String[] noCreateSetAndGet = new String[] { "id", "gmtCreate", "gmtModified", "createById", "lastModifiedById" };

	public AutoCreateUtil() {
		super();
	}

	/**
	 * 
	 * @param tableName
	 *            表名
	 * @param entityName
	 *            实体类名(带Entity)
	 * @param packageName
	 *            包名
	 * @param packageName
	 *            模块名称：例如用户管理
	 */
	public AutoCreateUtil(String tableName, String entityName, String packageName, String serviceName) {
		super();
		this.tableName = tableName;
		this.entityName = entityName;
		this.packageName = packageName;
		this.serviceName = serviceName;
	}

	/**
	 * 功能：生成实体类主体代码
	 * 
	 * @param colnames
	 * @param colTypes
	 * @param colSizes
	 * @return
	 */
	private String parseEntity(String[] colnames, String[] colTypes,
			int[] colSizes) {
		StringBuffer sb = new StringBuffer();
		sb.append("package " + "com.yhlt.showcase." + packageName
				+ ".entity;\r\n\r\n");
		// 判断是否导入工具包
		if (f_util) {
			sb.append("import java.util.Date;\r\n");
			sb.append("import org.springframework.format.annotation.DateTimeFormat;\r\n");
			sb.append("import com.fasterxml.jackson.annotation.JsonFormat;\r\n");
		}
		if (f_sql) {
			sb.append("import java.sql.*;\r\n");
		}
		sb.append("import javax.persistence.Entity;\r\n");
		sb.append("import javax.persistence.Table;\r\n");
		sb.append("import com.yhlt.showcase.base.entity.BaseEntity;\r\n");
		sb.append("\r\n");
		// 注释部分
		sb.append("/**\r\n");
		sb.append(" * " + serviceName + " 实体类\r\n");
		sb.append(" * @date " + DateUtil.toString(new Date()) + " \r\n");
		sb.append(" * @author " + author + "\r\n");
		sb.append(" */ \r\n");
		sb.append("@Entity\r\n");
		sb.append("@Table(name = \"" + tableName + "\")");
		// 实体部分
		sb.append("\r\npublic class " + entityName + " extends BaseEntity<Long>{\r\n");
		processAllAttrs(sb);// 属性
		processAllMethod(sb);// get set方法
		sb.append("}\r\n");
		return sb.toString();
	}

	/**
	 * 生成dao代码
	 * 
	 * @return
	 */
	private String parseDao() {
		StringBuffer sb = new StringBuffer();
		sb.append("package " + "com.yhlt.showcase." + packageName + ".dao;\r\n\r\n");
		sb.append("import com.yhlt.showcase.base.dao.BaseDao;\r\n");
		sb.append("import com.yhlt.showcase." + packageName + ".entity."
				+ entityName + ";\r\n");
		sb.append("\r\n");
		// 注释部分
		sb.append("/**\r\n");
		sb.append(" * " + serviceName + " Dao\r\n");
		sb.append(" * @date " + DateUtil.toString(new Date()) + " \r\n");
		sb.append(" * @author " + author + "\r\n");
		sb.append(" */\r\n");
		// Dao部分
		sb.append("public interface " + getStrByEntity() + "Dao"
				+ " extends BaseDao" + "<" + entityName + ">" + " {\r\n\r\n");
		sb.append("}\r\n");
		return sb.toString();
	}

	/**
	 * 生成service
	 * 
	 * @return
	 */
	private String parseService() {
		StringBuffer sb = new StringBuffer();
		sb.append("package " + "com.yhlt.showcase." + packageName
				+ ".service;\r\n\r\n");
		sb.append("import javax.transaction.Transactional;\r\n");
		sb.append("import org.springframework.stereotype.Component;\r\n");
		sb.append("import com.yhlt.showcase.base.datapermission.DataPermission;\r\n");
		sb.append("import com.yhlt.showcase.base.log.BusinessLog;\r\n");
		sb.append("import com.yhlt.showcase.base.service.BaseService;\r\n");
		sb.append("import com.yhlt.showcase." + packageName + ".entity."
				+ entityName + ";\r\n");
		sb.append("import com.yhlt.showcase." + packageName + ".dao."
				+ getStrByEntity() + "Dao" + ";\r\n");
		sb.append("\r\n");
		// 注释部分
		sb.append("/**\r\n");
		sb.append(" * " + serviceName + " Service\r\n");
		sb.append(" * @date " + DateUtil.toString(new Date()) + " \r\n");
		sb.append(" * @author " + author + "\r\n");
		sb.append(" */ \r\n");
		sb.append("@Component\r\n");
		sb.append("@Transactional\r\n");
		sb.append("@BusinessLog(service = \"" + serviceName + "\")\r\n");
		sb.append("@DataPermission");

		// Service部分
		sb.append("\r\npublic class " + getStrByEntity() + "Service"
				+ " extends BaseService<" + entityName + ", " + getStrByEntity()
				+ "Dao>" + " {\r\n\r\n");
		sb.append("}\r\n");
		return sb.toString();
	}

	/**
	 * 生成Controller
	 * 
	 * @return
	 */
	private String parseController() {
		StringBuffer sb = new StringBuffer();
		sb.append("package " + "com.yhlt.showcase." + packageName
				+ ".service;\r\n\r\n");
		
		
		
		sb.append("import org.springframework.stereotype.Controller;\r\n");
		sb.append("import org.springframework.ui.Model;\r\n");
		sb.append("import org.springframework.web.bind.annotation.RequestMapping;\r\n");
		sb.append("import com.yhlt.showcase.base.security.AccessRequired;\r\n");
		sb.append("import com.yhlt.showcase.base.controller.BaseController;\r\n");
		sb.append("import com.yhlt.showcase." + packageName + ".entity."
				+ entityName + ";\r\n");
		sb.append("import com.yhlt.showcase." + packageName + ".service."
				+ getStrByEntity() + "Service" + ";\r\n");
		sb.append("\r\n");
		// 注释部分
		sb.append("/**\r\n");
		sb.append(" * " + serviceName + " Controller\r\n");
		sb.append(" * @date " + DateUtil.toString(new Date()) + " \r\n");
		sb.append(" * @author " + author + "\r\n");
		sb.append(" */ \r\n");
		
		sb.append("@Controller\r\n");
		sb.append("@RequestMapping(value = \"/admin/" + packageName + "\")\r\n");
		sb.append("@AccessRequired(\"" + serviceName + "\")\r\n");

		// Controller部分
		sb.append("public class " + getStrByEntity() + "Controller"
				+ " extends BaseController<" + entityName + ", " + getStrByEntity()
				+ "Service>" + " {\r\n\r\n");
		sb.append("\t@Override\r\n");
		sb.append("\tpublic String index(Model model) {\r\n");
		sb.append("\t\treturn \"" + packageName + "/" + packageName + "_index\";\r\n");
		sb.append("\t}\r\n\r\n");
			
		
		sb.append("}\r\n");
		return sb.toString();
	}
	
	private String getStrByEntity() {
		return entityName.substring(0, entityName.indexOf("Entity"));
	}

	/**
	 * 功能：生成所有属性
	 * 
	 * @param sb
	 */
	private void processAllAttrs(StringBuffer sb) {
		for (int i = 0; i < colnames.length; i++) {
			if(isNotProcessSetAndGet(colnames[i])) {
				continue;
			}
			sb.append("\t/**\r\n").append("\t * ").append(colCommnets[i])
			.append("\r\n").append("\t */\r\n");
			if (colTypes[i].equalsIgnoreCase("datetime")) {
				sb.append("\t@JsonFormat(pattern = \"yyyy-MM-dd HH:mm:ss\", timezone = \"GMT+08:00\")\r\n");
				sb.append("\t@DateTimeFormat(pattern = \"yyyy-MM-dd HH:mm:ss\")\r\n");
			} else if (colTypes[i].equalsIgnoreCase("date")) {
				sb.append("\t@JsonFormat(pattern = \"yyyy-MM-dd\", timezone = \"GMT+08:00\")\r\n");
				sb.append("\t@DateTimeFormat(pattern = \"yyyy-MM-dd\")\r\n");
			}
			sb.append("\tprivate " + sqlType2JavaType(colTypes[i]) + " "
					+ colnames[i] + ";\r\n");
		}
		sb.append("\r\n");
	}

	/**
	 * 功能：生成所有方法
	 * 
	 * @param sb
	 */
	private void processAllMethod(StringBuffer sb) {
		for (int i = 0; i < colnames.length; i++) {
			if(isNotProcessSetAndGet(colnames[i])) {
				continue;
			}
			sb.append("\tpublic void set" + initcap(colnames[i]) + "("
					+ sqlType2JavaType(colTypes[i]) + " " + colnames[i]
					+ "){\r\n");
			sb.append("\t    this." + colnames[i] + "=" + colnames[i] + ";\r\n");
			sb.append("\t}\r\n");
			sb.append("\r\n");
			sb.append("\tpublic " + sqlType2JavaType(colTypes[i]) + " get"
					+ initcap(colnames[i]) + "(){\r\n");
			sb.append("\t    return " + colnames[i] + ";\r\n");
			sb.append("\t}\r\n");
			sb.append("\r\n");
		}
	}

	/**
	 * 功能：将输入字符串的首字母改成大写
	 * 
	 * @param str
	 * @return
	 */
	private String initcap(String str) {
		char[] ch = str.toCharArray();
		if (ch[0] >= 'a' && ch[0] <= 'z') {
			ch[0] = (char) (ch[0] - 32);
		}
		return new String(ch);
	}

	/**
	 * 功能：获得列的数据类型
	 * 
	 * @param sqlType
	 * @return
	 */
	private String sqlType2JavaType(String sqlType) {
		if (sqlType.equalsIgnoreCase("bit")) {
			return "boolean";
		} else if (sqlType.equalsIgnoreCase("tinyint")) {
			return "Long";
		} else if (sqlType.equalsIgnoreCase("smallint")) {
			return "Long";
		//mysql int类型 取出来是integer类型
		} else if (sqlType.equalsIgnoreCase("int")||sqlType.equalsIgnoreCase("integer")) {
			return "Long";
		} else if (sqlType.equalsIgnoreCase("bigint")) {
			return "Long";
		} else if (sqlType.equalsIgnoreCase("float")) {
			return "BigDecimal";
		} else if (sqlType.equalsIgnoreCase("decimal")
				|| sqlType.equalsIgnoreCase("numeric")
				|| sqlType.equalsIgnoreCase("real")
				|| sqlType.equalsIgnoreCase("money")
				|| sqlType.equalsIgnoreCase("smallmoney")) {
			return "BigDecimal";
		} else if (sqlType.equalsIgnoreCase("varchar")
				|| sqlType.equalsIgnoreCase("char")
				|| sqlType.equalsIgnoreCase("nvarchar")
				|| sqlType.equalsIgnoreCase("nchar")
				|| sqlType.equalsIgnoreCase("text")) {
			return "String";
		} else if (sqlType.equalsIgnoreCase("datetime")) {
			return "Date";
		} else if (sqlType.equalsIgnoreCase("date")) {
			return "Date";
		} else if (sqlType.equalsIgnoreCase("image")) {
			return "Blod";
		}

		return null;
	}

	public void create() throws Exception {
		// 创建连接
		Connection con = null;
		// 查要生成实体类的表
		String sql = "select * from " + tableName;
		PreparedStatement pStemt = null;
		Class.forName(driver);
		con = DriverManager.getConnection(url, name, password);
		pStemt = con.prepareStatement(sql);
		ResultSetMetaData rsmd = pStemt.getMetaData();
		int size = rsmd.getColumnCount(); // 统计列
		colnames = new String[size];
		colTypes = new String[size];
		colSizes = new int[size];
		colCommnets = new String[size];
		for (int i = 0; i < size; i++) {
			colnames[i] = lineToUpperCase(rsmd.getColumnName(i + 1));
			colTypes[i] = rsmd.getColumnTypeName(i + 1);
			if (colTypes[i].equalsIgnoreCase("datetime")
					|| colTypes[i].equalsIgnoreCase("date")) {
				f_util = true;
			} else if (colTypes[i].equalsIgnoreCase("image")
					|| colTypes[i].equalsIgnoreCase("text")) {
				f_sql = true;
			}
			colSizes[i] = rsmd.getColumnDisplaySize(i + 1);
		}
		//获取备注
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("show full columns from " + tableName);
		int j = 0;
		while (rs.next()) {
			colCommnets[j] = rs.getString("Comment");
			j++;
		}
		String content = parseEntity(colnames, colTypes, colSizes);
		String contentDao = parseDao();
		String contentService = parseService();
		String contentController = parseController();
		
		File directory = new File("");
		File packageDirectory = new File(directory.getAbsolutePath() + path + packageName);
		if (!packageDirectory.exists()) {
			packageDirectory.mkdirs();
		}
		
		File entityDirectory = new File(packageDirectory.getAbsolutePath() + "/entity");
		if (!entityDirectory.exists()) {
			entityDirectory.mkdirs();
		}
		File daoDirectory = new File(packageDirectory.getAbsolutePath() + "/dao");
		if (!daoDirectory.exists()) {
			daoDirectory.mkdirs();
		}
		File serviceDirectory = new File(packageDirectory.getAbsolutePath() + "/service");
		if (!serviceDirectory.exists()) {
			serviceDirectory.mkdirs();
		}
		
		// 生成entity
		FileWriter fwEntity = new FileWriter(entityDirectory.getAbsolutePath() + "/" + entityName + ".java");
		PrintWriter pwEntity = new PrintWriter(fwEntity);
		pwEntity.println(content);
		pwEntity.flush();
		pwEntity.close();
		// 生成dao
		FileWriter fwDao = new FileWriter(daoDirectory.getAbsolutePath() + "/" + getStrByEntity() + "Dao" + ".java");
		PrintWriter pwDao = new PrintWriter(fwDao);
		pwDao.println(contentDao);
		pwDao.flush();
		pwDao.close();
		// 生成service
		FileWriter fwService = new FileWriter(serviceDirectory.getAbsolutePath() + "/" + getStrByEntity() + "Service" + ".java");
		PrintWriter pwService = new PrintWriter(fwService);
		pwService.println(contentService);
		pwService.flush();
		pwService.close();
		// 生成Controller
		FileWriter fwController = new FileWriter(packageDirectory.getAbsolutePath() + "/" + getStrByEntity() + "Controller" + ".java");
		PrintWriter pwController = new PrintWriter(fwController);
		pwController.println(contentController);
		pwController.flush();
		pwController.close();
		
		con.close();
	}

	/**
	 * 将字符串中的横线变成大写
	 * 
	 * @param str
	 * @return
	 */
	private String lineToUpperCase(String str) {
		str = str.toLowerCase();
		if (!str.contains("_")) {
			return str;
		}
		String[] strs = str.split("_");
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < strs.length; i++) {
			if (i != 0) {
				sb.append(strs[i].substring(0, 1).toUpperCase()
						+ strs[i].substring(1));
			} else {
				sb.append(strs[i]);
			}
		}
		return sb.toString();
	}
	
	private boolean isNotProcessSetAndGet(String name) {
		for (int i = 0; i < noCreateSetAndGet.length; i++) {
			if(name.equals(noCreateSetAndGet[i])) {
				return true;
			}
		}
		return false;
	}

}
