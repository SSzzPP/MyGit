package com.yhlt.showcase.survey.controller;

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

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.survey.constants.SurveyConstants;
import com.yhlt.showcase.survey.dto.ExcelSurveyQuestionDto;
import com.yhlt.showcase.survey.entity.SurveyPaperEntity;
import com.yhlt.showcase.survey.entity.SurveyPaperQuestionEntity;
import com.yhlt.showcase.survey.entity.SurveyQuestionEntity;
import com.yhlt.showcase.survey.service.SurveyPaperQuestionService;
import com.yhlt.showcase.survey.service.SurveyPaperService;
import com.yhlt.showcase.survey.service.SurveyQuestionService;

/**
 * 试卷管理
 * 
 * @author stone
 * 
 */
@Controller
@RequestMapping(value = "/admin/survey/paperQuestion")
public class SurveyPaperQuestionController extends
		BaseController<SurveyPaperQuestionEntity, SurveyPaperQuestionService> {
	@Autowired
	private SurveyPaperService surveyPaperService;
	@Autowired
	private SurveyQuestionService surveyQuestionService;
	@Override
	public String index(Model model) {
		return null;
	}

	// 
	@RequestMapping(value = "/toPaperQuestion")
	public String toProtocol(Model model,HttpServletRequest request) {
		String uuid=request.getParameter("uuid");
		Map<String, Object> searchParams=new HashMap<String, Object>();
		searchParams.put("EQ_uuid", uuid);
		SurveyPaperEntity surveyPaperEntity=surveyPaperService.findOneByParams(searchParams);
		model.addAttribute("entity", surveyPaperEntity);
		return "survey/paper/survey_paper_question_index";
	}
	@RequestMapping(value = "/questionList")
	@ResponseBody
	public Map<String,Object> questionList(
			@RequestParam(value = "page", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "rows", defaultValue = "10") Integer pageRows,
			@RequestParam(value = "sort", defaultValue = "finish") String sort,
			@RequestParam(value = "order", defaultValue = "desc") String order,
			HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_", true);
		Map<String,Object> result=new HashMap<String, Object>();
		// 排序字段 多个用List
		List<SurveyPaperQuestionEntity> paperQuestionEntities=service.findByParams(searchParams);
		List<SurveyQuestionEntity> questionEntities=new ArrayList<SurveyQuestionEntity>();
		if(paperQuestionEntities!=null&&paperQuestionEntities.size()>0){
			for (SurveyPaperQuestionEntity surveyPaperQuestionEntity : paperQuestionEntities) {
				questionEntities.add(surveyPaperQuestionEntity.getSurveyQuestionEntity());
			}
		}
		result.put("total", questionEntities.size());
		result.put("rows", questionEntities);
		return result;
	}
	// 添加考试题目
		@RequestMapping(value = "/addTopic")
		public String addTopic(HttpServletRequest request, Model model) {
			String paperId=request.getParameter("paperId");
			model.addAttribute("entity", surveyPaperService.findOne(Long.parseLong(paperId)));
			return "survey/paper/survey_paper_question_add";
		}
		/**
		 * 保存更新方法<br>
		 * 带验证
		 * 
		 * @param t
		 * @param model
		 * @param request
		 * @param response
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value = "/saveThis")
		@ResponseBody
		public Map<String, Object> saveThis(SurveyQuestionEntity t, Model model,
				HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			if (t.getId() != null) {
				SurveyQuestionEntity temp = surveyQuestionService.findOne(t.getId());
				BeanUtils.copyProperties(t, temp);
				temp.setGmtModified(new Date());
				temp.setLastModifiedById(LoginContextHolder.get().getUserId());
				t = temp;
			} else {
				t.setGmtCreate(new Date());
				t.setCreateById(LoginContextHolder.get().getUserId());
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
			SurveyQuestionEntity surveyQuestionEntity=surveyQuestionService.save(t);
			SurveyPaperQuestionEntity surveyPaperQuestionEntity=new SurveyPaperQuestionEntity();
			String paperId=request.getParameter("paperId");
			surveyPaperQuestionEntity.setSurveyPaperEntity(surveyPaperService.findOne(Long.parseLong(paperId)));
			surveyPaperQuestionEntity.setSurveyQuestionEntity(surveyQuestionEntity);
			surveyPaperQuestionEntity.setCreateById(LoginContextHolder.get().getUserId());
			surveyPaperQuestionEntity.setGmtCreate(new Date());
			Map<String,Object> result=service.saveMap(surveyPaperQuestionEntity);
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
		 * 删除一条记录
		 * 
		 * @param id
		 * @param model
		 * @param request
		 * @param response
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value = "/deleteByQuestion")
		@ResponseBody
		public Map<String, Object> deleteByQuestion(@RequestParam("questionId") long questionId,@RequestParam("paperId") long paperId,
				Model model, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			Map<String,Object> searchParams=new HashMap<String, Object>();
			searchParams.put("EQ_surveyQuestionEntity.id", questionId);
			searchParams.put("EQ_surveyPaperEntity.id", paperId);
			List<SurveyPaperQuestionEntity> list=service.findByParams(searchParams);
			if(list==null||list.size()==0){
				Map<String, Object> result = new HashMap<String, Object>();
				result.put("success", false);
				return result;
			}
			service.delete(list);
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("success", true);
			return result;
		}
		/**
		 * 保存更新方法<br>
		 * 带验证
		 * 
		 * @param t
		 * @param model
		 * @param request
		 * @param response
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value = "/saveSelectThis")
		@ResponseBody
		public Map<String, Object> saveSelectThis(
				Long paperId,Long[] questionIds,
				HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			Long loginId=LoginContextHolder.get().getUserId();
			SurveyPaperEntity surveyPaperEntity=surveyPaperService.findOne(paperId);
			List<SurveyPaperQuestionEntity> list=new ArrayList<SurveyPaperQuestionEntity>();
			for (Long questionId : questionIds) {
				Map<String, Object> searchParams=new HashMap<String, Object>();
				searchParams.put("EQ_surveyPaperEntity.id", paperId);
				searchParams.put("EQ_surveyQuestionEntity.id",questionId);
				List<SurveyPaperQuestionEntity> searchs=service.findByParams(searchParams);
				//如果重复 continue
				if(searchs!=null&&searchs.size()>0){
					continue;
				}
				SurveyPaperQuestionEntity surveyPaperQuestionEntity=new SurveyPaperQuestionEntity();
				surveyPaperQuestionEntity.setSurveyPaperEntity(surveyPaperEntity);
				surveyPaperQuestionEntity.setSurveyQuestionEntity(surveyQuestionService.findOne(questionId));
				surveyPaperQuestionEntity.setCreateById(loginId);
				surveyPaperQuestionEntity.setGmtCreate(new Date());
				list.add(surveyPaperQuestionEntity);
			}
			Map<String, Object> result = service.save(list);
			return result;
		}
		/**
		 * hubaojie
		 * 
		 * @Description: 题库excel导入
		 * @param：
		 * @return
		 */
//		@RequestMapping(value = "/importQuestions")
//		@ResponseBody
//		public Map<String, Object> importQuestions(
//				@RequestParam("file") MultipartFile file,
//				@RequestParam("paperId") Long paperId,
//				HttpServletRequest request, HttpServletResponse response)
//				throws Exception {
//			Map<String, Object> result = new HashMap<String, Object>();
//			InputStream inputStream = (InputStream) (file.getInputStream());
//			// excel参数设置
//			ImportParams params = new ImportParams();
//			params.setTitleRows(1);
//			params.setHeadRows(1);
//			try {
//				List<ExcelSurveyQuestionDto> list = ExcelImportUtil.importExcel(
//						inputStream, ExcelSurveyQuestionDto.class, params);
//				System.out
//						.println("-------------------excel解析的试题数目：" + list.size());
//				// excel去重
//				List<ExcelSurveyQuestionDto> singleList = new ArrayList<ExcelSurveyQuestionDto>();
//				for (ExcelSurveyQuestionDto excelSurveyQuestionDto : list) {
//					if(!singleList.contains(excelSurveyQuestionDto)){
//						singleList.add(excelSurveyQuestionDto);
//					}
//				}
//				System.out.println("-------------------excel去重的试题数目："
//						+ (list.size() - singleList.size()));
//				// List<ExamQuestionEntity> saveList = new
//				// ArrayList<ExamQuestionEntity>();
//				// 保存数据库
//				List<ExcelSurveyQuestionDto> errorDataList = importQuestion(
//						singleList,paperId);
//				if (errorDataList != null && errorDataList.size() > 0) {
//
//					Workbook workbook = ExcelExportUtil.exportExcel(
//							new ExportParams("错误数据", "错误数据"),
//							ExcelSurveyQuestionDto.class, errorDataList);
//					OutputStream out = null;
//					try {
//						out = response.getOutputStream();
//						String fileName = "错误数据.xls";// 文件名
//						response.setContentType("application/x-msdownload");
//						response.setHeader(
//								"Content-Disposition",
//								"attachment; filename="
//										+ URLEncoder.encode(fileName, "UTF-8"));
//						workbook.write(out);
//					} catch (Exception e) {
//						e.printStackTrace();
//					} finally {
//						try {
//							out.close();
//						} catch (IOException e) {
//							e.printStackTrace();
//						}
//					}
//				}
//				result.put("success", true);
//				result.put("msg", "导入成功！");
//			} catch (Exception e) {
//				result.put("success", false);
//				result.put("msg", "导入失败！");
//			}
//
//			return result;
//		}
		/**
		 * 导入试题题库&返回错误数据
		 * 
		 * @param singleList
		 * @return
		 */
		public List<ExcelSurveyQuestionDto> importQuestion(
				List<ExcelSurveyQuestionDto> singleList,Long paperId) {

			int dbRepeatNum = 0;// 数据库去重数目统
			int splitNum = 0;
			SurveyPaperEntity surveyPaperEntity=surveyPaperService.findOne(paperId);
			// 错误数据
			List<ExcelSurveyQuestionDto> result = new ArrayList<ExcelSurveyQuestionDto>();

			// 数据库去重数据
			// List<ExcelSurveyQuestionDto> dbList = new
			// ArrayList<ExcelSurveyQuestionDto>();

			for (ExcelSurveyQuestionDto exam : singleList) {

				if (
						exam.getQuestionTypeStr() == null
						|| exam.getTitle() == null || exam.getOptions1() == null
						|| exam.getOptions2() == null) {
					result.add(exam);
					continue;
				}

				// 数据库去重:根据【题干和选项】去重
				Map<String, Object> searchParams = new HashMap<String, Object>();
				searchParams.put("EQ_title", exam.getTitle().trim());
				searchParams.put("EQ_options", exam.getOptions().trim());
				List<SurveyQuestionEntity> checkList = surveyQuestionService
						.findByParams(searchParams);
				for (SurveyQuestionEntity surveyQuestionEntity : checkList) {
					SurveyPaperQuestionEntity surveyPaperQuestionEntity=new SurveyPaperQuestionEntity();
					surveyPaperQuestionEntity.setCreateById(LoginContextHolder.get().getUserId());
					surveyPaperQuestionEntity.setGmtCreate(new Date());
					surveyPaperQuestionEntity.setSurveyPaperEntity(surveyPaperEntity);
					surveyPaperQuestionEntity.setSurveyQuestionEntity(surveyQuestionEntity);
					service.save(surveyPaperQuestionEntity);
				}
				if (checkList.size() > 0) {
					dbRepeatNum++;
					System.out.println("数据库去重试题：--------" + exam.getTitle());
					// exam.setId(checkList.get(0).getId());
					// result.add(exam);
					continue;
				}

				// 验证【;】
				// if (exam.getOptions().contains("；")
				// || exam.getOptions().split(";").length != exam
				// .getOptionsNums()) {
				// splitNum++;
				// System.out.println(" 验证【;】-知识点：" + exam.getExamType()
				// + "--------" + exam.getOptions());
				// }

				SurveyQuestionEntity tempEntity = new SurveyQuestionEntity();
				// CopyPropertiesUtil.copyPropertiesIgnoreNull(exam, tempEntity);
				// 设置参数
				// tempEntity.setUuid(UUID.randomUUID().toString());
				tempEntity.setTitle(exam.getTitle() == null ? exam.getTitle()
						: exam.getTitle().trim());
				tempEntity.setOptions(exam.getOptions() == null ? exam.getOptions()
						: exam.getOptions().trim());
				tempEntity.setQuestionType(SurveyConstants.QUESTION_TYPE_MAP.get(exam
						.getQuestionTypeStr().trim()));
				tempEntity.setOptionsNums(exam.getOptionsNums());
				tempEntity.setCreateById(LoginContextHolder.get().getUserId());
				tempEntity.setGmtCreate(new Date());
				// 保存question实体
				SurveyQuestionEntity backEntity = surveyQuestionService.save(tempEntity);
				SurveyPaperQuestionEntity surveyPaperQuestionEntity=new SurveyPaperQuestionEntity();
				surveyPaperQuestionEntity.setCreateById(LoginContextHolder.get().getUserId());
				surveyPaperQuestionEntity.setGmtCreate(new Date());
				surveyPaperQuestionEntity.setSurveyPaperEntity(surveyPaperEntity);
				surveyPaperQuestionEntity.setSurveyQuestionEntity(backEntity);
				service.save(surveyPaperQuestionEntity);
			}

			System.out.println("-------------------数据库去重的试题数目：" + dbRepeatNum);
			System.out.println("-------------------option有问题的试题数目：" + splitNum);
			return result;
		}
}
