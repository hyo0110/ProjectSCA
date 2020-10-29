package com.mrs.project.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mrs.project.service.BoardService;


@Controller
public class BoardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BoardService service;

	/*-----------------------------------공통-----------------------------------------------------------*/
	// list.jsp로만 보내는 요청
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {

		return "board/board_list";
	}
	
	// list.jsp에서 고객센터 또는 자유게시판 버튼에 따라서 목록보기를 부르는 요청(글 리스트불러오기)
	// type -> 0(자유) / 1(고객)
	@RequestMapping(value = "/typelist", method = RequestMethod.GET)
	public String list(Model model, @RequestParam String type) {
		logger.info("보드 타입 : "+type);
		service.list(model,type);
		return "board/board_list";
	}
	
	// writeForm.jsp로만 보내는 요청 -> type에 따라서 달라짐
	@RequestMapping(value = "/writeForm", method = RequestMethod.GET)
	public String writeForm(Model model, HttpSession session, @RequestParam String type) {
		String page = null;
		logger.info("type :"+type);
		if(type.equals("0")) { //자유게시판의 writeForm
		HashMap<String, String> fileList = new HashMap<String, String>();
		session.setAttribute("fileList", fileList);
		page="board/board_write"; 
		model.addAttribute("type",type);
		}else {//고객센터의 writeForm
		page = "board/board_cwrite"; 
		model.addAttribute("type",type);
		}
		return page;
	}
	
	//상세보기 + 업로드한 파일있으면 같이 보이기
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam String idx, @RequestParam String type, @RequestParam String pri) { 
		logger.info("상세보기 요청"+idx+"/타입:"+type+"/비밀글여부:"+pri);
		ModelAndView mav = null;
	/*	if(pri.equals("1")) { //비밀글이면 해당 회원만 볼 수 있게 하는 로직 / 로그인 기능 완료후에 할 예정
			
		}*/
		mav = service.detail(idx,type);
		return mav;
	}
	
	// 게시글 삭제요청
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Model model, @RequestParam String idx, @RequestParam String type,
			RedirectAttributes rAttr) {
		logger.info("삭제할 idx : "+idx+"타입 : "+type);
		return service.delete(idx,type,rAttr);
	}
	
	/*-----------------------------------고객센터 관련------------------------------------------------------*/
	//고객센터의 글쓰기
	@RequestMapping(value = "/cwrite", method = RequestMethod.POST)
	public ModelAndView cwrite(@RequestParam HashMap<String, String> params ,HttpSession session) {
		
		logger.info("글쓰기 요청");	
		logger.info("params : "+params);
		logger.info("비밀글 여부 : "+params.get("privateHidden"));
		if(params.get("privateHidden").equals("")) {
			System.out.println("들어옴?");
			params.put("privateHidden", "0");
			logger.info("비밀글 여부 : "+params.get("privateHidden"));
		}
		return service.cwrite(params,session);
	}
	
	
	/*--------------------------자유게시판 관련-------------------------------------------------------------------------*/

	//자유게시판 안의 파일 업로드를 위해서 창으로 이동
	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public String uploadForm(Model model) {
		
		return "board/board_photo_uploadForm";
	}
	
	//자유게시판 안의 파일 업로드
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public ModelAndView upload(MultipartFile file, HttpSession session) {
		logger.info("upload 요청");	
		return service.upload(file,session);
	}
	
	//자유게시판 안의 파일 삭제
	@RequestMapping(value = "/fileDelete", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> fileDelete(@RequestParam String fileName , HttpSession session) {
		logger.info("fileDelete 요청"+fileName);	
		return service.fileDelete(fileName,session);
	}
	
	//자유게시판의 글쓰기+ 파일업로드 실제 저장
	@RequestMapping(value = "/write", method = RequestMethod.POST)
		public ModelAndView write(@RequestParam HashMap<String, String> params ,HttpSession session) { //문자열로 파라메터를 보내기 때문에 string으로 받는데 보낼때는 object로 해야함(hashamp, list등으로 반환하기 때문에)
			logger.info("글쓰기 요청");	
			logger.info("params : "+params);
			return service.write(params,session);
		}

	@RequestMapping(value = "/updateForm", method = RequestMethod.GET)
	public ModelAndView updateForm(@RequestParam String idx, @RequestParam String type,HttpSession session) {
		logger.info("받아온 idx : "+idx+"/글 종류 : "+type);
		HashMap<String, String> fileList = new HashMap<String, String>();
		HashMap<String, String> delFileList = new HashMap<String, String>();
		session.setAttribute("fileList", fileList);
		session.setAttribute("delFileList", delFileList);
		return service.updateForm(idx,type,session);
	}

	
}
