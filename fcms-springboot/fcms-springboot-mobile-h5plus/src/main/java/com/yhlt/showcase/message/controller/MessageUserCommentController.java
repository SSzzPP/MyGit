package com.yhlt.showcase.message.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.message.entity.MessageUserCommentEntity;
import com.yhlt.showcase.message.service.MessageUserCommentService;

@Controller
@RequestMapping(value = "/mobile/message/user/comment")
public class MessageUserCommentController extends
		BaseController<MessageUserCommentEntity, MessageUserCommentService> {

	/**
	 * 查询该用户是否赞过这条消息
	 * 
	 * @param messageId
	 * @return
	 */
	@RequestMapping(value = "/userZan")
	@ResponseBody
	public Map<String, Object> userZan(Long messageId) {
		Map<String, Object> search = new HashMap<String, Object>();
		search.put("EQ_messageId", messageId);
		search.put("EQ_userId", LoginContextHolder.get().getUserId());
		search.put("EQ_type", 2L);
		search.put("EQ_deleteFlag", 0L);
		MessageUserCommentEntity entity = service.findOneByParams(search);
		Map<String, Object> result = new HashMap<String, Object>();
		if (entity != null) {
			result.put("success", true);
		} else {
			result.put("success", false);
		}
		return result;
	}
}
