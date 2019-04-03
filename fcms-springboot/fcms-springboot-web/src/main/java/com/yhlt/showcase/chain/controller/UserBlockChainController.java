package com.yhlt.showcase.chain.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.utils.BlockChainUtil;
import com.yhlt.showcase.blockchain.model.dto.transaction.WalletTransactionDetail;
import com.yhlt.showcase.venue.entity.VenueUserEntity;
import com.yhlt.showcase.venue.service.VenueUserService;

/**
 * 区块链数据展示
 * 
 * @author linannan
 */
@Controller
@RequestMapping(value = "/admin/user/blockChain")
public class UserBlockChainController extends BaseController<VenueUserEntity, VenueUserService> {

	@Override
	public String index(Model model) {
		return "blockChain/user_chain_index";
	}

	@RequestMapping(value = "/toDetail")
	public String toDetail(String uuid, HttpServletRequest request, Model model) {
		request.setAttribute("uuid", uuid);
		VenueUserEntity venueUserEntity = service.findOneByUuid(uuid);
		List<WalletTransactionDetail> list = BlockChainUtil.getDeals(venueUserEntity.getBlockChainAddress(), 1, 10);
		for (WalletTransactionDetail detail : list) {
			System.out.println(detail.getTxid());
			System.out.println(detail.getData());
		}
		return "blockChain/user_chain_detail";
	}

}
