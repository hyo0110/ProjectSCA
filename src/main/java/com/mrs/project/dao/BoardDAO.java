package com.mrs.project.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.mrs.project.dto.BoardDTO;
import com.mrs.project.dto.FileDTO;

public interface BoardDAO {

	ArrayList<BoardDTO> clist(String type); //고객센터 리스트 불러오기

	ArrayList<BoardDTO> flist(String type); // 자유게시판 리스트 불러오기

	int cwrite(HashMap<String, String> params); //고객센터 글쓰기

	int write(BoardDTO bean); //자유게시판 글쓰기

	void writeFile(int idx, String string, String key); // 자유게시판의 사진들을 db에 저장

	BoardDTO detail(String idx); //게시판 상세보기

	ArrayList<FileDTO> fileList(String idx); // 자유게시판 상세보기(사진 불러오기)

	int delete(String idx); //게시글 삭제하기

	List<BoardDTO> listSearch(@Param("search_option") String search_option, @Param("keyword") String keyword, @Param("type") String type);//게시판 검색

	int countRecord(@Param("search_option") String search_option, @Param("keyword") String keyword, @Param("type") String type);//게시판 레코드 갯수

}
