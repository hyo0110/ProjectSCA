package com.mrs.project.dao;

import java.util.HashMap;

import com.mrs.project.dto.MemberDTO;

public interface MemberDAO {

	int login(String id, String pw);

	int dbchk(String id);

	int join(HashMap<String, Object> params);

	MemberDTO checkPassword(HashMap<String, Object> params);

	void deleteMember(String id);

	MemberDTO updatepage(String id);

}
