package com.mrs.project.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Model model) {
		logger.info("멤버");
		
		return "member/index_join";
	}
	
}
