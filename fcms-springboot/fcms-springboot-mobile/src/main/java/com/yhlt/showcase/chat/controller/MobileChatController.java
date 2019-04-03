package com.yhlt.showcase.chat.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.chat.dto.ChatMessageListDto;
import com.yhlt.showcase.chat.entity.ChatMessageEntity;
import com.yhlt.showcase.chat.entity.VChatMessageEntity;
import com.yhlt.showcase.chat.service.ChatMessageService;
import com.yhlt.showcase.chat.service.VChatMessageService;
import com.yhlt.showcase.system.utils.FileUtil;
import com.yhlt.showcase.venue.entity.VenueUserEntity;
import com.yhlt.showcase.venue.service.VenueUserService;

/**
 * 聊天
 * 
 * @author lnn
 * 
 */
@Controller
@RequestMapping(value = "/mobile/chatmessage")
public class MobileChatController extends BaseController<ChatMessageEntity, ChatMessageService> {
	@Autowired
	private VenueUserService venueUserService;
	@Autowired
	private VChatMessageService vChatMessageService;

	/**
	 * 展示聊天列表
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/searchMessageList")
	@ResponseBody
	public List<ChatMessageListDto> searchMessageList(HttpServletRequest request, Model model) throws Exception {
		List<ChatMessageListDto> chatMessageListDtos = new ArrayList<ChatMessageListDto>();
		if (LoginContextHolder.get() == null) {
			return chatMessageListDtos;
		}
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_userId", LoginContextHolder.get().getUserId());
		List<VChatMessageEntity> chatMessageEntities = vChatMessageService.findByParams(searchParams);
		Map<Long, ChatMessageListDto> messageMap = new HashMap<Long, ChatMessageListDto>();
		for (VChatMessageEntity chatMessageEntity : chatMessageEntities) {
			String content = chatMessageEntity.getContent();
			if ("image".equals(chatMessageEntity.getType())) {
				content = "[图片]";
			} else if ("sound".equals(chatMessageEntity.getType())) {
				content = "[语音]";
			}
			Long targetUserId = chatMessageEntity.getTargetUserId();
			ChatMessageListDto chatMessageListDto = new ChatMessageListDto(chatMessageEntity.getUserId(), targetUserId, "", chatMessageEntity.getTargetUserName(), content, chatMessageEntity.getGmtCreate());
			if (!messageMap.containsKey(targetUserId)) {
				messageMap.put(targetUserId, chatMessageListDto);
			}
			
//			if (!chatMessageEntity.getRecvUserId().equals(LoginContextHolder.get().getUserId()))
//				messageList.put(chatMessageEntity.getRecvUserId(), chatMessageListDto);
		}
		
		for (ChatMessageListDto item : messageMap.values()) {
			chatMessageListDtos.add(item);
		}
		return chatMessageListDtos;
	}

	/**
	 * 查询聊天内容
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/searchMessageContent")
	@ResponseBody
	public Map<String, Object> searchMessageContent(Long recvUserId, HttpServletRequest request, Model model)
			throws Exception {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put("EQ_sendUserId_1", LoginContextHolder.get().getUserId());
		searchParams.put("EQ_recvUserId_1", recvUserId);

		searchParams.put("EQ_sendUserId_2", recvUserId);
		searchParams.put("EQ_recvUserId_2", LoginContextHolder.get().getUserId());
		Order o = new Order(Direction.ASC, "gmtCreate");
		List<ChatMessageEntity> chatMessageEntities = service.findByParams(searchParams, new Sort(o));
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		result.put("chatMessageEntities", chatMessageEntities);
		result.put("lastTime", chatMessageEntities.get(chatMessageEntities.size() - 1).getGmtCreate().getTime());
		return result;
	}

	/**
	 * 发送聊天内容
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sendMessageContent")
	@ResponseBody
	public boolean sendMessageContent(String content, Long recvUserId, HttpServletRequest request, Model model)
			throws Exception {
		ChatMessageEntity chatMessageEntity = new ChatMessageEntity();
		chatMessageEntity.setUuid(UUID.randomUUID().toString());
		chatMessageEntity.setSendUserId(LoginContextHolder.get().getUserId());
		chatMessageEntity.setRecvUserId(recvUserId);
		chatMessageEntity.setType("text");
		chatMessageEntity.setContent(content);
		chatMessageEntity = service.save(chatMessageEntity);
		/*
		 * try { String result = CommandUtil.exec("senditemfrom",
		 * "1Mrb66exvDw7u28AknsyMDg234874aNS6y", "message", chatMessageEntity.getId() +
		 * "", HexUtil.encode(JSON.toJSONString(chatMessageEntity).getBytes("UTF-8")));
		 * System.out.println(result); } catch (Exception e) { e.printStackTrace(); }
		 */
		return true;
	}

	/**
	 * 附件上传：保存到session
	 * 
	 * @param t
	 * @return
	 */
	@RequestMapping(value = "/uploadFile")
	@ResponseBody
	public Map<String, Object> uploadFile(Long recvUserId, HttpServletRequest request) {
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
						|| fileName.endsWith(".wav") || fileName.endsWith(".amr"))) {
					result.put("errorMsg", "图片或视频格式不正确");// 只能上传jpg/png/bmp/gif/mp4/mov格式图片视频，
					return result;
				}
			}
			List<ChatMessageEntity> chatMessageEntities = new ArrayList<ChatMessageEntity>();
			// 取得request中的所有文件名
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				// 取得上传文件
				MultipartFile multipartFile = multiRequest.getFile(iter.next());
				if (multipartFile != null) {
					String fileName = multipartFile.getOriginalFilename();
					List<Object> list = FileUtil.getNewFile(fileName, "chatmessagefile", request);
					File file = (File) list.get(0);
					String sysPath = (String) list.get(1);
					// 保存附件
					multipartFile.transferTo(file);

					// 保存文件信息
					ChatMessageEntity chatMessageEntity = new ChatMessageEntity();
					chatMessageEntity.setUuid(UUID.randomUUID().toString());
					chatMessageEntity.setSendUserId(LoginContextHolder.get().getUserId());
					chatMessageEntity.setRecvUserId(recvUserId);
					if (sysPath.toString().endsWith(".wav")) {
						chatMessageEntity.setType("sound");
					} else {
						chatMessageEntity.setType("image");
					}
					chatMessageEntity.setContent(sysPath.toString());
					service.save(chatMessageEntity);
					chatMessageEntities.add(chatMessageEntity);
				}
			}
			result.put("files", chatMessageEntities);
		} catch (Exception e) {
			throw new RuntimeException();
		}
		result.put("success", true);
		return result;
	}

	@RequestMapping(value = "/showImage")
	public void showImageByUuid(String uuid, HttpServletRequest request, HttpServletResponse response) {
		ChatMessageEntity chatMessageEntity = service.findOneByUuid(uuid);
		service.chatImgCallBack(chatMessageEntity.getContent(), response);
	}

	@RequestMapping(value = "/showHeadImage")
	public void showHeadImage(Long id, HttpServletRequest request, HttpServletResponse response) {
		VenueUserEntity venueUserEntity = venueUserService.findOne(id);
		service.chatImgCallBack(venueUserEntity.getImgUrl(), response);
	}
	@RequestMapping(value = "/showContentImage")
	public void showContentImage(String content, HttpServletRequest request, HttpServletResponse response) {
		service.chatImgCallBack(content, response);
	}
	
	/**
	 * 音频文件播放，返回Base64字符串
	 * @param uuid
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/soundPlayByUuid")
	@ResponseBody
	public Map<String, Object> soundPlayByUuid(String uuid, HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", false);
		ChatMessageEntity chatMessageEntity = service.findOneByUuid(uuid);
		String soundBase64 = service.soundToBase64(chatMessageEntity.getContent());
		if (StringUtils.isNotBlank(soundBase64)) {
			result.put("success", true);
			result.put("data", soundBase64);
		}
		return result;
	}
	
}
