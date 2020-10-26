package com.mrs.project.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class BoardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {
		logger.info("보드");
		
		return "board/board_list";
	}
	
}
