package com.yhlt.showcase.base.kit;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import org.apache.commons.lang3.StringUtils;

/**
 * @author hbi
 * 
 * 根据mysql 将【数据表】 生成 【对应的实体】
 * 修改【类的路径】 和 【类名】即可，entity,service,dao 文件以及所在的文件夹会自动生成，
 * 手动加入【serialVersionUID】，更改entity中的相关属性，手动生成get/set方法。
 * 
 * 注意：重复运行会覆盖文件
 */
public class GenerateEntityByMysql {
	/**
	 * 每次都必须配置的属性
	 */
	private String tablename = "tc_system_request_log";// 数据库中对应的表名

	private String className = "RequestLog";// entity/service/dao对应的名字
	
	private String packageOutPath = "com.yhlt.showcase.requestLog";// 指定实体所在文件夹所在的父文件夹
	
	private String classRemark = "WEB访问日志";// service中的 @BusinessLog(service = "日志管理。。。")
	
	private String controllerName = "RequestLogController";// Controller名字
	private String entityName = this.className + "Entity";// 实体名字
	private String serviceName = this.className + "Service";// Service名字
	private String daoName = this.className + "Dao";// Dao名字
	
	private String packageOutEntityPath = this.packageOutPath + ".entity";// 指定实体生成所在包的路径
	private String packageOutServicePath = this.packageOutPath + ".service";// 指定service生成所在包的路径
	private String packageOutDaoPath = this.packageOutPath + ".dao";// 指定dao生成所在包的路径
	private String packageOutControllerPath = this.packageOutPath + ".entity";// 指定Controller存放路径和entity一致
	
	private boolean isNeedGenerateEntity = true;// 需要生成entity，true：生成；false：不生成
	private boolean isNeedGenerateDao = true;// 需要生成Dao，true：生成；false：不生成
	private boolean isNeedGenerateServcie = true;// 需要生成Servcie，true：生成；false：不生成
	private boolean isNeedGenerateController = false;// 需要生成Controller，true：生成；false：不生成
	
	/**
	 * 只需配置一次的属性
	 */
	// 数据库连接
	private static final String URL ="jdbc:oracle:thin:@172.16.1.181:1521:orcl";
	private static final String NAME = "fcms";
	private static final String PASS = "fcms";
	private static final String DRIVER ="oracle.jdbc.driver.OracleDriver";
	
//	private static final String URL ="jdbc:mysql://172.20.5.120:3306/bpmsms-product";
//	private static final String NAME = "root";
//	private static final String PASS = "Password12";
//	private static final String DRIVER ="com.mysql.jdbc.Driver";
	
	// 作者名字
	private String authorName = "wangyoutao";
	
	// 需要去除的字段
	private String REMOVE_COLNAME_ID = "id";// 
	private String REMOVE_COLNAME_GMT_CREATE = "gmt_create";
	private String REMOVE_COLNAME_CREATE_BY_ID = "create_by_id";
	private String REMOVE_COLNAME_GMT_MODIFIED = "gmt_modified";
	private String REMOVE_COLNAME_LAST_MODIFIED_BY_ID = "last_modified_by_id";
	
	/**
	 * 无需配置的属性
	 */
	private String[] colnames; // 列名数组
	private String[] colTypes; //列名类型数组
	private int[] colSizes; //列名大小数组
	
	private boolean f_date = false; // 是否需要导入包date相关包*
	private boolean f_uuid = false; // 是否需要导入包uuid*
	private boolean f_column = false; // 是否需要导入包uuid*
	

	/*
	 * 构造函数
	 */
	public GenerateEntityByMysql(){
    	//创建连接
    	Connection con;
		//查要生成实体类的表
    	String sql = "select * from " + tablename;
    	PreparedStatement pStemt = null;
    	try {
    		try {
				Class.forName(DRIVER);
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
    		con = DriverManager.getConnection(URL,NAME,PASS);
			pStemt = con.prepareStatement(sql);
			ResultSetMetaData rsmd = pStemt.getMetaData();
			int size = rsmd.getColumnCount();	//统计列
			colnames = new String[size];
			colTypes = new String[size];
			colSizes = new int[size];
			for (int i = 0; i < size; i++) {
				colnames[i] = formatColName(rsmd.getColumnName(i + 1));
				colTypes[i] = rsmd.getColumnTypeName(i + 1);
//				if(colTypes[i].equalsIgnoreCase("datetime")){
//					f_util = true;
//				}
//				if(colTypes[i].equalsIgnoreCase("image") || colTypes[i].equalsIgnoreCase("text")){
//					f_sql = true;
//				}
				colSizes[i] = rsmd.getColumnDisplaySize(i + 1);
			}
			
			try {
				File directory = new File("");
				File file = new File(directory.getAbsolutePath()+ "/src/main/java/"+this.packageOutPath.replace(".", "/"));
				if (!file.exists()) {
					file.mkdirs();
				}
				
				// 生成entity
				if(this.isNeedGenerateEntity){
					String entityContent = createEntityContent(colnames,colTypes,colSizes);
					generateEntity(entityContent);
				}
				
				
				// 生成Dao
				if(this.isNeedGenerateDao){
					String daoContent = createDaoContent();
					generateServiceOrDao(daoContent,this.packageOutDaoPath,this.daoName);
				}
				
				// 生成Service
				if(this.isNeedGenerateServcie){
					String serviceContent = createServiceContent();
					generateServiceOrDao(serviceContent,this.packageOutServicePath,this.serviceName);
				}

				// 生成Controller
				if(this.isNeedGenerateController){
					String controllerContent = createControllerContent();
					generateController(controllerContent);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
//				try {
//					con.close();
//				} catch (SQLException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
		}
    }
	
	/**生成entity文件
	 * @param content
	 * @throws IOException 
	 */
	private void generateEntity(String content) throws IOException{
		File directory = new File("");
		//System.out.println("绝对路径："+directory.getAbsolutePath());
		//System.out.println("相对路径："+directory.getCanonicalPath());
		String path=this.getClass().getResource("").getPath();
		
		System.out.println(path);
		
//		System.out.println("src/?/"+path.substring(path.lastIndexOf("/com/", path.length())) );
//			String outputPath = directory.getAbsolutePath()+ "/src/"+path.substring(path.lastIndexOf("/com/", path.length()), path.length()) + initcap(tablename) + ".java";
//		String outputPath = directory.getAbsolutePath()+ "/src/main/java/"+this.packageOutPath.replace(".", "/")+"/"+initcap(tablename) + ".java";
		String outputEntityPath = directory.getAbsolutePath()+ "/src/main/java/"+this.packageOutEntityPath.replace(".", "/")+"/"+ this.entityName + ".java";
		
		File file = new File(directory.getAbsolutePath()+ "/src/main/java/"+this.packageOutEntityPath.replace(".", "/"));
		if (!file.exists()) {
			file.mkdirs();
		}
		
		FileWriter fw = new FileWriter(outputEntityPath);
		PrintWriter pw = new PrintWriter(fw);
		pw.println(content);
		pw.flush();
		pw.close();
	}
	
	/**生成Service文件
	 * @param content
	 * @throws IOException 
	 */
	private void generateServiceOrDao(String content,String path,String className) throws IOException{
		File directory = new File("");
//		String path=this.getClass().getResource("").getPath();
		String outputEntityPath = directory.getAbsolutePath()+ "/src/main/java/"+ path.replace(".", "/")+"/"+ className + ".java";
		
		File file = new File(directory.getAbsolutePath()+ "/src/main/java/"+path.replace(".", "/"));
		if (!file.exists()) {
			file.mkdirs();
		}
		
		FileWriter fw = new FileWriter(outputEntityPath);
		PrintWriter pw = new PrintWriter(fw);
		pw.println(content);
		pw.flush();
		pw.close();
	}
	
	/**
	 * 生成Controller文件
	 * @param content
	 * @throws IOException 
	 */
	private void generateController(String content) throws IOException{
		File directory = new File("");
		String outputControllerPath = directory.getAbsolutePath()+ "/src/main/java/"+this.packageOutControllerPath.replace(".", "/")+"/"+ this.controllerName + ".java";
		
		File file = new File(directory.getAbsolutePath()+ "/src/main/java/"+this.packageOutControllerPath.replace(".", "/"));
		if (!file.exists()) {
			file.mkdirs();
		}
		
		FileWriter fw = new FileWriter(outputControllerPath);
		PrintWriter pw = new PrintWriter(fw);
		pw.println(content);
		pw.flush();
		pw.close();
	}
	
	/**格式话属性:col_name -> colName
	 * @param colName
	 * @return
	 */
	private String formatColName(String colName){
		if(colName.equalsIgnoreCase(REMOVE_COLNAME_ID) ||
				colName.equalsIgnoreCase(REMOVE_COLNAME_CREATE_BY_ID) ||
				colName.equalsIgnoreCase(REMOVE_COLNAME_GMT_CREATE) ||
				colName.equalsIgnoreCase(REMOVE_COLNAME_GMT_MODIFIED) ||
				colName.equalsIgnoreCase(REMOVE_COLNAME_LAST_MODIFIED_BY_ID)){
			
				colName = "";
			}else{
				int len = colName.split("_").length;
				for (int i = 0; i < len; i++) {
					int underLinePos = colName.indexOf("_");
					String oldStr = colName.substring(underLinePos + 1,underLinePos + 2);
					String newStr = oldStr.toUpperCase();
					colName = colName.replace("_"+oldStr, newStr);
				}
			}
		
		return colName;
	}

	/**
	 * 功能：生成实体类主体代码
	 * @param colnames
	 * @param colTypes
	 * @param colSizes
	 * @return
	 */
	private String createEntityContent(String[] colnames, String[] colTypes, int[] colSizes) {
		StringBuffer sbBefore = new StringBuffer();
		// 包名放在最上面
		sbBefore.append("package " + this.packageOutEntityPath + ";\r\n");
		sbBefore.append("\r\n");
		
		// 必須要倒入的包
		sbBefore.append("import com.yhlt.showcase.base.entity.BaseEntity;\r\n");
		sbBefore.append("import javax.persistence.Table;\r\n");
		sbBefore.append("import javax.persistence.Entity;\r\n");
		
		StringBuffer sb = new StringBuffer();
		//注释部分
		sb.append("\r\n");
		sb.append("/**\r\n");
		sb.append(" * @Description: "+this.classRemark+" Entity\r\n");
		sb.append(" * @author "+this.authorName+"\r\n");
		sb.append(" * @date "+formatDate2Str(new Date(), "yyyy-MM-dd HH:mm")+"\r\n");
		sb.append(" */");
		
		// 注解部分
		sb.append("\r\n");
		sb.append("@Entity\r\n");
		sb.append("@Table(name = \""+this.tablename+"\")\r\n");
		
		//实体部分
//		sb.append("\r\n\r\npublic class " + initcap(tablename) + " extends BaseEntity<Long> {\r\n");
		sb.append("public class " + this.entityName + " extends BaseEntity<Long> {\r\n");
		processAllAttrs(sb);//属性
//		processAllMethod(sb);//get set方法
		sb.append("}\r\n");
		
		//判断是否导入工具包
		if(f_uuid){
			sbBefore.append("import java.util.UUID;\r\n");
		}
		if(f_date){
			sbBefore.append("import java.util.Date;\r\n");
			sbBefore.append("import org.springframework.format.annotation.DateTimeFormat;\r\n");
			sbBefore.append("import com.fasterxml.jackson.annotation.JsonFormat;\r\n");
		}
		if(f_column){
			sbBefore.append("import javax.persistence.Column;\r\n");
		}
		sbBefore.append(sb);	
    	//System.out.println(sb.toString());
		return sbBefore.toString();
	}
	
	/**
	 * 功能：生成dao类主体代码
	 * @param colnames
	 * @param colTypes
	 * @param colSizes
	 * @return
	 */
	private String createDaoContent() {
		StringBuffer sb = new StringBuffer();
		// 包名放在最上面
		sb.append("package " + this.packageOutDaoPath + ";\r\n");
		sb.append("\r\n");
		
		// 必須要倒入的包
		sb.append("import com.yhlt.showcase.base.dao.BaseDao;\r\n");
		sb.append("import "+this.packageOutEntityPath+"."+this.entityName+";\r\n");
//		sb.append("\r\n");
		
		//注释部分
		sb.append("\r\n");
		sb.append("/**\r\n");
		sb.append(" * @Description: "+this.classRemark+" dao\r\n");
		sb.append(" * @author "+this.authorName+"\r\n");
		sb.append(" * @date "+formatDate2Str(new Date(), "yyyy-MM-dd HH:mm")+"\r\n");
		sb.append(" */");
				
		//实体部分
		sb.append("\r\n");
		sb.append("public interface " + this.daoName + " extends BaseDao<"+this.entityName+"> {\r\n");
		sb.append("}\r\n");
		
    	//System.out.println(sb.toString());
		return sb.toString();
	}
	
	/**
	 * 功能：生成controller类代码
	 * @param colnames
	 * @param colTypes
	 * @param colSizes
	 * @return
	 */
	private String createControllerContent() {
		StringBuffer sb = new StringBuffer();
		// 包名放在最上面
		sb.append("package " + this.packageOutControllerPath + ";\r\n");
		sb.append("\r\n");
		
		// 必須要倒入的包
		sb.append("import org.springframework.stereotype.Controller;\r\n");
		sb.append("import org.springframework.ui.Model;\r\n");
		sb.append("import org.springframework.web.bind.annotation.RequestMapping;\r\n");
		sb.append("import com.yhlt.showcase.base.controller.BaseController;\r\n");
		sb.append("import "+this.packageOutServicePath+"."+this.entityName+";\r\n");
		sb.append("import "+this.packageOutEntityPath+"."+this.serviceName+";\r\n");
		
		
		//注释部分
		sb.append("\r\n");
		sb.append("/**\r\n");
		sb.append(" * @Description: "+this.classRemark+"\r\n");
		sb.append(" * @author "+this.authorName+"\r\n");
		sb.append(" * @date "+formatDate2Str(new Date(), "yyyy-MM-dd HH:mm")+"\r\n");
		sb.append(" */");
		
		// 注解部分
		sb.append("\r\n");
		sb.append("@Controller\r\n");
		sb.append("@RequestMapping(value = \""+this.tablename+"\")\r\n");
		
		//实体部分
		sb.append("public class "+this.controllerName+" extends\r\n");
		sb.append("\t\t\t\t BaseController<"+this.entityName+","+this.serviceName+"> {\r\n");
		
		sb.append("\t@Override\r\n");
		sb.append("\tpublic String index(Model model) {\r\n");
		sb.append("\t\treturn \"\";\r\n");
		sb.append("\t}\r\n");
		
		sb.append("}\r\n");
		
    	//System.out.println(sb.toString());
		return sb.toString();
	}
	
	/**
	 * 功能：生成service类主体代码
	 * @param colnames
	 * @param colTypes
	 * @param colSizes
	 * @return
	 */
	private String createServiceContent() {
		StringBuffer sb = new StringBuffer();
		// 包名放在最上面
		sb.append("package " + this.packageOutServicePath + ";\r\n");
		sb.append("\r\n");
		
		// 必須要倒入的包
		sb.append("import org.springframework.stereotype.Component;\r\n");
		sb.append("import javax.transaction.Transactional;\r\n");
		sb.append("import com.yhlt.showcase.base.log.BusinessLog;\r\n");
		sb.append("import com.yhlt.showcase.base.datapermission.DataPermission;\r\n");
		sb.append("import com.yhlt.showcase.base.service.BaseService;\r\n");
		sb.append("import "+this.packageOutEntityPath+"."+this.entityName+";\r\n");
		sb.append("import "+this.packageOutDaoPath+"."+this.daoName+";\r\n");
//		sb.append("\r\n");
		
		//注释部分
		sb.append("\r\n");
		sb.append("/**\r\n");
		sb.append(" * @Description: "+this.classRemark+" service\r\n");
		sb.append(" * @author "+this.authorName+"\r\n");
		sb.append(" * @date "+formatDate2Str(new Date(), "yyyy-MM-dd HH:mm")+"\r\n");
		sb.append(" */");
				
		// service类注解
		sb.append("\r\n");
		sb.append("@Component\r\n");
		sb.append("@Transactional\r\n");
		sb.append("@BusinessLog(service = \""+this.classRemark+"\")\r\n");
		sb.append("@DataPermission\r\n");
		
		//实体部分
		sb.append("public class " + this.serviceName + " extends BaseService<"+this.entityName+", "+this.daoName+"> {\r\n");
		sb.append("}\r\n");
		
    	//System.out.println(sb.toString());
		return sb.toString();
	}
	
	/**
	 * 功能：生成所有属性
	 * @param sb
	 */
	private void processAllAttrs(StringBuffer sb) {
		sb.append("\r\n");
		for (int i = 0; i < colnames.length; i++) {
			if(StringUtils.isNotEmpty(colnames[i])){
				//注释部分
				sb.append("\t/**\r\n");
				sb.append("\t* \r\n");
				sb.append("\t*/ \r\n");
				
				if(colnames[i].equalsIgnoreCase("uuid")){
					sb.append("\t@Column(insertable = true, updatable = false)\r\n");
					sb.append("\tprivate String uuid = UUID.randomUUID().toString();\r\n");
					f_uuid = true;
					f_column = true;
				}else if(colTypes[i].equalsIgnoreCase("datetime")){
					sb.append("\t@JsonFormat(pattern = \"yyyy-MM-dd HH:mm\", timezone = \"GMT+08:00\")\r\n");
					sb.append("\t@DateTimeFormat(pattern = \"yyyy-MM-dd\")\r\n");
					sb.append("\tprivate " + sqlType2JavaType(colTypes[i]) + " " + colnames[i] + ";\r\n");
					f_date = true;
					f_column = true;
				}else{
					sb.append("\tprivate " + sqlType2JavaType(colTypes[i]) + " " + colnames[i] + ";\r\n");
				}
				sb.append("\r\n");
				
			}
		}
		sb.append("\r\n");
	}

	/**
	 * 功能：生成所有方法
	 * @param sb
	 */
	private void processAllMethod(StringBuffer sb) {
		for (int i = 0; i < colnames.length; i++) {
			if(StringUtils.isNotEmpty(colnames[i])){
				sb.append("\tpublic void set" + initcap(colnames[i]) + "(" + sqlType2JavaType(colTypes[i]) + " " + 
						colnames[i] + "){\r\n");
				sb.append("\tthis." + colnames[i] + "=" + colnames[i] + ";\r\n");
				sb.append("\t}\r\n");
				sb.append("\tpublic " + sqlType2JavaType(colTypes[i]) + " get" + initcap(colnames[i]) + "(){\r\n");
				sb.append("\t\treturn " + colnames[i] + ";\r\n");
				sb.append("\t}\r\n");
			}
			
		}
		
	}
	
	/**
	 * 功能：将输入字符串的首字母改成大写
	 * @param str
	 * @return
	 */
	private String initcap(String str) {
		
		char[] ch = str.toCharArray();
		if(ch[0] >= 'a' && ch[0] <= 'z'){
			ch[0] = (char)(ch[0] - 32);
		}
		
		return new String(ch);
	}

	/**
	 * 功能：获得列的数据类型
	 * @param sqlType
	 * @return
	 */
	private String sqlType2JavaType(String sqlType) {
		
		if(sqlType.equalsIgnoreCase("bit")){
			return "boolean";
		}else if(sqlType.equalsIgnoreCase("tinyint")){
			return "byte";
		}else if(sqlType.equalsIgnoreCase("smallint")){
			return "short";
		}else if(sqlType.equalsIgnoreCase("int") || sqlType.equalsIgnoreCase("integer")){
			return "int";
		}else if(sqlType.equalsIgnoreCase("bigint")){
			return "long";
		}else if(sqlType.equalsIgnoreCase("float")){
			return "float";
		}else if(sqlType.equalsIgnoreCase("decimal") || sqlType.equalsIgnoreCase("numeric") 
				|| sqlType.equalsIgnoreCase("real") || sqlType.equalsIgnoreCase("money") 
				|| sqlType.equalsIgnoreCase("smallmoney")){
			return "double";
		}else if(sqlType.equalsIgnoreCase("varchar") || sqlType.equalsIgnoreCase("char") 
				|| sqlType.equalsIgnoreCase("nvarchar") || sqlType.equalsIgnoreCase("nchar") 
				|| sqlType.equalsIgnoreCase("text")){
			return "String";
		}else if(sqlType.equalsIgnoreCase("datetime")){
			return "Date";
		}else if(sqlType.equalsIgnoreCase("image")){
			return "Blod";
		}
		
		return null;
	}
	
	/**
	 * 出口
	 * TODO
	 * @param args
	 */
	public static void main(String[] args) {
		
		try {
			new GenerateEntityByMysql();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 根据日期格式，把参数中的日期转换为对应格式的字符串
	* @Date        :      2012-2-17
	* @param date
	* @param datePattern
	* @return
	 */
	public static String formatDate2Str(Date date,String datePattern){
		SimpleDateFormat sdf = new SimpleDateFormat(datePattern, Locale.getDefault());
		return sdf.format(date);
		
	}

}