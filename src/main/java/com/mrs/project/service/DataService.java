package com.mrs.project.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.rosuda.REngine.REXP;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

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
		return data;
	}
	
	
	
	//해당 구 관련 뉴스 기사 5개 불러오기
	public HashMap<String, Object> newslist(String region) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		String url = "https://search.naver.com/search.naver?where=news&sm=tab_jum&query=" + region;
		Document doc = null;
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Elements element = doc.select("div.news_wrap.api_ani_send > div > a");
		ArrayList<String> title = (ArrayList<String>) element.eachAttr("title");
		ArrayList<String> link = (ArrayList<String>) element.eachAttr("href");
		for (int i = 1; i <= 5; i++) {
			//logger.info(i + "번째 뉴스" + title.get(i - 1) + " " + link.get(i - 1));
			result.put("title_" + i, title.get(i - 1));
			result.put("link_" + i, link.get(i - 1));
		}
		return result;
	}
	// 반기별 업종 불러오기 => 사실 이거로 다 해야하는데... 일단 html 삽입하는 거부터
	public HashMap<String, Object> openbiz(String region, String reg_date) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		DataDTO status = dao.status(region,reg_date);
		//result.put("openbiz",status.getData_code());
		result.put("status",status);
		return result;
	}
	

	public ModelAndView where_result(HashMap<String, String> param, ModelAndView mav) throws Exception {
		int age_cnt = Integer.parseInt(param.get("age_cnt")); 
		int time_cnt = Integer.parseInt(param.get("time_cnt")); 
		
		if (!param.isEmpty()) {
			logger.info("params : " + param);//불러온 파라메이터
			
			// 1. R connection 실행
			RConnection conn = new RConnection();
			conn.eval("df<-data.frame()");
			//age 시작
			if (param.get("age_total") != null) {
				conn.eval("library(KoNLP)");
				conn.eval("library(dplyr)");
				conn.eval("library(stringr)");
				conn.eval("library(plotly)");
				conn.eval("age<-read.csv('C:/Users/aa/Desktop/2차 프로젝트 관련/유동인구 xcel/202001_age_people.csv')");
				conn.eval("age$age_total_cnt<-ifelse(age$age_total_cnt > 120000000,NA,age$age_total_cnt)");
				conn.eval("new_age<- na.omit(age) %>% arrange(desc(age_total_cnt)) %>% head(10)");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("df_1<-cbind(new_age,score)");
				conn.eval("df_1<-select(df_1, region, score)");
				conn.eval("df<-rbind(df,df_1)");
			}

			if (param.get("age_10") != null) {
				conn.eval("library(KoNLP)");
				conn.eval("library(dplyr)");
				conn.eval("library(stringr)");
				conn.eval("library(plotly)");
				conn.eval("age<-read.csv('C:/Users/aa/Desktop/2차 프로젝트 관련/유동인구 xcel/202001_age_people.csv')");
				conn.eval("age<-age %>% arrange(desc(age_10_cnt))");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("age<-head(age,10)");
				conn.eval("df_1<-cbind(age,score)");
				conn.eval("df_1<-select(df_1, region, score)");
				conn.eval("df<-rbind(df,df_1)");
			}
			
			if (param.get("age_20") != null) {
				conn.eval("library(KoNLP)");
				conn.eval("library(dplyr)");
				conn.eval("library(stringr)");
				conn.eval("library(plotly)");
				conn.eval("age<-read.csv('C:/Users/aa/Desktop/2차 프로젝트 관련/유동인구 xcel/202001_age_people.csv')");
				conn.eval("age$age_20_cnt<-ifelse(age$age_20_cnt > 25000000,NA,age$age_20_cnt)");
				conn.eval("new_age<- na.omit(age) %>% arrange(desc(age_20_cnt)) %>% head(10)");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("df_1<-cbind(new_age,score)");
				conn.eval("df_1<-select(df_1, region, score)");
				conn.eval("df<-rbind(df,df_1)");
			}
			
			if (param.get("age_30") != null) {
				conn.eval("library(KoNLP)");
				conn.eval("library(dplyr)");
				conn.eval("library(stringr)");
				conn.eval("library(plotly)");
				conn.eval("age<-read.csv('C:/Users/aa/Desktop/2차 프로젝트 관련/유동인구 xcel/202001_age_people.csv')");
				conn.eval("age$age_30_cnt<-ifelse(age$age_30_cnt > 25000000,NA,age$age_30_cnt)");
				conn.eval("new_age<- na.omit(age) %>% arrange(desc(age_30_cnt)) %>% head(10)");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("df_1<-cbind(new_age,score)");
				conn.eval("df_1<-select(df_1, region, score)");
				conn.eval("df<-rbind(df,df_1)");
			}
			
			if (param.get("age_40") != null) {
				conn.eval("library(KoNLP)");
				conn.eval("library(dplyr)");
				conn.eval("library(stringr)");
				conn.eval("library(plotly)");
				conn.eval("age<-read.csv('C:/Users/aa/Desktop/2차 프로젝트 관련/유동인구 xcel/202001_age_people.csv')");
				conn.eval("age$age_40_cnt<-ifelse(age$age_40_cnt > 18000000,NA,age$age_40_cnt)");
				conn.eval("new_age<- na.omit(age) %>% arrange(desc(age_40_cnt)) %>% head(10)");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("df_1<-cbind(new_age,score)");
				conn.eval("df_1<-select(df_1, region, score)");
				conn.eval("df<-rbind(df,df_1)");
			}
			
			if (param.get("age_50") != null) {
				conn.eval("library(KoNLP)");
				conn.eval("library(dplyr)");
				conn.eval("library(stringr)");
				conn.eval("library(plotly)");
				conn.eval("age<-read.csv('C:/Users/aa/Desktop/2차 프로젝트 관련/유동인구 xcel/202001_age_people.csv')");
				conn.eval("age$age_50_cnt<-ifelse(age$age_50_cnt > 17000000,NA,age$age_50_cnt)");
				conn.eval("age$age_50_cnt<-ifelse(age$age_50_cnt < 5000000,NA,age$age_50_cnt)");
				conn.eval("new_age<- na.omit(age) %>% arrange(desc(age_50_cnt)) %>% head(10)");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("df_1<-cbind(new_age,score)");
				conn.eval("df_1<-select(df_1, region, score)");
				conn.eval("df<-rbind(df,df_1)");
			}
			
			if (param.get("age_60") != null) {
				conn.eval("library(KoNLP)");
				conn.eval("library(dplyr)");
				conn.eval("library(stringr)");
				conn.eval("library(plotly)");
				conn.eval("age<-read.csv('C:/Users/aa/Desktop/2차 프로젝트 관련/유동인구 xcel/202001_age_people.csv')");
				conn.eval("age<-age %>% arrange(desc(age_60_cnt)) %>% head(10)");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("df_1<-cbind(age,score)");
				conn.eval("df_1<-select(df_1, region, score)");
				conn.eval("df<-rbind(df,df_1)");
			}
			
			conn.eval("df<-df %>% group_by(region) %>% summarise(score=sum(score)/"+age_cnt+")");
			//age 끝
			
			//day 시작
				if(param.get("day_1")!=null) {//day가 월~목
					conn.eval("library(KoNLP)");
					conn.eval("library(dplyr)");
					conn.eval("library(stringr)");
					conn.eval("library(plotly)");
					conn.eval("day<-read.csv(\"C:/Users/aa/Desktop/2차 프로젝트 관련/유동인구 xcel/202001_day_people_1.csv\")");
					conn.eval("day<-day %>% arrange(desc(mon_thu))");
					conn.eval("day$mon_thu<-ifelse(day$mon_thu > 60000000,NA,day$mon_thu)");
					conn.eval("new_day<- na.omit(day) %>% arrange(desc(mon_thu)) %>% head(10)");
					conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
					conn.eval("df_1<-cbind(new_day,score)");
					conn.eval("df_1<-select(df_1, region, score)");
					conn.eval("df<-rbind(df,df_1)");
				}
				if (param.get("day_2")!=null) {//day 금~일
					conn.eval("library(KoNLP)");
					conn.eval("library(dplyr)");
					conn.eval("library(stringr)");
					conn.eval("library(plotly)");
					conn.eval("day<-read.csv(\"C:/Users/aa/Desktop/2차 프로젝트 관련/유동인구 xcel/202001_day_people_1.csv\")");
					conn.eval("day<-day %>% arrange(desc(fri_sun))");
					conn.eval("day$fri_sun<-ifelse(day$fri_sun > 50000000,NA,day$fri_sun)");
					conn.eval("new_day<- na.omit(day) %>% arrange(desc(fri_sun)) %>% head(10)");
					conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
					conn.eval("df_1<-cbind(new_day,score)");
					conn.eval("df_1<-select(df_1, region, score)");
					conn.eval("df<-rbind(df,df_1)");
				}
				
				if (param.get("day_total")!=null) {//day 금~일
					conn.eval("library(KoNLP)");
					conn.eval("library(dplyr)");
					conn.eval("library(stringr)");
					conn.eval("library(plotly)");
					conn.eval("day<-read.csv(\"C:/Users/aa/Desktop/2차 프로젝트 관련/유동인구 xcel/202001_day_people_1.csv\")");
					conn.eval("day$day_total_cnt<-ifelse(day$day_total_cnt > 120000000, NA, day$day_total_cnt)");
					conn.eval("new_day<- na.omit(day) %>% arrange(desc(day_total_cnt)) %>% head(10)");
					conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
					conn.eval("df_1<-cbind(new_day,score)");
					conn.eval("df_1<-select(df_1, region, score)");
					conn.eval("df<-rbind(df,df_1)");
				}
				
			//day 끝
			
			//about time start
			
			if (param.get("time_total") != null) {
				conn.eval("library(KoNLP)");
				conn.eval("library(dplyr)");
				conn.eval("library(stringr)");
				conn.eval("library(plotly)");
				conn.eval("time<-read.csv(\"C:/Users/aa/Desktop/2차 프로젝트 관련/유동인구 xcel/202001_time_people.csv\")");
				conn.eval("time<-time %>% arrange(desc(time_total_cnt))");
				conn.eval("time$time_total_cnt<-ifelse(time$time_total_cnt > 120000000,NA,time$time_total_cnt)");
				conn.eval("new_time<- na.omit(time) %>% arrange(desc(time_total_cnt)) %>% head(10)");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("df_1<-cbind(new_time,score)");
				conn.eval("df_1<-select(df_1, region, score)");
				conn.eval("df<-rbind(df,df_1)");
			}
			if (param.get("time_1") != null) {
				conn.eval("library(KoNLP)");
				conn.eval("library(dplyr)");
				conn.eval("library(stringr)");
				conn.eval("library(plotly)");
				conn.eval("time<-read.csv(\"C:/Users/aa/Desktop/2차 프로젝트 관련/유동인구 xcel/202001_time_people.csv\")");
				conn.eval("time<-time %>% arrange(desc(time_1_cnt))");
				conn.eval("time<-time %>% head(10)");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("df_1<-cbind(time,score)");
				conn.eval("df_1<-select(df_1, region, score)");
				conn.eval("df<-rbind(df,df_1)");
			}
			if (param.get("time_2") != null) {
				conn.eval("library(KoNLP)");
				conn.eval("library(dplyr)");
				conn.eval("library(stringr)");
				conn.eval("library(plotly)");
				conn.eval("time<-read.csv(\"C:/Users/aa/Desktop/2차 프로젝트 관련/유동인구 xcel/202001_time_people.csv\")");
				conn.eval("time<-time %>% arrange(desc(time_2_cnt))");
				conn.eval("time$time_2_cnt<-ifelse(time$time_2_cnt > 26000000,NA,time$time_2_cnt)");
				conn.eval("new_time<- na.omit(time) %>% arrange(desc(time_2_cnt)) %>% head(10)");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("df_1<-cbind(new_time,score)");
				conn.eval("df_1<-select(df_1, region, score)");
				conn.eval("df<-rbind(df,df_1)");
			}
			
			if (param.get("time_3") != null) {
				conn.eval("library(KoNLP)");
				conn.eval("library(dplyr)");
				conn.eval("library(stringr)");
				conn.eval("library(plotly)");
				conn.eval("time<-read.csv(\"C:/Users/aa/Desktop/2차 프로젝트 관련/유동인구 xcel/202001_time_people.csv\")");
				conn.eval("time<-time %>% arrange(desc(time_3_cnt))");
				conn.eval("time$time_3_cnt<-ifelse(time$time_3_cnt > 20000000,NA,time$time_3_cnt)");
				conn.eval("new_time<- na.omit(time) %>% arrange(desc(time_3_cnt)) %>% head(10)");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("df_1<-cbind(new_time,score)");
				conn.eval("df_1<-select(df_1, region, score)");
				conn.eval("df<-rbind(df,df_1)");
			}
			if (param.get("time_4") != null) {
				conn.eval("library(KoNLP)");
				conn.eval("library(dplyr)");
				conn.eval("library(stringr)");
				conn.eval("library(plotly)");
				conn.eval("time<-read.csv(\"C:/Users/aa/Desktop/2차 프로젝트 관련/유동인구 xcel/202001_time_people.csv\")");
				conn.eval("time<-time %>% arrange(desc(time_4_cnt))");
				conn.eval("time$time_4_cnt<-ifelse(time$time_4_cnt > 20000000,NA,time$time_4_cnt)");
				conn.eval("new_time<- na.omit(time) %>% arrange(desc(time_4_cnt)) %>% head(10)");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("df_1<-cbind(new_time,score)");
				conn.eval("df_1<-select(df_1, region, score)");
				conn.eval("df<-rbind(df,df_1)");
			}
			if (param.get("time_5") != null) {
				conn.eval("library(KoNLP)");
				conn.eval("library(dplyr)");
				conn.eval("library(stringr)");
				conn.eval("library(plotly)");
				conn.eval("time<-read.csv(\"C:/Users/aa/Desktop/2차 프로젝트 관련/유동인구 xcel/202001_time_people.csv\")");
				conn.eval("time<-time %>% arrange(desc(time_5_cnt))");
				conn.eval("time$time_5_cnt<-ifelse(time$time_5_cnt > 20000000,NA,time$time_5_cnt)");
				conn.eval("new_time<- na.omit(time) %>% arrange(desc(time_5_cnt)) %>% head(10)");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("df_1<-cbind(new_time,score)");
				conn.eval("df_1<-select(df_1, region, score)");
				conn.eval("df<-rbind(df,df_1)");
			}
			if (param.get("time_6") != null) {
				conn.eval("library(KoNLP)");
				conn.eval("library(dplyr)");
				conn.eval("library(stringr)");
				conn.eval("library(plotly)");
				conn.eval("time<-read.csv(\"C:/Users/aa/Desktop/2차 프로젝트 관련/유동인구 xcel/202001_time_people.csv\")");
				conn.eval("time<-time %>% arrange(desc(time_6_cnt) %>% head(10))");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("df_1<-cbind(time,score)");
				conn.eval("df_1<-select(df_1, region, score)");
				conn.eval("df<-rbind(df,df_1)");
			}
			conn.eval("df<-df %>% group_by(region) %>% summarise(score=sum(score)/"+time_cnt+")");
			//about time end
			
			conn.eval("df<-df %>% group_by(region) %>% summarise(score=sum(score))");
			conn.eval("df<-df %>% arrange(desc(score))");
			
			REXP exp = conn.eval("df");
			RList list = exp.asList();
			conn.close();
			for(int i = 0; i<list.size();i++) {
				// list.at(i).? 컬럼의 내용을 하나씩 뽑아내기
				list.at(i).asStrings();
				logger.info(i+"번째 리스트");
				for(String item : list.at(i).asStrings()) {
					logger.info(item);
				}
			}
			String first= list.at(0).asString();
			mav.addObject("msg",first);
			mav.setViewName("main/main_where_result");
			
		} else{//param is 공백
			mav.addObject("msg", "조건을 선택해주세요");
			mav.setViewName("main/main_where_result");
		}
		return mav;
	}





}
