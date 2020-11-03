package com.mrs.project.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class DataController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	//메인 들어가기
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model) {
		logger.info("메인으로");
		
		return "main";
	}
	
	
	//무엇을 들어가기
	@RequestMapping(value = "/what", method = RequestMethod.GET)
	public String what(Model model) {
		logger.info("무엇으로");		
		return "main/main_what";
	}
	
	// 무엇을 결과화면
	@RequestMapping(value = "/whatresult", method = RequestMethod.GET)
	public ModelAndView whatresult(Model model, @RequestParam String region) {
		logger.info("무엇을 결과 "+region);
		ModelAndView mav = new ModelAndView();			
		mav.addObject("region", region);
		mav.setViewName("main/main_what_result");		
		return mav;
	}
	
	//어디로 들어가기
	@RequestMapping(value = "/where", method = RequestMethod.GET)
	public String where(Model model) {
		logger.info("어디로");		
		return "main/main_where";
	}
	
}
