package com.yhlt.showcase.front.controller.venue;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.properties.EnvProperties;
import com.yhlt.showcase.base.utils.ImageUtils;
import com.yhlt.showcase.base.utils.MD5Util;
import com.yhlt.showcase.base.utils.SensitiveWordsUtil;
import com.yhlt.showcase.subscribe.entity.NewsSubscribeEntity;
import com.yhlt.showcase.subscribe.service.NewsSubscribeService;
import com.yhlt.showcase.system.utils.FileUtil;
import com.yhlt.showcase.venue.entity.VenueUserEntity;
import com.yhlt.showcase.venue.entity.VenueUserLikeEntity;
import com.yhlt.showcase.venue.service.VenueUserLikeService;
import com.yhlt.showcase.venue.service.VenueUserService;

/**
 * 场馆人员
 * 
 * @author swy
 */
@Controller
@RequestMapping(value = "/front/venue/user")
public class FrontVenueUserController extends BaseController<VenueUserEntity, VenueUserService> {
	@Autowired
	private EnvProperties envProperties;
	@Autowired
	private NewsSubscribeService newsSubscribeService;

	@Autowired
	private VenueUserLikeService venueUserLikeService;

	@Override
	public String index(Model model) {
		return null;
	}

	@RequestMapping(value = "/toRegister")
	public String add(HttpServletRequest request, Model model) {
		return "front/register/register_info";
	}

	@RequestMapping(value = "/userHeadImg")
	public void userHeadImg(String uuid, HttpServletRequest request, HttpServletResponse response) {
		VenueUserEntity venueUserEntity = service.findOneByUuid(uuid);
		try {
			if (venueUserEntity != null && venueUserEntity.getImgUrl() != null) {
				ImageUtils.imgToStream(venueUserEntity.getImgUrl(), response);
			} else {
				ImageUtils.imgToStream(envProperties.getNoFile(), response);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	/**
	 * 用户注册
	 * 
	 * @param mobileCode
	 * @param msgCode
	 * @param passwordCode
	 * @param verifyCodeImgId
	 * @return
	 */
	@RequestMapping(value = "/saveRegister")
	@ResponseBody
	public Map<String, Object> saveRegister(VenueUserEntity venueUserEntity, HttpServletRequest request, HttpServletResponse response, String[] userLikes) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", false);
		try {
			// 手机号不能重复注册
			if (StringUtils.isNotBlank(venueUserEntity.getMobile())) {
				Map<String, Object> searchParams = new HashMap<>();
				searchParams.put("EQ_mobile", venueUserEntity.getMobile());
				VenueUserEntity venueUserEntityTemp = service.findOneByParams(searchParams);
				if (venueUserEntityTemp != null) {
					result.put("msg", "该手机号已经被使用！");
					return result;
				}
			}
			// 验证昵称是否有敏感词
			if (SensitiveWordsUtil.sensitiveFlag(venueUserEntity.getName())) {
				result.put("success", false);
				result.put("msg", "您的昵称不符合规范！");
				return result;
			}
			// 验证个性签名是否有敏感词
			if (SensitiveWordsUtil.sensitiveFlag(venueUserEntity.getExperience())) {
				result.put("success", false);
				result.put("msg", "您的个性签名内容不符合规范！");
				return result;
			}
			// 保存用户头像
			MultipartHttpServletRequest servletRequest = (MultipartHttpServletRequest) request;
			MultipartFile multipartFile = servletRequest.getFile("headImg");
			String fileName = multipartFile.getOriginalFilename();
			List<Object> list = FileUtil.getNewFile(fileName, "userInfofile", request);
			File file = (File) list.get(0);
			String sysPath = (String) list.get(1);
			multipartFile.transferTo(file);

			venueUserEntity.setImgUrl(sysPath);
			venueUserEntity.setPassword(MD5Util.MD5(venueUserEntity.getPassword()));
			venueUserEntity.setUuid(UUID.randomUUID().toString());
			venueUserEntity.setType(2L);
			venueUserEntity.setStatus(0L);
			Set<ConstraintViolation<VenueUserEntity>> constraintViolations = validator.getValidator().validate(venueUserEntity);
			// 如果大于0，说明有验证未通过信息
			if (constraintViolations.size() > 0) {
				result.put("success", false);
				result.put("msg", constraintViolations.iterator().next().getMessage());
				return result;
			}
			result = service.saveMap(venueUserEntity);
			// 注册同时订阅 体育赛事 法律法规
			NewsSubscribeEntity lawEntity = new NewsSubscribeEntity(venueUserEntity.getId(), 0, 1);
			NewsSubscribeEntity matchEntity = new NewsSubscribeEntity(venueUserEntity.getId(), 0, 0);
			newsSubscribeService.save(matchEntity);
			newsSubscribeService.save(lawEntity);
			// 区块链存交易
			/*
			 * if (blockChainProperties.getEnabled()) { String address =
			 * service.getAddress(entity.getId());
			 * BlockChainUtil.sendData(address, "user_point", 10, "register");
			 * service.upadateUserTotal(10L, entity.getId()); }
			 */
			// 存用户的兴趣爱好
			if (userLikes != null && userLikes.length > 0) {
				List<VenueUserLikeEntity> userLikeList = new ArrayList<>();
				for (String userLikeId : userLikes) {
					VenueUserLikeEntity userLikeEntity = new VenueUserLikeEntity();
					userLikeEntity.setVenueUserId(venueUserEntity.getId());
					userLikeEntity.setLikeId(Long.valueOf(userLikeId));
					userLikeList.add(userLikeEntity);
				}
				venueUserLikeService.save(userLikeList);
			}

			result.put("success", true);
			result.put("msg", "注册成功，请登录！");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}
}
