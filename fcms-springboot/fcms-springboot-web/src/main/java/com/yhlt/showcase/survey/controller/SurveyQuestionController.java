package com.yhlt.showcase.survey.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.yhlt.showcase.base.security.AccessRequired;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.base.utils.CopyPropertiesUtil;
import com.yhlt.showcase.survey.constants.SurveyConstants;
import com.yhlt.showcase.survey.dto.QuestionTypeDto;
import com.yhlt.showcase.survey.entity.SurveyQuestionEntity;
import com.yhlt.showcase.survey.service.SurveyPaperQuestionService;
import com.yhlt.showcase.survey.service.SurveyQuestionService;
import com.yhlt.showcase.survey.service.SurveyRecordService;
import com.yhlt.showcase.system.utils.FileUtil;

/**
 * 在线考试题库
 * 
 * @author stone
 * 
 */
@Controller
@RequestMapping(value = "/admin/survey/question")
public class SurveyQuestionController extends
		BaseController<SurveyQuestionEntity, SurveyQuestionService> {
	
	@Autowired
	private SurveyPaperQuestionService surveyPaperQuestionService;
	@Autowired
	private SurveyRecordService surveyRecordService;

	@Override
	public String index(Model model) {
		return "survey/question/survey_question_index";
	}

	// 添加考试题目
	@RequestMapping(value = "/addTopic")
	public String addTopic(HttpServletRequest request, Model model) {
		return "survey/question/survey_question_add";

	}

	// 修改考试题目
	@RequestMapping(value = "/editTopic")
	public String editTopic(@RequestParam Long id, HttpServletRequest request,
			Model model) {
		SurveyQuestionEntity surveyQuestionEntity = service.findOne(id);
		model.addAttribute("entity", surveyQuestionEntity);
		return "survey/question/survey_question_edit";
	}

	/**
	 * 题目图片上传
	 * 
	 * @param file
	 * @author hubaojie
	 */
	@RequestMapping(value = "/CKEditorUpload")
	public String CKEditorUpload(@RequestParam("upload") MultipartFile file,
			@RequestParam(value = "CKEditorFuncNum") String CKEditorFuncNum,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String module = "examQuestionCKEditor";
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("UTF-8");
		String fileName = file.getOriginalFilename();

		// 格式处理
		String type = fileName.substring(fileName.lastIndexOf(".") + 1);
		if (!(type.equalsIgnoreCase("jpg") || type.equalsIgnoreCase("gif")
				|| type.equalsIgnoreCase("bmp") || type.equalsIgnoreCase("png"))) {
			out.println("<script type=\"text/javascript\">");
			out.println("window.parent.CKEDITOR.tools.callFunction("
					+ CKEditorFuncNum + ",'',"
					+ "'文件格式不正确（必须为.jpg/.gif/.bmp/.png文件）');");
			out.println("</script>");
			return null;
		}

		// 文件处理
		List<Object> list = FileUtil.getNewFile(fileName, module, request);
		File newFile = (File) list.get(0);
		StringBuffer path = (StringBuffer) list.get(1);

		// 保存文件
		file.transferTo(newFile);

		// 返回“图像”选项卡并显示图片
		out.println("<script type=\"text/javascript\">");
		out.println("window.parent.CKEDITOR.tools.callFunction("
				+ CKEditorFuncNum + ",'" + request.getContextPath()
				+ path.toString().replace("\\", "/") + "','')");
		out.println("</script>");
		return null;
	}

	/**
	 * 单选复选信息
	 * 
	 * @param name
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/questionType")
	@ResponseBody
	public List<QuestionTypeDto> questionType(HttpServletRequest request, Model model) {
		List<QuestionTypeDto> list = new ArrayList<QuestionTypeDto>();
		for (String questionKey : SurveyConstants.QUESTION_TYPE_MAP.keySet()) {
			QuestionTypeDto questionTypeDto = new QuestionTypeDto();
			questionTypeDto.setName(questionKey);
			questionTypeDto.setValue(SurveyConstants.QUESTION_TYPE_MAP
					.get(questionKey));
			list.add(questionTypeDto);
		}
		return list;
	}
	
	@RequestMapping(value = "/save")
	@ResponseBody
	public Map<String, Object> save(SurveyQuestionEntity t, Model model,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		if (t.getId() != null) {
			SurveyQuestionEntity temp = service.findOne(t.getId());
			CopyPropertiesUtil.copyPropertiesIgnoreNull(t, temp);
			temp.setGmtModified(new Date());
			temp.setLastModifiedById(LoginContextHolder.get().getUserId());
			t = temp;
		} else {
			t.setGmtCreate(new Date());
			t.setCreateById(LoginContextHolder.get().getUserId());
			// t.setUuid(UUID.randomUUID().toString());
		}
		// 验证实体类
		Set<ConstraintViolation<SurveyQuestionEntity>> constraintViolations = validator
				.getValidator().validate(t);
		// 如果大于0，说明有验证未通过信息
		if (constraintViolations.size() > 0) {
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("success", false);
			result.put("msg", constraintViolations.iterator().next()
					.getMessage());
			return result;
		}

		t.setTitle(replaceBlank(t.getTitle(), false));
		t.setOptions(replaceBlank(t.getOptions(), true));
		t.setOptionsNums(t.getOptions().split(";").length);
		Map<String, Object> result = service.saveMap(t);
		return result;
	}

	/**
	 * 去掉P标签 和 换行
	 * 
	 * @param str
	 * @return
	 */
	public String replaceBlank(String str, boolean processIamge) {

		str = str.replaceAll("<p>", "");
		str = str.replaceAll("</p>", "");

		String dest = "";
		if (str != null) {
			Pattern p = Pattern.compile("\t|\r|\n");
			Matcher m = p.matcher(str);
			dest = m.replaceAll("");
			// 处理图像
			if (processIamge) {
				dest = replaceImageInfo(dest);
			}
		}
		return dest;
	}

	public String replaceImageInfo(String str) {
		return str.replaceAll("style=\".*?\"", "")
				.replaceAll("width=\".*?\"", "")
				.replaceAll("/>", "style=\"padding:10px\" width=\"200px\" />");
	}

	/**
	 * 分页查询，包含search_查询条件<br>
	 * 返回Map{row:{},total:{}}
	 * 
	 * @param pageNum
	 * @param pageRows
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(
			@RequestParam(value = "page", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "rows", defaultValue = "10") Integer pageRows,
			@RequestParam(value = "sort", defaultValue = "id") String sort,
			@RequestParam(value = "order", defaultValue = "asc") String order,
			HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_", true);
		// 排序字段 多个用List
		Order o = new Order("desc".equals(order) ? Direction.DESC
				: Direction.ASC, sort);
		Map<String, Object> result = service.findByParamsMap(searchParams,
				new PageRequest(pageNum - 1, pageRows, new Sort(o)));
		return result;
	}
	/**
	 * 删除一条记录
	 * 
	 * @param id
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@AccessRequired("管理员")
	@RequestMapping(value = "/delete")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam("id") long id,
			Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//删除和问题相关的问卷问题中间表
		surveyPaperQuestionService.delete(surveyPaperQuestionService.findAllByQuestionId(id));
		//删除和问题相关的记录中间表
		surveyRecordService.delete(surveyRecordService.findAllByQuestionId(id));
		service.delete(id);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		return result;
	}
	/**
	 * 下载试题模板
	 * 
	 * @param id
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/downloadTemplate")
	public void downloadTemplate(String uuid, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String folder = request.getSession().getServletContext()
				.getRealPath("/template/问卷问题模板.xlsx");
		File file = new File(folder);
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		if (file.exists()) {
			response.reset();
			String filename = URLEncoder.encode("问卷问题模板.xlsx", "utf-8");
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
	 * hubaojie
	 * 
	 * @Description: 题库excel导入
	 * @param：
	 * @return
	 */
//	@RequestMapping(value = "/importQuestions")
//	@ResponseBody
//	public Map<String, Object> importQuestions(
//			@RequestParam("file") MultipartFile file,
//			HttpServletRequest request, HttpServletResponse response)
//			throws Exception {
//		Map<String, Object> result = new HashMap<String, Object>();
//		InputStream inputStream = (InputStream) (file.getInputStream());
//		// excel参数设置
//		ImportParams params = new ImportParams();
//		params.setTitleRows(1);
//		params.setHeadRows(1);
//		try {
//			List<ExcelSurveyQuestionDto> list = ExcelImportUtil.importExcel(
//					inputStream, ExcelSurveyQuestionDto.class, params);
//			System.out
//					.println("-------------------excel解析的试题数目：" + list.size());
//			// excel去重
//			List<ExcelSurveyQuestionDto> singleList = new ArrayList<ExcelSurveyQuestionDto>();
//			for (ExcelSurveyQuestionDto excelSurveyQuestionDto : list) {
//				if(!singleList.contains(excelSurveyQuestionDto)){
//					singleList.add(excelSurveyQuestionDto);
//				}
//			}
//			System.out.println("-------------------excel去重的试题数目："
//					+ (list.size() - singleList.size()));
//			// List<ExamQuestionEntity> saveList = new
//			// ArrayList<ExamQuestionEntity>();
//			// 保存数据库
//			List<ExcelSurveyQuestionDto> errorDataList = service.importQuestion(
//					singleList);
//			if (errorDataList != null && errorDataList.size() > 0) {
//
//				Workbook workbook = ExcelExportUtil.exportExcel(
//						new ExportParams("错误数据", "错误数据"),
//						ExcelSurveyQuestionDto.class, errorDataList);
//				OutputStream out = null;
//				try {
//					out = response.getOutputStream();
//					String fileName = "错误数据.xls";// 文件名
//					response.setContentType("application/x-msdownload");
//					response.setHeader(
//							"Content-Disposition",
//							"attachment; filename="
//									+ URLEncoder.encode(fileName, "UTF-8"));
//					workbook.write(out);
//				} catch (Exception e) {
//					e.printStackTrace();
//				} finally {
//					try {
//						out.close();
//					} catch (IOException e) {
//						e.printStackTrace();
//					}
//				}
//			}
//			result.put("success", true);
//			result.put("msg", "导入成功！");
//		} catch (Exception e) {
//			result.put("success", false);
//			result.put("msg", "导入失败！");
//		}
//
//		return result;
//	}

}
