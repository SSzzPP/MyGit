package com.yhlt.showcase.information.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.yhlt.showcase.base.properties.EnvProperties;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.dict.DictEntity;
import com.yhlt.showcase.dict.DictService;
import com.yhlt.showcase.information.entity.InformationEntity;
import com.yhlt.showcase.information.service.InformationService;
import com.yhlt.showcase.system.utils.FileUtil;

/**
 * 资讯管理
 * 
 * @author linannan
 * 
 */
@Controller
@RequestMapping(value = "/mobile/information/info")
public class InformationController extends BaseController<InformationEntity, InformationService> {

	@Autowired
	private DictService dictService;
	@Autowired
	private EnvProperties envProperties;

	@RequestMapping(value = "/bannerList")
	@ResponseBody
	public List<InformationEntity> bannerList(HttpServletRequest request, Model model) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_", true);
		// 查已发布的
		searchParams.put("EQ_status", 1);
		// 处理分类
		if (!StringUtils.isBlank((String) searchParams.get("EQ_moduleName"))) {
			DictEntity dictEntity = dictService.findDict("INFO_MODULE", (String) searchParams.get("EQ_moduleName"));
			searchParams.put("EQ_moduleId", dictEntity.getId());
			searchParams.remove("EQ_moduleName");
		}
		Order o = new Order(Direction.DESC, "gmtCreate");
		Map<String, Object> searchResult = service.findByParamsMap(searchParams, new PageRequest(0, 3, new Sort(o)));
		List<InformationEntity> entities = (List<InformationEntity>) searchResult.get("rows");
		result.put("entities", entities);
		return entities;

	}

	@RequestMapping(value = "/showImage")
	public void showImage(String uuid, HttpServletRequest request, HttpServletResponse response) {
		InformationEntity informationEntity = service.findOneByUuid(uuid);
		if (informationEntity.getHeadImage() != null) {
			service.coverImgCallBack(informationEntity.getHeadImage(), response);
		} else {
			service.coverImgCallBack(envProperties.getNoFile(), response);
		}
	}

	@RequestMapping(value = "/getBannerDetail")
	@ResponseBody
	public Map<String, Object> getBannerDetail(String uuid) {
		Map<String, Object> result = new HashMap<String, Object>();
		InformationEntity informationEntity = service.findOneByUuid(uuid);
		result.put("success", true);
		result.put("obj", informationEntity);
		return result;

	}

	@RequestMapping(value = "/showContentImage")
	public void showContentImage(String fileName, HttpServletRequest request, HttpServletResponse response) {
		String name = fileName.substring(fileName.indexOf("=") + 1);
		service.fileCallBack(name, response, FileUtil.getFileSavePath());
	}

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
	//查询场馆介绍（唯一值）
	@RequestMapping(value="/findVenueIntroduce")
	@ResponseBody
	public Map<String, Object> findVenueIntroduce(@RequestParam("id") Long id,HttpServletRequest request) {
		Map<String, Object> searchParams = new HashMap<String,Object>();
		searchParams.put("EQ_venueId", id);
		searchParams.put("EQ_moduleId", 503L);
		searchParams.put("EQ_status", 1);
		InformationEntity entity=service.findOneByParams(searchParams);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("obj", entity);
		result.put("success", true);
		return result;
	}
}
