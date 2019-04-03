package com.yhlt.showcase.venue.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhlt.showcase.base.controller.BaseController;
import com.yhlt.showcase.venue.entity.VenueCerificateEntity;
import com.yhlt.showcase.venue.service.VenueCerificateService;

@Controller
@RequestMapping(value = "/mobile/venue/cerificate")
public class VenueCerificateController extends BaseController<VenueCerificateEntity, VenueCerificateService>{

}
