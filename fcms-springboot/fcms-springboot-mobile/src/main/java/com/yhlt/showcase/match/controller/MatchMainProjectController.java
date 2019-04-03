package com.yhlt.showcase.match.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.match.entity.MatchMainProjectEntity;
import com.yhlt.showcase.match.service.MatchMainProjectService;

@Controller
@RequestMapping(value = "/match/main/project")
public class MatchMainProjectController extends BaseController<MatchMainProjectEntity, MatchMainProjectService>{

}
