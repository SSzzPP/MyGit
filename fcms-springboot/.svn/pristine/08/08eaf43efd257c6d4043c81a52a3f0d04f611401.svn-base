package com.yhlt.showcase.front.controller.venue;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.Image.entity.ImageEntity;
import com.yhlt.showcase.Image.service.ImageService;
import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.properties.EnvProperties;
import com.yhlt.showcase.base.utils.ImageUtils;
import com.yhlt.showcase.venue.entity.VenueEquipmentTypeEntity;
import com.yhlt.showcase.venue.service.VenueEquipmentTypeService;

/**
 * 健身设施
 * 
 * @author swy
 */
@Controller
@RequestMapping(value = "/front/venue/equipment/type")
public class FrontVenueEquipmentTypeController extends BaseController<VenueEquipmentTypeEntity, VenueEquipmentTypeService> {

	@Autowired
	private ImageService imageService;
	@Autowired
	private EnvProperties envProperties;

	@Override
	public String index(Model model) {
		return null;
	}
	
	/**
	 * 显示首页图
	 * 
	 * @param uuid
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/showImg")
	public void showImg(String uuid, HttpServletRequest request, HttpServletResponse response) {
		ImageEntity imageEntity = imageService.findOneByUuid(uuid);
		try {
			if (imageEntity != null && imageEntity.getSysFilePath() != null) {
				ImageUtils.imgToStream(imageEntity.getSysFilePath(), response);
			} else {
				ImageUtils.imgToStream(envProperties.getNoFile(), response);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}
	/**
	 * 查有图片的健身路径5条
	 * 
	 */
	@RequestMapping(value = "/searchWithPic")
	@ResponseBody
	public List<VenueEquipmentTypeEntity> searchWithPic(HttpServletRequest request, Model model)
			throws Exception {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_imgType", 480);
		searchParams.put("EQ_module", 2);
		searchParams.put("EQ_deleteFlag", 0);
		Map<String, Object> result = imageService.findByParamsMap(searchParams, new PageRequest(0, 5,new Sort(new Order(Direction.ASC, "equipmentId"))));
		List<ImageEntity> imageEntities = (List<ImageEntity>) result.get("rows");
		List<VenueEquipmentTypeEntity> list = new ArrayList<VenueEquipmentTypeEntity>();
		for (ImageEntity imageEntity : imageEntities) {
			VenueEquipmentTypeEntity entity = service.findOne(imageEntity.getEquipmentId());
			list.add(entity);
		}
		return list;
	}
}
