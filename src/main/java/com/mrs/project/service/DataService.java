package com.mrs.project.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mrs.project.dao.DataDAO;

@Service
public class DataService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired DataDAO dao;	
	
	
	
	
}