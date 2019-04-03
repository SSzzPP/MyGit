package com.yhlt.showcase.survey.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.survey.dto.SurveyPaperStatusDto;
import com.yhlt.showcase.survey.entity.SurveyPaperEntity;
import com.yhlt.showcase.survey.service.SurveyPaperService;

/**
 * 试卷管理
 * 
 * @author stone
 * 
 */
@Controller
@RequestMapping(value = "/mobile/survey/paper")
public class MobileSurveyPaperController extends BaseController<SurveyPaperEntity, SurveyPaperService>{


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
			@RequestParam(value = "order", defaultValue = "desc") String order,
			HttpServletRequest request, Model model) throws Exception {
		//Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_", true);
		// 排序字段 多个用List
		//Order o = new Order("desc".equals(order)?Direction.DESC:Direction.ASC, sort);
		//Map<String, Object> result = service.findByParamsMap(searchParams, new PageRequest(pageNum - 1, pageRows,new Sort(o)));
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> searchParams = new HashMap<String,Object>();
		searchParams.put("userId", LoginContextHolder.get().getUserId());
		searchParams.put("startRow", --pageNum * pageRows);
		searchParams.put("endRow", pageRows);
		List<SurveyPaperStatusDto> list = service.findPaperPager(searchParams);
		result.put("rows", list);
		result.put("now", DateFormatUtils.format(new Date(), "yyyy-MM-dd"));
		result.put("userId", LoginContextHolder.get().getUserId());
		
		return result;
	}
}
