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

@Service
public class DataService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired DataDAO dao;
	
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
			logger.info(i+"번째 뉴스"+ title.get(i-1)+" "+ link.get(i-1));
			result.put("title_"+i, title.get(i-1));					
			result.put("link_"+i, link.get(i-1));					
		}
		return result;	
	}
	
	
	
	
}
	