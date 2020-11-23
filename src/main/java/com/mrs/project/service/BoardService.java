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
	@Value("#{config['manager.id']}") String adminId; // 관리자 아이디
	
	/*-----------------------------------공통-----------------------------------------------------------*/

	
	//게시판 상세보기(글 불러오기 + 사진불러오기)
	@Transactional
	public ModelAndView detail(String idx, String type, String pri, HttpSession session, RedirectAttributes rAttr) {
		
		ModelAndView mav = new ModelAndView();
		String page = "redirect:/typelist?type="+type;
		int comCnt = 0;
		int success = 0;
		String loginId = (String) session.getAttribute("loginid");
		
		String board_id = dao.whoId(idx); // 글쓴 사람 누군지 확인
		
		if(type.equals("1")&& pri.equals("1")) { // 게시판이 고객센터이면서 비밀글일때
				if(loginId.equals(board_id) || loginId.equals("admin")) { //세션아이디랑 글쓴이랑 같으면

					if(loginId.equals(board_id)) {
					
						comCnt = dao.comAllCount(idx); //댓글 달림 여부 체크 (카운트갯수)
						
						if(comCnt > 0) { // 댓글 확인 여부 체크
							boolean update = dao.updateBchk(idx);
						}
					}
						success = dao.bhit(idx); //조회수 올리기
						
						BoardDTO dto = dao.detail(idx); //내용 불러오기
						ArrayList<FileDTO> fileList = dao.fileList(idx); //사진리스트 넣기
						
						mav.addObject("fileList",fileList);
						mav.addObject("info",dto);
						page = "board/board_detail";
					
				} else {
					page = "redirect:/typelist?type="+type;
				}
				
		}else {
				success = dao.bhit(idx); //조회수
				BoardDTO dto = dao.detail(idx);
				ArrayList<FileDTO> fileList = dao.fileList(idx);
				mav.addObject("fileList",fileList);
				mav.addObject("info",dto);
				page = "board/board_detail";
			}

		rAttr.addFlashAttribute("msg", "비밀글 작성자가 아닙니다.");
		mav.setViewName(page);
		mav.addObject("comCnt", comCnt);
		return mav;
	}
	
	//게시글 삭제하기
	public String delete(String idx, String type, RedirectAttributes rAttr) {
		int success = dao.delete(idx);
		String msg = "삭제 실패";
		if(success>0) {
			msg = "삭제성공";
		}
		String page = "redirect:/typelist?type="+type;
		rAttr.addFlashAttribute("msg", msg);
		return page;
	}	
	
	
	//리스트 부르기 페이징
	public HashMap<String, Object> pagingList(int page, int pagePerCnt, String type) {
		
		//리스트/현재페이지/최대 만들수 있는 페이지수
				HashMap<String, Object> json = new HashMap<String, Object>();
				
				int allCnt = dao.allCount(type);//전체 게시물 수

				int range = allCnt%pagePerCnt>0?
						Math.round(allCnt/pagePerCnt)+1
						:Math.round(allCnt/pagePerCnt);

				if(page>range) {
					page = range;
				}
				
				int end = page * pagePerCnt;
				int start = end - pagePerCnt+1;
				
				ArrayList<BoardDTO> list= dao.listCall(start,end,type);
				
				for(BoardDTO dto : list) {
					String idx = Integer.toString(dto.getBoard_idx());
					int com = dao.comAllCount(idx);
					dto.setCom_total(com);
				}
				
				json.put("currPage",page);
				json.put("range", range);
				json.put("type", type);
				json.put("list", list);


				return json;
	}
	
	/*-----------------------------------고객센터 관련------------------------------------------------------*/
	//고개센터 글쓰기
	public ModelAndView cwrite(HashMap<String, String> params, HttpSession session) {
		//logger.info("글쓰기 접속");
		int success = dao.cwrite(params);
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
			session.setAttribute("fileList", fileList);
		} catch (IOException e) {
			//e.printStackTrace();
		}
	
		mav.addObject("path","photo/"+newFileName); 
		mav.setViewName("board/board_photo_uploadForm"); 
				
		return mav;
	}

	//자유게시판 안에 파일 삭제
	public HashMap<String, Object> fileDelete(String fileName, HttpSession session) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		int success = 0;
		
		//1. session 에서 fileList와 delFileList 가져오기
		HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList"); 
		HashMap<String, String> delFileList = (HashMap<String, String>) session.getAttribute("delFileList");
		
		//2. 실제 파일 삭제 하기
		String delFileName = root+"upload/"+fileName;
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
			int idx = bean.getBoard_idx();
			if(size>0) { //업로드한 파일이 있다면 
				for(String key : fileList.keySet()) { 
					dao.writeFile(idx, (String)fileList.get(key),key);
				}
			}
			page="redirect:/detail?idx="+idx+"&type="+bean.getBoard_type()+"&pri="+bean.getPrivate_bbs(); //등록된 상세 페이지로 이동
		}else {
			//세션의 fileList에 저장된 모든 파일을 삭제
			for(String fileName : fileList.keySet()) { 
				File file = new File(root+"upload/"+fileName);
				 boolean success= file.delete();
			}
			
		}
		session.removeAttribute("fileList");
		
		mav.setViewName(page);
		mav.addObject("type", bean.getBoard_type());
		return mav;
	}


	//업데이트 폼으로 이동
	public ModelAndView updateForm(String idx, String type, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			BoardDTO dto = dao.detail(idx);
			mav.addObject("info",dto);
			mav.setViewName("board/board_update");
			return mav;
	}


	//업데이트 할 때 기존 파일 삭제하기 
	public HashMap<String, Object> updateFileDelete(String fileName, HttpSession session) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		int success = 1;
		
		//1. session 에서 delFileList 가져오기
		HashMap<String, String> delFileList = (HashMap<String, String>) session.getAttribute("delFileList");
		
		//2. 실제 파일 삭제 하기 -> 저장할때 하는걸로 바꿈
		//3. fileList에서 삭제한 파일명 넣기
		delFileList.put(fileName, fileName);
		
		//4. session에 fileList 넣기
		session.setAttribute("delFileList", delFileList);
		
		result.put("success", success);
		return result;
	}


	//게시판 수정 + 기존파일 삭제했으면 실제 삭제 + 새로올린파일 있으면 실제 저장까지
	@Transactional
	public ModelAndView update(HashMap<String, String> params, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String page = "redirect:/updateForm";
		BoardDTO bean = new BoardDTO(); 
		
		bean.setSubject(params.get("subject"));
		bean.setContent(params.get("content"));
		bean.setId(params.get("id"));
		bean.setBoard_type(params.get("type"));
		bean.setBoard_idx(Integer.parseInt(params.get("idx")));
		
		HashMap<String, Object> fileList = (HashMap<String, Object>) session.getAttribute("fileList");
		HashMap<String, Object> delFileList = (HashMap<String, Object>) session.getAttribute("delFileList");
		
		if(dao.update(bean)==1) { //글 수정 성공시
			int size = fileList.size();
			int delSize = delFileList.size();
			int idx = bean.getBoard_idx();
			if(size>0) { //업로드한 파일이 있다면 
				for(String key : fileList.keySet()) { 
					dao.writeFile(idx, (String)fileList.get(key),key);
				}
			}
			if(delSize>0) {
				for(String delKey : delFileList.keySet()) {
					dao.deleteFile(idx,delKey);
					
					String delFileName = root+"upload/"+delKey;
					File file = new File(delFileName);
					if(file.exists()) { //파일이 존재할 경우
						if(file.delete()) { //삭제 처리 후 성공하면
							logger.info("삭제완료");
						}else {
							logger.info("이미 삭제된 상황");  
						}
					}
				}
			}
			page="redirect:/detail?idx="+idx+"&type="+bean.getBoard_type()+"&pri="+bean.getPrivate_bbs(); //등록된 상세 페이지로 이동
		}else {
			//세션의 fileList에 저장된 모든 파일을 삭제
			for(String fileName : fileList.keySet()) { 
				File file = new File(root+"upload/"+fileName);
				 boolean success= file.delete();
			}
			
		}
		session.removeAttribute("fileList");
		session.removeAttribute("delFileList");
		
		mav.setViewName(page);
		mav.addObject("type", bean.getBoard_type());
		return mav;
	}


	/*---------------------------------------------------------------댓글 관련-----------------------------------------------------------------------------------------------------------*/

	public HashMap<String, Object> comlist(int page, int pagePerCnt, String idx) {

		HashMap<String, Object> json = new HashMap<String, Object>();

		int allCnt = dao.comAllCount(idx);
		
		int range = allCnt%pagePerCnt>0?
				Math.round(allCnt/pagePerCnt)+1
				:Math.round(allCnt/pagePerCnt);
					
		if(page>range) {
			page = range;
		}
		
		int end = page * pagePerCnt;
		int start = end - pagePerCnt+1;
		json.put("allCnt", allCnt);
		json.put("currPage",page);
		json.put("range", range);
		json.put("list", dao.comListCall(start,end,idx));
		
		return json;
	}

	//댓글삭제
	public HashMap<String, Object> delCom(HashMap<String, String> params) {
		HashMap<String, Object> json = new HashMap<String, Object>();
		
		String msg = "댓글삭제 실패";
		if(dao.delCom(params)) {
			msg = "댓글 삭제 성공";
		}
		
		json.put("msg", msg);
		
		return json;
	}
	
	//댓글등록
	public HashMap<String, Object> insertCom(HashMap<String, String> params) {
		
		HashMap<String, Object> json = new HashMap<String, Object>();
		
		String msg = "댓글등록 실패";
		if(dao.insertCom(params)) {
			msg = "댓글 등록 성공";
		}
		
		json.put("msg", msg);
		
		return json;
	}
	
	   //게시판 검색---------------------------------------------------------------------------------------------------------------
	   public List<BoardDTO> listSearch(String search_option, String keyword, String type) {

	      return dao.listSearch(search_option,keyword,type);
	   }


	   public int countRecord(String search_option, String keyword, String type) {

	      return dao.countRecord(search_option,keyword,type);

	   }


	public HashMap<String, Object> resultpaging(int page, int pagePerCnt, String type, String search_option,
			String keyword, HashMap<String, String> params) {
		HashMap<String, Object> json = new HashMap<String, Object>();
		
		int allCnt = dao.countRecord(search_option,keyword,type);//검색결과의 갯수...
		
		int range = allCnt%pagePerCnt>0?
				Math.round(allCnt/pagePerCnt)+1
				:Math.round(allCnt/pagePerCnt);
			
		if(page>range) {
			page = range;
		}
		
		int end = page * pagePerCnt;
		int start = end - pagePerCnt+1;
		
		json.put("keyword", keyword);
		json.put("currPage",page);
		json.put("range", range);
		json.put("type", type);
		json.put("list", params.get("list"));
		json.put("list", dao.resultpaging(start,end,type,keyword,search_option));		

		return json;
	}


	
	
	

	
}
