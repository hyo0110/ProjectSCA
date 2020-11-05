package com.mrs.project.dao;

import java.util.ArrayList;

import com.mrs.project.dto.BoardDTO;
import com.mrs.project.dto.MemberDTO;

public interface AdminDAO {

	ArrayList<BoardDTO> list(int start, int end);//관리자 게시판 페이지

	int totlist();//게시글 총 카운트.
	
	ArrayList<BoardDTO> faqlist(int start, int end); //회원

	int totalist();
	
	
	int admindel(String board_idx);//관리자 게시판 삭제

	ArrayList<MemberDTO> admemberlist(int start, int end);//관리자 회원 페이지

	int totalmemberist();//관리자 회원 카운트
	
	int adminmemberdel(String id);//관리자 회원 탈퇴



	



	



	

	



	
}
