package com.mrs.project.dao;

import java.util.HashMap;

import com.mrs.project.dto.DataDTO;

public interface DataDAO {

	DataDTO what_result(String region);

	DataDTO status(String region, String reg_date);
	/*
	  DataDTO ppl_age(String region, String reg_date);
	  
	  DataDTO ppl_day(String region, String reg_date);
	  
	  DataDTO ppl_time(String region, String reg_date);
	 */


	int scriptsave(String parameter, String loginId, String subject);

	int scrap_cnt(String loginid);


}
