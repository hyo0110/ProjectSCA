package com.mrs.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("scrap")
public class ScrapDTO {

	private int scrap_idx;
	private String id;
	private String scrap_sub;
	private String op_age;
	private String op_time;
	private String op_day;
	private String result_url;
	public int getScrap_idx() {
		return scrap_idx;
	}
	public void setScrap_idx(int scrap_idx) {
		this.scrap_idx = scrap_idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getScrap_sub() {
		return scrap_sub;
	}
	public void setScrap_sub(String scrap_sub) {
		this.scrap_sub = scrap_sub;
	}
	public String getOp_age() {
		return op_age;
	}
	public void setOp_age(String op_age) {
		this.op_age = op_age;
	}
	public String getOp_time() {
		return op_time;
	}
	public void setOp_time(String op_time) {
		this.op_time = op_time;
	}
	public String getOp_day() {
		return op_day;
	}
	public void setOp_day(String op_day) {
		this.op_day = op_day;
	}
	public String getResult_url() {
		return result_url;
	}
	public void setResult_url(String result_url) {
		this.result_url = result_url;
	}
	
	
}
