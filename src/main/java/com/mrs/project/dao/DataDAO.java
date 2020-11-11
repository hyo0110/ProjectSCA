package com.mrs.project.dao;

import com.mrs.project.dto.DataDTO;

public interface DataDAO {

	DataDTO what_result(String region);

	DataDTO status(String region, String reg_date);

}
