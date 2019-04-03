package com.yhlt.showcase.front.controller.information;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
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

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.dict.DictEntity;
import com.yhlt.showcase.dict.DictService;
import com.yhlt.showcase.information.entity.InformationEntity;
import com.yhlt.showcase.information.service.InformationService;

/**
 * 资讯管理
 * 
 * @author linannan
 * 
 */
@Controller
@RequestMapping(value = "/front/information/info")
public class FrontInformationController extends BaseController<InformationEntity, InformationService> {
	@Autowired
	private DictService dictService;

	@Override
	public String index(Model model) {
		return null;
	}
	
	/**
	 * 按照类型查询
	 */
	@RequestMapping(value = "/listByModule")
	@ResponseBody
	public Map<String, Object> listByModule(@RequestParam(value = "page", defaultValue = "1") Integer pageNum, @RequestParam(value = "rows", defaultValue = "10") Integer pageRows, @RequestParam(value = "sort", defaultValue = "id") String sort, @RequestParam(value = "order", defaultValue = "asc") String order, HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_", true);
		// 查已发布的
		searchParams.put("EQ_status", 1);
		// 处理分类
		if (!StringUtils.isBlank((String) searchParams.get("EQ_moduleName"))) {
			DictEntity dictEntity = dictService.findDict("INFO_MODULE", (String) searchParams.get("EQ_moduleName"));
			searchParams.put("EQ_moduleId", dictEntity.getId());
			searchParams.remove("EQ_moduleName");
		}
		// 排序字段 多个用List
		Order o = new Order("desc".equals(order) ? Direction.DESC : Direction.ASC, sort);
		Map<String, Object> result = service.findByParamsMap(searchParams, new PageRequest(pageNum - 1, pageRows, new Sort(o)));
		return result;
	}
}
