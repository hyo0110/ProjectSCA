package com.mrs.project.dao;

import java.util.ArrayList;

import com.mrs.project.dto.BoardDTO;

public interface AdminDAO {

	ArrayList<BoardDTO> list();//관리자 게시판 페이지

	int admindel(String board_idx);//관리자 게시판 삭제



	
}
