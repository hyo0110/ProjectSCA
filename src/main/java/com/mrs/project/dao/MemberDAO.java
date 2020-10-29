package com.mrs.project.dao;

import java.util.HashMap;

public interface MemberDAO {

	int login(String id, String pw);

	int dbchk(String id);

	int join(HashMap<String, Object> params);

}
