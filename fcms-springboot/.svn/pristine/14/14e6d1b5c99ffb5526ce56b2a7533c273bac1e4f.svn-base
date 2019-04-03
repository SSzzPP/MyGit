package com.yhlt.showcase.front.controller.venue;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.properties.BlockChainProperties;
import com.yhlt.showcase.base.utils.BlockChainUtil;
import com.yhlt.showcase.blockchain.model.dto.datamod.DataModItem;
import com.yhlt.showcase.venue.entity.VenueVealuateEntity;
import com.yhlt.showcase.venue.service.VenueVealuateService;
/**
* 评价
* 
* @author swy
* */
@Controller
@RequestMapping(value = "/front/venue/vealuate")
public class FrontVenueVealuateController extends BaseController<VenueVealuateEntity, VenueVealuateService>{
	@Autowired
	private BlockChainProperties blockChainProperties;
	
	@Override
	public String index(Model model) {
		return "venue/vealuate/venue_vealuate_index";
	}
	
	@RequestMapping("/showBlochChainDataMod")
	@ResponseBody
	public Map<String,Object> showBlochChainDataMod(Long venueId,Long vealuateId){
		Map<String,Object> result = new HashMap<String,Object>();
		if(blockChainProperties.getEnabled()) {
			String key = venueId.toString()+"."+vealuateId.toString();
			DataModItem dataModItem = BlockChainUtil.getLastestDataItemByKey("VENUE_VEAL", key);
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
