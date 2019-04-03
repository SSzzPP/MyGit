package com.yhlt.showcase.complaint.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.properties.BlockChainProperties;
import com.yhlt.showcase.base.utils.BlockChainUtil;
import com.yhlt.showcase.base.utils.ImageUtils;
import com.yhlt.showcase.blockchain.model.dto.datamod.DataModItem;
import com.yhlt.showcase.complaint.entity.ComplaintImageEntity;
import com.yhlt.showcase.complaint.entity.ComplaintMainEntity;
import com.yhlt.showcase.complaint.service.ComplaintImageService;
import com.yhlt.showcase.complaint.service.ComplaintMainService;

/**
 * 投诉
 * 
 * @authorlinannan
 * 
 */
@Controller
@RequestMapping(value = "/admin/complaint/info")
public class ComplaintController extends BaseController<ComplaintMainEntity, ComplaintMainService> {
	@Autowired
	private ComplaintImageService complaintImageServicce;
	@Autowired
	private BlockChainProperties blockChainProperties;
	@Override
	public String index(Model model) {
		return "";
	}
	@RequestMapping("/showCompImgs")
	public void showCompImgs(String uuid, HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("EQ_uuid", uuid);
		ComplaintImageEntity complaintImageEntity=complaintImageServicce.findOneByParams(map);
		ImageUtils.imgToStream(complaintImageEntity.getSysFilePath(), response);
	}
	@RequestMapping("/showBlochChainDataMod")
	@ResponseBody
	public Map<String,Object> showBlochChainDataMod(Long venueId,Long complaintId){
		Map<String,Object> result = new HashMap<String,Object>();
		if(blockChainProperties.getEnabled()) {
			String key = venueId.toString()+"."+complaintId.toString();
			DataModItem dataModItem = BlockChainUtil.getLastestDataItemByKey("VENUE_COMP", key);
			if(dataModItem==null) {
				result.put("success", false);
			}else {
				result.put("success", true);
			}
			result.put("dataModItem",dataModItem);
		}else {
			result.put("success", false);
		}
		return result;
	}
}
