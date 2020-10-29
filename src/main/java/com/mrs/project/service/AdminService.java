package com.mrs.project.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.mrs.project.dao.AdminDAO;
import com.mrs.project.dto.BoardDTO;
import com.mrs.project.dto.MemberDTO;

@Service
public class AdminService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired AdminDAO dao;
	
	public ModelAndView adminlist() {
		ArrayList<BoardDTO> list = dao.list();
		logger.info("list"+list.size());
		ModelAndView mav = new ModelAndView();
		mav.addObject("adminlist",list);
		mav.setViewName("adminlist");
		logger.info("adminlist"+mav);
		return mav;
		
	}

	public int admindel(String board_idx) {
		int success = dao.admindel(board_idx);
		logger.info("삭제 갯수"+success);	
		return success;
	}

	public ModelAndView admemberlist() {
		ArrayList<MemberDTO> list = dao.admemberlist();
		logger.info("회원사이즈"+list.size());
		ModelAndView mav = new ModelAndView();
		mav.addObject("admemberlist",list);
		mav.setViewName("admin/admin_member");
		logger.info("admemberlist"+mav);
		return mav;
	}

	
	


}
