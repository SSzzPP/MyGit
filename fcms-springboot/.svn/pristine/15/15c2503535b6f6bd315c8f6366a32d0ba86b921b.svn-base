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
import com.yhlt.showcase.base.utils.ImageUtils;
import com.yhlt.showcase.venue.entity.VenueInfoEntity;
import com.yhlt.showcase.venue.service.VenueInfoService;

/**
 * 场馆管理
 * 
 * @authorlinannan
 * 
 */
@Controller
@RequestMapping(value = "/front/venue/info")
public class FrontVenueInfoController extends BaseController<VenueInfoEntity, VenueInfoService> {

	@Autowired
	private ImageService imageService;

	@Override
	public String index(Model model) {
		return null;
	}
	
	/**
	 * 图片显示
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/venueImg")
	public void venueImg(String uuid, HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("EQ_uuid", uuid);
		ImageEntity imageEntity = imageService.findOneByParams(map);
		ImageUtils.imgToStream(imageEntity.getSysFilePath(), response);
	}
	/**
	 * 查有图片的场馆5条
	 * 
	 */
	@RequestMapping(value = "/searchWithPic")
	@ResponseBody
	public List<VenueInfoEntity> searchWithPic(HttpServletRequest request, Model model)
			throws Exception {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_imgType", 480);
		searchParams.put("EQ_module", 1);
		searchParams.put("EQ_deleteFlag", 0);
		Map<String, Object> result = imageService.findByParamsMap(searchParams, new PageRequest(0, 5,new Sort(new Order(Direction.ASC, "venueId"))));
		List<ImageEntity> imageEntities = (List<ImageEntity>) result.get("rows");
		List<VenueInfoEntity> list = new ArrayList<VenueInfoEntity>();
		for (ImageEntity imageEntity : imageEntities) {
			VenueInfoEntity entity = service.findOne(imageEntity.getVenueId());
			list.add(entity);
		}
		return list;
	}
}
