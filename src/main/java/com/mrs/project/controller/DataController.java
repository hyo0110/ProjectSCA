package com.mrs.project.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class DataController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	

	@RequestMapping(value = "/result", method = RequestMethod.GET)
	public String result(Model model) {
		logger.info("결과");
		
		return "main/main_what_result";
	}
	
}
