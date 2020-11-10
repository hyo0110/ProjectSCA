package com.mrs.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("data")
public class DataDTO { // market_total_data + ppl_day_data + ppl_time_data + ppl_age_data

	private String data_code;
	private String region;
	private String best_time;
	private String best_day;
	private String best_age;
	private long total_ppl_cnt;
	private String mk_status;
	private String mk_fav;
	private String mk_total;
	private String reg_date;
	private long age_10_cnt;
	private long age_20_cnt;
	private long age_30_cnt;
	private long age_40_cnt;
	private long age_50_cnt;
	private long age_60_cnt;
	private long age_total_cnt;
	private long time_1_cnt;
	private long time_2_cnt;
	private long time_3_cnt;
	private long time_4_cnt;
	private long time_5_cnt;
	private long time_6_cnt;
	private long time_total_cnt;
	private long day_mon_cnt;
	private long day_tue_cnt;
	private long day_wed_cnt;
	private long day_thu_cnt;
	private long day_fri_cnt;
	private long day_sat_cnt;
	private long day_sun_cnt;
	private long day_week_cnt;
	private long day_end_cnt;
	private long day_total_cnt;
	
	public String getData_code() {
		return data_code;
	}
	public void setData_code(String data_code) {
		this.data_code = data_code;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getBest_time() {
		return best_time;
	}
	public void setBest_time(String best_time) {
		this.best_time = best_time;
	}
	public String getBest_day() {
		return best_day;
	}
	public void setBest_day(String best_day) {
		this.best_day = best_day;
	}
	public String getBest_age() {
		return best_age;
	}
	public void setBest_age(String best_age) {
		this.best_age = best_age;
	}
	public long getTotal_ppl_cnt() {
		return total_ppl_cnt;
	}
	public void setTotal_ppl_cnt(long total_ppl_cnt) {
		this.total_ppl_cnt = total_ppl_cnt;
	}
	public String getMk_status() {
		return mk_status;
	}
	public void setMk_status(String mk_status) {
		this.mk_status = mk_status;
	}
	public String getMk_fav() {
		return mk_fav;
	}
	public void setMk_fav(String mk_fav) {
		this.mk_fav = mk_fav;
	}
	public String getMk_total() {
		return mk_total;
	}
	public void setMk_total(String mk_total) {
		this.mk_total = mk_total;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public long getAge_10_cnt() {
		return age_10_cnt;
	}
	public void setAge_10_cnt(long age_10_cnt) {
		this.age_10_cnt = age_10_cnt;
	}
	public long getAge_20_cnt() {
		return age_20_cnt;
	}
	public void setAge_20_cnt(long age_20_cnt) {
		this.age_20_cnt = age_20_cnt;
	}
	public long getAge_30_cnt() {
		return age_30_cnt;
	}
	public void setAge_30_cnt(long age_30_cnt) {
		this.age_30_cnt = age_30_cnt;
	}
	public long getAge_40_cnt() {
		return age_40_cnt;
	}
	public void setAge_40_cnt(long age_40_cnt) {
		this.age_40_cnt = age_40_cnt;
	}
	public long getAge_50_cnt() {
		return age_50_cnt;
	}
	public void setAge_50_cnt(long age_50_cnt) {
		this.age_50_cnt = age_50_cnt;
	}
	public long getAge_60_cnt() {
		return age_60_cnt;
	}
	public void setAge_60_cnt(long age_60_cnt) {
		this.age_60_cnt = age_60_cnt;
	}
	public long getAge_total_cnt() {
		return age_total_cnt;
	}
	public void setAge_total_cnt(long age_total_cnt) {
		this.age_total_cnt = age_total_cnt;
	}
	public long getTime_1_cnt() {
		return time_1_cnt;
	}
	public void setTime_1_cnt(long time_1_cnt) {
		this.time_1_cnt = time_1_cnt;
	}
	public long getTime_2_cnt() {
		return time_2_cnt;
	}
	public void setTime_2_cnt(long time_2_cnt) {
		this.time_2_cnt = time_2_cnt;
	}
	public long getTime_3_cnt() {
		return time_3_cnt;
	}
	public void setTime_3_cnt(long time_3_cnt) {
		this.time_3_cnt = time_3_cnt;
	}
	public long getTime_4_cnt() {
		return time_4_cnt;
	}
	public void setTime_4_cnt(long time_4_cnt) {
		this.time_4_cnt = time_4_cnt;
	}
	public long getTime_5_cnt() {
		return time_5_cnt;
	}
	public void setTime_5_cnt(long time_5_cnt) {
		this.time_5_cnt = time_5_cnt;
	}
	public long getTime_6_cnt() {
		return time_6_cnt;
	}
	public void setTime_6_cnt(long time_6_cnt) {
		this.time_6_cnt = time_6_cnt;
	}
	public long getTime_total_cnt() {
		return time_total_cnt;
	}
	public void setTime_total_cnt(long time_total_cnt) {
		this.time_total_cnt = time_total_cnt;
	}
	public long getDay_mon_cnt() {
		return day_mon_cnt;
	}
	public void setDay_mon_cnt(long day_mon_cnt) {
		this.day_mon_cnt = day_mon_cnt;
	}
	public long getDay_tue_cnt() {
		return day_tue_cnt;
	}
	public void setDay_tue_cnt(long day_tue_cnt) {
		this.day_tue_cnt = day_tue_cnt;
	}
	public long getDay_wed_cnt() {
		return day_wed_cnt;
	}
	public void setDay_wed_cnt(long day_wed_cnt) {
		this.day_wed_cnt = day_wed_cnt;
	}
	public long getDay_thu_cnt() {
		return day_thu_cnt;
	}
	public void setDay_thu_cnt(long day_thu_cnt) {
		this.day_thu_cnt = day_thu_cnt;
	}
	public long getDay_fri_cnt() {
		return day_fri_cnt;
	}
	public void setDay_fri_cnt(long day_fri_cnt) {
		this.day_fri_cnt = day_fri_cnt;
	}
	public long getDay_sat_cnt() {
		return day_sat_cnt;
	}
	public void setDay_sat_cnt(long day_sat_cnt) {
		this.day_sat_cnt = day_sat_cnt;
	}
	public long getDay_sun_cnt() {
		return day_sun_cnt;
	}
	public void setDay_sun_cnt(long day_sun_cnt) {
		this.day_sun_cnt = day_sun_cnt;
	}
	public long getDay_week_cnt() {
		return day_week_cnt;
	}
	public void setDay_week_cnt(long day_week_cnt) {
		this.day_week_cnt = day_week_cnt;
	}
	public long getDay_end_cnt() {
		return day_end_cnt;
	}
	public void setDay_end_cnt(long day_end_cnt) {
		this.day_end_cnt = day_end_cnt;
	}
	public long getDay_total_cnt() {
		return day_total_cnt;
	}
	public void setDay_total_cnt(long day_total_cnt) {
		this.day_total_cnt = day_total_cnt;
	}
	
	
	
}
