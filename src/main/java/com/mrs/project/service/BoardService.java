package com.mrs.project.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mrs.project.dao.BoardDAO;
import com.mrs.project.dto.BoardDTO;
import com.mrs.project.dto.FileDTO;


@Service
public class BoardService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired BoardDAO dao;
	
	@Value("#{config['Globals.root']}")String root;
	private String fullpath = null; // 경로를 담는 변수 
	
	/*-----------------------------------공통-----------------------------------------------------------*/
	//글 리스트 불러오기 요청
	public void list(Model model, String type) {
		logger.info("리스트 요청 서비스");
		ArrayList<BoardDTO> list = null;

		if(type.equals("1")) {
			System.out.println("1되나?");
			list= dao.clist(type);
		}else {
			System.out.println("0되나?");
			list = dao.flist(type);
		}

		logger.info("리스트 갯수 : "+list.size());
		model.addAttribute("list", list);
		model.addAttribute("type",type);
	}

	
	//게시판 상세보기(글 불러오기 + 사진불러오기)
	public ModelAndView detail(String idx, String type) {
		ModelAndView mav = new ModelAndView();
		BoardDTO dto = dao.detail(idx);
		ArrayList<FileDTO> fileList = dao.fileList(idx);
		logger.info("첨부된 파일 : " + fileList.size());
		mav.addObject("fileList",fileList);
		mav.addObject("info",dto);
		mav.setViewName("board/board_detail");
		return mav;
	}
	
	//게시글 삭제하기
	public String delete(String idx, String type, RedirectAttributes rAttr) {
		int success = dao.delete(idx);
		logger.info("글 삭제 여부 : " + success);
		String msg = "삭제 실패";
		if(success>0) {
			msg = "삭제성공";
		}
		String page = "redirect:/typelist?type="+type;
		rAttr.addFlashAttribute("msg", msg);
		return page;
	}	
	
	
	/*-----------------------------------고객센터 관련------------------------------------------------------*/
	//고개센터 글쓰기
	public ModelAndView cwrite(HashMap<String, String> params, HttpSession session) {
		logger.info("글쓰기 접속");
		int success = dao.cwrite(params);
		logger.info("성공여부 : "+success);
		ModelAndView mav = new ModelAndView();
		String page = "redirect:/writeForm?type="+params.get("type");
		if(success>0) {
			page = "redirect:/typelist?type="+params.get("type");
		}
		mav.setViewName(page);
		return mav;
	}

	
	/*--------------------------자유게시판 관련------------------------------------------------------*/
	
	//자유게시판 안에 파일 업로드로 이동
	public ModelAndView upload(MultipartFile file, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		fullpath = root+"upload/";

		String fileName = file.getOriginalFilename();
		String newFileName = System.currentTimeMillis()+fileName.substring(fileName.lastIndexOf("."));

		try {
			byte[] bytes = file.getBytes(); 
			Path path = Paths.get(fullpath+newFileName);
			Files.write(path, bytes); 
			HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
			fileList.put(newFileName, fileName);
			logger.info("업로드 한 파일 갯수 :" + fileList.size());
			session.setAttribute("fileList", fileList);
		} catch (IOException e) {
			e.printStackTrace();
		}
	
		mav.addObject("path","photo/"+newFileName); 
		mav.setViewName("board/board_photo_uploadForm"); 
				
		return mav;
	}

	//자유게시판 안에 파일 삭제
	public HashMap<String, Object> fileDelete(String fileName, HttpSession session) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		int success = 0;
		
		//1. session 에서 fileList 가져오기
		HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList"); 
		
		//2. 실제 파일 삭제 하기
		String delFileName = root+"upload/"+fileName;
		logger.info("지울 파일 경로 : " + delFileName);
		File file = new File(delFileName);
		if(file.exists()) { //파일이 존재할 경우
			if(file.delete()) { //삭제 처리 후 성공하면
				success = 1; 
			}else {
				logger.info("이미 삭제된 상황"); 
				success = 1; 
			}
		}
		
		//3. fileList에서 삭제한 파일명 지우기
		if(fileList.get(fileName) != null) { //파일명이 리스트에 존재하면
			fileList.remove(fileName); 
			logger.info("삭제 후 남은 파일 갯수 : " + fileList.size());
		}
		
		//4. session에 fileList 넣기
		session.setAttribute("fileList", fileList);
		
		result.put("success", success);
		return result;
	}

	
	//자유게시판 글쓰기
	@Transactional
	public ModelAndView write(HashMap<String, String> params, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String page = "redirect:/writeForm";
		BoardDTO bean = new BoardDTO(); 
		
		bean.setSubject(params.get("subject"));
		bean.setContent(params.get("content"));
		bean.setId(params.get("id"));
		bean.setBoard_type(params.get("type"));
		
		HashMap<String, Object> fileList = (HashMap<String, Object>) session.getAttribute("fileList");
		
		if(dao.write(bean)==1) { //글 등록 성공시
			int size = fileList.size();
			logger.info("저장할 파일 수 : " + size);
			int idx = bean.getBoard_idx();
			if(size>0) { //업로드한 파일이 있다면 
				logger.info(idx+"번 게시물에 소속된 파일 등록");
				for(String key : fileList.keySet()) { 
					//idx, oriFileName, newFileName
					dao.writeFile(idx, (String)fileList.get(key),key);
				}
			}
			page="redirect:/detail?idx="+idx+"&type="+bean.getBoard_type()+"&pri="+bean.getPrivate_bbs(); //등록된 상세 페이지로 이동
		}else {
			//세션의 fileList에 저장된 모든 파일을 삭제
			for(String fileName : fileList.keySet()) { 
				File file = new File(root+"upload/"+fileName);
				 boolean success= file.delete();
				 logger.info(fileName+"삭제결과"+success);
			}
			
		}
		session.removeAttribute("fileList");
		
		mav.setViewName(page);
		mav.addObject("type", bean.getBoard_type());
		return mav;
	}


	/*
	public ModelAndView listAll(String search_option, String keyword) {
		List<BoardDTO> list = dao.listAll(search_option, keyword);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("search_option", search_option);
		map.put("keyword",keyword);
		ModelAndView mav = new ModelAndView();
		mav.addObject("map",map);
		mav.setViewName("board/board_list");
		return mav;
	}
	*/

	
	//게시판 검색---------------------------------------------------------------------------------------------------------------
	public List<BoardDTO> listSearch(String search_option, String keyword, String type) {
		logger.info("리스트 나옴?");
		Map<String, String> map = new HashMap<String, String>();
		map.put("search_option", search_option);
		map.put("keyword",keyword);
		map.put("type", type);
		return dao.listSearch(search_option,keyword,type);
	}


	public int countRecord(String search_option, String keyword, String type) {
		logger.info("여기도나옴?");
		Map<String, String> map = new HashMap<String, String>();
		map.put("search_option", search_option);
		map.put("keyword",keyword);
		map.put("type", type);
		return dao.countRecord(search_option,keyword,type);
	}


	
	
	

	
}
