package com.mrs.project.dao;

import java.util.ArrayList;

import com.mrs.project.dto.BoardDTO;
import com.mrs.project.dto.MemberDTO;

public interface AdminDAO {

	ArrayList<BoardDTO> list();//관리자 게시판 페이지

	int admindel(String board_idx);//관리자 게시판 삭제

	ArrayList<MemberDTO> admemberlist();//관리자 회원 페이지

	

	



	
}
