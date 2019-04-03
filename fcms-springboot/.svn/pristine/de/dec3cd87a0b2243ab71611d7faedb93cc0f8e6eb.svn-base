package com.yhlt.showcase.system.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.dict.DictEntity;
import com.yhlt.showcase.dict.DictService;

/**
 * 数据字典
 * 
 * @author lls
 * 
 */
@Controller
@RequestMapping(value = "/mobile/system/dict")
public class DictController extends BaseController<DictEntity, DictService> {

	/**
	 * 根据字典名称及类型判断数据字典项是否重复
	 * 
	 * @param dictName
	 * @param typeName
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/check")
	@ResponseBody
	public Map<String, Object> check(@RequestParam("dictName") String dictName, @RequestParam("typeName") String typeName, HttpServletRequest request, Model model) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_name", dictName);
		searchParams.put("EQ_type", typeName);
		List<DictEntity> dictEntities = service.findByParams(searchParams);

		Map<String, Object> result = new HashMap<String, Object>();
		// flag=true 没有注册，false已被注册
		boolean flag = dictEntities == null || dictEntities.size() == 0;
		result.put("success", flag);
		result.put("msg", flag ? "" : "该标识已被注册");
		return result;
	}

	/**
	 * 根据模块查询 供下拉框用
	 * 
	 * @param typeName
	 * @return
	 * @author xunxun
	 * @date 2015-1-30 下午2:54:51
	 */
	@RequestMapping(value = "/combobox")
	@ResponseBody
	public List<DictEntity> combobox(String type) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		if (StringUtils.isNotBlank(type)) {
			searchParams.put("EQ_type", type);
		}
		return service.findByParams(searchParams);
	}

	@RequestMapping(value = "/getID")
	@ResponseBody
	public DictEntity getId(String type, String value) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		if (StringUtils.isNotBlank(type)) {
			searchParams.put("EQ_type", type);
			searchParams.put("EQ_value", value);
		}
		return service.findOneByParams(searchParams);
	}

	/**
	 * 查询场馆 商圈、区域、分类
	 * 
	 * @return
	 */
	@RequestMapping(value = "/venue")
	@ResponseBody
	public Map<String, Object> venue() {
		Map<String, Object> result = new HashMap<>();
		List<DictEntity> businessList = service.findByTypeNoCache("BUSINESS_AREA", new Sort(Direction.ASC, "id"));
		List<DictEntity> administrateList = service.findByTypeNoCache("ADMINISTRATE_AREA", new Sort(Direction.ASC, "id"));
		List<DictEntity> venueTypeList = service.findByTypeNoCache("SPORT_TYPE", new Sort(Direction.ASC, "id"));
		result.put("business", businessList);
		result.put("administrat", administrateList);
		result.put("venueType", venueTypeList);
		return result;
	}
	/**
	 * 健身路径 街道列表
	 * @return
	 */
	@RequestMapping(value = "/pubEquipStreet")
	@ResponseBody
	public Map<String, Object> pubEquipStreet() {
		Map<String, Object> result = new HashMap<>();
		List<DictEntity> streetList = service.findByTypeNoCache("STREET_NAME", new Sort(Direction.ASC, "id"));
		result.put("street", streetList);
		return result;
	}
	/**
	 * 列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "/findByType")
	@ResponseBody
	public List<DictEntity> venueType(String type) {
		return service.findByTypeNoCache(type, new Sort(Direction.ASC, "id"));
	}

	/**
	 * 健身频道列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "/channelList")
	@ResponseBody
	public List<DictEntity> getChannelList() {
		return service.findByTypeNoCache("INFO_MODULE", new Sort(Direction.ASC, "id"));
	}
}
