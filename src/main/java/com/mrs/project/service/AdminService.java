package com.mrs.project.service;

import java.util.ArrayList;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.deser.impl.CreatorCandidate.Param;
import com.mrs.project.dao.AdminDAO;
import com.mrs.project.dao.BoardDAO;
import com.mrs.project.dto.BoardDTO;
import com.mrs.project.dto.MemberDTO;

@Service
public class AdminService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired AdminDAO dao;
	@Autowired BoardDAO board;
	
	public ModelAndView adminlist(@RequestParam Map<String, String> params) {
		String pageParam = params.get("page");
		int page = 1;
		if(pageParam !=null) {
			page=Integer.parseInt(pageParam);
		}
			
		int totCount = dao.totlist(); // 총 글 갯수카운트
		int listCount = 10; //한 페이지에 보여주는 리스트의 수 
		int Countpage = 10; //페이지를 5개씩 카운트 한다.
		int totPage = totCount/listCount; //총 페이지 갯수	
		int start = ((page - 1) / 1	) * 10 + 1;
		int end = start + Countpage - 1;
		
		logger.info("총카운트"+totCount);
		logger.info("listCount"+listCount);
		if(totCount % listCount >0) {
			totPage ++;
		} //페이지 증가 5개씩 쪼개서
		
		if(totPage ==0) {
			totPage=1;
		}
		
		if(totPage<page) {
			page = totPage; //
		}
		
		
		
		ArrayList<BoardDTO> list = dao.list(start,end);
		
		for(BoardDTO dto : list) {
			String idx = Integer.toString(dto.getBoard_idx());
			
			int com = board.comAllCount(idx);
			logger.info("각 게시글에 대한 갯수 : "+com);
			dto.setCom_total(com);
			//logger.info("???"+dto.getCom_total());
		}
		
		logger.info("list"+list.size());
		ModelAndView mav = new ModelAndView();	
		mav.addObject("listCount",listCount);//페이지당 보여줌
		mav.addObject("currPage",page); //현재 페이지
		mav.addObject("endPage",totPage); //끝페이지
 		mav.addObject("adminlist",list); //리스트 페이지
 		mav.addObject("start",start); //움직이는 페이지 왼쪽
 		mav.addObject("end",end); // 움직이는 페이지
 		for (int iCount = start; iCount <= end; iCount++) {
		    if (iCount == page) {
		    	mav.addObject("iCount",iCount);
		    	System.out.print(" <b>" + iCount + "</b>");
		    } else {
		        System.out.print(" " + iCount + " ");
		    }
		}
 		
		mav.setViewName("adminlist");

		return mav;
		
	}

	public int admindel(String board_idx) {
		int success = dao.admindel(board_idx);
		logger.info("삭제 갯수"+success);	
		return success;
	}

	public ModelAndView admemberlist(Map<String, String> params) {
		String pageParam = params.get("page");
		int page = 1;
		if(pageParam !=null) {
			page=Integer.parseInt(pageParam);
		}
		
		int totCount = dao.totalmemberist(); // 총 글 갯수카운트
		int listCount = 10; //한 페이지에 보여주는 페이지 수 
		int Countpage = 10; //페이지를 5개씩 카운트 한다.
		int totPage = totCount/listCount; //총 페이지 갯수	
		int start = ((page - 1) / 1) * 10 + 1;
		int end = start + Countpage - 1;

		
		int range = totCount%Countpage>0?
				Math.round(totCount/Countpage)+1
				:Math.round(totCount/Countpage);
		
		if(totCount % listCount >0) {
			totPage ++;
		} //페이지 증가 5개씩 쪼개서
		
		if(totPage ==0) {
			totPage=1;		
		}
	
		if(totPage<page) {
			page = totPage; //
		}
		
		ArrayList<MemberDTO> list = dao.admemberlist(start,end);
		logger.info("회원사이즈"+list.size());
		ModelAndView mav = new ModelAndView();
		logger.info("list"+list.size());	
		mav.addObject("listCount",listCount);//페이지당 보여줌
		mav.addObject("currPage",page); //현재 페이지
		mav.addObject("endPage",totPage); //끝페이지
 		mav.addObject("adminlist",list); //리스트 페이지
 		mav.addObject("start",start); //움직이는 페이지 왼쪽
 		mav.addObject("end",end); // 움직이는 페이지
 		mav.addObject("range",range);
 		mav.addObject("totCount",totCount);
 		for (int iCount = start; iCount <= end; iCount++) {
		    if (iCount == page) {
		    	mav.addObject("iCount",iCount);
		    	System.out.print(" <b>" + iCount + "</b>");
		    } else {
		        System.out.print(" " + iCount + " ");
		    }
		}
		mav.addObject("admemberlist",list);
		mav.setViewName("admin/admin_member");
		logger.info("admemberlist"+mav);
		return mav;
	}

	public int adminmemberdel(String id) {
		int success = dao.adminmemberdel(id);
		logger.info("삭제 갯수"+success);	
		return success;
	}

	public ModelAndView adminfaqlist(Map<String, String> params) {
		String pageParam = params.get("page");
		int page = 1;
		if(pageParam !=null) {
			page=Integer.parseInt(pageParam);
		}
		
		int totCount = dao.totalist(); // 총 글 갯수카운트
		int listCount = 10; //한 페이지에 보여주는 페이지 수 
		int Countpage = 10; //페이지를 5개씩 카운트 한다.
		int totPage = totCount/listCount; //총 페이지 갯수	
		int start = ((page - 1) / 1) * 10 + 1;
		int end = start + Countpage - 1;
		
		int range = totCount%Countpage>0?
				Math.round(totCount/Countpage)+1
				:Math.round(totCount/Countpage);
 		
		if(totCount % listCount >0) {
			totPage ++;
		} //페이지 증가 5개씩 쪼개서
		
		if(totPage ==0) {
			totPage=1;		
		}
	
		if(totPage<page) {
			page = totPage; //
		}
		
		ArrayList<BoardDTO> list = dao.faqlist(start,end);
		logger.info("list"+list.size());
		ModelAndView mav = new ModelAndView();	
		mav.addObject("listCount",listCount);//페이지당 보여줌
		mav.addObject("currPage",page); //현재 페이지
		mav.addObject("endPage",totPage); //끝페이지
 		mav.addObject("adminlist",list); //리스트 페이지
 		mav.addObject("start",start); //움직이는 페이지 왼쪽
 		mav.addObject("end",end); // 움직이는 페이지
 		mav.addObject("range", range);
 		for (int iCount = start; iCount <= end; iCount++) {
		    if (iCount == page) {
		    	mav.addObject("iCount",iCount);
		    	System.out.print(" <b>" + iCount + "</b>");
		    } else {
		        System.out.print(" " + iCount + " ");
		    }
		}
 		
		mav.setViewName("adminfaqlist");

		return mav;
	}


	


}
