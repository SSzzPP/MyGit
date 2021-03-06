package com.yhlt.showcase.wallet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.utils.BlockChainUtil;
import com.yhlt.showcase.blockchain.model.dto.transaction.WalletTransactionDetail;
import com.yhlt.showcase.venue.entity.VenueUserEntity;
import com.yhlt.showcase.venue.service.VenueUserService;

@Controller
@RequestMapping(value = "/mobile/wallet")
public class WalletController {

	@Autowired
	private VenueUserService venueUserService;

	
	/**
	 * 显示用户交易记录
	 * 
	 * @return
	 */
	@RequestMapping(value = "/getWallet")
	@ResponseBody
	public Map<String, Object> getWallet() {
		Map<String, Object> result = new HashMap<String, Object>();
		VenueUserEntity venueUserEntity = venueUserService.findOne(LoginContextHolder.get().getUserId());
		result.put("publicAdd", venueUserEntity.getBlockChainAddress());
		result.put("qty", venueUserEntity.getBlockChainTotal());
		return result;
	}
	/**
	 * 显示用户交易记录
	 * 
	 * @return
	 */
	@RequestMapping(value = "/getBlockChainDeals")
	@ResponseBody
	public List<WalletTransactionDetail> getBlockChainDeals(
			@RequestParam(value = "page", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "rows", defaultValue = "10") Integer pageRows) {
		VenueUserEntity venueUserEntity = venueUserService.findOne(LoginContextHolder.get().getUserId());
		return BlockChainUtil.getDeals(venueUserEntity.getBlockChainAddress(), pageNum, pageRows);
	}

}
