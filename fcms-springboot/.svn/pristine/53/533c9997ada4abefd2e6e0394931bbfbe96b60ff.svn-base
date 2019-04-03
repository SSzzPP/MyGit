package com.yhlt.showcase.complaint.controller;

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

import org.springframework.beans.BeanUtils;
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

import com.alibaba.fastjson.JSONObject;
import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.base.properties.BlockChainProperties;
import com.yhlt.showcase.base.security.LoginContextHolder;
import com.yhlt.showcase.base.util.DateUtil;
import com.yhlt.showcase.base.util.Servlets;
import com.yhlt.showcase.base.utils.BlockChainUtil;
import com.yhlt.showcase.complaint.entity.ComplaintImageEntity;
import com.yhlt.showcase.complaint.entity.ComplaintMainEntity;
import com.yhlt.showcase.complaint.service.ComplaintImageService;
import com.yhlt.showcase.complaint.service.ComplaintMainService;
import com.yhlt.showcase.message.entity.MessageImageEntity;
import com.yhlt.showcase.message.entity.MessageMainEntity;
import com.yhlt.showcase.message.entity.MessageUserCommentEntity;
import com.yhlt.showcase.message.service.MessageImageService;
import com.yhlt.showcase.message.service.MessageUserCommentService;
import com.yhlt.showcase.order.entity.OrderEntity;
import com.yhlt.showcase.order.service.OrderService;
import com.yhlt.showcase.system.utils.FileUtil;
import com.yhlt.showcase.venue.service.VenueUserService;

@Controller
@RequestMapping(value = "/mobile/complaint")
public class ComplaintMainController extends
		BaseController<ComplaintMainEntity, ComplaintMainService> {

	@Autowired
	private ComplaintImageService complaintImageService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private VenueUserService venueUserService;
	@Autowired
	private BlockChainProperties blockChainProperties;


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
	@RequestMapping(value = "/saveInfo")
	@ResponseBody
	public Map<String, Object> saveInfo(ComplaintMainEntity entity,String orderUuid, HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			OrderEntity orderEntity = orderService.findOneByUuid(orderUuid);
			if(orderEntity != null && orderEntity.getComplaintId() == null) {
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
				Set<ConstraintViolation<ComplaintMainEntity>> constraintViolations = validator
						.getValidator().validate(entity);
				// 如果大于0，说明有验证未通过信息
				if (constraintViolations.size() > 0) {
					result.put("success", false);
					result.put("msg", constraintViolations.iterator().next()
							.getMessage());
					return result;
				}
				entity.setType(0L);
				entity.setVenueId(orderEntity.getVenueId());
				entity.setDeleteFlag(0L);
				if (entity.getId() != null) {
					entity.setGmtModified(new Date());
					entity.setLastModifiedById(userId);
				} else {
					entity.setGmtCreate(new Date());
					entity.setCreateById(userId);
				}
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
						//保存图片表
						ComplaintImageEntity imageEntity = new ComplaintImageEntity();
						imageEntity.setComplaintId(entity.getId());
						imageEntity.setSysFilePath(sysPath);
						imageEntity.setSysFileName(file.getName().toLowerCase());
						imageEntity.setFileSize(multipartFile.getSize());
						imageEntity.setConvertFileSize(FileUtil.convertFileSize(multipartFile.getSize()));
						imageEntity.setUuid(UUID.randomUUID().toString());
						imageEntity.setDeleteFlag(0L);
						complaintImageService.save(imageEntity);
						result.put("success", true);
					}
				}
				orderEntity.setComplaintId(entity.getId());
				orderService.save(orderEntity);
				//区块链存场馆投诉
				if(blockChainProperties.getEnabled()) {
					String key = orderEntity.getVenueId().toString()+"."+entity.getId().toString();
					JSONObject dataobj = new JSONObject();
					dataobj.put("name", venueUserService.findOne(userId).getName());
					dataobj.put("time", DateUtil.formatDate2Str(new Date(), "yyyy-MM-dd HH:mm:ss"));
					dataobj.put("content", entity.getContent());
					BlockChainUtil.sendItem("VENUE_COMP", key, dataobj);
				}
			}else {
				result.put("success", false);
				result.put("msg", "您已经投诉过了!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
