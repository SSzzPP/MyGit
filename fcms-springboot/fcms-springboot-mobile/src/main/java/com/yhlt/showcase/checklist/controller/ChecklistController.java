package com.yhlt.showcase.checklist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.checklist.entity.ChecklistEntity;
import com.yhlt.showcase.checklist.service.ChecklistService;

/**
 * 检查单配置
 * 
 * @author admin
 * 
 */
@Controller
@RequestMapping(value = "/mobile/checklist")
public class ChecklistController extends BaseController<ChecklistEntity, ChecklistService> {

}
