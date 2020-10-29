package com.mrs.project.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.mrs.project.dao.MemberDAO;

@Service
public class MemberService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MemberDAO dao;
	
	//로그인-----------------------------------------------------------------------------------------------------------------
	public int login(String id, String pw) {
		int cnt = dao.login(id,pw);
		//logger.info("회원여부"+cnt);
		return cnt;
	}

	//회원가입-----------------------------------------------------------------------------------------------------------------
	public ModelAndView join(HashMap<String, Object> params) {
		int success = dao.join(params);
		//logger.info("여기까지왔슈");
		
		String msg = "가입에 실패했습니다.";
		String page = "joinForm";
		
		if(success>0) {
			msg = "가입에 성공했습니다.";
			page = "member/index_login";
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName(page);
		return mav;
	}

	//아이디중복확인------------------------------------------------------------------------------------------------------------
	public HashMap<String, Object> dbchk(String id) {
		int result = dao.dbchk(id);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("dbchk", result);
		return map;
	}





	
	
	
	
}
