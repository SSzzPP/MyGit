package com.yhlt.showcase.system.utils;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.yhlt.showcase.base.modules.SpringContextHolder;
import com.yhlt.showcase.base.properties.EnvProperties;

public class FileUtil {

	private static EnvProperties envProperties = SpringContextHolder.getBean(EnvProperties.class);

	public static String getFileSavePath() {
		return envProperties.getFileSavePath();
	}

	/**
	 * 获取附件，最后一个参数可以不传，使用时可不传，也可传任意数量的String类型参数，将追加到 模块/年月日/之后
	 * 
	 * 
	 * 存到本地（带盘符）
	 *
	 *
	 * @param fileName
	 * @return
	 */
	public static synchronized List<Object> getNewFile(String fileName, String module, HttpServletRequest request, String... subModule) {
		try {
			Thread.sleep(1);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		List<Object> list = new ArrayList<Object>();
		// 得到文件扩展名
		String extension = fileName.substring(fileName.lastIndexOf("."));
		// 得到当天日期
		Date date = new Date();
		// 取四位年两位月两位天
		SimpleDateFormat today = new SimpleDateFormat("yyyyMMdd");
		// 转换为字符串
		String dateFormat = today.format(date);
		String filePath = FileUtil.getFileSavePath() + "/" + module + "/" + dateFormat;
		// 文件名变量
		StringBuilder systemName = new StringBuilder(System.currentTimeMillis() + extension);
		File file = new File(filePath.toString());
		if (!file.exists()) {
			file.mkdirs();
		}
		File newFile = new File(file.getPath() + "/" + systemName.toString());
		list.add(newFile);
		list.add(newFile.getPath());
		return list;
	}

	/**
	 * 文件大小转化
	 * 
	 * @param fileSize
	 * @return
	 */
	public static String convertFileSize(long fileSize) {
		String strUnit = "B";
		String strAfterComma = "";
		int intDivisor = 1;
		if (fileSize >= 1024 * 1024) {
			strUnit = "MB";
			intDivisor = 1024 * 1024;
		} else if (fileSize >= 1024) {
			strUnit = "KB";
			intDivisor = 1024;
		}
		if (intDivisor == 1)
			return fileSize + strUnit;
		strAfterComma = "" + 100 * (fileSize % intDivisor) / intDivisor;
		if (strAfterComma == "")
			strAfterComma = ".0";
		return fileSize / intDivisor + "." + strAfterComma + strUnit;

	}

	/**
	 * 获取文件大小
	 * 
	 * @param fileSize
	 * @return
	 */
	public static long getFileSizes(File f) throws Exception {
		long s = 0;
		if (f.exists()) {
			FileInputStream fis = null;
			fis = new FileInputStream(f);
			s = fis.available();
		} else {
			f.createNewFile();
			System.out.println("文件不存在");
		}
		return s;
	}

	/**
	 * @author hbj
	 * @Description: 文件重命名 @param： path:D:/demo oldname:old.jpg newname:new.jpg
	 * @return
	 */
	public static void renameFile(String path, String oldname, String newname) {
		if (!oldname.equals(newname)) {// 新的文件名和以前文件名不同时,才有必要进行重命名
			File oldfile = new File(path + "/" + oldname);
			File newfile = new File(path + "/" + newname);
			if (!oldfile.exists()) {
				return;// 重命名文件不存在
			}
			if (newfile.exists())// 若在该目录下已经有一个文件和新文件名相同，则不允许重命名
				System.out.println(newname + "已经存在！");
			else {
				oldfile.renameTo(newfile);
			}
		} else {
			System.out.println("新文件名和旧文件名相同...");
		}
	}

	/**
	 * 判断图片后缀
	 */
	public static boolean imageExtension(String extension) {
		List<String> extensions = Arrays.asList("png", "jpg", "jpeg", "gif", "bmp", "jpeg2000", "tiff", "psd", "svg");
		if (extensions.contains(extension)) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 上传图片
	 */
	public static boolean uploadImageFile(MultipartFile imgFile, String path) {
		File file = new File(path);
		try {
			imgFile.transferTo(file);
			return true;
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 获取附件，最后一个参数可以不传，使用时可不传，也可传任意数量的String类型参数，将追加到 模块/年月日/之后
	 * 
	 * 存到项目目录下（不带盘符）
	 * 
	 * @param fileName
	 * @return
	 */
	public static synchronized List<Object> getNewFileWithSysPath(String fileName, String module, HttpServletRequest request, String... subModule) {
		try {
			Thread.sleep(1);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		List<Object> list = new ArrayList<Object>();
		// 得到文件扩展名
		String extension = fileName.substring(fileName.lastIndexOf("."));
		// 得到当天日期
		Date date = new Date();
		// 取四位年两位月两位天
		SimpleDateFormat today = new SimpleDateFormat("yyyyMMdd");
		// 文件路径变量
		StringBuffer filePath = new StringBuffer(request.getSession().getServletContext().getRealPath(""));
		filePath.append("/");
		StringBuffer sysPath = new StringBuffer("Files");
		// 转换为字符串
		String dateFormat = today.format(date);
		sysPath.append("/").append(module).append("/").append(dateFormat).append("/");
		for (String sub : subModule) {
			sysPath.append(sub).append("/");
		}
		// 文件名变量
		StringBuilder systemName = new StringBuilder(System.currentTimeMillis() + extension);
		File file = new File(filePath.toString() + sysPath.toString());
		if (!file.exists()) {
			file.mkdirs();
		}
		File newFile = new File(file.getPath() + "/" + systemName.toString());
		sysPath.append(systemName);
		list.add(newFile);
		list.add(sysPath);
		return list;
	}
}
