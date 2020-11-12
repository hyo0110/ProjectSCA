package com.mrs.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("scrap")
public class ScrapDTO {

	private int scrap_idx;
	private String id;
	private String scrap_sub;
	private String parameter;
	
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
	public String getParameter() {
		return parameter;
	}
	public void setParameter(String parameter) {
		this.parameter = parameter;
	}

	
	
}
