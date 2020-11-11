package com.mrs.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.mrs.project.dao.MemberDAO;
import com.mrs.project.dto.BoardDTO;
import com.mrs.project.dto.MemberDTO;
import com.mrs.project.dto.ScrapDTO;

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

	public int mypage_loginpw(String id, String pw) {
		int result = dao.mypage_loginpw(id, pw);
		logger.info(""+result);
		return result;
	}

	public void deleteMember(String id) {

		dao.deleteMember(id);

	}
	
	public MemberDTO mypage_updatepage(String id) {
		MemberDTO dto = dao.updatepage(id);
		return dto;
	}

	public int updateMember(String user_id, String user_pw, String user_name, String user_email) {
		
		
		return dao.updateMember(user_id,user_pw,user_name,user_email);
	}

	
	public void mypage_scrap(String id, Model model) {
		ArrayList<ScrapDTO> list = dao.mypage_scrap(id);
		model.addAttribute("list", list);
		
	}

	public void scrap_delete(String idx) {
		dao.scrap_delete(idx);
	}

	public String mypage_written(String id, int page, Model model) {
		int perPage = 10; // 한화면에서 보여줄 갯수
		int start  = 0;
		int end = 0;
		if(page >= 0 && page <= 1) {
			start = 1; 
			end = 10;
		}else { // 
			end = page * perPage;
			start = end - perPage+1;
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", id);
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<BoardDTO> list = dao.mypage_written(map);
		int total = dao.getTotalCnt(id);
		int allPage = total / perPage;
		if(total % perPage > 0) { // 한페이지를 더해주고
			allPage += 1;
		}
		model.addAttribute("list", list);
		model.addAttribute("totalPage", allPage);
		model.addAttribute("curPage", page);
		
		return "member/mypage_written";
	}

	public MemberDTO mypage_detail(String id) {
		MemberDTO dto = dao.mypage_detail(id);
		
		return dto;
		
	}




	
	
	









	
	
	
	
}
