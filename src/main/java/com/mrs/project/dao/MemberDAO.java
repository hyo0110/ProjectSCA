package com.mrs.project.dao;

import java.util.HashMap;

import org.springframework.web.servlet.ModelAndView;

import com.mrs.project.dto.MemberDTO;

public interface MemberDAO {

	int login(String id, String pw);

	int dbchk(String id);

	int join(HashMap<String, Object> params);

	MemberDTO checkPassword(HashMap<String, Object> params);

	void deleteMember(String id);

	MemberDTO updatepage(String id);

	int updateMember(String user_id, String user_pw, String user_name, String user_email);

}
