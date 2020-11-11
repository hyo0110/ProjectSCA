package com.mrs.project.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.naming.ldap.ManageReferralControl;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.jstl.core.Config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.support.ManagedArray;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.GenericApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.tags.EvalTag;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.core.JsonParser;
import com.mrs.project.dto.BoardDTO;
import com.mrs.project.service.AdminService;

@Controller
public class AdminController {
	@Autowired AdminService service;
	@Value("#{config['manager.id']}")
	private String managerid;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
// 관리자 페이지 접속
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView index(Model model,HttpSession session,@RequestParam Map<String, String> params) {
		logger.info("관리자모드 진입");
		logger.info("params"+params);
		ModelAndView mav = new ModelAndView();	
			System.out.println(managerid+"어드민값");
			String msg;
			
			if(managerid!=null) {
				mav = service.adminlist(params);
				mav.setViewName("admin/admin_board2");
				logger.info("리스트를 잘 불러오는가요?"+mav);
			}else {
				if(!managerid.equals("admin")) {
					msg = "접근할 수 없습니다.";
				}
			}		
		return mav;
	}	
	//관리자 게시글 삭제
	@RequestMapping(value = "/admindel", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> admindel(@RequestParam String board_idx) {
		logger.info(board_idx+"삭제 idx값");
		HashMap<String, Object> map = new HashMap<String, Object>();
		String msg = "실패";
		int del_cnt = service.admindel(board_idx);
		if(del_cnt>0) {
			msg = "성공";
		}
				// 제이슨 형태로 결과값을 보내줘야함.
		
		map.put("msg", msg);
		map.put("del_cnt", del_cnt);
		return map;
	}

	@RequestMapping(value = "/admin_faqboard", method = RequestMethod.GET)
	public ModelAndView adminfaqboard(Model model,@RequestParam Map<String, String> params,HttpSession session) {
		logger.info("여기오나요?");
		String msg;
		ModelAndView mav = new ModelAndView();	
		if(managerid!=null) {
			mav = service.adminfaqlist(params);
			mav.setViewName("admin/admin_faqboard2");
			logger.info("회원리스트를 잘 불러오는가요?"+mav);
		}			else {
			if(!managerid.equals("admin")) {
				msg = "접근할 수 없습니다.";
			}
		}
		return mav;
	}
		
	@RequestMapping(value = "/admin_member", method = RequestMethod.GET)
	public ModelAndView admin_member(Model model,@RequestParam Map<String, String> params) {
		logger.info("여기오나요?");
		ModelAndView mav = new ModelAndView();	
		if(managerid!=null) {
			mav = service.admemberlist(params);
			mav.setViewName("admin/admin_member2");
			logger.info("회원리스트를 잘 불러오는가요?"+mav);
		}			
		return mav;
	}
	
	@RequestMapping(value = "/adminmemberdel", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> adminmemberdel(@RequestParam String id) {
		logger.info(id+"삭제 idx값");
		HashMap<String, Object> map = new HashMap<String, Object>();
		String msg = "실패";
		int del_cnt = service.adminmemberdel(id);
		if(del_cnt>0) {
			msg = "성공";
		}
				// 제이슨 형태로 결과값을 보내줘야함.
		
		map.put("msg", msg);
		map.put("del_cnt", del_cnt);
		return map;
	}
	
	
}