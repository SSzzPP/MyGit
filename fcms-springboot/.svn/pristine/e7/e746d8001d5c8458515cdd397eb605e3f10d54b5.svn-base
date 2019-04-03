package com.yhlt.showcase.message.controller;

import java.io.File;
import java.util.Date;
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
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.properties.BlockChainProperties;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.base.utils.BlockChainUtil;
import com.yhlt.showcase.message.entity.MessageImageEntity;
import com.yhlt.showcase.message.entity.MessageMainEntity;
import com.yhlt.showcase.message.entity.MessageUserCommentEntity;
import com.yhlt.showcase.message.service.MessageImageService;
import com.yhlt.showcase.message.service.MessageMainService;
import com.yhlt.showcase.message.service.MessageUserCommentService;
import com.yhlt.showcase.system.utils.FileUtil;
import com.yhlt.showcase.venue.entity.VenueUserEntity;
import com.yhlt.showcase.venue.service.VenueUserService;

@Controller
@RequestMapping(value = "/mobile/message")
public class MessageMainController extends BaseController<MessageMainEntity, MessageMainService> {

	@Autowired
	private MessageImageService messageImageService;
	@Autowired
	private MessageUserCommentService messageUserCommentService;
	@Autowired
	private BlockChainProperties blockChainProperties;
	@Autowired
	private VenueUserService venueUserService;

	/**
	 * 我的动态列表
	 */
	@RequestMapping(value = "myList")
	@ResponseBody
	public Map<String, Object> myList(
			@RequestParam(value = "page", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "rows", defaultValue = "10") Integer pageRows,
			@RequestParam(value = "sort", defaultValue = "id") String sort,
			@RequestParam(value = "order", defaultValue = "asc") String order,
			HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_", true);
		searchParams.put("EQ_userId", LoginContextHolder.get().getUserId());
		// 排序字段 多个用List
		Order o = new Order("desc".equals(order)?Direction.DESC:Direction.ASC, sort);
		Map<String, Object> result = service.findByParamsMap(searchParams, new PageRequest(pageNum - 1, pageRows,new Sort(o)));
		return result;
	}

	/**
	 * 跳转到消息详情（默认用户阅读该消息）
	 * 
	 * @param model
	 * @param request
	 * @param airflightno
	 * @return
	 */
	@RequestMapping(value = "/toDetail")
	@ResponseBody
	public MessageMainEntity toDetail(Long messageId, Model model, HttpServletRequest request) {
		
		String sessionId = request.getHeader("sessionId");
		
		if (!"no_login".equals(sessionId)) {
			Long userId = LoginContextHolder.get().getUserId();
			// 保存阅读 type=1
			Map<String, Object> search = new HashMap<String, Object>();
			search.put("EQ_userId", userId);
			search.put("EQ_type", 1L);
			search.put("EQ_messageId", messageId);
			search.put("EQ_deleteFlag", 0L);
			MessageUserCommentEntity entity = new MessageUserCommentEntity();
			entity = messageUserCommentService.findOneByParams(search);
			if (entity == null) {
				MessageUserCommentEntity commentEntity = new MessageUserCommentEntity();
				commentEntity.setUserId(userId);
				commentEntity.setType(1L);
				commentEntity.setMessageId(messageId);
				commentEntity.setTime(new Date());
				commentEntity.setDeleteFlag(0L);
				messageUserCommentService.save(commentEntity);
			}
		}
		
		// 查询这一条信息
		MessageMainEntity messageMainEntity = service.findOne(messageId);
		
		return messageMainEntity;
	}

	/**
	 * 保存发送内容跟图片
	 * 
	 * @param entity
	 * @param mediaId
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/saveUserMessage")
	@ResponseBody
	public Map<String, Object> saveUserMessage(MessageMainEntity entity, Long itemId, HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> result = new HashMap<String, Object>();
		//JSON.toJSONString(request.getParameterNames())
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
						|| fileName.endsWith(".wav")|| fileName.endsWith(".jpeg") )) {
					result.put("errorMsg", "图片或视频格式不正确");// 只能上传jpg/png/bmp/gif/mp4/mov格式图片视频，
					return result;
				}
			}
			//保存文件
			Long userId = LoginContextHolder.get().getUserId();
//			Long userId = 1L;
			// 验证实体
			Set<ConstraintViolation<MessageMainEntity>> constraintViolations = validator
					.getValidator().validate(entity);
			// 如果大于0，说明有验证未通过信息
			if (constraintViolations.size() > 0) {
				result.put("success", false);
				result.put("msg", constraintViolations.iterator().next()
						.getMessage());
				return result;
			}
			entity.setUserId(userId);
			entity.setTime(new Date());
			// entity.setTimeWrapper(DateUtil.formatDate2Str(entity.getTime(),
			// "yyyy-MM-dd HH:mm:ss"));
			entity.setDeleteFlag(0L);
			entity.setType(itemId);
			result = service.saveMap(entity);
			// 取得request中的所有文件名
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				// 取得上传文件
				MultipartFile multipartFile = multiRequest.getFile(iter.next());
				if (multipartFile != null) {
					String fileName = multipartFile.getOriginalFilename();
					List<Object> list = FileUtil.getNewFile(fileName, "message", request);
					File file = (File) list.get(0);
					String sysPath = (String) list.get(1);
					// 保存附件
					multipartFile.transferTo(file);
					saveImage(userId, entity.getId(), sysPath);
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	/**
	 * 保存图片mediaId
	 * 
	 * @param mediaId
	 * @param userId
	 * @param messageId
	 */
	public void saveImage( Long userId, Long messageId, String filePath) {
		MessageImageEntity entity = new MessageImageEntity();
		entity.setMessageId(messageId);
		entity.setUserId(userId);
		entity.setImgUrl(filePath);
		entity.setUuid(UUID.randomUUID().toString());
		messageImageService.save(entity);
	}

	/**
	 * 点赞保存,送点赞者和楼主积分
	 * 
	 * @param messageId
	 * @return
	 */
	@RequestMapping(value = "/saveZan")
	@ResponseBody
	public Map<String, Object> saveZan(Long messageId) {
		Map<String, Object> search = new HashMap<String, Object>();
		search.put("EQ_messageId", messageId);
		search.put("EQ_userId", LoginContextHolder.get().getUserId());
		search.put("EQ_type", 2L);
		MessageUserCommentEntity message = messageUserCommentService
				.findOneByParams(search);
		Map<String, Object> result = new HashMap<String, Object>();
		if (message == null) {
			// 保存赞
			result = saveUserComment(messageId, 2L, null);
			// 点赞得积分(点赞者和楼主)
		} else {
			// 再次点赞不得积分
			message.setDeleteFlag(0L);
			result = messageUserCommentService.saveMap(message);
		}
		return result;
	}

	/**
	 * 保存评论，送评论者和楼主积分
	 * 
	 * @param messageId
	 * @param t
	 * @return
	 */
	@RequestMapping(value = "/saveComment")
	@ResponseBody
	public Map<String, Object> saveComment(Long messageId, String comment) {
		Map<String, Object> result = new HashMap<String, Object>();
		// 保存评论
		result = saveUserComment(messageId, 3L, comment);
		// 区块链存交易
		if (blockChainProperties.getEnabled()) {
			VenueUserEntity venueUserEntity = venueUserService.findOne(LoginContextHolder.get().getUserId());
			String address = venueUserService.getAddress(venueUserEntity.getId());
			BlockChainUtil.sendData(address, "user_point", 10, "comment");
			venueUserService.upadateUserTotal(venueUserEntity.getBlockChainTotal()+10L, venueUserEntity.getId());
		}
		return result;
	}

	// 保存赞或者评论
	public Map<String, Object> saveUserComment(Long messageId, Long type,
			String content) {
		MessageUserCommentEntity entity = new MessageUserCommentEntity();
		entity.setUserId(LoginContextHolder.get().getUserId());
		entity.setType(type);
		entity.setTime(new Date());
		entity.setMessageId(messageId);
		entity.setDeleteFlag(0L);
		entity.setContent(content);
		return messageUserCommentService.saveMap(entity);
	}

	/**
	 * 用户取消赞
	 * 
	 * @param messageId
	 * @return
	 */
	@RequestMapping(value = "/deleteZan")
	@ResponseBody
	public Map<String, Object> detailZan(Long messageId) {
		Map<String, Object> search = new HashMap<String, Object>();
		search.put("EQ_messageId", messageId);
		search.put("EQ_userId", LoginContextHolder.get().getUserId());
		search.put("EQ_type", 2L);
		MessageUserCommentEntity entity = messageUserCommentService
				.findOneByParams(search);
		entity.setDeleteFlag(1L);
		messageUserCommentService.save(entity);
		return null;
	}

	/**
	 * 查询 点赞跟评论
	 * 
	 * @param pageNum
	 * @param pageRows
	 * @param sort
	 * @param order
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/zanAndComment")
	@ResponseBody
	public Map<String, Object> zanAndComment(
			@RequestParam(value = "page", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "rows", defaultValue = "10") Integer pageRows,
			@RequestParam(value = "sort", defaultValue = "id") String sort,
			@RequestParam(value = "order", defaultValue = "asc") String order,
			HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_", true);
		Order o = new Order("desc".equals(order) ? Direction.DESC
				: Direction.ASC, sort);
		Map<String, Object> result = messageUserCommentService.findByParamsMap(
				searchParams, new PageRequest(pageNum - 1, pageRows,
						new Sort(o)));
		return result;
	}

	/**
	 * 
	 * @param url
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/imgShow")
	public void imgShow(String url, HttpServletRequest request,
			HttpServletResponse response) {
		if (url != null && url != "") {
			messageImageService.coverImgCallBack(url, response);
		}
	}

	/**
	 * 修改为用户已删除
	 * 
	 * @param id
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deteleMessage")
	@ResponseBody
	public Map<String, Object> deteleMessage(Long messageId, Model model,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		MessageMainEntity entity = service.findOne(messageId);
		entity.setDeleteFlag(1L);
		return save(entity, model, request, response);
	}
}
