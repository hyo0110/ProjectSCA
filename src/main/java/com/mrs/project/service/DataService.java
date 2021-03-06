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

	@Autowired
	DataDAO dao;

	//스크랩 개수 세기
	public HashMap<String, Object> scrap_cnt(String loginid) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		int scrap_cnt = dao.scrap_cnt(loginid);
		result.put("scrap_cnt",scrap_cnt);
		return result;
	}	
	
	// 해당 구 베스트 정보+망고플레이트 불러오기
	public DataDTO what_result(String region) {
		DataDTO data = new DataDTO();
		data = dao.what_result(region);
		return data;
	}

	// 해당 구 관련 뉴스 기사 5개 불러오기
	public HashMap<String, Object> newslist(String region) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		String url = "https://search.naver.com/search.naver?where=news&sm=tab_jum&query=" + region;
		Document doc = null;
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			//e.printStackTrace();
		}
		Elements element = doc.select("div.news_wrap.api_ani_send > div > a");
		ArrayList<String> title = (ArrayList<String>) element.eachAttr("title");
		ArrayList<String> link = (ArrayList<String>) element.eachAttr("href");
		for (int i = 1; i <= 5; i++) {
			// logger.info(i + "번째 뉴스" + title.get(i - 1) + " " + link.get(i - 1));
			result.put("title_" + i, title.get(i - 1));
			result.put("link_" + i, link.get(i - 1));
		}
		return result;
	}

	// 반기별 업종 불러오기 일자, 지역에 따라. 
	public HashMap<String, Object> openbiz(String region, String reg_date) throws Exception {
		HashMap<String, Object> result = new HashMap<String, Object>();
		DataDTO status = dao.status(region, reg_date);
		//DataDTO ppl_age = dao.ppl_age(region,reg_date);  // dto 쓸 수 있을거 같으면 쓰기... 인데.. 
		//DataDTO ppl_day = dao.ppl_day(region,reg_date);
		//DataDTO ppl_time = dao.ppl_time(region,reg_date);
		
		String age_html = reg_date + "_" + region + "_" + "age.html";
		String day_html = reg_date + "_" + region + "_" + "day.html";
		String time_html = reg_date + "_" + region + "_" + "time.html";
		String age_result_path = "c:/upload/" + age_html;
		String day_result_path = "c:/upload/" + day_html;
		String time_result_path = "c:/upload/" + time_html;

		RConnection conn = new RConnection();
		conn.eval("library(dplyr)");
		conn.eval("library(plotly)");
		conn.eval("library(htmlwidgets)");

		conn.assign("selected_reg_date", reg_date);
		conn.assign("selected_region", region);
		conn.assign("age_path", age_result_path);
		conn.assign("day_path", day_result_path);
		conn.assign("time_path", time_result_path);
		//나이대 하기
		conn.eval("age <- read.csv('C:/upload/db_move_age_people.csv')"); // 여기 파일 주소 바꾸기
		conn.eval("age <- filter(age, reg_date==selected_reg_date, region==selected_region)");
		conn.eval("나이대 <- c('10대','20대','30대','40대','50대','60대이상')");
		conn.eval("유동인구수 <- c(age$X10대, age$X20대, age$X30대, age$X40대, age$X50대, age$X60대)");
		conn.eval("age_df <- data.frame(나이대, 유동인구수)");
		conn.eval("age_result <- plot_ly(age_df, x=~나이대, y=~유동인구수)");
		try {	conn.eval("saveWidget(age_result, age_path, libdir='lib')");}catch(Exception e){
			//e.printStackTrace();
		}
		
		//요일
		conn.eval("day <- read.csv('C:/upload/db_move_day_people.csv')"); // 여기 파일 주소 바꾸기
		conn.eval("day <- filter(day, reg_date==selected_reg_date, region==selected_region)");
		conn.eval("요일=c('월','화','수','목','금','토','일')");
		conn.eval("유동인구수=c(day$monday,day$tuesday,day$wednesday,day$thursday,day$friday,day$saturday,day$sunday)");
		conn.eval("day_df <- data.frame(요일,유동인구수)");
		conn.eval("day_df$요일 <- factor(day_df$요일, levels = c('월','화','수','목','금','토','일'))");
		conn.eval("day_result <- plot_ly(day_df, x=~요일, y=~유동인구수)");	
		try {	conn.eval("saveWidget(day_result, day_path, libdir='lib')");}catch(Exception e){
			//e.printStackTrace();
		}
		
		// 시간대
		conn.eval("time <- read.csv('C:/upload/db_move_time_people.csv')"); // 여기 파일 주소 바꾸기
		conn.eval("time <- filter(time, reg_date==selected_reg_date, region==selected_region)");
		conn.eval("시간대 = c('새벽','오전','점심','오후','저녁','밤')");
		conn.eval("유동인구수 = c(time$time_1,time$time_2,time$time_3,time$time_4,time$time_5,time$time_6)");
		conn.eval("time_df <- data.frame(시간대,유동인구수)");
		conn.eval("time_df$시간대 <- factor(time_df$시간대, levels = c('새벽','오전','점심','오후','저녁','밤'))");
		conn.eval("time_result <- plot_ly(time_df, x=~시간대, y=~유동인구수) %>% add_lines()");		
		try {	conn.eval("saveWidget(time_result, time_path, libdir='lib')");}catch(Exception e){
			//e.printStackTrace();
		}		
		conn.close(); // 자원닫기 어예
		
		result.put("status", status);
		result.put("age_html", "/photo/" + age_html); //파일 서비스 한거 설정 그냥 같이 가기위해!
		result.put("day_html", "/photo/" + day_html);
		result.put("time_html", "/photo/" + time_html);
		return result;
	}

	public ModelAndView where_result(HashMap<String, String> param, ModelAndView mav) throws Exception {
		int age_cnt = Integer.parseInt(param.get("age_cnt"));
		int time_cnt = Integer.parseInt(param.get("time_cnt"));

		if (!param.isEmpty()) {
			//logger.info("params : " + param);// 불러온 파라메이터

			// 1. R connection 실행
			RConnection conn = new RConnection();
			conn.eval("library(KoNLP)");
			conn.eval("library(dplyr)");
			conn.eval("library(stringr)");
			conn.eval("library(plotly)");
			
			conn.eval("df<-data.frame()");
			conn.eval("df_4<-data.frame()");
			conn.eval("df_5<-data.frame()");
			//age 시작
			if (param.get("age_total") != null) {
				conn.eval("age<-read.csv('C:/upload/202001_age_people.csv')");
				conn.eval("age$age_total_cnt<-ifelse(age$age_total_cnt > 120000000,NA,age$age_total_cnt)");
				conn.eval("new_age<- na.omit(age) %>% arrange(desc(age_total_cnt)) %>% head(10)");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("df_1<-cbind(new_age,score)");
				conn.eval("df_1<-select(df_1, region, score)");
				conn.eval("df<-rbind(df,df_1)");
			}

			if (param.get("age_10") != null) {
				conn.eval("age<-read.csv('C:/upload/202001_age_people.csv')");
				conn.eval("age<-age %>% arrange(desc(age_10_cnt))");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("age<-head(age,10)");
				conn.eval("df_1<-cbind(age,score)");
				conn.eval("df_1<-select(df_1, region, score)");
				conn.eval("df<-rbind(df,df_1)");
			}

			if (param.get("age_20") != null) {
				conn.eval("age<-read.csv('C:/upload/202001_age_people.csv')");
				conn.eval("age$age_20_cnt<-ifelse(age$age_20_cnt > 25000000,NA,age$age_20_cnt)");
				conn.eval("new_age<- na.omit(age) %>% arrange(desc(age_20_cnt)) %>% head(10)");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("df_1<-cbind(new_age,score)");
				conn.eval("df_1<-select(df_1, region, score)");
				conn.eval("df<-rbind(df,df_1)");
			}

			if (param.get("age_30") != null) {
				conn.eval("age<-read.csv('C:/upload/202001_age_people.csv')");
				conn.eval("age$age_30_cnt<-ifelse(age$age_30_cnt > 25000000,NA,age$age_30_cnt)");
				conn.eval("new_age<- na.omit(age) %>% arrange(desc(age_30_cnt)) %>% head(10)");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("df_1<-cbind(new_age,score)");
				conn.eval("df_1<-select(df_1, region, score)");
				conn.eval("df<-rbind(df,df_1)");
			}

			if (param.get("age_40") != null) {
				conn.eval("age<-read.csv('C:/upload/202001_age_people.csv')");
				conn.eval("age$age_40_cnt<-ifelse(age$age_40_cnt > 18000000,NA,age$age_40_cnt)");
				conn.eval("new_age<- na.omit(age) %>% arrange(desc(age_40_cnt)) %>% head(10)");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("df_1<-cbind(new_age,score)");
				conn.eval("df_1<-select(df_1, region, score)");
				conn.eval("df<-rbind(df,df_1)");
			}

			if (param.get("age_50") != null) {
				conn.eval("age<-read.csv('C:/upload/202001_age_people.csv')");
				conn.eval("age$age_50_cnt<-ifelse(age$age_50_cnt > 17000000,NA,age$age_50_cnt)");
				conn.eval("age$age_50_cnt<-ifelse(age$age_50_cnt < 5000000,NA,age$age_50_cnt)");
				conn.eval("new_age<- na.omit(age) %>% arrange(desc(age_50_cnt)) %>% head(10)");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("df_1<-cbind(new_age,score)");
				conn.eval("df_1<-select(df_1, region, score)");
				conn.eval("df<-rbind(df,df_1)");
			}

			if (param.get("age_60") != null) {
				conn.eval("age<-read.csv('C:/upload/202001_age_people.csv')");
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
					conn.eval("day<-read.csv(\"C:/upload/202001_day_people_1.csv\")");
					conn.eval("day<-day %>% arrange(desc(mon_thu))");
					conn.eval("day$mon_thu<-ifelse(day$mon_thu > 60000000,NA,day$mon_thu)");
					conn.eval("new_day<- na.omit(day) %>% arrange(desc(mon_thu)) %>% head(10)");
					conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
					conn.eval("df_2<-cbind(new_day,score)");
					conn.eval("df_2<-select(df_2, region, score)");
					conn.eval("df_4<-rbind(df_4,df_2)");
				}
				if (param.get("day_2")!=null) {//day 금~일
					conn.eval("day<-read.csv(\"C:/upload/202001_day_people_1.csv\")");
					conn.eval("day<-day %>% arrange(desc(fri_sun))");
					conn.eval("day$fri_sun<-ifelse(day$fri_sun > 50000000,NA,day$fri_sun)");
					conn.eval("new_day<- na.omit(day) %>% arrange(desc(fri_sun)) %>% head(10)");
					conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
					conn.eval("df_2<-cbind(new_day,score)");
					conn.eval("df_2<-select(df_2, region, score)");
					conn.eval("df_4<-rbind(df_4,df_2)");
				}
				
				if (param.get("day_total")!=null) {//day 금~일
					conn.eval("day<-read.csv(\"C:/upload/202001_day_people_1.csv\")");
					conn.eval("day$day_total_cnt<-ifelse(day$day_total_cnt > 120000000, NA, day$day_total_cnt)");
					conn.eval("new_day<- na.omit(day) %>% arrange(desc(day_total_cnt)) %>% head(10)");
					conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
					conn.eval("df_2<-cbind(new_day,score)");
					conn.eval("df_2<-select(df_2, region, score)");
					conn.eval("df_4<-rbind(df_4,df_2)");
				}
				
			//day 끝
			
			//about time start
			

			if (param.get("time_total") != null) {
				conn.eval("time<-read.csv(\"C:/upload/202001_time_people.csv\")");
				conn.eval("time<-time %>% arrange(desc(time_total_cnt))");
				conn.eval("time$time_total_cnt<-ifelse(time$time_total_cnt > 120000000,NA,time$time_total_cnt)");
				conn.eval("new_time<- na.omit(time) %>% arrange(desc(time_total_cnt)) %>% head(10)");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("df_3<-cbind(new_time,score)");
				conn.eval("df_3<-select(df_3, region, score)");
				conn.eval("df_5<-rbind(df_5,df_3)");
			}
			if (param.get("time_1") != null) {
				conn.eval("time<-read.csv(\"C:/upload/202001_time_people.csv\")");
				conn.eval("time<-time %>% arrange(desc(time_1_cnt))");
				conn.eval("time<-time %>% head(10)");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("df_3<-cbind(time,score)");
				conn.eval("df_3<-select(df_3, region, score)");
				conn.eval("df_5<-rbind(df_5,df_3)");
			}
			if (param.get("time_2") != null) {
				conn.eval("time<-read.csv(\"C:/upload/202001_time_people.csv\")");
				conn.eval("time<-time %>% arrange(desc(time_2_cnt))");
				conn.eval("time$time_2_cnt<-ifelse(time$time_2_cnt > 26000000,NA,time$time_2_cnt)");
				conn.eval("new_time<- na.omit(time) %>% arrange(desc(time_2_cnt)) %>% head(10)");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("df_3<-cbind(new_time,score)");
				conn.eval("df_3<-select(df_3, region, score)");
				conn.eval("df_5<-rbind(df_5,df_3)");
			}

			if (param.get("time_3") != null) {
				conn.eval("time<-read.csv(\"C:/upload/202001_time_people.csv\")");
				conn.eval("time<-time %>% arrange(desc(time_3_cnt))");
				conn.eval("time$time_3_cnt<-ifelse(time$time_3_cnt > 20000000,NA,time$time_3_cnt)");
				conn.eval("new_time<- na.omit(time) %>% arrange(desc(time_3_cnt)) %>% head(10)");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("df_3<-cbind(new_time,score)");
				conn.eval("df_3<-select(df_3, region, score)");
				conn.eval("df_5<-rbind(df_5,df_3)");
			}
			if (param.get("time_4") != null) {
				conn.eval("time<-read.csv(\"C:/upload/202001_time_people.csv\")");
				conn.eval("time<-time %>% arrange(desc(time_4_cnt))");
				conn.eval("time$time_4_cnt<-ifelse(time$time_4_cnt > 20000000,NA,time$time_4_cnt)");
				conn.eval("new_time<- na.omit(time) %>% arrange(desc(time_4_cnt)) %>% head(10)");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("df_3<-cbind(new_time,score)");
				conn.eval("df_3<-select(df_3, region, score)");
				conn.eval("df_5<-rbind(df_5,df_3)");
			}
			if (param.get("time_5") != null) {
				conn.eval("time<-read.csv(\"C:/upload/202001_time_people.csv\")");
				conn.eval("time<-time %>% arrange(desc(time_5_cnt))");
				conn.eval("time$time_5_cnt<-ifelse(time$time_5_cnt > 20000000,NA,time$time_5_cnt)");
				conn.eval("new_time<- na.omit(time) %>% arrange(desc(time_5_cnt)) %>% head(10)");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("df_3<-cbind(new_time,score)");
				conn.eval("df_3<-select(df_3, region, score)");
				conn.eval("df_5<-rbind(df_5,df_3)");
			}
			if (param.get("time_6") != null) {
				conn.eval("time<-read.csv(\"C:/upload/202001_time_people.csv\")");
				conn.eval("time<-time %>% arrange(desc(time_6_cnt)) %>% head(10)");
				conn.eval("score<-c(10,9,8,7,6,5,4,3,2,1)");
				conn.eval("df_3<-cbind(time,score)");
				conn.eval("df_3<-select(df_3, region, score)");
				conn.eval("df_5<-rbind(df_5,df_3)");
				
			}

			conn.eval("df_5<-df_5 %>% group_by(region) %>% summarise(score=sum(score)/"+time_cnt+")");
			//about time end
			
			conn.eval("df<- rbind(df, df_4, df_5)");

			conn.eval("df<-df %>% group_by(region) %>% summarise(score=sum(score))");
			conn.eval("df<-df %>% arrange(desc(score))");

			REXP exp = conn.eval("df");
			RList list = exp.asList();

			//지역구 별 점수 뽑기 end
			
			
			
			String best_region= list.at(0).asString();
			
			conn.eval("market<-read.csv(\"C:/upload/202001_market_1.csv\")");
			conn.eval("market_1<-market %>% select(지역구_명, 업태구분명, accept)");
			conn.eval("market_1<-market_1 %>% filter(지역구_명=='"+best_region+"') %>% arrange(desc(accept))");
			exp = conn.eval("market_1");
			RList list_market = exp.asList();
			
			
			for(int i = 0; i<list_market.size();i++) {
				// list.at(i).? 컬럼의 내용을 하나씩 뽑아내기
				list_market.at(i).asStrings();
				//logger.info(i+"번째 리스트");
				for(String item : list_market.at(i).asStrings()) {
					//logger.info(item);
				}
			}
			String Sectors = list_market.at(1).asString();
			
			
			conn.eval("library(htmlwidgets)");
			conn.eval("region_df<-data.frame()");
			conn.eval("score_df<-data.frame()");
			
			for(int i = 0; i<list.size();i++) {
				// list.at(i).? 컬럼의 내용을 하나씩 뽑아내기
				list.at(i).asStrings();
				//logger.info(i+"번째 리스트");
				for(String item : list.at(i).asStrings()) {
					if (i==0) {
						//System.out.println("i가 0일때");
						//logger.info(item);
						conn.eval("region<-c('"+item+"')");
						conn.eval("region<-as.data.frame(region)");
						conn.eval("region_df<-rbind(region_df,region)");
					}
					if (i==1) {
						//System.out.println("i가 1일때");
						//logger.info(item);
						conn.eval("region_score<-c("+item+")");
						conn.eval("region_score<-as.data.frame(region_score)");
						conn.eval("score_df<-rbind(score_df,region_score)");
					}
				}
			}
			conn.eval("real_score<-cbind(region_df,score_df)");
			conn.eval("real_score<-real_score %>% head(10)");
			conn.eval("real_score<-plot_ly(real_score, x=~region, y=~region_score, type='bar') %>%" + 
					"  layout(title='region_score', xaxis=list(title='지역구'),yaxis=list(title='점수'))");
			
			try {
				  conn.eval("saveWidget(real_score,'C:/upload/result.html',libdir = 'lib')");
			} catch (Exception e) {
				//e.printStackTrace();
			}
			
			conn.close();
			// eval안에 주석까지 넣어서 돌리면 오류가 나요! 주석은 빼고 넣어주세여
			
			
			mav.addObject("param", param);
			mav.addObject("msg",best_region);
			mav.addObject("Sectors",Sectors);
			mav.addObject("fileName", "result.html"); 

			mav.setViewName("main/main_where_result");
			
		} 
		return mav;
	}

	public boolean scriptsave(String parameter, String loginId, String subject) {
		 boolean success = false;
		 int result = dao.scriptsave(parameter,loginId,subject);
		 if(result>0) {
			 success = true;
		 } 
		 
		 return success;
	}



}
