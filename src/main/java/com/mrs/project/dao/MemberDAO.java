package com.mrs.project.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import com.mrs.project.dto.BoardDTO;
import com.mrs.project.dto.MemberDTO;
import com.mrs.project.dto.ScrapDTO;

public interface MemberDAO {

	int login(String id, String pw);

	int dbchk(String id);

	int join(HashMap<String, Object> params);


	void deleteMember(String id);

	MemberDTO updatepage(String id);

	int updateMember(String user_id, String user_pw, String user_name, String user_email);

	ArrayList<ScrapDTO> mypage_scrap(String id);

	void scrap_delete(String idx);

	ArrayList<BoardDTO> mypage_written(HashMap<String, Object> map);

	MemberDTO mypage_detail(String id);

	int mypage_loginpw(String id, String pw);
	
	int getTotalCnt(String id);

	int snsIdChk(String id, String idKinds);

	int memberConnect(String id, String pw, String snsId, String idKinds);

	int kaoIdDelete(String kakaoId, String loginid);
	
	ArrayList<MemberDTO> snsLogin(String snsId, String idKinds);

	int snsIdChk(HashMap<String, Object> map);



}
