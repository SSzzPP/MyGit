package com.yhlt.showcase.chat.service;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.base.utils.ImageUtils;
import com.yhlt.showcase.chat.dao.ChatMessageDao;
import com.yhlt.showcase.chat.entity.ChatMessageEntity;

/**
 * 聊天message
 * 
 * @author lnn
 * @date 2018年6月19日14:37:38
 */
@Component
@Transactional
@DataPermission
public class ChatMessageService extends BaseService<ChatMessageEntity, ChatMessageDao> {
	
	public void chatImgCallBack(String coverImgPath, HttpServletResponse response) {
		try {
			ImageUtils.imgToStream(coverImgPath, response);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	/**
	 * 音频文件转换为Base64格式
	 * @param coverImgPath
	 * @param response
	 * @return
	 */
	public String soundToBase64(String soundPath) {
		try {
			return ImageUtils.imgToBase64(soundPath);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
}
