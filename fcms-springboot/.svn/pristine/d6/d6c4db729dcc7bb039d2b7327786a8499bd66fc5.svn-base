package com.yhlt.showcase.survey.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.survey.constants.SurveyConstants;
import com.yhlt.showcase.survey.dao.SurveyQuestionDao;
import com.yhlt.showcase.survey.dto.ExcelSurveyQuestionDto;
import com.yhlt.showcase.survey.entity.SurveyQuestionEntity;

/**
 * 问卷问题
 * 
 * @author stone
 * 
 */
@Component
@Transactional
@BusinessLog(service = "问题管理")
@DataPermission
public class SurveyQuestionService extends BaseService<SurveyQuestionEntity, SurveyQuestionDao>{
	/**
	 * 导入试题题库&返回错误数据
	 * 
	 * @param singleList
	 * @return
	 */
	public List<ExcelSurveyQuestionDto> importQuestion(
			List<ExcelSurveyQuestionDto> singleList) {

		int dbRepeatNum = 0;// 数据库去重数目统
		int splitNum = 0;

		// 错误数据
		List<ExcelSurveyQuestionDto> result = new ArrayList<ExcelSurveyQuestionDto>();

		// 数据库去重数据
		// List<ExcelSurveyQuestionDto> dbList = new
		// ArrayList<ExcelSurveyQuestionDto>();
		List<SurveyQuestionEntity> saveList=new ArrayList<SurveyQuestionEntity>();
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
			List<SurveyQuestionEntity> checkList = this
					.findByParams(searchParams);
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
			saveList.add(tempEntity);
			// 保存question实体
			//SurveyQuestionEntity backEntity = this.save(tempEntity);
		}
		this.save(saveList);
		System.out.println("-------------------数据库去重的试题数目：" + dbRepeatNum);
		System.out.println("-------------------option有问题的试题数目：" + splitNum);
		return result;
	}
}
