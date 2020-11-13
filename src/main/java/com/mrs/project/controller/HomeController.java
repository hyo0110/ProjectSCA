package com.mrs.project.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("서비스 시작");
		
		return "index";
	}
	
	@RequestMapping(value = "/nav", method = RequestMethod.GET)
	public String nav(Model model) {
		logger.info("네비바 요청");
		
		return "navi";
	}
	
	@RequestMapping(value = "/service_explain", method = RequestMethod.GET)
	public String service_explain(Model model) {
		//logger.info("네비바 요청");
		
		return "service_explain";
	}
	
	@RequestMapping(value = "/footer", method = RequestMethod.GET)
	public String footer(Model model) {
		//logger.info("네비바 요청");
		
		return "footer";
	}
}
