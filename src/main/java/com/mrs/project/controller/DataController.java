package com.mrs.project.controller;

import java.util.HashMap;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.Rserve.RConnection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mrs.project.dto.DataDTO;
import com.mrs.project.service.DataService;


@Controller
public class DataController {
	@Autowired DataService service;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	//메인 들어가기
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model) {
		logger.info("메인으로");
		
		return "main";
	}
	
	//----------------------------------------무엇을-----------------------------------------------------
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
		DataDTO data = service.what_result(region);
		ModelAndView mav = new ModelAndView();			
		mav.addObject("region", region);
		mav.addObject("data", data);
		mav.setViewName("main/main_what_result");		
		return mav;
	}
	
	// 무엇을 뉴스리스트
	@RequestMapping(value = "/newslist", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> newslist(@RequestParam HashMap<String, String> param) {		
		logger.info("뉴스리스트: "+ param.get("region"));
		String region = param.get("region");		
		return service.newslist(region);
	}
	
	//무엇을 반기별 업종분표 불러오기
	@RequestMapping(value = "/openbiz", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> openbiz(@RequestParam HashMap<String, String> param) {		
		logger.info("영업중인 : "+ param.get("region") +", "+ param.get("reg_date"));
		String region = param.get("region");
		String reg_date = param.get("reg_date");
		return service.openbiz(region,reg_date);
	}
	//--------------------------------------- 어디에서 --------------------------------------------------
	//어디에서 들어가기
	@RequestMapping(value = "/where", method = RequestMethod.GET)
	public String where(Model model) {
		logger.info("어디에서");
		
		return "main/main_where";
	}
	
	@RequestMapping(value = "/whereresult", method = RequestMethod.GET)
	public ModelAndView whereresult(ModelAndView model, @RequestParam HashMap<String, String> param) throws Exception {
		ModelAndView mav = new ModelAndView();	
		logger.info("어디로에 대한 결과");
		System.out.println(param);

		return service.where_result(param,mav);		
	}
	

	
	
	
}
