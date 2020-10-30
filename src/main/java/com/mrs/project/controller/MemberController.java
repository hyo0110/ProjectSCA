package com.mrs.project.controller;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mrs.project.dto.MemberDTO;
import com.mrs.project.service.MemberService;


@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MemberService service;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "member/index_login";
	}
	
	//로그인-----------------------------------------------------------------------------------------
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam String id, @RequestParam String pw, HttpSession session) {
		//logger.info(id+"/"+pw);	
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] byteArrid = digest.digest(id.getBytes(StandardCharsets.UTF_8));
			//logger.info("id : "+byteArrid);
		
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		int cnt = service.login(id,pw);
		ModelAndView mav = new ModelAndView();
		String msg = "로그인 실패했습니다.";
		String page = "member/index_login";
		if(cnt>0) {
			session.setAttribute("loginid", id);
			msg = "로그인 성공했습니다.";
			page = "index";
		}
		mav.addObject("msg",msg);
		mav.setViewName(page);
		
		return mav;
	}
	
	//회원가입폼----------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm(Model model) {
		
		return "member/index_join";
	}
	
	//회원가입-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView join(@RequestParam HashMap<String, Object> params) {
		//logger.info("params : {}",params);
		
		return service.join(params);
	}
	
	//아이디 중복확인-----------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/dbchk", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> dbchk(@RequestParam String id) {
		//logger.info("id : {}",id);
		return service.dbchk(id);
	}
	
	//로그아웃------------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		session.removeAttribute("loginid");
		model.addAttribute("msg","로그아웃 되었습니다.");
		
		return "member/index_login";
	}
	//마이페이지 재로그인 화면이동
	@RequestMapping(value = "/mypage_login", method = RequestMethod.GET)
	public String mypage_login(HttpSession session, Model model) {
		
		
		
		return "member/mypage_login";
	}
	//마이페이지 재로그인 화면이동
	@RequestMapping(value = "/mypage_detail", method = RequestMethod.POST)
	public String mypage_detail(HttpSession session, Model model, @RequestParam String pw) { 
		 String id =(String) session.getAttribute("loginid");
		 System.out.println(id);
		MemberDTO dto = service.mypage_loginpw(pw, id);
		if(dto != null) {
			model.addAttribute("member", dto);
			return "member/mypage_detail";	
		}
		return "redirect:/member/mypage_login";
	}
	
	@RequestMapping(value = "/deleteMember", method = RequestMethod.GET)
	public String deleteMember(HttpSession session, Model model) {

		String id = (String) session.getAttribute("loginid");
		service.deleteMember(id);
		session.removeAttribute("loginid");

		return "redirect:/logout";
	}
	
	// 내 정보 수정 페이지 들어갈때
	@RequestMapping(value = "/mypage_update", method = RequestMethod.GET)
	public String mypage_update(HttpSession session, Model model) {
		String id = (String) session.getAttribute("loginid");
		MemberDTO dto = service.mypage_updatepage(id);
		model.addAttribute("member", dto);
		return "member/mypage_update";
	}
	
	// 내 정보 수정하기
	@RequestMapping(value = "/updateMember", method = RequestMethod.POST)
	public String updateMember(Model model, @RequestParam String user_id,
			@RequestParam String user_pw, @RequestParam String user_name, @RequestParam String user_email) {		
		int count = service.updateMember(user_id, user_pw, user_name, user_email);
		String page ="redirect:/mypage_update";
		if(count>0) {
			page="redirect:/mypage_login";
		}
		return page;
	}


}
