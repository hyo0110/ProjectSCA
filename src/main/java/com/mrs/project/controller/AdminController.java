package com.mrs.project.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class AdminController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model) {
		logger.info("관리자");
		
		return "admin/admin_board";
	}
	
}
