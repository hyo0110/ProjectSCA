package com.mrs.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("member")
public class MemberDTO {
	
	String user_id;
	String user_pw;
	String user_name;
	String email;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw1(String user_pw) {
		this.user_pw = user_pw;

	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

}
