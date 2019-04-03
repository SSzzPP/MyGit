package com.yhlt.showcase.venue.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.properties.BlockChainProperties;
import com.yhlt.showcase.base.properties.EnvProperties;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.utils.BlockChainUtil;
import com.yhlt.showcase.base.utils.DateUtil;
import com.yhlt.showcase.base.utils.ImageUtils;
import com.yhlt.showcase.base.utils.MD5Util;
import com.yhlt.showcase.base.utils.RedisUtil;
import com.yhlt.showcase.subscribe.entity.NewsSubscribeEntity;
import com.yhlt.showcase.subscribe.service.NewsSubscribeService;
import com.yhlt.showcase.system.utils.FileUtil;
import com.yhlt.showcase.venue.entity.VenueUserEntity;
import com.yhlt.showcase.venue.entity.VenueUserLikeEntity;
import com.yhlt.showcase.venue.service.VenueUserLikeService;
import com.yhlt.showcase.venue.service.VenueUserService;

@Controller
@RequestMapping(value = "/mobile/venue/user")
public class VenueUserController extends BaseController<VenueUserEntity, VenueUserService> {

	@Autowired
	private EnvProperties envProperties;
	@Autowired
	private VenueUserLikeService venueUserLikeService;
	@Autowired
	private BlockChainProperties blockChainProperties;
	@Autowired
	private NewsSubscribeService newsSubscribeService;
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
	public Map<String, Object> saveRegister(String mobileCode, String msgCode, String passwordCode,
			String verifyCodeImgId) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", false);
		try {
			Map<String, Object> searchParams = new HashMap<>();
			searchParams.put("EQ_loginName", mobileCode);
			VenueUserEntity venueUserEntity = service.findOneByParams(searchParams);
			if (venueUserEntity != null) {
				result.put("msg", "该手机号已经注册过了");
				return result;
			}

			String code = RedisUtil.get(verifyCodeImgId);
			if (!msgCode.equalsIgnoreCase(code)) {
				result.put("msg", "验证码错误");
				return result;
			}

			VenueUserEntity entity = new VenueUserEntity();
			entity.setLoginName(mobileCode);
			entity.setName(mobileCode);
			entity.setMobile(mobileCode);
			entity.setPassword(MD5Util.MD5(passwordCode));
			entity.setUuid(UUID.randomUUID().toString());
			entity.setType(2L);
			entity.setSex(0);

			Set<ConstraintViolation<VenueUserEntity>> constraintViolations = validator.getValidator().validate(entity);
			// 如果大于0，说明有验证未通过信息
			if (constraintViolations.size() > 0) {
				result.put("success", false);
				result.put("msg", constraintViolations.iterator().next().getMessage());
				return result;
			}
			//注册同时订阅 体育赛事 法律法规
			VenueUserEntity userEntity =service.save(entity);
			NewsSubscribeEntity lawEntity = new NewsSubscribeEntity(userEntity.getId(),0,1);
			NewsSubscribeEntity matchEntity = new NewsSubscribeEntity(userEntity.getId(),0,0);
			newsSubscribeService.save(matchEntity);
			newsSubscribeService.save(lawEntity);
			// 区块链存交易
			if (blockChainProperties.getEnabled()) {
				String address = service.getAddress(entity.getId());
				BlockChainUtil.sendData(address, "user_point", 10, "register");
				service.upadateUserTotal(10L, entity.getId());
			}
			result.put("success", true);
			result.put("msg", "注册成功");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}

	/**
	 * 显示头像
	 * 
	 * @param uuid
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/userHeadImg")
	public void userHeadImg(String uuid, HttpServletRequest request, HttpServletResponse response) {
		VenueUserEntity venueUserEntity = service.findOneByUuid(uuid);

		try {
			if (venueUserEntity.getImgUrl() != null) {
				ImageUtils.imgToStream(venueUserEntity.getImgUrl(), response);
			} else {
				ImageUtils.imgToStream(envProperties.getNoUserImg(), response);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	/**
	 * 用户信息显示
	 * 
	 * @param uuid
	 * @return
	 */
	@RequestMapping(value = "/userInfo")
	@ResponseBody
	public Map<String, Object> userInfo(String uuid) {
		Map<String, Object> result = new HashMap<>();
		result.put("success", false);

		VenueUserEntity entity = service.findOneByUuid(uuid);
		if (entity != null) {
			result.put("success", true);
			result.put("obj", entity);
		}
		return result;
	}

	/**
	 * 修改用户信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "/saveUserInfo")
	@ResponseBody
	public Map<String, Object> saveUserInfo(String uuid, String name, Integer sex, String mobile, String email,
			String birthday, String experience) {
		Map<String, Object> result = new HashMap<>();
		result.put("success", false);

		VenueUserEntity entity = service.findOneByUuid(uuid);

		if (!entity.getMobile().equals(mobile)) {
			Map<String, Object> searchParams = new HashMap<>();
			searchParams.put("EQ_loginName", mobile);
			searchParams.put("EQ_mobile", mobile);
			VenueUserEntity venueUserEntity = service.findOneByParams(searchParams);
			if (venueUserEntity != null) {
				result.put("msg", "该手机号已经被使用");
				return result;
			}
			entity.setMobile(mobile);
			entity.setLoginName(mobile);
		}

		entity.setName(name);
		entity.setSex(sex);
		entity.setBirthday(DateUtil.parseDate(birthday));
		entity.setEmail(email);
		entity.setExperience(experience);
		entity.setUndisturb(0);
		Set<ConstraintViolation<VenueUserEntity>> constraintViolations = validator.getValidator().validate(entity);
		// 如果大于0，说明有验证未通过信息
		if (constraintViolations.size() > 0) {
			result.put("success", false);
			result.put("msg", constraintViolations.iterator().next().getMessage());
			return result;
		}

		result = service.saveMap(entity);
		result.put("msg", "保存成功");
		return result;
	}

	/**
	 * 修改头像
	 * 
	 * @param imgUrl
	 * @param uuid
	 * @return
	 */
	@RequestMapping(value = "/saveImgUrl")
	@ResponseBody
	public Map<String, Object> saveImgUrl(String uuid, HttpServletRequest request) {
		VenueUserEntity entity = service.findOneByUuid(uuid);

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", false);
		try {
			// 转换成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;

			// 判断指定格式
			Iterator<String> suffixIter = multiRequest.getFileNames();
			while (suffixIter.hasNext()) {
				// 取得上传文件
				MultipartFile multipartFile = multiRequest.getFile(suffixIter.next());
				String fileName = multipartFile.getOriginalFilename().toLowerCase();
				if (!(fileName.endsWith(".jpg") || fileName.endsWith(".gif") || fileName.endsWith(".bmp")
						|| fileName.endsWith(".png") || fileName.endsWith(".mp4") || fileName.endsWith(".mov")
						|| fileName.endsWith(".wav"))) {
					result.put("errorMsg", "图片或视频格式不正确");// 只能上传jpg/png/bmp/gif/mp4/mov格式图片视频，
					return result;
				}
			}
			// 取得request中的所有文件名
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				// 取得上传文件
				MultipartFile multipartFile = multiRequest.getFile(iter.next());
				if (multipartFile != null) {
					String fileName = multipartFile.getOriginalFilename();
					List<Object> list = FileUtil.getNewFile(fileName, "userInfofile", request);
					File file = (File) list.get(0);
					String sysPath = (String) list.get(1);
					// 保存附件
					multipartFile.transferTo(file);

					entity.setImgUrl(sysPath);
					result = service.saveMap(entity);
					return result;

				}
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		result.put("success", true);
		return result;

	}

	/**
	 * 保存用户的运动爱好
	 * 
	 * @param request
	 * @param userLikes
	 * @return
	 */
	@RequestMapping(value = "/saveLike")
	@ResponseBody
	public Map<String, Object> saveLike(HttpServletRequest request, String userLikes) {
		Map<String, Object> result = new HashMap<>();
		result.put("success", false);
		String[] arr = userLikes.split(",");

		Map<String, Object> searchParams = new HashMap<>();
		searchParams.put("EQ_venueUserId", LoginContextHolder.get().getUserId());
		List<VenueUserLikeEntity> list = venueUserLikeService.findByParams(searchParams);
		List<VenueUserLikeEntity> listLike = new ArrayList<>();
		if (list.size() != 0) {
			venueUserLikeService.delete(list);
		}
		for (String l : arr) {
			VenueUserLikeEntity entity = new VenueUserLikeEntity();
			entity.setVenueUserId(LoginContextHolder.get().getUserId());
			entity.setLikeId(Long.valueOf(l));
			listLike.add(entity);
		}
		result = venueUserLikeService.save(listLike);
		return result;
	}

	/**
	 * 显示用户的运动爱好标签
	 * 
	 * @return
	 */
	@RequestMapping(value = "/likeList")
	@ResponseBody
	public List<VenueUserLikeEntity> likeList() {
		Map<String, Object> searchParams = new HashMap<>();
		searchParams.put("EQ_venueUserId", LoginContextHolder.get().getUserId());
		List<VenueUserLikeEntity> list = venueUserLikeService.findByParams(searchParams);
		return list;
	}
	
	/**
	 * 当前登录用户详细信息
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/loginUserDetail")
	@ResponseBody
	public Map<String, Object> detail(Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Long id = LoginContextHolder.get().getUserId();
		VenueUserEntity userEntity = service.findOne(id);
		Map<String, Object> result = new HashMap<>();
		result.put("obj", userEntity);
		if (userEntity == null)
			result.put("success", false);
		else
			result.put("success", true);
		return result;
	}

	/**
	 * 修改免打扰
	 * 
	 * @param undisturb
	 * @param userId
	 * @return
	 */
	@RequestMapping("/updateUndisturb")
	@ResponseBody
	public Map<String, Object> updateUndisturb(Integer undisturb, long userId) {
		boolean upadteSuccess = service.updateUndisturb(undisturb, userId) > 0;
		Map<String, Object> result = new HashMap<>();
		result.put("success", upadteSuccess);
		return result;
	}

}
