package com.yhlt.showcase.front.controller.dict;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
@RequestMapping(value = "/front/dict")
public class FrontDictController extends BaseController<DictEntity, DictService> {

	@Override
	public String index(Model model) {
		return null;
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
}
