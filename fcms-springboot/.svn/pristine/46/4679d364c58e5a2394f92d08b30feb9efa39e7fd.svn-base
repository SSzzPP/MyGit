package com.yhlt.showcase.system.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.properties.EnvProperties;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.base.utils.Constants;
import com.yhlt.showcase.base.utils.DateUtil;
import com.yhlt.showcase.system.entity.FileEntity;
import com.yhlt.showcase.system.service.FileService;

@Controller
@RequestMapping(value = "/admin/system/file")
public class FileController extends BaseController<FileEntity, FileService> {

	@Autowired
	private EnvProperties envProperties;

	@Override
	public String index(Model model) {
		return "system/file/file_index";
	}

	/**
	 * 查询
	 * 
	 * @param pageNum
	 * @param pageRows
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 * @author xunxun
	 * @date 2015-1-22 上午9:55:09
	 */
	@Override
	public Map<String, Object> list(
			@RequestParam(value = "page", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "rows", defaultValue = "10") Integer pageRows,
			@RequestParam(value = "sort", defaultValue = "gmtCreate") String sort,
			@RequestParam(value = "order", defaultValue = "desc") String order,
			HttpServletRequest request, Model model) throws Exception {
		// 排序字段 多个用List
		Order o = new Order("desc".equals(order) ? Direction.DESC
				: Direction.ASC, sort);
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_");
		Map<String, Object> result = service.findByParamsMap(searchParams,
				new PageRequest(pageNum - 1, pageRows, new Sort(o)));
		return result;
	}

	/**
	 * 删除附件信息 同时删除文件
	 * 
	 * @param ids
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 * @author xunxun
	 * @date 2015-1-22 上午9:50:36
	 */
	@Override
	public Map<String, Object> batchDelete(Long[] ids, Model model,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		for (Long id : ids) {
			FileEntity fileEntity = service.findOne(id);
			File file = new File(fileEntity.getSysFilePath());
			// 删除文件
			file.delete();
			// 删除数据
			service.delete(id);
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		return result;
	}

	/**
	 * 附件上传
	 * 
	 * @param file
	 * @param module
	 * @return
	 * @throws Exception
	 * @author xunxun
	 * @date 2015-1-22 上午9:51:10
	 */
	@RequestMapping(value = "/upload")
	@ResponseBody
	public Map<String, Object> upload(@RequestParam("file") MultipartFile file,
			String module) throws Exception {
		String fileName = file.getOriginalFilename();
		FileEntity fileEntity = new FileEntity();
		fileEntity.setModule(module);
		fileEntity.setFileName(fileName);
		fileEntity.setFileSize(file.getSize());
		fileEntity.setConvertFileSize(convertFileSize(file.getSize()));
		fileEntity
				.setContentType(fileName.substring(fileName.lastIndexOf(".") + 1));
		// 获取系统文件
		File newFile = getNewFile(fileName, module);
		fileEntity.setSysFileName(newFile.getName());
		fileEntity.setSysFilePath(newFile.getPath());
		fileEntity.setDeleteFlag(Constants.DELETE_FLAG_FALSE);
		fileEntity.setGmtCreate(new Date());
		fileEntity.setCreateById(LoginContextHolder.get().getUserId());
		// 保存附件
		file.transferTo(newFile);
		// 保存附件信息
		service.save(fileEntity);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		result.put("obj", fileEntity);
		return result;
	}

	/**
	 * 富文本上传
	 * 
	 * @param file
	 * @param module
	 * @return
	 * @throws Exception
	 * @author xunxun
	 * @date 2015-1-22 上午9:51:10
	 */
	@RequestMapping(value = "/uploadImg")
	public String uploadImg(@RequestParam("upload") MultipartFile file,
			@RequestParam(value = "CKEditorFuncNum") String CKEditorFuncNum,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("UTF-8");
		String fileName = file.getOriginalFilename();
		FileEntity fileEntity = new FileEntity();
		fileEntity.setModule("uploadImg");
		fileEntity.setFileName(fileName);
		fileEntity.setFileSize(file.getSize());
		fileEntity.setConvertFileSize(convertFileSize(file.getSize()));
		fileEntity.setContentType(fileName.substring(fileName.lastIndexOf(".") + 1));

		if (!fileEntity.getContentType().equalsIgnoreCase("jpg")&&!fileEntity.getContentType().equalsIgnoreCase("png")&&!fileEntity.getContentType().equalsIgnoreCase("bmp")&&!fileEntity.getContentType().equalsIgnoreCase("gif")) {
			out.println("<script type=\"text/javascript\">");
			out.println("window.parent.CKEDITOR.tools.callFunction("
					+ CKEditorFuncNum + ",'',"
					+ "'文件格式不正确（必须为.jpg/.gif/.bmp/.png文件）');");
			out.println("</script>");
			return null;
		}
		// if (fileEntity.getFileSize() > 2000 * 1024) {
		// out.println("<script type=\"text/javascript\">");
		// out.println("window.parent.CKEDITOR.tools.callFunction(" +
		// CKEditorFuncNum
		// + ",''," + "'文件大小不得大于2MB');");
		// out.println("</script>");
		// return null;
		// }

		// 获取系统文件

		String number = "00000001";
		// 得到文件扩展名
		String extension = fileName.substring(fileName.lastIndexOf("."));
		// 得到当天日期
		String today = DateUtil.formatDate(new Date(), "yyyyMMdd");
		// 获取web项目所在路径
		String realPath = request.getSession().getServletContext()
				.getRealPath("/");
		// 文件路径变量
		StringBuilder path = new StringBuilder();
		path.append("\\").append("uploadImg").append("\\").append(today)
				.append("\\");
		// 文件名变量
		StringBuilder systemName = new StringBuilder(today);
		File localfile = new File(realPath + path.toString());
		// 存在目录判断目录下的文件数量+1，不存在则取1
		if (localfile.exists()) {
			// 得到目录下的文件数量
			String size = ObjectUtils.toString(localfile.list().length + 1);
			number = number.substring(0, number.length() - size.length())
					+ size;
		} else {
			localfile.mkdirs();
		}
		systemName.append(number).append(extension);
		path.append(systemName);
		File newFile = new File(realPath + path.toString());

		fileEntity.setSysFileName(newFile.getName());
		fileEntity.setSysFilePath(path.toString());
		fileEntity.setDeleteFlag(Constants.DELETE_FLAG_FALSE);
		fileEntity.setGmtCreate(new Date());
		fileEntity.setCreateById(LoginContextHolder.get().getUserId());
		// 保存附件
		file.transferTo(newFile);
		// 保存附件信息
		service.save(fileEntity);

		return null;
	}

	/**
	 * 验证文件是否存在
	 * 
	 * @param id
	 * @return
	 * @author xunxun
	 * @date 2015-1-24 下午3:04:12
	 */
	@RequestMapping(value = "/check")
	@ResponseBody
	public Map<String, Object> check(Long id) {
		Map<String, Object> result = new HashMap<String, Object>();
		FileEntity fileEntity = service.findOne(id);
		File file = new File(fileEntity.getSysFilePath());
		if (file.exists()) {
			result.put("success", true);
		} else {
			result.put("success", false);
		}
		return result;
	}

	/**
	 * 下载
	 * 
	 * @param id
	 * @param request
	 * @param response
	 * @author xunxun
	 * @date 2015-1-22 上午11:29:46
	 */
	@RequestMapping(value = "/download")
	public void download(Long id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		FileEntity fileEntity = service.findOne(id);
		File file = new File(fileEntity.getSysFilePath());
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		if (file.exists()) {
			response.reset();
			String filename = URLEncoder.encode(fileEntity.getFileName(),
					"utf-8");
			response.setHeader("Content-Disposition", "attachment; filename="
					+ filename);
			response.addHeader("Content-Length", "" + file.length());
			response.setContentType("application/octet-stream;charset=UTF-8");
			// 获取输入流
			bis = new BufferedInputStream(new FileInputStream(file));
			// 输出流
			bos = new BufferedOutputStream(response.getOutputStream());
			byte[] buff = new byte[2048];
			int bytesRead;
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}
			// 关闭流
			bis.close();
			bos.close();
		}
	}

	/**
	 * 获取系统文件
	 * 
	 * @param fileName
	 * @param module
	 * @return
	 * @author xunxun
	 * @date 2015-1-21 下午5:06:48
	 */
	private synchronized File getNewFile(String fileName, String module) {
		String number = "00000001";
		// 得到文件扩展名
		String extension = fileName.substring(fileName.lastIndexOf("."));
		// 得到当天日期
		String today = DateUtil.formatDate(new Date(), "yyyyMMdd");
		// 文件路径变量
		StringBuilder path = new StringBuilder(envProperties.getFileSavePath());
		path.append("/").append(module).append("/").append(today).append("/");
		// 文件名变量
		StringBuilder systemName = new StringBuilder(today);
		File file = new File(path.toString());
		// 存在目录判断目录下的文件数量+1，不存在则取1
		if (file.exists()) {
			// 得到目录下的文件数量
			String size = ObjectUtils.toString(file.list().length + 1);
			number = number.substring(0, number.length() - size.length())
					+ size;
		} else {
			file.mkdirs();
		}
		systemName.append(number).append(extension);
		path.append(systemName);
		File newFile = new File(path.toString());
		return newFile;
	}

	/**
	 * 文件大小转化
	 * 
	 * @param filesize
	 * @return
	 * @author xunxun
	 * @date 2015-1-21 下午5:04:45
	 */
	private String convertFileSize(long filesize) {
		String strUnit = "B";
		String strAfterComma = "";
		int intDivisor = 1;
		if (filesize >= 1024 * 1024) {
			strUnit = "MB";
			intDivisor = 1024 * 1024;
		} else if (filesize >= 1024) {
			strUnit = "KB";
			intDivisor = 1024;
		}
		if (intDivisor == 1)
			return filesize + strUnit;
		strAfterComma = "" + 100 * (filesize % intDivisor) / intDivisor;
		if (strAfterComma == "")
			strAfterComma = ".0";
		return filesize / intDivisor + "." + strAfterComma + strUnit;

	}
	
	
	public File getNewFile(String module,String fileName,HttpServletRequest request){

		// 获取系统文件
		String number = "00000001";
		// 得到文件扩展名
		String extension = fileName.substring(fileName.lastIndexOf("."));
		// 得到当天日期
		String today = DateUtil.formatDate(new Date(), "yyyyMMdd");
		// 获取web项目所在路径
		String realPath = request.getSession().getServletContext()
				.getRealPath("/");
		// 文件路径变量
		StringBuilder path = new StringBuilder();
		path.append("\\").append(module).append("\\").append(today)
				.append("\\");
		// 文件名变量
		StringBuilder systemName = new StringBuilder(today);
		File localfile = new File(realPath + path.toString());
		// 存在目录判断目录下的文件数量+1，不存在则取1
		if (localfile.exists()) {
			// 得到目录下的文件数量
			String size = ObjectUtils.toString(localfile.list().length + 1);
			number = number.substring(0, number.length() - size.length())
					+ size;
		} else {
			localfile.mkdirs();
		}
		systemName.append(number).append(extension);
		path.append(systemName);
		File newFile = new File(realPath + path.toString());
		return newFile;
		
	}
	
	 public long getFileSizes(File f) throws Exception{//取得文件大小
	       long s=0;
	       if (f.exists()) {
	           FileInputStream fis = null;
	           fis = new FileInputStream(f);
	          s= fis.available();
	       } else {
	           f.createNewFile();
	           System.out.println("文件不存在");
	       }
	       return s;
	    }
}
