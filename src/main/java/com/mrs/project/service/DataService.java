package com.mrs.project.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mrs.project.dao.DataDAO;
import com.mrs.project.dto.DataDTO;

@Service
public class DataService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired DataDAO dao;
	
	// 해당 구 베스트 정보+망고플레이트 불러오기
	public DataDTO what_result(String region) {
		DataDTO data = new DataDTO();
		data = dao.what_result(region);
		/*  <h3>${data.region}는... </h3>
		  ${data.best_day} , ${data.best_time}에 ${data.best_age} 유동인구가 가장 많습니다.
		이 곳의 음식점/카페 수는 ${data.mk_total }개 입니다.
		*/
		return data;
	}
	
	
	
	//해당 구 관련 뉴스 기사 5개 불러오기
	public HashMap<String, Object> newslist(String region) {
		HashMap<String, Object> result = new HashMap<String, Object>();		
		String url = "https://search.naver.com/search.naver?where=news&sm=tab_jum&query="+region; 
		Document doc = null; 
			try {
				doc = Jsoup.connect(url).get();			
			} catch (IOException e) {
				e.printStackTrace();
			}		
		Elements element = doc.select("div.news_wrap.api_ani_send > div > a");		
		ArrayList<String> title = (ArrayList<String>) element.eachAttr("title");
		ArrayList<String> link = (ArrayList<String>) element.eachAttr("href");		
		for(int i = 1; i<=5; i++) {
			//logger.info(i+"번째 뉴스"+ title.get(i-1)+" "+ link.get(i-1));
			result.put("title_"+i, title.get(i-1));					
			result.put("link_"+i, link.get(i-1));					
		}
		return result;	
	}


	
	
	
}
	