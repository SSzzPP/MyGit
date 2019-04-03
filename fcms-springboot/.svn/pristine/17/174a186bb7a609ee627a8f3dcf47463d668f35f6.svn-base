package com.yhlt.showcase.base.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;

import com.yhlt.showcase.base.modules.SpringContextHolder;
import com.yhlt.showcase.base.properties.EnvProperties;

import sun.misc.BASE64Decoder;

/**
 * @author hubaojie
 * 
 */
@SuppressWarnings("restriction")
public class ImageUtils {
	private static EnvProperties envProperties = SpringContextHolder.getBean(EnvProperties.class);

	/**
	 * @author hbj
	 * @Description: base64 转img 并保存 @param： base64Str:去除前缀的base64字符串
	 *               imgFilePath：存储路径
	 */
	public static boolean base64ToImg(String base64Str, String imgFilePath) {// 对字节数组字符串进行Base64解码并生成图片
		if (base64Str == null) // 图像数据为空
			return false;
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			// Base64解码
			byte[] bytes = decoder.decodeBuffer(base64Str);
			for (int i = 0; i < bytes.length; ++i) {
				if (bytes[i] < 0) {// 调整异常数据
					bytes[i] += 256;
				}
			}
			// 生成jpeg图片
			OutputStream out = new FileOutputStream(imgFilePath);
			out.write(bytes);
			out.flush();
			out.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * 图片转Base64
	 * 
	 * @author hbj
	 * @Description: base64 转img 并保存 @param： base64Str:去除前缀的base64字符串
	 *               imgFilePath：存储路径
	 */
	public static String imgToBase64(String imgFile) {
		InputStream inputStream = null;
		byte[] data = null;
		try {
			inputStream = new FileInputStream(imgFile);
			data = new byte[inputStream.available()];
			inputStream.read(data);
			inputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 加密
		return Base64.encodeBase64String(data);
	}

	/**
	 * 
	 * 
	 * @param loginName
	 * @return
	 */
	public static String getBase64ImgShow(String path) {
		String src = "";
		try {
			src += "data:image/";
			// 获取图片类型
			File file = new File(path);
			src += getImageFormat(file).toUpperCase();
			src += ";base64,";
			src += imgToBase64(path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return src;
	}
	/**
	 * 
	 * 
	 * @param loginName
	 * @return
	 */
	public static String getBase64VideoShow(String path) {
		String src = "";
		try {
			src += "data:video/";
			// 获取图片类型
			File file = new File(path);
			//src += getImageFormat(file).toUpperCase();
			src += "mp4";
			src += ";base64,";
			src += imgToBase64(path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return src;
	}

	/*
	 * 获得图片的格式，例如：JPEG、GIF等
	 */
	public static String getImageFormat(Object obj) {
		try {
			ImageInputStream iis = ImageIO.createImageInputStream(obj);
			Iterator<ImageReader> iterator = ImageIO.getImageReaders(iis);
			while (iterator.hasNext()) {
				ImageReader reader = (ImageReader) iterator.next();
				return reader.getFormatName();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 将图片转换成流并输出到页面
	 * 
	 * @param imgFilePath
	 * @param response
	 * @return
	 */
	public static boolean imgToStream(String imgFilePath, HttpServletResponse response) {
		InputStream fis = null;
		OutputStream os = null;
		try {
			fis = new FileInputStream(imgFilePath);
			os = response.getOutputStream();
			int count = 0;
			byte[] buffer = new byte[1024 * 8];
			while ((count = fis.read(buffer)) != -1) {
				os.write(buffer, 0, count);
				os.flush();
			}
			fis.close();
			os.close();
			return true;
		} catch (FileNotFoundException e) {
			try {
				fis = new FileInputStream(envProperties.getFileNotFound());
				os = response.getOutputStream();
				int count = 0;
				byte[] buffer = new byte[1024 * 8];
				while ((count = fis.read(buffer)) != -1) {
					os.write(buffer, 0, count);
					os.flush();
				}
				fis.close();
				os.close();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 项目内存放图片的板块文件夹
	 * 
	 * @author zhangweite
	 * @date 2017-10-31 14:38:00
	 */
	/*
	 * public static File getParentFile(HttpServletRequest request, String
	 * section) { String assets = Env.getProperty(Env.KEY_STATIC_URL).replace(
	 * Env.getProperty(Env.KEY_DYNAMIC_URL), ""); String parentPath =
	 * request.getSession().getServletContext() .getRealPath("") + assets +
	 * File.separator + "images" + File.separator + "promotion" + File.separator
	 * + section; return new File(parentPath); }
	 */

}
