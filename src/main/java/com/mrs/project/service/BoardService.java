package com.mrs.project.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mrs.project.dao.BoardDAO;

@Service
public class BoardService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired BoardDAO dao;	
	
	
	
	
}
